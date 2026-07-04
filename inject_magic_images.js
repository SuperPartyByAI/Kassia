import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  
  // Update Hero Image
  const { data: heroData } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'hero').single();
  if (heroData) {
    heroData.content.image_url = '/images/magie/spectacol-magie-copii-bucuresti-show.png';
    await supabase.from('kassia_page_sections').update({ content: heroData.content }).eq('id', heroData.id);
  }

  // Fetch all service_details sections
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id).eq('section_type', 'service_details');
  
  for (let sec of sections) {
    if (sec.heading === 'Magie adevărată care fascinează copiii și uimește părinții') {
      if (!sec.content.body.includes('<img')) {
        sec.content.body = `<img src="/images/magie/spectacol-magie-copii-bucuresti-bagheta.png" alt="Copil cu bagheta magica" class="rounded-2xl shadow-lg" style="width:100%; max-width:800px; display:block; margin: 2rem auto; object-fit:cover; border: 4px solid white;" />` + sec.content.body;
        await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
      }
    }
    if (sec.heading === 'Cum decurge prezența magicianului (Pas cu Pas)') {
      if (!sec.content.body.includes('<img')) {
        sec.content.body = `<img src="/images/magie/spectacol-magie-copii-bucuresti-setup.png" alt="Setup masa magicianului" class="rounded-2xl shadow-lg" style="width:100%; max-width:800px; display:block; margin: 2rem auto; object-fit:cover; border: 4px solid white;" />` + sec.content.body;
        await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
      }
    }
    if (sec.heading === 'Spectacol de Magie acasă, la curte, restaurant sau grădiniță') {
      if (!sec.content.body.includes('<img')) {
        sec.content.body = `<img src="/images/magie/spectacol-magie-copii-bucuresti-comedie.png" alt="Magician stand up comedy copii" class="rounded-2xl shadow-lg" style="width:100%; max-width:800px; display:block; margin: 2rem auto; object-fit:cover; border: 4px solid white;" />` + sec.content.body;
        await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
      }
    }
  }

  // Update Gallery
  await supabase.from('kassia_gallery_items').delete().eq('page_id', page.id);
  const galleryItems = [
    { page_id: page.id, url: '/images/magie/spectacol-magie-copii-bucuresti-show.png', alt_text: 'Spectacol de magie Bucuresti', order_index: 10 },
    { page_id: page.id, url: '/images/magie/spectacol-magie-copii-bucuresti-iepuras.png', alt_text: 'Aparitie iepuras magic', order_index: 20 },
    { page_id: page.id, url: '/images/magie/spectacol-magie-copii-bucuresti-comedie.png', alt_text: 'Magician amuzant petreceri copii', order_index: 30 },
    { page_id: page.id, url: '/images/magie/spectacol-magie-copii-bucuresti-bagheta.png', alt_text: 'Copil cu bagheta magica', order_index: 40 },
    { page_id: page.id, url: '/images/magie/spectacol-magie-copii-bucuresti-setup.png', alt_text: 'Recuzita magie copii', order_index: 50 }
  ];
  await supabase.from('kassia_gallery_items').insert(galleryItems);

  console.log('Images injected successfully into sections and gallery!');
}

run();
