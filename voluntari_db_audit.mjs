import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages, error } = await supabase
    .from('kassia_pages')
    .select('id, slug, status, index_status, include_in_sitemap, title, h1, canonical_url, meta_title, meta_description');

  if (error) {
      console.error(error);
      process.exit(1);
  }

  const matches = pages.filter(p => {
      const txt = [p.slug, p.title, p.h1, p.meta_title, p.meta_description].join(' ').toLowerCase();
      return txt.includes('voluntari'); // ilfov might be too broad and match other pages, but let's check
  });

  console.log("--- VOLUNTARI PAGES IN DB ---");
  console.log(JSON.stringify(matches, null, 2));

  // Also check Ilfov pages if there are any specific standalone Ilfov pages
  const ilfovMatches = pages.filter(p => {
      const txt = [p.slug, p.title, p.h1].join(' ').toLowerCase();
      return txt.includes('ilfov') && !txt.includes('voluntari') && !txt.includes('berceni');
  });
  console.log("--- OTHER ILFOV PAGES ---");
  console.log(JSON.stringify(ilfovMatches, null, 2));

})();
