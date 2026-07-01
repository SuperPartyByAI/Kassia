import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // Fetch sections
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId);
  
  for (const s of sections) {
      let updated = false;
      if (s.content.body.includes("răspundem cu promptitudine solicitărilor venite din ansamblurile rezidențiale noi din Ilfov")) {
          s.content.body = s.content.body.replace("răspundem cu promptitudine solicitărilor venite din ansamblurile rezidențiale noi din Ilfov", "organizăm evenimente și pentru familiile din ansamblurile rezidențiale noi din Ilfov");
          updated = true;
      }
      if (s.content.body.includes("jocuri de mișcare și întreceri captivante care valorifică spațiul exterior")) {
          s.content.body = s.content.body.replace("jocuri de mișcare și întreceri captivante care valorifică spațiul exterior", "jocuri de mișcare și întreceri adaptate spațiului exterior");
          updated = true;
      }
      if (s.content.body.includes("ștafete, și chiar animatori pe picioroange sau mascote voluminoase")) {
          s.content.body = s.content.body.replace("ștafete, și chiar animatori pe picioroange sau mascote voluminoase", "ștafete și, unde se potrivește, animatori pe picioroange sau mascote voluminoase");
          updated = true;
      }

      if (updated) {
          const { error } = await supabase.from('kassia_page_sections').update({ content: s.content }).eq('id', s.id);
          if (error) console.error("Error updating", s.id, error);
          else console.log("Updated section", s.id);
      }
  }
})();
