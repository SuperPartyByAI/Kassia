import fs from 'fs';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const faqId = 'f6a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c';
   const newText = "Este recomandat să ne trimiți detaliile evenimentului din timp, pentru a verifica disponibilitatea echipei pentru data dorită și pentru a stabili structura programului.";

   const res = await fetch(`${SUPABASE_URL}/rest/v1/kassia_faqs?id=eq.${faqId}`, {
      method: 'PATCH',
      headers: {
         'apikey': SUPABASE_KEY,
         'Authorization': `Bearer ${SUPABASE_KEY}`,
         'Content-Type': 'application/json',
         'Prefer': 'return=representation'
      },
      body: JSON.stringify({ answer: newText })
   });

   if (!res.ok) {
       console.error("Failed to update FAQ:", await res.text());
   } else {
       const data = await res.json();
       console.log("FAQ updated successfully:", data);
   }
}
run();
