import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase
        .from('kassia_pages')
        .select('id')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
    
    if (!page) {
        console.error("Page not found");
        return;
    }
    
    const pageId = page.id;
    
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('id, heading, section_type')
        .eq('page_id', pageId);
        
    console.log("Found sections:", sections.length);
    
    const updates = [];
    
    for (let s of sections) {
        let newOrder = null;
        
        if (s.section_type === 'hero') newOrder = 1;
        else if (s.section_type === 'costume_catalog') newOrder = 10;
        else if (s.heading === 'Activități tematice și divertisment interactiv') newOrder = 20;
        else if (s.heading === 'Trust Summary') newOrder = 30; // we will create this if not exists
        else if (s.heading && s.heading.includes('București și Ilfov') && s.section_type === 'service_details') newOrder = 40;
        else if (s.heading === 'Ce evităm când organizăm activități cu grupuri de copii') newOrder = 50;
        else if (s.heading === 'Cum decurge programul cu animatori pas cu pas') newOrder = 60;
        else if (s.heading === 'Un personaj animator sau două personaje animatoare?') newOrder = 70;
        else if (s.heading === 'Recuzită, mascote și adaptarea programului după vârstă') newOrder = 80;
        else if (s.section_type === 'gallery') newOrder = 90;
        else if (s.section_type === 'cta_final') newOrder = 100;
        else newOrder = 1000; // push everything else down
        
        if (newOrder) {
            updates.push(
                supabase.from('kassia_page_sections').update({ order_index: newOrder }).eq('id', s.id)
            );
        }
    }
    
    // Check if Trust Summary exists
    const hasTrust = sections.some(s => s.heading === 'De ce ne aleg mii de părinți?');
    if (!hasTrust) {
        console.log("Creating Trust block...");
        const trustHtml = `
<div class="trust-summary-block" style="background:#f8fafc; padding:2rem; border-radius:16px; border:1px solid #e2e8f0; text-align:center;">
  <div style="font-size:2rem; font-weight:900; color:#10b981; margin-bottom:0.5rem;">4.9 / 5 Stele</div>
  <p style="font-size:1.1rem; color:#475569; margin-bottom:1.5rem;">Bazat pe sute de recenzii reale de la părinți fericiți din București și Ilfov.</p>
  <div style="display:flex; flex-wrap:wrap; gap:1rem; justify-content:center; margin-bottom:1.5rem;">
    <div style="background:white; padding:1rem; border-radius:12px; box-shadow:0 2px 4px rgba(0,0,0,0.05); max-width:280px; text-align:left;">
      <p style="font-style:italic; font-size:0.9rem; color:#334155; margin-bottom:0.5rem;">"Elsa a fost minunată, copiii s-au distrat de minune pe tot parcursul petrecerii!"</p>
      <div style="font-weight:700; font-size:0.8rem; color:#0f172a;">- Andreea M.</div>
    </div>
    <div style="background:white; padding:1rem; border-radius:12px; box-shadow:0 2px 4px rgba(0,0,0,0.05); max-width:280px; text-align:left;">
      <p style="font-style:italic; font-size:0.9rem; color:#334155; margin-bottom:0.5rem;">"Spiderman i-a ținut în priză cu concursuri super amuzante. Recomand cu drag!"</p>
      <div style="font-weight:700; font-size:0.8rem; color:#0f172a;">- Mihai C.</div>
    </div>
    <div style="background:white; padding:1rem; border-radius:12px; box-shadow:0 2px 4px rgba(0,0,0,0.05); max-width:280px; text-align:left;">
      <p style="font-style:italic; font-size:0.9rem; color:#334155; margin-bottom:0.5rem;">"Au venit cu recuzită diversă și au făcut o atmosferă de neuitat pentru cei mici."</p>
      <div style="font-weight:700; font-size:0.8rem; color:#0f172a;">- Diana M.</div>
    </div>
  </div>
  <div style="display:flex; justify-content:center; gap:1rem; flex-wrap:wrap;">
    <a href="https://wa.me/40763795919" class="btn-primary" style="background:#25D366; color:white; padding:0.75rem 2rem; border-radius:999px; text-decoration:none; font-weight:700;">Scrie pe WhatsApp</a>
    <a href="tel:0763795919" class="btn-primary" style="background:#0f172a; color:white; padding:0.75rem 2rem; border-radius:999px; text-decoration:none; font-weight:700;">Sună: 0763 795 919</a>
  </div>
  <p style="font-size:0.85rem; color:#64748b; margin-top:1rem;">* Programările se fac exclusiv în prealabil. Recomandăm rezervarea cu cel puțin 7 zile înainte.</p>
</div>
        `;
        
        updates.push(
            supabase.from('kassia_page_sections').insert({
                page_id: pageId,
                section_type: 'service_details',
                heading: 'De ce ne aleg mii de părinți?',
                content: { body: trustHtml, is_active: true },
                order_index: 30
            })
        );
    }
    
    await Promise.all(updates);
    console.log("DB Updated successfully with new order.");
}

run();
