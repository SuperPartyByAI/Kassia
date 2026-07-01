import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  console.log("Checking kassia_pricing_programs for 'asigur*'");
  const { data: programs } = await supabase.from('kassia_pricing_programs').select('*').or('short_description.ilike.%asigur%,includes_list.ilike.%asigur%,title.ilike.%asigur%');
  console.log("Programs found:", programs);

  console.log("Checking kassia_page_sections for 'asigur*'");
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_id, body').or('body.ilike.%asigur%,title.ilike.%asigur%');
  console.log("Sections found:");
  sections.forEach(s => console.log(s.id, s.section_id, s.body.substring(0, 100) + '...'));
})();
