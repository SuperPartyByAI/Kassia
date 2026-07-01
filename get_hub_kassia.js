import fs from 'fs';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/PUBLIC_SUPABASE_ANON_KEY=(.*)/)[1].trim();

async function run() {
   const resPage = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?slug=eq.animatori-petreceri-copii&select=id`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const pageData = await resPage.json();
   if (!pageData || pageData.length === 0) {
       console.log("PAGE NOT FOUND");
       return;
   }
   const pageId = pageData[0].id;
   console.log("PAGE_ID:", pageId);
   
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,section_type,order_index,content_html&order=order_index.asc`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const sections = await resSec.json();
   
   for (const s of sections) {
       let contentStr = typeof s.content_html === 'object' ? JSON.stringify(s.content_html) : s.content_html;
       console.log('\n--- SECTION ' + s.id + ' | TYPE: ' + s.section_type + ' | ORDER: ' + s.order_index + ' ---');
       const hasPrices = contentStr && (contentStr.match(/\d+\s*(lei|ron|euro)/i) || contentStr.match(/(pret|tarif|preț|prețul|tariful)/i));
       console.log('Has Pricing Indicators: ' + (hasPrices ? 'YES' : 'NO'));
       console.log('Snippet: ' + (contentStr ? contentStr.substring(0, 150).replace(/\n/g, ' ') : '') + '...');
   }
}
run();
