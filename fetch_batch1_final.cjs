require('dotenv').config({path: '.env.local'});
const fs = require('fs');

const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
const headers = { 'apikey': key, 'Authorization': `Bearer ${key}` };

const slugs = [
  'animatori-botez-bucuresti',
  'animatori-gradinita-bucuresti',
  'animatori-scoala-bucuresti',
  'animatori-copii-crangasi' // to check index_status, robots, etc.
];

async function run() {
  let report = [];
  
  for (let slug of slugs) {
    const res = await fetch(`${url}/rest/v1/kassia_pages?slug=eq.${slug}`, { headers });
    const pages = await res.json();
    if (pages.length === 0) continue;
    const page = pages[0];
    
    let pageData = {
      page: page,
      sections: []
    };
    
    if (slug === 'animatori-copii-crangasi') {
      try {
        const liveRes = await fetch(`https://www.kassia.ro/${slug}/`, { headers: { 'User-Agent': 'Googlebot' } });
        const html = await liveRes.text();
        pageData.live_robots = html.match(/<meta[^>]+name="robots"[^>]+content="([^"]+)"/i) 
                             ? html.match(/<meta[^>]+name="robots"[^>]+content="([^"]+)"/i)[1] 
                             : 'not found';
      } catch(e) {
        pageData.live_robots = 'error';
      }
    } else {
      const secRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${page.id}`, { headers });
      const sections = await secRes.json();
      
      for (let sec of sections) {
        const h = sec.heading ? sec.heading.toLowerCase() : '';
        const c = sec.content ? JSON.stringify(sec.content).toLowerCase() : '';
        const slugNoDash = slug.split('-').join(' ');
        
        if (h.includes(slugNoDash) || c.includes(slugNoDash) || 
            h.includes('animatori petreceri copii') || c.includes('animatori petreceri copii') ||
            c.includes('cauti animatori') || c.includes('rezervă acum') || c.includes('cât timp stă')) {
          pageData.sections.push(sec);
        }
      }
    }
    report.push(pageData);
  }
  
  fs.writeFileSync('/tmp/batch1_final.json', JSON.stringify(report, null, 2));
  console.log("Done");
}

run();
