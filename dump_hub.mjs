import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, title, heading, order_index, content').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db').order('order_index');
  
  let mapText = "";
  let toxicText = "";
  let toxicProtected = "";
  
  const toxicWords = ['perfect', 'premium', 'magie', 'pachete', 'asigura', 'asigură', 'asiguram', 'asigurăm', 'ideal', 'garantat', 'memorabil', 'de neuitat'];
  
  sections.forEach(s => {
      const isProtected = s.section_type === 'reviews' || s.section_type === 'testimonials';
      const content = JSON.stringify(s).toLowerCase();
      const toxic = toxicWords.filter(t => content.includes(t));
      
      mapText += `- **[Order: ${s.order_index}] [Type: ${s.section_type}]** Heading: "${s.heading || s.title}" | Target action: \n`;
      
      if (toxic.length > 0) {
          if (isProtected) {
              toxicProtected += `- [Type: ${s.section_type}] Heading: "${s.heading || s.title}" -> Toxic: [${toxic.join(', ')}]\n`;
          } else {
              toxicText += `- [Type: ${s.section_type}] Heading: "${s.heading || s.title}" -> Toxic: [${toxic.join(', ')}]\n`;
          }
      }
  });
  
  console.log("SECTION MAP:");
  console.log(mapText);
  console.log("\nTOXIC IN EDITABLE:");
  console.log(toxicText);
  console.log("\nTOXIC IN PROTECTED:");
  console.log(toxicProtected);
})();
