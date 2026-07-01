import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db'; // REAL Main Hub

  // 1. Fix "Un personaj animator sau două personaje animatoare?"
  const { data: sec1 } = await supabase.from('kassia_page_sections').select('content').eq('id', 'd4b15f67-4567-789a-bcde-f0123456789a').single();
  if (sec1) {
    let body = sec1.content.body;
    body = body.replace('face-painting', 'momentele creative individuale');
    body = body.replace('experiență superioară', 'o desfășurare mai clară a activităților');
    await supabase.from('kassia_page_sections').update({ content: { ...sec1.content, body } }).eq('id', 'd4b15f67-4567-789a-bcde-f0123456789a');
    console.log("Fixed 1 vs 2 animators block");
  }

  // 2. Fix "Zone acoperite"
  const { data: zoneSecs } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId).eq('heading', 'Zone acoperite în București și Ilfov');
  if (zoneSecs && zoneSecs.length > 0) {
    const zoneSec = zoneSecs[0];
    let body = zoneSec.content.body;
    body = body.replace('Costurile pot varia marginal doar în funcție de distanța în afara Bucureștiului, conform detaliilor de pe <a href="/preturi-animatori-copii-bucuresti/">pagina de prețuri</a>.', 'Pentru detalii comerciale actualizate și opțiuni suplimentare, consultă pagina de prețuri pentru programele cu animatori.');
    // Just in case it was already replaced or slightly different:
    if (!body.includes('Pentru detalii comerciale actualizate')) {
        body = body.replace(/Costurile pot varia marginal.*/, 'Pentru detalii comerciale actualizate și opțiuni suplimentare, consultă pagina de prețuri pentru programele cu animatori.');
    }
    await supabase.from('kassia_page_sections').update({ content: { ...zoneSec.content, body } }).eq('id', zoneSec.id);
    console.log("Fixed Zone acoperite block");
  }

  // 3. Deactivate legacy sections properly (is_active: false)
  const legacyIds = [
    'e5c26f78-5678-89ab-cdef-0123456789ab', // Servicii conexe...
    '2a39f6df-b924-4f0f-8f81-80a57e62a19d', // De ce sa alegi Kassia...
    'f6d37f89-6789-9abc-def0-123456789abc', // Ghid pentru planificarea (process_steps, rendered by something else? wait, process_steps is excluded from content loop, but let's hide it anyway)
    '323680be-7197-4038-9468-cb53b1bf4fcf'  // N/A block
  ];
  
  for (const id of legacyIds) {
    const { data: s } = await supabase.from('kassia_page_sections').select('content').eq('id', id).single();
    if (s && s.content) {
      await supabase.from('kassia_page_sections').update({ content: { ...s.content, is_active: false } }).eq('id', id);
      console.log(`Deactivated legacy block ${id} using is_active: false`);
    }
  }

  // 4. Find the "Animatori pentru petreceri de copii în sectoarele Bucureștiului" block
  // This could be internal links or another section I missed.
  const { data: allSecs } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', pageId);
  for (const s of allSecs) {
    if (s.heading && s.heading.includes('sectoarele Bucureștiului')) {
      console.log(`Found unknown legacy block: ${s.heading} (${s.id})`);
      await supabase.from('kassia_page_sections').update({ content: { ...s.content, is_active: false } }).eq('id', s.id);
      console.log(`Deactivated it.`);
    }
  }
})();
