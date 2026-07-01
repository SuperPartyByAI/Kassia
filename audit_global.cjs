require('dotenv').config({path: '.env.local'});
const fs = require('fs');
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
const serperKey = process.env.SERPER_API_KEY;
const headers = { 'apikey': key, 'Authorization': `Bearer ${key}` };

const passPages = [
  'animatori-petreceri-copii', 'preturi-animatori-copii-bucuresti',
  'animatori-petreceri-copii-sector-1', 'animatori-petreceri-copii-sector-2',
  'animatori-petreceri-copii-sector-3', 'animatori-petreceri-copii-sector-4',
  'animatori-petreceri-copii-sector-5', 'animatori-petreceri-copii-sector-6',
  'animatori-petreceri-copii-voluntari', 'animatori-petreceri-copii-berceni',
  'animatori-petreceri-copii-popesti-leordeni', 'animatori-petreceri-copii-bragadiru', 'animatori-petreceri-copii-chiajna'
];

function classify(slug, h1) {
  if (slug === '' || slug === 'home' || slug === 'animatori-petreceri-copii' || slug === 'preturi-animatori-copii-bucuresti') return 'A';
  
  const locals = ['sector', 'berceni', 'voluntari', 'pipera', 'popesti', 'bragadiru', 'chiajna', 'crangasi', 'herastrau', 'ilfov', 'bucuresti-'];
  if (locals.some(x => slug.includes(x)) && slug.includes('animatori-')) return 'B';

  const animKw = ['animator', 'personaj', 'mascot', 'pictur', 'modelaj', 'spectacol', 'magie', 'mini-disco', 'jocuri', 'tematica', 'printese', 'dinozaur', 'unicorn', 'cavaleri'];
  if (animKw.some(x => slug.includes(x))) return 'C';
  
  return 'D';
}

function detectDefect(p, text) {
  let isDefect = false;
  let reason = '';
  const slugWords = p.slug.split('-').join(' ');
  
  if (p.title && p.title.toLowerCase().includes(`animatori petreceri copii ${slugWords}`)) {
    isDefect = true; reason = 'Titlu mecanic';
  }
  if (p.h1 && p.h1.toLowerCase() === `animatori petreceri copii ${slugWords}`) {
    isDefect = true; reason += ' | H1 mecanic';
  }
  if (text && text.toLowerCase().includes(`cauti animatori pentru petreceri copii in ${slugWords}`)) {
    isDefect = true; reason += ' | Text mecanic';
  }
  if (p.slug.includes('crangasi')) {
    isDefect = true; reason += ' | Semnal Crangasi detectat';
  }
  return { isDefect, reason };
}

async function run() {
  const res = await fetch(`${url}/rest/v1/kassia_pages?select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,show_pricing_preview,updated_at&status=eq.published`, { headers });
  let pages = await res.json();
  
  // Also push the homepage manually if its slug is 'home' or ''
  const homeRes = await fetch(`${url}/rest/v1/kassia_pages?slug=eq.home`, { headers });
  const homePages = await homeRes.json();
  if (homePages.length > 0 && !pages.find(p => p.slug === 'home')) pages.push(homePages[0]);
  
  let results = { A: [], B: [], C: [], D: [], Defects: [] };
  
  for (let p of pages) {
    const cat = classify(p.slug, p.h1);
    
    let info = {
      slug: p.slug,
      url: `https://www.kassia.ro/${p.slug === 'home' ? '' : p.slug + '/'}`,
      title: p.title,
      meta: p.meta_description,
      h1: p.h1,
      status: p.status,
      index_status: p.index_status,
      sitemap: p.include_in_sitemap,
      pricing_preview: p.show_pricing_preview,
      cat: cat,
      query: p.slug.replace(/-/g, ' '),
      isPass: passPages.includes(p.slug),
      http: 'N/A',
      has_pricing: false,
      faq: false,
      serp_total: 0,
      kassia_rank: 'N/A',
      lider: 'N/A',
      defect: false,
      defect_reason: ''
    };

    if (cat !== 'D' && p.index_status === 'index') {
      try {
        const liveRes = await fetch(info.url, { headers: { 'User-Agent': 'Googlebot' } });
        info.http = liveRes.status;
        const text = await liveRes.text();
        info.has_pricing = text.includes('280 lei') || text.includes('2750 lei');
        info.faq = text.includes('Întrebări Frecvente');
        
        const defectCheck = detectDefect(p, text);
        if (defectCheck.isDefect) {
          info.defect = true;
          info.defect_reason = defectCheck.reason;
          results.Defects.push(info);
        }

        if (!info.isPass) {
          const serpRes = await fetch('https://google.serper.dev/search', {
            method: 'POST',
            headers: { 'X-API-KEY': serperKey, 'Content-Type': 'application/json' },
            body: JSON.stringify({ q: info.query, gl: 'ro', hl: 'ro', num: 20 })
          });
          const serpData = await serpRes.json();
          const organic = serpData.organic || [];
          info.serp_total = organic.length;
          info.kassia_rank = organic.findIndex(r => r.link.includes('kassia.ro')) + 1;
          if (info.kassia_rank === 0) info.kassia_rank = 'N/A';
          if (organic[0]) info.lider = organic[0].domain || new URL(organic[0].link).hostname;
        }
      } catch (e) {
        info.error = e.message;
      }
      await new Promise(r => setTimeout(r, 150));
    }
    
    results[cat].push(info);
  }
  
  fs.writeFileSync('/tmp/audit_global.json', JSON.stringify(results, null, 2));
  console.log("Global audit written to /tmp/audit_global.json");
}
run();
