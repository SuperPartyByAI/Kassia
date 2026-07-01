import fs from 'fs';
const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resSec2 = await fetch(`${SUPABASE_URL}/rest/v1/kassia_faqs?page_id=eq.3a754972-74d7-4632-9dfa-2aa9be7682db&select=id,question,answer`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s2 = await resSec2.json();
   for (const faq of s2) {
       const text = JSON.stringify(faq);
       if (text.includes('săptămâni')) {
           console.log(`Found in FAQ ID: ${faq.id}`);
           console.log(`Question: ${faq.question}`);
       }
   }
}
run();
