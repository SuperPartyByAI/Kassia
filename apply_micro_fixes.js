import fs from 'fs';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const secId = "2a39f6df-b924-4f0f-8f81-80a57e62a19d";
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?id=eq.${secId}&select=content`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s = await resSec.json();
   let content = s[0].content;
   
   if (content.body.includes('detalii pentru programele cu animatori copii')) {
      console.log("Already updated!");
      return;
   }
   
   const microFix2 = `<p>Pentru variantele de program și detaliile comerciale actualizate, consultă pagina dedicată cu <a href="/preturi-animatori-copii-bucuresti/">detalii pentru programele cu animatori copii</a>.</p>`;
   
   const microFix1 = `<h3>Animatori pentru petreceri de copii în sectoarele Bucureștiului</h3><p>Pentru evenimente organizate în București, poți consulta și paginile dedicate pentru sectoarele unde echipa Kassia poate susține programe de animație pentru copii: <a href="/animatori-petreceri-copii-sector-1/">animatori petreceri copii Sector 1</a>, <a href="/animatori-petreceri-copii-sector-2/">animatori petreceri copii Sector 2</a>, <a href="/animatori-petreceri-copii-sector-3/">animatori petreceri copii Sector 3</a>, <a href="/animatori-petreceri-copii-sector-4/">animatori petreceri copii Sector 4</a>, <a href="/animatori-petreceri-copii-sector-5/">animatori petreceri copii Sector 5</a>, <a href="/animatori-petreceri-copii-sector-6/">animatori petreceri copii Sector 6</a>.</p>`;
   
   content.body = content.body + microFix2 + microFix1;
   
   const resUpdate = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?id=eq.${secId}`, {
      method: 'PATCH',
      headers: {
         'apikey': SUPABASE_KEY,
         'Authorization': `Bearer ${SUPABASE_KEY}`,
         'Content-Type': 'application/json',
         'Prefer': 'return=representation'
      },
      body: JSON.stringify({ content })
   });
   
   const updated = await resUpdate.json();
   console.log("SUCCESS: Section 7 updated.");
}
run();
