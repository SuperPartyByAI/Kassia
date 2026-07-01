require('dotenv').config({path: '.env.local'});
const fs = require('fs');
const { JSDOM } = require('jsdom');

const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
const headers = { 'apikey': key, 'Authorization': `Bearer ${key}` };

const passPages = [
  'home', '', 'animatori-petreceri-copii', 'preturi-animatori-copii-bucuresti',
  'animatori-petreceri-copii-sector-1', 'animatori-petreceri-copii-sector-2',
  'animatori-petreceri-copii-sector-3', 'animatori-petreceri-copii-sector-4',
  'animatori-petreceri-copii-sector-5', 'animatori-petreceri-copii-sector-6',
  'animatori-petreceri-copii-berceni', 'animatori-petreceri-copii-voluntari'
];

function isSuspect(p) {
  let reasons = [];
  const title = (p.title || '').toLowerCase();
  const h1 = (p.h1 || '').toLowerCase();
  const meta = (p.meta_description || '').toLowerCase();
  
  if (title.includes('animatori petreceri copii ')) reasons.push('title_mecanic');
  if (h1.includes('animatori petreceri copii ')) reasons.push('h1_mecanic');
  if (meta.includes('în animatori') || meta.includes('in animatori')) reasons.push('meta_mecanic');
  
  if (p.slug.startsWith('animatori-copii-') || p.slug.startsWith('animatori-petreceri-copii-')) {
    reasons.push('slug_suspect'); // We check text live
  }
  
  return reasons.length > 0 ? reasons : null;
}

function recommend(p, liveData) {
  const isLocalitate = p.slug.includes('crangasi') || p.slug.includes('ilfov') || p.slug.match(/sector|berceni|voluntari|popesti|bragadiru|chiajna/);
  
  if (isLocalitate && p.index_status === 'index') {
    return {
      rec: 'A. Rewrite / Repair',
      motiv: 'Pagina vizează un cartier/localitate cu potențial real de căutare. Are valoare SEO.',
      dest: '-',
      risc_seo: 'Mare dacă rămâne mecanică. Mic dacă se repară metadata și se indexează conținut util.',
      risc_user: 'Bouncing mare din cauza textului ilogic.',
      verif: 'Recrawl GSC după update Supabase.'
    };
  }
  
  if (p.slug.includes('animatori-copii-bucuresti') || p.slug.includes('animatori-petreceri-copii')) {
    return {
      rec: 'B. 301 Redirect',
      motiv: 'Este o variație de slug/canonică greșită care canibalizează pagina principală.',
      dest: '/animatori-petreceri-copii/',
      risc_seo: 'Scăzut.',
      risc_user: 'Minim.',
      verif: 'Test live status 301.'
    };
  }

  return {
    rec: 'A. Rewrite / Repair',
    motiv: 'Pagina vizează o tematică (ex: dinozauri, unicorn). Poate converti bine dacă este curățată.',
    dest: '-',
    risc_seo: 'Mare dacă rămâne așa (spam). Mic după reparație.',
    risc_user: 'Dezamăgire vizuală/textuală momentan.',
    verif: 'Update Supabase + validare.'
  };
}

async function run() {
  const res = await fetch(`${url}/rest/v1/kassia_pages?select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,show_pricing_preview,updated_at&status=eq.published`, { headers });
  let pages = await res.json();
  
  const homeRes = await fetch(`${url}/rest/v1/kassia_pages?slug=eq.home`, { headers });
  const homePages = await homeRes.json();
  if (homePages.length > 0 && !pages.find(p => p.slug === 'home')) pages.push(homePages[0]);

  let suspects = [];
  
  for (let p of pages) {
    const s = isSuspect(p);
    if (s && p.index_status === 'index') {
      p.suspect_reasons = s;
      suspects.push(p);
    }
  }

  let finalSuspects = [];

  for (let p of suspects) {
    try {
      const pageUrl = `https://www.kassia.ro/${p.slug === 'home' ? '' : p.slug + '/'}`;
      const liveRes = await fetch(pageUrl, { headers: { 'User-Agent': 'Googlebot' } });
      const html = await liveRes.text();
      const dom = new JSDOM(html);
      const doc = dom.window.document;
      
      const titleLive = doc.title;
      const h1Live = doc.querySelector('h1') ? doc.querySelector('h1').textContent.trim() : '';
      const metaLive = doc.querySelector('meta[name="description"]') ? doc.querySelector('meta[name="description"]').content : '';
      
      const bodyText = doc.body.textContent;
      let textMecanic = [];
      const slugWords = p.slug.split('-').join(' ');
      
      // Look for specific mechanical phrases
      const phrase1 = `cauti animatori pentru petreceri copii in ${slugWords}`;
      const phrase2 = `în ${slugWords}`;
      const phrase3 = `in ${slugWords}`;
      
      const paragraphs = doc.querySelectorAll('p, h2, h3, div');
      paragraphs.forEach(el => {
        const text = el.textContent.trim().toLowerCase();
        if (text.includes(phrase1)) textMecanic.push(text.substring(text.indexOf(phrase1), text.indexOf(phrase1) + 100));
        else if (text.includes(phrase2) && text.length < 150) textMecanic.push(text);
      });

      // Filter uniqueness
      textMecanic = [...new Set(textMecanic)].slice(0, 3);
      
      // If it only had 'slug_suspect' but no mechanical text or h1, we skip it
      if (p.suspect_reasons.length === 1 && p.suspect_reasons[0] === 'slug_suspect' && textMecanic.length === 0 && !h1Live.toLowerCase().includes('animatori petreceri copii')) {
        continue;
      }
      
      finalSuspects.push({
        db: p,
        live: {
          http: liveRes.status,
          title: titleLive,
          h1: h1Live,
          meta: metaLive,
          text_mecanic: textMecanic,
          has_pricing: html.includes('280 lei'),
          sitemap: p.include_in_sitemap
        },
        remediere: recommend(p)
      });
      
    } catch (e) {
      console.error("Error fetching", p.slug, e);
    }
    await new Promise(r => setTimeout(r, 100));
  }
  
  fs.writeFileSync('/tmp/audit_p0.json', JSON.stringify({ 
    total_published: pages.length,
    pass_pages: passPages,
    suspects: finalSuspects
  }, null, 2));
  console.log("Written P0 report to /tmp/audit_p0.json");
}

run();
