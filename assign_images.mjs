import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  const updates = [
    { heading: 'Bucurie și interacțiune pentru cei mici', image_url: '/images/animatori/animator-petrecere-copii-bucuresti-hero.webp', image_alt: 'Animatori la o petrecere pentru copii' },
    { heading: 'Animatori pentru petreceri în cartierul Berceni și zona de sud', image_url: '/images/animatori/animatori-copii-bucuresti-evenimente.webp', image_alt: 'Animatori petrecere spatiu interior apartament restaurant' },
    { heading: 'Petreceri în comuna Berceni, curți și ansambluri rezidențiale', image_url: '/images/animatori/animatori-copii-bucuresti-zone-acoperite.webp', image_alt: 'Animatori petrecere curte spatiu exterior' },
    { heading: 'Activități care se pot integra în program', image_url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp', image_alt: 'Jocuri interactive si activitati cu animatori' }
  ];

  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', pageId);
  
  for (let u of updates) {
      let sec = sections.find(s => s.heading === u.heading);
      if (sec) {
          let c = typeof sec.content === 'string' ? JSON.parse(sec.content) : sec.content;
          c.image_url = u.image_url;
          c.image_alt = u.image_alt;
          await supabase.from('kassia_page_sections').update({ content: c }).eq('id', sec.id);
          console.log(`Updated image for ${u.heading}`);
      }
  }
})();
