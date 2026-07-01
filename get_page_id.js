import fs from 'fs';
const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?path=eq./animatori-petreceri-copii/&select=id`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s = await resSec.json();
   console.log("Page ID:", s[0].id);

   const resSec2 = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?page_id=eq.${s[0].id}&select=id,section_type,heading,content`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s2 = await resSec2.json();
   for (const sec of s2) {
       const text = JSON.stringify(sec.content);
       if (text.includes('câteva săptămâni')) {
           console.log(`Found in Section ID: ${sec.id}`);
           console.log(`Type: ${sec.section_type}`);
           console.log(`Heading: ${sec.heading}`);
       }
   }
}
run();
