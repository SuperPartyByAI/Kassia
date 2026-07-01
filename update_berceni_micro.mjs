import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // 1. Update title & meta
  const { error: metaErr } = await supabase.from('kassia_pages')
    .update({
      title: 'Animatori Petreceri Copii Berceni | Sector 4 și Ilfov | Kassia',
      meta_title: 'Animatori Petreceri Copii Berceni | Sector 4 și Ilfov | Kassia',
      meta_description: 'Animatori pentru petreceri de copii în cartierul Berceni, Sector 4 și comuna Berceni, Ilfov. Programe adaptate pentru apartamente, restaurante, grădinițe, curți și spații de joacă.'
    })
    .eq('id', pageId);
  if (metaErr) console.error("Meta err:", metaErr); else console.log("Meta updated.");

  // 2. Fetch existing sections to update them with links
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).order('display_order', { ascending: true });
  
  for (let s of sections) {
    let newBody = s.content.body;
    
    // Add links (only those that were 200)
    // - "animatori pentru petreceri de copii" (not sure if this exact string is there, let's see)
    // Actually, I can just inject these into the text if they exist, or the user meant I should rewrite a little to include them?
    // "Adaugă linkuri interne contextuale în corp, cu ancore curate:"
    // I will replace occurrences of these phrases if they exist.
    // Let's print existing text to see.
  }
  console.log("Existing sections:", JSON.stringify(sections.map(s => ({id: s.id, heading: s.heading, body: s.content.body})), null, 2));

})();
