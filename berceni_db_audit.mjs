import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const paths = [
  '/animatori-copii-berceni/',
  '/animatori-petreceri-copii-berceni/',
  '/animatori-petreceri-copii-sector-4/'
];

(async () => {
  for (const path of paths) {
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('path', path).single();
    if (page) {
      const { data: faqs } = await supabase.from('kassia_faqs').select('id').eq('page_id', page.id);
      console.log(`\n=== DB Record for ${path} ===`);
      console.log(`ID: ${page.id}`);
      console.log(`Path: ${page.path}`);
      console.log(`Slug: ${page.slug}`);
      console.log(`Status: ${page.status}`);
      console.log(`Index Status: ${page.index_status}`);
      console.log(`Include in Sitemap: ${page.include_in_sitemap}`);
      console.log(`Canonical URL: ${page.canonical_url}`);
      console.log(`Page Type: ${page.page_type}`);
      console.log(`Updated At: ${page.updated_at}`);
      console.log(`FAQ Count: ${faqs ? faqs.length : 0} (source: kassia_faqs)`);
    } else {
      console.log(`\n=== DB Record for ${path} ===\nNOT FOUND IN DB`);
    }
  }
})();
