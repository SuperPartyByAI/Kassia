import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

async function run() {
  const { data } = await supabase.from('pages').select('*').ilike('url', '%animatori-petreceri-copii%');
  if (!data || data.length === 0) {
      console.log("NOT FOUND ANY");
      return;
  }
  const match = data.find(p => p.url === '/animatori-petreceri-copii' || p.url === '/animatori-petreceri-copii/');
  if (!match) {
      console.log("EXACT MATCH NOT FOUND. Found:", data.map(d=>d.url));
      return;
  }
  fs.writeFileSync('pillar_content_before.html', match.content || "");
  fs.writeFileSync('pillar_row.json', JSON.stringify(match, null, 2));
  console.log("FETCHED");
}
run();
