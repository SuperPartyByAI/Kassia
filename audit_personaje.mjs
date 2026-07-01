import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('Supabase URL or Key is missing.');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  console.log("=== TASK 1 AUDIT ===");

  // 1. Check existing characters/mascots pages
  console.log("Checking for existing characters/mascots pages...");
  const { data: pages } = await supabase
    .from('kassia_pages')
    .select('path, title, status')
    .ilike('path', '%personaje%')
    .or('path.ilike.%mascote%');
  
  if (pages && pages.length > 0) {
    console.log("Found existing pages:", pages);
  } else {
    console.log("No existing /personaje/ or /mascote/ pages found.");
  }

  // 2. Check internal links related to characters
  console.log("\nChecking for existing internal links targeting characters/mascots...");
  const { data: links } = await supabase
    .from('kassia_internal_links')
    .select('anchor_text, target_page_id, kassia_pages!target_page_id(path)')
    .or('anchor_text.ilike.%personaj%,anchor_text.ilike.%mascot%');

  if (links && links.length > 0) {
    console.log("Found existing links:", JSON.stringify(links, null, 2));
  } else {
    console.log("No existing internal links found for 'personaj' or 'mascot'.");
  }

  // 3. Check for specific source pages to verify their existence
  const pathsToCheck = [
    '/',
    '/animatori-petreceri-copii/',
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/preturi-animatori-copii-bucuresti/'
  ];
  console.log(`\nVerifying existence of source pages for internal linking...`);
  const { data: srcPages } = await supabase
    .from('kassia_pages')
    .select('path, id, status')
    .in('path', pathsToCheck);
    
  console.log("Source pages found:");
  srcPages.forEach(p => console.log(`- ${p.path} [${p.status}] (ID: ${p.id})`));

}

run();
