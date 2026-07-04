import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    if (!page) return console.log("Page not found");

    const vipBlockHTML = `
<div class="vip-package-offer" style="background: linear-gradient(135deg, #1e293b, #0f172a); color: white; padding: 2.5rem; border-radius: 16px; margin: 2rem 0; box-shadow: 0 10px 25px rgba(0,0,0,0.15); border: 1px solid rgba(255,255,255,0.1);">
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 2rem;">
        <div style="flex: 1; min-width: 300px;">
            <div style="display: inline-block; background: #10b981; color: white; font-weight: 700; padding: 0.25rem 0.75rem; border-radius: 99px; font-size: 0.85rem; margin-bottom: 1rem;">OFERTĂ SPECIALĂ</div>
            <h3 style="font-size: 1.8rem; margin-bottom: 1rem; color: white;">Pachet Petrecere Completă</h3>
            <p style="color: #cbd5e1; font-size: 1rem; line-height: 1.6; margin-bottom: 1.5rem;">Cea mai bună alegere pentru o petrecere completă și fără griji. Include tot ce ai nevoie pentru a ține copiii complet captivați.</p>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.75rem;">
                <li style="display: flex; align-items: center; gap: 10px;"><span style="color: #10b981;">✓</span> 2 animatori la alegere (2 ore)</li>
                <li style="display: flex; align-items: center; gap: 10px;"><span style="color: #10b981;">✓</span> Mașină de baloane de săpun inclusă</li>
                <li style="display: flex; align-items: center; gap: 10px;"><span style="color: #10b981;">✓</span> Pictură pe față și modelaj baloane</li>
                <li style="display: flex; align-items: center; gap: 10px;"><span style="color: #10b981;">✓</span> Boxă și microfon pentru activități</li>
            </ul>
        </div>
        <div style="background: rgba(255,255,255,0.05); padding: 2rem; border-radius: 12px; text-align: center; min-width: 250px; border: 1px solid rgba(255,255,255,0.1);">
            <div style="text-decoration: line-through; color: #94a3b8; font-size: 1.25rem; margin-bottom: 0.5rem;">1100 lei</div>
            <div style="font-size: 2.5rem; font-weight: 800; color: #10b981; margin-bottom: 0.5rem;">950 lei</div>
            <div style="color: #cbd5e1; font-size: 0.85rem; margin-bottom: 1.5rem;">*Pachet promoțional în limita disponibilității</div>
            <a href="https://wa.me/40763795919?text=Buna!%20Vreau%20sa%20rezerv%20Pachetul%20Petrecere%20Completa." target="_blank" rel="noopener" class="btn-primary" style="display: inline-block; width: 100%; padding: 1rem; background: #10b981; color: white; text-decoration: none; font-weight: 700; border-radius: 8px;">Verifică Disponibilitatea</a>
        </div>
    </div>
</div>`;

    const upsellHTML = `
<div class="additional-services-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-bottom: 3rem;">
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02);">
        <div style="width: 48px; height: 48px; background: #eff6ff; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin-bottom: 1rem;">
            <span style="font-size: 1.5rem;">🎈</span>
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Decoruri din Baloane</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Completează petrecerea cu o <a href="/arcada-baloane-bucuresti/" style="color: var(--primary); font-weight: 600;">arcadă de baloane</a> sau un panou foto personalizat pentru poze memorabile.</p>
    </div>
    
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02);">
        <div style="width: 48px; height: 48px; background: #eff6ff; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin-bottom: 1rem;">
            <span style="font-size: 1.5rem;">✨</span>
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Ursitoare Botez</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Spectacol plin de emoție pentru botezuri, cu rochii deosebite și texte personalizate pentru bebeluș.</p>
    </div>
    
    <div style="background: white; border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02);">
        <div style="width: 48px; height: 48px; background: #eff6ff; border-radius: 8px; display: flex; align-items: center; justify-content: center; margin-bottom: 1rem;">
            <span style="font-size: 1.5rem;">🫧</span>
        </div>
        <h4 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 0.5rem;">Mașină Baloane Săpun</h4>
        <p style="color: #475569; font-size: 0.95rem; line-height: 1.5; margin-bottom: 1rem;">Un accesoriu care aduce garantat bucurie la orice petrecere de copii, creând o atmosferă magică.</p>
    </div>
</div>`;

    const weddingsHTML = `
<div class="weddings-baptisms-block" style="background: #f8fafc; padding: 2rem; border-radius: 16px; margin-bottom: 3rem;">
    <h2 style="font-size: 1.75rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">Animatori pentru Nunți, Botezuri și Evenimente Corporate</h2>
    <p style="color: #475569; font-size: 1rem; line-height: 1.6; margin-bottom: 1rem;">Știm cât de important este ca adulții să se poată relaxa la un eveniment major. Echipa noastră de <strong>animatori copii</strong> se deplasează la nunți, botezuri sau petreceri corporate în București și Ilfov pentru a crea un spațiu dedicat și sigur pentru cei mici.</p>
    <p style="color: #475569; font-size: 1rem; line-height: 1.6;">Aducem cu noi măsuțe de lucru, materiale pentru ateliere creative, jucării, boxe și un program special gândit pentru a ține copiii ocupați, în timp ce părinții se bucură de petrecere.</p>
</div>`;

    // We will place VIP Block at 3.5 (under price grid)
    await supabase.from('kassia_page_sections').delete().eq('page_id', page.id).eq('heading', 'Pachet VIP Discount');
    await supabase.from('kassia_page_sections').insert({
        page_id: page.id,
        section_type: 'custom_html',
        heading: 'Pachet VIP Discount',
        content: { is_active: true, body: vipBlockHTML },
        order_index: 3.5
    });

    // We will place Upsell and Weddings at 8.4 and 8.5 (under age hub)
    await supabase.from('kassia_page_sections').delete().eq('page_id', page.id).eq('heading', 'Servicii Adiționale pentru o Petrecere Magică');
    await supabase.from('kassia_page_sections').insert({
        page_id: page.id,
        section_type: 'custom_html',
        heading: 'Servicii Adiționale pentru o Petrecere Magică',
        content: { is_active: true, body: upsellHTML },
        order_index: 8.4
    });

    await supabase.from('kassia_page_sections').delete().eq('page_id', page.id).eq('heading', 'Animatori pentru Nunți, Botezuri și Evenimente Corporate');
    await supabase.from('kassia_page_sections').insert({
        page_id: page.id,
        section_type: 'custom_html',
        heading: 'Animatori pentru Nunți, Botezuri și Evenimente Corporate', // Not printed inside Astro if custom_html, wait, actually heading is printed if it exists!
        content: { is_active: true, body: weddingsHTML },
        order_index: 8.5
    });

    console.log("Inserted Faza 4 blocks successfully!");
}

run();
