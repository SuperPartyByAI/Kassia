import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages, error } = await supabase.from('kassia_pages').select('id, slug, title, is_active');
  if (error) console.error(error);
  
  const targetSlugs = [
    '', '/',
    'animatori-petreceri-copii-bucuresti',
    'preturi-animatori-copii-bucuresti',
    'animatori-petreceri-copii-sector-1',
    'animatori-petreceri-copii-sector-2',
    'animatori-petreceri-copii-sector-3',
    'animatori-petreceri-copii-sector-4',
    'animatori-petreceri-copii-sector-5',
    'animatori-petreceri-copii-sector-6',
    'animatori-petreceri-copii-popesti-leordeni',
    'animatori-copii-berceni-ilfov',
    'animatori-petreceri-copii-voluntari'
  ];

  const matchedPages = pages.filter(p => targetSlugs.includes(p.slug));
  const pageIds = matchedPages.map(p => p.id);
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, page_id, section_type, content').in('page_id', pageIds);

  const inventory = matchedPages.map(page => {
    const pageSections = sections.filter(s => s.page_id === page.id);
    const contentStr = JSON.stringify(pageSections).toLowerCase();
    
    const hasPricingPreview = contentStr.includes('preturi') || contentStr.includes('pricing');
    const hasScenariiLocale = contentStr.includes('scenari');
    const hasCeEvitam = contentStr.includes('evit');
    const hasCumDecurge = contentStr.includes('decurge');
    const hasUnSauDoua = (contentStr.includes('un personaj') && contentStr.includes('doua')) || (contentStr.includes('un personaj') && contentStr.includes('două'));
    
    let faqCount = 0;
    const faqSection = pageSections.find(s => s.section_type === 'faq');
    if (faqSection && faqSection.content && faqSection.content.faqs) {
        faqCount = faqSection.content.faqs.length;
    }

    return {
      slug: page.slug,
      is_active: page.is_active,
      blocks: {
        hasCeEvitam,
        hasCumDecurge,
        hasUnSauDoua,
        hasScenariiLocale,
        faqCount,
        totalSections: pageSections.length
      }
    };
  });

  console.log(JSON.stringify(inventory, null, 2));
})();
