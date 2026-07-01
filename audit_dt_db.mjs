import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
    global: { fetch: fetch },
    realtime: { transport: WebSocket }
});

async function run() {
  const paths = [
    '/animatori-copii-drumul-taberei',
    '/animatori-copii-drumul-taberei/',
    '/animatori-petreceri-copii-drumul-taberei',
    '/animatori-petreceri-copii-drumul-taberei/',
    '/animatori-copii-sector-6',
    '/animatori-copii-sector-6/',
    '/animatori-petreceri-copii-sector-6',
    '/animatori-petreceri-copii-sector-6/'
  ];

  const { data, error } = await supabase.from('kassia_pages').select('*').in('path', paths);
  
  if (error) {
    console.error(error);
    return;
  }
  
  console.log("Found pages in DB:", data.length);
  for (const p of data) {
      console.log(`\nID: ${p.id}`);
      console.log(`Path: ${p.path}`);
      console.log(`Status: ${p.status}`);
      console.log(`Index Status: ${p.index_status}`);
      console.log(`Sitemap: ${p.include_in_sitemap}`);
      console.log(`Canonical: ${p.canonical_url}`);
      console.log(`Title: ${p.title}`);
      console.log(`Desc: ${p.meta_description}`);
      console.log(`Updated: ${p.updated_at}`);
      console.log(`Page Type: ${p.page_type}`);
      
      const { data: sections } = await supabase.from('kassia_page_sections').select('heading, section_type').eq('page_id', p.id);
      const h1 = sections.find(s => s.section_type === 'hero')?.heading || 'N/A';
      const h2s = sections.filter(s => s.section_type !== 'hero' && s.heading).map(s => s.heading);
      const faqs = sections.filter(s => s.section_type === 'faq');
      
      console.log(`H1: ${h1}`);
      console.log(`H2s: ${h2s.join(' | ')}`);
      console.log(`FAQ Count: ${faqs.length}`);
  }
}
run();
