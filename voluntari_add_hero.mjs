import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';
  
  const heroBody = `
    <ul style="list-style:none; padding:0; margin:1.5rem 0; display:flex; flex-direction:column; gap:0.5rem; text-align:left; font-size:1.1rem; max-width: 600px;">
      <li style="display:flex; align-items:flex-start; gap:0.5rem;"><span style="color:var(--primary);">✔</span> Pentru curți, vile și ansambluri rezidențiale</li>
      <li style="display:flex; align-items:flex-start; gap:0.5rem;"><span style="color:var(--primary);">✔</span> Recomandare rapidă: un personaj animator sau două personaje animatoare</li>
      <li style="display:flex; align-items:flex-start; gap:0.5rem;"><span style="color:var(--primary);">✔</span> Plan pentru interior, exterior sau terasă</li>
      <li style="display:flex; align-items:flex-start; gap:0.5rem;"><span style="color:var(--primary);">✔</span> Răspuns pe WhatsApp pentru disponibilitate</li>
    </ul>
  `;

  const newHero = {
    page_id: pageId,
    section_type: 'hero',
    order_index: 1,
    heading: 'Hero Voluntari',
    content: {
      body: heroBody,
      cta_text: 'Scrie-ne pe WhatsApp pentru recomandarea potrivită locației',
      cta_url: 'https://wa.me/40722301980'
    }
  };

  const { error } = await supabase.from('kassia_page_sections').insert([newHero]);
  if (error) console.error("Error inserting:", error);
  else console.log("Hero section inserted successfully!");
})();
