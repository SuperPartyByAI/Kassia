import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  
  const { error } = await supabase.from('kassia_pages').update({
    title: 'Spectacol de Magie Copii București - Iluzionist pentru Petreceri | Kassia',
    h1: 'Spectacol de Magie și Iluzionism pentru Copii',
    meta_title: 'Spectacol de Magie Copii București & Ilfov - Magician Petreceri',
    meta_description: 'Transformă petrecerea copilului tău într-o experiență de neuitat cu un spectacol de magie interactiv. Magician profesionist, trucuri fascinante și momente pline de umor.',
    index_status: 'index'
  }).eq('id', page.id);
  
  console.log('Update error:', error);
}

run();
