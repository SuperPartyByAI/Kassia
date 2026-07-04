import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  
  await supabase.from('kassia_gallery_items').delete().eq('page_id', page.id);
  
  const galleryItems = [
    { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp', alt_text: 'Magician Bucuresti', order_index: 10 },
    { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp', alt_text: 'Copii uimiti magie', order_index: 20 },
    { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp', alt_text: 'Trucuri petrecere', order_index: 30 }
  ];
  const { error: errorGal } = await supabase.from('kassia_gallery_items').insert(galleryItems);
  if (errorGal) console.error("ERROR INSERTING GALLERY:", errorGal);
  else console.log("Gallery images fixed!");
}

run();
