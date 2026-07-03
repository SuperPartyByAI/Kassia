import fs from 'fs';
import path from 'path';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const file = path.join(process.cwd(), 'audit_animatori_pillar_costume_gallery_v4', 'full_73_catalog_copy.json');
  const catalogData = JSON.parse(fs.readFileSync(file, 'utf-8'));
  
  const cards = catalogData.map(c => ({
    image_url: c.optimized_file,
    title: c.generic_title,
    cta_text: '',
    cta_url: '',
    alt_text: c.safe_alt_text,
    short_description: c.short_description,
    width: c.width,
    height: c.height
  }));

  const { data: pageData, error: pageErr } = await supabase
    .from('kassia_pages')
    .select('id')
    .eq('slug', 'animatori-petreceri-copii')
    .single();

  if (pageErr || !pageData) {
    console.error('Page not found', pageErr);
    process.exit(1);
  }

  const { data: sectionData, error: secErr } = await supabase
    .from('kassia_page_sections')
    .select('id, content')
    .eq('page_id', pageData.id)
    .eq('section_type', 'costume_catalog')
    .single();

  if (secErr || !sectionData) {
    console.error('Section not found', secErr);
    process.exit(1);
  }

  const updatedContent = {
    ...sectionData.content,
    cards: cards
  };

  const { error: updateErr } = await supabase
    .from('kassia_page_sections')
    .update({ content: updatedContent })
    .eq('id', sectionData.id);

  if (updateErr) {
    console.error('Update failed', updateErr);
  } else {
    console.log(`Successfully updated costume catalog with ${cards.length} items.`);
  }
}
run();
