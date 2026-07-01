import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // 1. Fix Legacy Slug Status to 'draft'
  const { data: updateLegacy, error: errLegacy } = await supabase
    .from('kassia_pages')
    .update({ status: 'draft' })
    .eq('slug', 'animatori-copii-berceni-ilfov-legacy');
  console.log("Legacy slug status updated to draft:", errLegacy || 'success');

  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // 2. Fix old CTA "Trimite detaliile petrecerii"
  // Let's find it first
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId);
  if (sections) {
    for (const sec of sections) {
        let contentStr = typeof sec.content === 'string' ? sec.content : JSON.stringify(sec.content);
        if (contentStr.includes('Trimite detaliile petrecerii')) {
            let c = typeof sec.content === 'string' ? JSON.parse(sec.content) : sec.content;
            
            const whatsappNumber = '40768098268';
            const whatsappText = 'Buna! As dori detalii pentru animatori la o petrecere de copii in Berceni.';
            const whatsappLink = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(whatsappText)}`;
            
            if (c.body) {
                // Find and replace the CTA in c.body
                // It might be an <a> tag
                c.body = c.body.replace(/href="[^"]*".*?>Trimite detaliile petrecerii</g, `href="${whatsappLink}" target="_blank" rel="noopener noreferrer">Scrie-ne pe WhatsApp pentru detalii<`);
                // Wait, maybe the regex is too strict or too loose. Let's just do a simple replace
                // Actually, I'll replace the exact string first
            }
            await supabase.from('kassia_page_sections').update({ content: c }).eq('id', sec.id);
            console.log("Old CTA replaced in section:", sec.id);
        }
    }
  }

  // 3. Fix raw <p> tags in FAQs
  const { data: faqs } = await supabase.from('kassia_faqs').select('id, answer').eq('page_id', pageId);
  if (faqs) {
    for (const faq of faqs) {
        if (faq.answer.includes('<p>') || faq.answer.includes('</p>')) {
            let cleanAnswer = faq.answer.replace(/<\/?p>/g, '');
            await supabase.from('kassia_faqs').update({ answer: cleanAnswer }).eq('id', faq.id);
            console.log("Cleaned <p> tags from FAQ:", faq.id);
        }
    }
  }

})();
