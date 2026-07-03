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
        
    const { data: heroSection } = await supabase
        .from('kassia_page_sections')
        .select('id, content')
        .eq('page_id', page.id)
        .eq('section_type', 'hero')
        .single();
        
    const newBody = `
<div style="font-size:1.25rem; font-weight:600; margin-bottom:1.5rem; display:flex; flex-direction:column; gap:0.5rem;">
  <span style="color:#10b981; font-size:1.5rem;">De la 280 lei / 1 oră</span>
  <span>Bucură-te de cele mai iubite personaje la petrecerea copilului tău!</span>
</div>
<div style="display:flex; justify-content:center; gap:1rem; flex-wrap:wrap; margin-top:2rem;">
  <a href="#preturi-programe-cu-animatori" class="btn-primary" style="background:#0f172a; color:white;">Vezi pachetele</a>
  <a href="https://wa.me/40763795919" class="btn-primary" style="background:#25D366; color:white;">Scrie pe WhatsApp</a>
  <a href="tel:0763795919" class="btn-primary" style="background:transparent; color:#0f172a; border:2px solid #0f172a;">Sună Acum</a>
</div>
    `;
    
    // We clear the old cta_url / cta_text from the JSON so the old button is gone, since we render our own custom HTML CTAs in the body
    await supabase.from('kassia_page_sections')
        .update({ 
            content: { 
                body: newBody,
                image_url: heroSection.content.image_url,
                image_alt: heroSection.content.image_alt
            } 
        })
        .eq('id', heroSection.id);
        
    console.log("Hero updated.");
}

run();
