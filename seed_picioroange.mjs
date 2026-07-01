import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'preturi-animatori-copii-bucuresti').single();
  
  // Extract Animatori pe picioroange content from DB before we delete it just in case
  const { data: picioroangeSec } = await supabase.from('kassia_page_sections').select('*').eq('heading', 'Animatori pe picioroange').eq('page_id', page.id).single();
  
  const program = {
      category: 'animatori',
      title: 'Animatori pe picioroange',
      duration_label: '1-2 ore',
      short_description: 'Pentru evenimente stradale, lansări de produse, petreceri corporate sau welcome invitați la evenimente premium.',
      price_amount: 350,
      currency: 'lei',
      price_prefix: 'de la',
      price_suffix: '/ 1 oră',
      includes_list: [
        "Welcome guests la locație",
        "Costume tematice spectaculoase",
        "Interacțiune și photo-corner mobil",
        "Ideal pentru spații mari și evenimente open-air"
      ],
      extra_options: [],
      details_url: '/preturi-animatori-copii-bucuresti/',
      order_index: 30,
      is_active: true,
      is_test: false,
      internal_note: 'Animatori picioroange',
      show_on_pricing_page: true,
      show_on_local_preview: false, 
      show_price_on_pricing_page: true,
      show_price_on_local_preview: false
  };

  const { error } = await supabase.from('kassia_pricing_programs').insert(program);
  if (error) console.error("Error seeding:", error.message);
  else console.log("Seeded picioroange successfully!");
  
  // Now delete the old hardcoded sections
  const headingsToDelete = ['Program cu 1 personaj animator', 'Program cu 2 personaje animatoare', 'Animatori pe picioroange'];
  const { error: delErr } = await supabase.from('kassia_page_sections').delete().eq('page_id', page.id).in('heading', headingsToDelete);
  
  if (delErr) console.log("Delete err", delErr);
  else console.log("Old hardcoded sections deleted successfully.");

})();
