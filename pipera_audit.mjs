import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', 'animatori-copii-pipera-bucuresti').single();
  
  if (!page) {
    console.log("Page not found in DB");
    return;
  }
  
  console.log("--- DB ROW ---");
  console.log(`Slug: ${page.slug}\nStatus: ${page.status}\nIndex: ${page.index_status}\nSitemap: ${page.include_in_sitemap}\nH1: ${page.h1}\nMeta: ${page.meta_description}`);
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('content').eq('page_id', page.id);
  const { data: faqs } = await supabase.from('kassia_faqs').select('question, answer').eq('page_id', page.id);
  
  const toxicTerms = ['pachete', 'pictură pe față', 'face painting', 'garantat', 'memorabil', 'de neuitat', 'perfect', 'ideal', 'profesioniști', 'premium', 'cost', 'preț', 'tarif', 'taxă', '2-3 săptămâni', 'câteva săptămâni', 'gratuit', '<p>'];
  
  let foundToxics = [];
  sections?.forEach(s => {
      let txt = JSON.stringify(s.content).toLowerCase();
      toxicTerms.forEach(t => { if (txt.includes(t.toLowerCase())) foundToxics.push(t); });
  });
  faqs?.forEach(f => {
      let txt = (f.question + " " + f.answer).toLowerCase();
      toxicTerms.forEach(t => { if (txt.includes(t.toLowerCase())) foundToxics.push(t); });
  });
  
  console.log("\n--- TOXIC TERMS IN DB CONTENT ---");
  console.log([...new Set(foundToxics)].join(', '));
})();
