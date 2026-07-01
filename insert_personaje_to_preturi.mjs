import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/personaje-animatori-copii-bucuresti/').single();
  
  const newSection = {
    page_id: page.id,
    section_type: 'content',
    heading: 'Detalii pentru programele cu animatori',
    order_index: 31,
    content: {
      body: '<p>După alegerea personajului, poți consulta variantele de program cu 1 personaj animator, 2 personaje animatoare și animatori pe picioroange pe pagina dedicată detaliilor pentru animatori.</p>',
      cta_text: 'Vezi detaliile pentru animatori',
      cta_url: '/preturi-animatori-copii-bucuresti/'
    }
  };

  const { error } = await supabase.from('kassia_page_sections').insert(newSection);
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Inserted link back to Preturi successfully!');
  }
}

run();
