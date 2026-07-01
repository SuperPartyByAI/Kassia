import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data, error } = await supabase
    .from('pages')
    .select('*')
    .eq('id', '3a754972-74d7-4632-9dfa-2aa9be7682db')
    .single();
  if (error) { console.error(error); return; }
  
  console.log("TITLE: " + data.meta_title);
  console.log("META: " + data.meta_description);
  console.log("H1: " + data.hero_h1);
  console.log("H2s: ");
  if(data.sections) {
    data.sections.forEach(s => console.log("- " + s.heading));
  }
}
run();
