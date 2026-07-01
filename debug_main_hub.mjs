import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Check for duplicate pages
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug, path').eq('path', '/animatori-petreceri-copii/');
  console.log(`Found ${pages.length} pages for /animatori-petreceri-copii/`);
  console.log(pages);

  // Check how many sections exist for the known page id
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, content, heading').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db');
  console.log(`Found ${sections.length} sections for page ID 3a754972-74d7-4632-9dfa-2aa9be7682db`);

  // Check if there are other sections containing "face-painting"
  const { data: badSecs } = await supabase.from('kassia_page_sections').select('id, page_id, heading').ilike('content->>body', '%face-painting%');
  console.log("Sections with face-painting in content->body:");
  for (const bs of badSecs) {
      const { data: p } = await supabase.from('kassia_pages').select('path').eq('id', bs.page_id).single();
      console.log(`- ${bs.id} | Page: ${p ? p.path : 'UNKNOWN'} | Heading: ${bs.heading}`);
  }

  // Check if there are other sections containing "Costurile pot varia marginal"
  const { data: badSecs2 } = await supabase.from('kassia_page_sections').select('id, page_id, heading').ilike('content->>body', '%Costurile pot varia marginal%');
  console.log("Sections with Costurile pot varia marginal:");
  for (const bs of badSecs2) {
      const { data: p } = await supabase.from('kassia_pages').select('path').eq('id', bs.page_id).single();
      console.log(`- ${bs.id} | Page: ${p ? p.path : 'UNKNOWN'} | Heading: ${bs.heading}`);
  }

})();
