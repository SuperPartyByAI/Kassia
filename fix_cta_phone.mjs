import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';
  const heading = 'Berceni urban sau comuna Berceni: alegem programul după locație';

  const phone = '0768098268';
  const whatsappText = 'Buna! As dori mai multe detalii despre decoratiunile cu baloane.';
  const whatsappNumber = '40768098268'; // EXACT MATCH WITH HEADER logic
  const whatsappLink = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(whatsappText)}`;

  const cardBody = `
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-top: 1rem;">
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981; display: flex; flex-direction: column;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Cartierul Berceni / Sector 4</h3>
    <p style="margin-bottom:1rem; font-size:0.95rem; color: #475569; flex-grow: 1;">Pentru apartamente, restaurante, grădinițe și spații de joacă din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și Grand Arena, folosim activități compacte, jocuri de echipă și momente creative adaptate spațiului interior.</p>
    <a href="/animatori-petreceri-copii-sector-4/" style="font-size: 0.9rem; color: #10b981; text-decoration: none; font-weight: 600; align-self: flex-start;">Vezi pagina pentru Sector 4 &rarr;</a>
  </div>
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981; display: flex; flex-direction: column;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Comuna Berceni / Ilfov</h3>
    <p style="margin-bottom:1rem; font-size:0.95rem; color: #475569; flex-grow: 1;">Pentru case, curți, vile și ansambluri rezidențiale, programul poate include mai multe jocuri de mișcare, mini-disco, ștafete și activități în aer liber. Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului.</p>
    <a href="${whatsappLink}" target="_blank" rel="noopener noreferrer" style="font-size: 0.9rem; color: #10b981; text-decoration: none; font-weight: 600; align-self: flex-start;">Scrie-ne pe WhatsApp &rarr;</a>
  </div>
</div>
  `;

  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId).eq('heading', heading);
  
  if (sections && sections.length > 0) {
      let sec = sections[0];
      let c = typeof sec.content === 'string' ? JSON.parse(sec.content) : sec.content;
      c.body = cardBody;
      await supabase.from('kassia_page_sections').update({ content: c }).eq('id', sec.id);
      console.log("Updated Ilfov CTA to WhatsApp with CORRECT PHONE successfully!");
  }
})();
