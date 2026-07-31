import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
  if (page) {
     const { data: sections } = await supabase.from('kassia_page_sections').select('id, content, heading').eq('page_id', page.id);
     
     for (const s of sections) {
        if (s.content) {
            let contentStr = typeof s.content === 'string' ? s.content : JSON.stringify(s.content);
            if (contentStr.includes('animatori-copii-bucuresti-activitati.webp')) {
               console.log("Found broken image in section:", s.id, "heading:", s.heading);
               contentStr = contentStr.replace(/animatori-copii-bucuresti-activitati\.webp/g, 'animatori-copii-bucuresti-program-animatie.webp');
               
               const newContent = JSON.parse(contentStr);
               const { error } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', s.id);
               if (error) console.error("Error updating", error);
               else console.log("Updated successfully!");
            }
        }
     }
  }
}

run();
