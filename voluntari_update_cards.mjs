import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
  
  for (let s of sections) {
    if (s.heading === "Pe scurt pentru părinți din Voluntari și Pipera") {
      let c = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
      c.image_url = "/images/locatii/voluntari_pe_scurt.png";
      c.image_alt = "Activități cu animatori pentru copii în Voluntari și Pipera";
      await supabase.from('kassia_page_sections').update({ section_type: 'feature_card', content: c }).eq('id', s.id);
      console.log("Updated Pe scurt");
    }
    if (s.heading === "Cum pregătim zona de joc într-o curte din Voluntari sau Pipera") {
      let c = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
      c.image_url = "/images/locatii/voluntari_zona_joc.png";
      c.image_alt = "Zonă de joc pregătită pentru copii într-o curte din Voluntari";
      await supabase.from('kassia_page_sections').update({ section_type: 'feature_card', content: c }).eq('id', s.id);
      console.log("Updated Zona de joc");
    }
    if (s.heading === "Un personaj animator sau două personaje animatoare?") {
      let c = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
      c.image_url = "/images/locatii/voluntari_un_personaj_sau_doua.png";
      c.image_alt = "Personaje animatoare la petrecere pentru copii în Pipera";
      await supabase.from('kassia_page_sections').update({ section_type: 'feature_card', content: c }).eq('id', s.id);
      console.log("Updated Un personaj sau doua");
    }
  }
})();
