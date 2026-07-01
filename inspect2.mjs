import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const slugs = [
  'decoratiuni-baloane-bucuresti',
  'decoratiuni-baloane-botez-bucuresti',
  'decoratiuni-baloane-majorat-bucuresti',
  'decoratiuni-baloane-aniversare-copii-bucuresti',
  'decoratiuni-baloane-aniversare-adulti-bucuresti'
];

async function run() {
  for (const slug of slugs) {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', slug).single();
    if (!page) continue;
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    console.log(`\n--- FAQs for ${slug} ---`);
    faqs.forEach(f => {
      console.log(`Q: ${f.question}`);
      console.log(`A: ${f.answer}`);
    });
  }
}

run();
