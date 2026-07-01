import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  const cardBody = `
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-top: 1rem;">
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Cartierul Berceni / Sector 4</h3>
    <p style="margin-bottom:0; font-size:0.95rem; color: #475569;">Pentru apartamente, restaurante, grădinițe și spații de joacă din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și Grand Arena, folosim activități compacte, jocuri de echipă și momente creative adaptate spațiului interior.</p>
  </div>
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Comuna Berceni / Ilfov</h3>
    <p style="margin-bottom:0; font-size:0.95rem; color: #475569;">Pentru case, curți, vile și ansambluri rezidențiale, programul poate include mai multe jocuri de mișcare, mini-disco, ștafete și activități în aer liber. Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului.</p>
  </div>
</div>
  `;

  const detaliiBody = `<p>Pentru a pregăti programul potrivit, ne ajută să știm adresa evenimentului, tipul locației, vârsta copiilor, numărul aproximativ de participanți, dacă activitățile se desfășoară în interior sau exterior și dacă există o temă sau un personaj preferat.</p>`;

  const { error: insErr } = await supabase.from('kassia_page_sections').insert([
    {
      page_id: pageId,
      section_type: 'editorial',
      heading: 'Berceni urban sau comuna Berceni: alegem programul după locație',
      content: { body: cardBody },
      order_index: 2
    },
    {
      page_id: pageId,
      section_type: 'editorial',
      heading: 'Ce detalii ne ajută înainte de eveniment',
      content: { body: detaliiBody },
      order_index: 6
    }
  ]);
  
  if (insErr) {
    console.error("Insert Error:", insErr);
  } else {
    console.log("Sections inserted successfully!");
  }
})();
