import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('Supabase URL or Key is missing.');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  console.log("Fetching homepage ID...");
  const { data: pageData, error: pageError } = await supabase
    .from('kassia_pages')
    .select('id')
    .eq('path', '/')
    .single();

  if (pageError || !pageData) {
    console.error("Error fetching homepage:", pageError);
    return;
  }
  const pageId = pageData.id;

  console.log("Fetching sections for homepage...");
  const { data: sections, error: secError } = await supabase
    .from('kassia_page_sections')
    .select('id, section_type, content')
    .eq('page_id', pageId);

  if (secError) {
    console.error("Error fetching sections:", secError);
    return;
  }

  let found = false;
  for (const sec of sections) {
    let contentStr = JSON.stringify(sec.content);
    if (contentStr.includes('Vezi oferta pentru Botez')) {
      console.log(`Found string in section ${sec.section_type} (ID: ${sec.id})`);
      const newContentStr = contentStr.replace(/Vezi oferta pentru Botez/g, 'Vezi detaliile pentru Botez');
      const newContent = JSON.parse(newContentStr);
      
      const { error: updateError } = await supabase
        .from('kassia_page_sections')
        .update({ content: newContent })
        .eq('id', sec.id);

      if (updateError) {
        console.error("Failed to update section:", updateError);
      } else {
        console.log("Successfully updated section.");
        found = true;
      }
    }
  }

  if (!found) {
    console.log("String 'Vezi oferta pentru Botez' not found in any section content.");
  }
}

run();
