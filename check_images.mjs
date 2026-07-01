import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  const { data: sections, error } = await supabase.from('kassia_page_sections').select('heading, section_type, content').eq('page_id', pageId);
  if (error) console.error("Error:", error);
  else {
      sections.forEach(s => {
          let c = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
          console.log(`Heading: ${s.heading} | Type: ${s.section_type} | Image: ${c.image_url || 'NONE'}`);
      });
  }
})();
