import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

const PAGE_ID = '3a754972-74d7-4632-9dfa-2aa9be7682db';

async function viewSections() {
  const { data: sections, error } = await supabase
    .from('kassia_page_sections')
    .select('id, section_type, order_index, heading, content')
    .eq('page_id', PAGE_ID)
    .order('order_index', { ascending: true });

  if (error) {
    console.error("Error fetching sections:", error);
    process.exit(1);
  }

  sections.forEach(s => {
    console.log(`--- Section ${s.order_index} (Type: ${s.section_type}, ID: ${s.id}) ---`);
    console.log(JSON.stringify(s.content, null, 2));
  });
}

viewSections().catch(console.error);
