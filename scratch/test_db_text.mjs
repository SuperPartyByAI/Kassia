import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  realtime: {
    transport: ws,
  },
});

async function run() {
  const { data: page } = await supabase
    .from('kassia_pages')
    .select('id')
    .eq('path', '/animatori-petreceri-copii-herastrau/')
    .single();

  const { data: sections } = await supabase
    .from('kassia_page_sections')
    .select('id, content')
    .eq('page_id', page.id);

  for (const sec of sections) {
    if (sec.content && sec.content.cards) {
      const card = sec.content.cards[1];
      if (card && card.body) {
        console.log('Text:', card.body);
        console.log('Char codes:');
        for (let i = 0; i < card.body.length; i++) {
          console.log(`  ${card.body[i]}: ${card.body.charCodeAt(i)}`);
        }
      }
    }
  }
}

run().catch(console.error);
