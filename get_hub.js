import fs from 'fs';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/PUBLIC_SUPABASE_ANON_KEY=(.*)/)[1].trim();

async function run() {
   const resPage = await fetch(`${SUPABASE_URL}/rest/v1/pages?slug=eq.animatori-petreceri-copii&select=id`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const pageData = await resPage.json();
   const pageId = pageData[0].id;
   console.log("PAGE_ID:", pageId);
   
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/sections?page_id=eq.${pageId}&select=id,section_type,section_order,content&order=section_order.asc`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const sections = await resSec.json();
   fs.writeFileSync('sections_p2.json', JSON.stringify(sections, null, 2));
   
   for (const s of sections) {
       let contentStr = typeof s.content === 'object' ? JSON.stringify(s.content) : s.content;
       console.log('\n--- SECTION ' + s.id + ' | TYPE: ' + s.section_type + ' | ORDER: ' + s.section_order + ' ---');
       const hasPrices = contentStr.match(/\d+\s*(lei|ron|euro)/i) || contentStr.match(/(pret|tarif|preț|prețul|tariful)/i);
       console.log('Has Pricing Indicators: ' + (hasPrices ? 'YES' : 'NO'));
       console.log('Snippet: ' + contentStr.substring(0, 150).replace(/\n/g, ' ') + '...');
   }
}
run();
