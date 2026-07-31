import { createClient } from '@supabase/supabase-js';
const supabase = createClient('https://jrfhprnuxxfwkwjwdsez.supabase.co', 'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx');

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  for (let i = 0; i < cards.length; i++) {
    // Just use a clean, safe alt text based on the title, without mechanical phrasing
    cards[i].alt_text = `Costum animator petreceri copii: ${cards[i].title}`;
    // Also clear any short_description that might have bad text
    if (i >= 12) {
       cards[i].short_description = "Costum pentru petreceri de copii cu activități distractive.";
    }
  }
  
  const newContent = { ...section.content, cards };
  const { error } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', section.id);
  if (error) console.error(error);
  else console.log('Updated alt texts successfully');
}
run();
