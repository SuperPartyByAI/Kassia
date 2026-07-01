import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    auth: {
        persistSession: false,
    },
    global: {
        fetch: fetch,
    },
    realtime: {
        transport: WebSocket,
    },
});

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-voluntari/').single();
  
  if (!page) {
    console.error("Page not found");
    return;
  }

  // Find the logistics section
  const { data: sections, error: fetchErr } = await supabase.from('kassia_page_sections').select('id, heading').eq('page_id', page.id);
  
  if (fetchErr) {
    console.error(fetchErr);
    return;
  }

  const badSection = sections.find(s => s.heading && s.heading.includes('Logistică'));
  
  if (badSection) {
      console.log("Updating existing section...");
      const { error: upErr } = await supabase.from('kassia_page_sections').update({
          heading: 'Organizarea activităților în curți și ansambluri rezidențiale din Voluntari',
          content: JSON.stringify({
            is_active: true,
            body: `
              <p>În curțile mari din Voluntari și Pipera, activitățile merg mai bine atunci când zona de joc este aleasă dinainte. Recomandăm un spațiu vizibil pentru părinți, aproape de restul invitaților, dar fără obiecte care pot întrerupe jocurile. Animatorul poate folosi un punct de regrupare, jocuri pe echipe și momente scurte de tranziție între activități, astfel încât copiii să rămână implicați. Pentru ansamblurile rezidențiale din Pipera, Iancu Nicolae sau zona de nord a Bucureștiului, este util să existe acces auto temporar pentru descărcarea materialelor și o zonă clară pentru începerea programului.</p>
            `
          })
      }).eq('id', badSection.id);
      
      if (upErr) console.error(upErr);
      else console.log("Update complete.");
  } else {
      console.log("Section not found.");
  }
}
run();
