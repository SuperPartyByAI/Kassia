require('dotenv').config({path: '.env.local'});
const fs = require('fs');

const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
const headers = { 'apikey': key, 'Authorization': `Bearer ${key}` };

const slugs = [
  'animatori-copii-crangasi',
  'animatori-botez-bucuresti',
  'animatori-gradinita-bucuresti',
  'animatori-scoala-bucuresti'
];

async function run() {
  let report = [];
  
  for (let slug of slugs) {
    const res = await fetch(`${url}/rest/v1/kassia_pages?slug=eq.${slug}`, { headers });
    const pages = await res.json();
    if (pages.length === 0) continue;
    const page = pages[0];
    
    const secRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${page.id}`, { headers });
    const sections = await secRes.json();
    
    // identify mechanical sections
    let mechSections = [];
    for (let sec of sections) {
      const h = sec.heading ? sec.heading.toLowerCase() : '';
      const c = sec.content ? JSON.stringify(sec.content).toLowerCase() : '';
      const p1 = `cauti animatori pentru petreceri copii in`;
      const p2 = `de ce sa alegi animatori pentru`;
      const p3 = `rezervă acum pentru petrecerea ta în`;
      
      const slugNoDash = slug.split('-').join(' ');
      
      if (h.includes(p1) || c.includes(p1) ||
          h.includes(p2) || c.includes(p2) ||
          h.includes(p3) || c.includes(p3) ||
          h.includes(slugNoDash) || c.includes(slugNoDash)) {
        mechSections.push(sec);
      }
    }
    
    report.push({
      page,
      sections: mechSections
    });
  }
  
  fs.writeFileSync('/tmp/batch1_data.json', JSON.stringify(report, null, 2));
  console.log("Done");
}

run();
