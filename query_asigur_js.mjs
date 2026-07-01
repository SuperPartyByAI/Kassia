import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: programs } = await supabase.from('kassia_pricing_programs').select('*');
  const badPrograms = programs.filter(p => JSON.stringify(p).toLowerCase().includes('asigur'));
  console.log("Programs with 'asigur':", badPrograms);

  const { data: sections } = await supabase.from('kassia_page_sections').select('*');
  const badSections = sections.filter(s => JSON.stringify(s).toLowerCase().includes('asigur'));
  console.log("Sections with 'asigur':", badSections.map(s => s.id + ' ' + s.section_id));
})();
