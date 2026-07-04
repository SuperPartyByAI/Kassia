import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();

    const upsellHTML = `
<div class="additional-services-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-bottom: 3rem;">
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02); text-align: center;">
        <div style="width: 100%; height: 160px; margin-bottom: 1rem; border-radius: 8px; overflow: hidden;">
            <img src="/images/decoratiuni-baloane-hub-arcada.webp" alt="Decoruri din baloane" style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;" />
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Decoruri din Baloane</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Completează petrecerea cu o <a href="/arcada-baloane-bucuresti/" style="color: var(--primary); font-weight: 600;">arcadă de baloane</a> sau un panou foto personalizat pentru poze memorabile.</p>
    </div>
    
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02); text-align: center;">
        <div style="width: 100%; height: 160px; margin-bottom: 1rem; border-radius: 8px; overflow: hidden;">
            <img src="/images/botez-hub-oferta.webp" alt="Ursitoare Botez Kassia" style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;" />
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Ursitoare Botez</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Spectacol plin de emoție pentru botezuri, cu rochii deosebite și texte personalizate pentru bebeluș.</p>
    </div>
    
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02); text-align: center;">
        <div style="width: 100%; height: 160px; margin-bottom: 1rem; border-radius: 8px; overflow: hidden;">
            <img src="/images/animatori/animatori-copii-bucuresti-servicii-complementare.webp" alt="Masina baloane sapun petreceri copii" style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;" />
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Mașină Baloane Săpun</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Un accesoriu care aduce garantat bucurie la orice petrecere de copii, creând o atmosferă magică.</p>
    </div>
</div>`;

    await supabase.from('kassia_page_sections').update({
        content: { is_active: true, body: upsellHTML }
    }).eq('page_id', page.id).eq('order_index', 83);

    console.log("Updated Upsell block with proper images.");
}
run();
