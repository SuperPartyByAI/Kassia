import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug, title').eq('slug', 'animatori-petreceri-copii-berceni');
  if (!pages || pages.length === 0) return;
  const page = pages[0];
  const { data: sections } = await supabase.from('kassia_page_sections').select('section_type, content').eq('page_id', page.id);
  const contentStr = JSON.stringify(sections).toLowerCase();
  
  console.log({
    slug: page.slug,
    blocks: {
      hasCeEvitam: contentStr.includes('evit'),
      hasCumDecurge: contentStr.includes('decurge'),
      hasUnSauDoua: (contentStr.includes('un personaj') && contentStr.includes('doua')) || (contentStr.includes('un personaj') && contentStr.includes('două')),
      hasScenariiLocale: contentStr.includes('scenari'),
      hasZoneLocale: contentStr.includes('zon') || contentStr.includes('cartier') || contentStr.includes('acoperi'),
      hasPricingPreview: contentStr.includes('preturi') || contentStr.includes('pricing') || sections.some(s => s.section_type === 'pricing'),
      totalSections: sections.length
    }
  });
})();
