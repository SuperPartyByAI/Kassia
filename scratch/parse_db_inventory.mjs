import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

// Native WebSocket bypass for Node v20
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

async function runDbAudit() {
  console.log("=========================================");
  console.log("DB INVENTORY AUDIT");
  console.log("=========================================");

  // Fetch all rows from kassia_pages
  const { data: allPages, error: pagesErr } = await supabase
    .from('kassia_pages')
    .select('*');

  if (pagesErr) {
    console.error("Error fetching pages:", pagesErr);
    process.exit(1);
  }

  console.log(`Total rows in kassia_pages: ${allPages.length}`);

  // Fetch count of sections per page
  const { data: allSections, error: sectionsErr } = await supabase
    .from('kassia_page_sections')
    .select('page_id, id');
  
  if (sectionsErr) {
    console.error("Error fetching sections:", sectionsErr);
    process.exit(1);
  }

  const sectionsCountMap = {};
  allSections.forEach(s => {
    sectionsCountMap[s.page_id] = (sectionsCountMap[s.page_id] || 0) + 1;
  });

  // Fetch count of FAQs per page
  const { data: allFaqs, error: faqsErr } = await supabase
    .from('kassia_faqs')
    .select('page_id, id');

  if (faqsErr) {
    console.error("Error fetching FAQs:", faqsErr);
    process.exit(1);
  }

  const faqsCountMap = {};
  allFaqs.forEach(f => {
    faqsCountMap[f.page_id] = (faqsCountMap[f.page_id] || 0) + 1;
  });

  // Filters for Animatori cluster pages
  // We can identify animatori pages by path containing animatori, mascote, pictura, modelaj, mini-disco
  const isAnimatoriPath = (p) => {
    const normalized = (p || '').toLowerCase();
    return (
      normalized.includes('animatori') ||
      normalized.includes('mascote') ||
      normalized.includes('pictura-pe-fata') ||
      normalized.includes('modelaj-baloane') ||
      normalized.includes('mini-disco') ||
      normalized.includes('jocuri-interactive') ||
      normalized.includes('personaje') ||
      normalized.includes('tematica')
    );
  };

  const animatoriPages = allPages.filter(p => isAnimatoriPath(p.path));
  console.log(`Total animatori pages in DB: ${animatoriPages.length}`);

  const published = animatoriPages.filter(p => p.status === 'published');
  const indexable = animatoriPages.filter(p => p.index_status === 'index');
  const noindex = animatoriPages.filter(p => p.index_status === 'noindex');
  const inSitemap = animatoriPages.filter(p => p.include_in_sitemap === true);
  
  const noSections = animatoriPages.filter(p => !sectionsCountMap[p.id]);
  const noFaqs = animatoriPages.filter(p => !faqsCountMap[p.id]);

  console.log(`Published animatori pages: ${published.length}`);
  console.log(`Indexable animatori pages: ${indexable.length}`);
  console.log(`Noindex animatori pages: ${noindex.length}`);
  console.log(`Include in sitemap: ${inSitemap.length}`);
  console.log(`Without sections: ${noSections.length}`);
  console.log(`Without FAQ: ${noFaqs.length}`);

  // Căutare pagină generică
  console.log("\nSearching for exact generic page in DB...");
  const exactSlug = allPages.filter(p => p.slug === 'animatori-petreceri-copii');
  const exactPath = allPages.filter(p => p.path === '/animatori-petreceri-copii/');

  console.log(`Exact slug match count: ${exactSlug.length}`);
  console.log(`Exact path match count: ${exactPath.length}`);

  if (exactPath.length > 0) {
    console.log("Details of exact path match:");
    for (const p of exactPath) {
      console.log(JSON.stringify({
        id: p.id,
        slug: p.slug,
        path: p.path,
        title: p.title,
        h1: p.h1,
        meta_title: p.meta_title,
        meta_description: p.meta_description,
        status: p.status,
        index_status: p.index_status,
        include_in_sitemap: p.include_in_sitemap,
        canonical_url: p.canonical_url,
        sectionsCount: sectionsCountMap[p.id] || 0,
        faqsCount: faqsCountMap[p.id] || 0
      }, null, 2));
    }
  } else {
    console.log("No exact path match found. Showing 10 closest paths in DB:");
    const closest = allPages
      .filter(p => isAnimatoriPath(p.path))
      .slice(0, 10);
    closest.forEach(p => {
      console.log(`Path: ${p.path} | Status: ${p.status} | Index: ${p.index_status}`);
    });
  }

  // Căutări semantice suplimentare
  const animatoriCopiiPaths = allPages.filter(p => p.path === '/animatori-copii/' || p.slug === 'animatori-copii');
  console.log(`\nExact '/animatori-copii/' in DB count: ${animatoriCopiiPaths.length}`);
  if (animatoriCopiiPaths.length > 0) {
    console.log(JSON.stringify(animatoriCopiiPaths, null, 2));
  }
}

runDbAudit().catch(console.error);
