import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  console.log('--- 1. MICRO-FIX MASCOTE PAGE ---');
  const mascotePath = '/mascote-petreceri-copii-bucuresti/';
  const { data: page } = await supabase.from('kassia_pages').select('*').eq('path', mascotePath).single();
  
  if (page) {
    let newH1 = page.h1.replace(/Spectaculoase/gi, '').replace(/\\s+/g, ' ').trim();
    await supabase.from('kassia_pages').update({ h1: newH1 }).eq('id', page.id);
    console.log('Updated H1 to:', newH1);

    // Clean sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    for (const sec of sections) {
      if (sec.content && sec.content.body) {
        let body = sec.content.body;
        body = body.replace(/impact vizual uriaș/gi, 'impact vizual frumos');
        body = body.replace(/oportunități fotografice deosebite/gi, 'oportunități pentru fotografii frumoase');
        body = body.replace(/Curățenia este o prioritate absolută/gi, 'Avem grijă de curățenie');
        body = body.replace(/proceduri stricte de igienizare/gi, 'igienizare atentă');
        body = body.replace(/Curățenia este o prioritate/gi, 'Avem grijă de curățenie');
        await supabase.from('kassia_page_sections').update({ content: { body } }).eq('id', sec.id);
      }
    }

    // Clean faqs
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
      let ans = faq.answer;
      ans = ans.replace(/impact vizual uriaș/gi, 'impact vizual frumos');
      ans = ans.replace(/oportunități fotografice deosebite/gi, 'oportunități pentru fotografii frumoase');
      ans = ans.replace(/Curățenia este o prioritate absolută/gi, 'Avem grijă de curățenie');
      ans = ans.replace(/proceduri stricte de igienizare/gi, 'igienizare atentă');
      ans = ans.replace(/Curățenia este o prioritate/gi, 'Avem grijă de curățenie');
      await supabase.from('kassia_faqs').update({ answer: ans }).eq('id', faq.id);
    }
    console.log('Cleaned text phrases in sections and FAQs.');
  }

  console.log('\\n--- 2. AUDIT LEGACY PROGRAMMATIC PAGES ---');
  // Find all pages with the toxic pattern
  const { data: allPages } = await supabase.from('kassia_pages').select('id, path, h1, meta_description, status, index_status, include_in_sitemap').neq('status', 'draft');
  
  let legacyPages = [];
  
  for (const p of allPages) {
    if (
        p.h1 && p.h1.toLowerCase().includes('animatori petreceri copii') && p.path !== '/animatori-petreceri-copii/' ||
        p.meta_description && p.meta_description.toLowerCase().includes('cauți animatori pentru petreceri copii în') ||
        p.path.includes('/blog/animator-sau-mascota') ||
        p.path.includes('/animatori-evenimente-') ||
        p.path.includes('/animatori-copii-regie')
    ) {
        // Exclude the good cluster pages
        const goodPaths = [
            '/', 
            '/animatori-petreceri-copii/', 
            '/personaje-animatori-copii-bucuresti/',
            '/preturi-animatori-copii-bucuresti/',
            '/mascote-petreceri-copii-bucuresti/',
            '/animatori-petreceri-copii-sector-1/',
            '/animatori-petreceri-copii-sector-2/',
            '/animatori-petreceri-copii-sector-3/',
            '/animatori-petreceri-copii-sector-4/',
            '/animatori-petreceri-copii-sector-5/',
            '/animatori-petreceri-copii-sector-6/'
        ];
        if (!goodPaths.includes(p.path)) {
            legacyPages.push(p);
        }
    }
  }

  console.log('URL | H1 | Meta Desc | Status | In Sitemap');
  legacyPages.forEach(p => {
    let shortMeta = p.meta_description ? (p.meta_description.substring(0, 50) + '...') : 'N/A';
    console.log(`${p.path} | ${p.h1} | ${shortMeta} | ${p.status} | ${p.include_in_sitemap}`);
  });
  console.log('\\nTotal legacy pages found:', legacyPages.length);
}

run();
