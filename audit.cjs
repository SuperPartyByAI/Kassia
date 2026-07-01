require('dotenv').config({path: '.env.local'});
const fs = require('fs');
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
const serperKey = process.env.SERPER_API_KEY;
const headers = { 'apikey': key, 'Authorization': `Bearer ${key}` };

if (!serperKey) {
  console.log(JSON.stringify({ error: "SERPER_API_KEY lipsește" }));
  process.exit(1);
}

const passedPages = [
  'animatori-petreceri-copii', 'preturi-animatori-copii-bucuresti',
  'animatori-petreceri-copii-sector-1', 'animatori-petreceri-copii-sector-2',
  'animatori-petreceri-copii-sector-3', 'animatori-petreceri-copii-sector-4',
  'animatori-petreceri-copii-sector-5', 'animatori-petreceri-copii-sector-6',
  'animatori-petreceri-copii-voluntari', 'animatori-petreceri-copii-berceni',
  'animatori-petreceri-copii-popesti-leordeni'
];

function classify(slug) {
  if (['animatori-petreceri-copii', 'preturi-animatori-copii-bucuresti'].includes(slug)) return 'A';
  if (slug.includes('sector') || ['berceni', 'voluntari', 'popesti-leordeni', 'bragadiru', 'chiajna', 'herastrau'].some(x => slug.includes(x))) return 'B';
  const nonAnimatori = ['baloane', 'decor', 'heliu', 'arcada', 'panou-foto', 'nunta', 'botez-decor', 'corporate'];
  if (nonAnimatori.some(x => slug.includes(x)) && !slug.includes('animator') && !slug.includes('modelaj')) return 'D';
  return 'C';
}

function getQuery(slug) {
  return slug.replace(/-/g, ' ');
}

async function run() {
  const res = await fetch(`${url}/rest/v1/kassia_pages?select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,page_type,show_pricing_preview,updated_at&status=eq.published`, { headers });
  const pages = await res.json();
  
  const keywords = ['animator', 'personaj', 'mascot', 'pictur', 'modelaj', 'spectacol', 'magie', 'mini-disco', 'jocuri'];
  let allRelevant = pages.filter(p => {
    const isAnimatori = keywords.some(k => p.slug.includes(k));
    const isNotBalloonsOnly = !p.slug.includes('decoratiuni-baloane') && !p.slug.includes('arcada') && !p.slug.includes('panou-foto') && !p.slug.includes('heliu') && !p.slug.includes('ghirlande');
    return (isAnimatori && isNotBalloonsOnly) || passedPages.includes(p.slug);
  });

  const results = [];
  
  // To avoid timeouts, we process in chunks
  for (let i = 0; i < allRelevant.length; i++) {
    const p = allRelevant[i];
    const cat = classify(p.slug);
    const isPass = passedPages.includes(p.slug);
    const query = getQuery(p.slug);
    
    let result = {
      slug: p.slug,
      category: cat,
      status_actual: isPass ? 'PASS + MONITOR / LOCKED' : (p.index_status === 'noindex' ? 'NOINDEX' : 'NEEDS AUDIT'),
      keyword: query,
      live_status: 'N/A',
      has_pricing: false,
      kassia_rank: 'N/A',
      total_serp: 0,
      lider: 'N/A',
      serp_details: []
    };

    if (cat !== 'D' && p.index_status === 'index' && !isPass) {
       try {
         // Live snapshot
         const liveRes = await fetch(`https://www.kassia.ro/${p.slug}/`, { headers: { 'User-Agent': 'Googlebot' } });
         result.live_status = liveRes.status;
         const text = await liveRes.text();
         result.has_pricing = text.includes('280 lei') || text.includes('2750 lei') || text.includes('pricing');
         
         // SERP
         const serpRes = await fetch('https://google.serper.dev/search', {
           method: 'POST',
           headers: { 'X-API-KEY': serperKey, 'Content-Type': 'application/json' },
           body: JSON.stringify({ q: query, gl: 'ro', hl: 'ro', num: 20 })
         });
         const serpData = await serpRes.json();
         const organic = serpData.organic || [];
         result.total_serp = organic.length;
         result.serp_details = organic.slice(0, 10).map(r => ({ pos: r.position, domain: r.domain || new URL(r.link).hostname, title: r.title }));
         result.kassia_rank = organic.findIndex(r => r.link.includes('kassia.ro')) + 1;
         if (result.kassia_rank === 0) result.kassia_rank = 'N/A';
         if (organic[0]) result.lider = organic[0].domain || new URL(organic[0].link).hostname;
       } catch (e) {
         result.error = e.message;
       }
    }
    
    results.push(result);
    // Delay to respect API limits
    await new Promise(r => setTimeout(r, 150));
  }
  
  fs.writeFileSync('/tmp/audit_results.json', JSON.stringify(results, null, 2));
  console.log("Audit complete. Wrote to /tmp/audit_results.json");
}
run();
