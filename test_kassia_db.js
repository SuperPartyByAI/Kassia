const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '/Users/universparty/wa-web-launcher/kassia-site/.env.local' });

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.VITE_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY);

async function run() {
  const { count: pagesCount } = await supabase.from('kassia_pages').select('*', { count: 'exact', head: true });
  const { count: linksCount } = await supabase.from('kassia_internal_links').select('*', { count: 'exact', head: true });
  const { count: seoMapCount } = await supabase.from('kassia_seo_map').select('*', { count: 'exact', head: true });
  const { count: publishedCount } = await supabase.from('kassia_pages').select('*', { count: 'exact', head: true }).eq('status', 'published');
  const { count: indexCount } = await supabase.from('kassia_pages').select('*', { count: 'exact', head: true }).eq('index_status', 'index');
  const { count: sitemapCount } = await supabase.from('kassia_pages').select('*', { count: 'exact', head: true }).eq('include_in_sitemap', true);

  console.log(`kassia_pages total: ${pagesCount}`);
  console.log(`kassia_internal_links total: ${linksCount}`);
  console.log(`kassia_seo_map total: ${seoMapCount}`);
  console.log(`published pages: ${publishedCount}`);
  console.log(`index pages: ${indexCount}`);
  console.log(`include_in_sitemap=true: ${sitemapCount}`);

  // check schema for page sections
  const { data: sectionData, error: sectionError } = await supabase.from('kassia_page_sections').select('*').limit(1);
  console.log('kassia_page_sections sample:', sectionData);
  console.log('kassia_page_sections error:', sectionError);

  const { data: pageData, error: pageError } = await supabase.from('kassia_pages').select('*').limit(1);
  console.log('kassia_pages sample:', pageData);
  console.log('kassia_pages error:', pageError);

  const { data: linkData, error: linkError } = await supabase.from('kassia_internal_links').select('id, source_page_id, target_page_id, anchor_text, order_index').limit(1);
  console.log('kassia_internal_links sample:', linkData);
  console.log('kassia_internal_links error:', linkError);

}
run();
