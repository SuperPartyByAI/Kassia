import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();

    const megaHubHTML = `
<div class="kassia-ecosystem" style="background: #ffffff; padding: 4rem 2rem; border-radius: 24px; box-shadow: 0 20px 40px rgba(0,0,0,0.04); margin-bottom: 4rem; border: 1px solid #f1f5f9;">
    <div style="text-align: center; margin-bottom: 3rem;">
        <span style="display: inline-block; background: #f3e8ff; color: #a855f7; padding: 0.5rem 1rem; border-radius: 99px; font-weight: 700; font-size: 0.85rem; margin-bottom: 1rem; text-transform: uppercase; letter-spacing: 0.05em;">Atracții & Servicii Extra</span>
        <h2 style="font-size: 2.2rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">O Petrecere Completă, Fără Griji</h2>
        <p style="color: #64748b; font-size: 1.1rem; max-width: 600px; margin: 0 auto;">De la tobogane gonflabile și animatori pe picioroange, până la mașini de vată de zahăr și decoruri. Organizăm ecosistemul complet Kassia pentru petrecerea copilului tău.</p>
    </div>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem;">
        <!-- Divertisment & Spectacol -->
        <div style="background: #f8fafc; border-radius: 16px; padding: 2rem; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🎭</span> Divertisment & Spectacol</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Animatori pe Picioroange</strong><br><span style="font-size: 0.95rem; color: #475569;">Atracția supremă, vizibilă de la distanță și ideală pentru poze de neuitat.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Spectacol de Magie</strong><br><span style="font-size: 0.95rem; color: #475569;">Trucuri captivante cu magician care îi vor lăsa pe cei mici uimiți.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Ursitoare Botez & Moț</strong><br><span style="font-size: 0.95rem; color: #475569;">Spectacol emoționant cu rochii de basm, muzică și text dedicat.</span></div></li>
            </ul>
        </div>

        <!-- Food & Fun -->
        <div style="background: #f8fafc; border-radius: 16px; padding: 2rem; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🍿</span> Food & Snack-uri</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Aparat Vată de Zahăr</strong><br><span style="font-size: 0.95rem; color: #475569;">Atracția dulce nelipsită, preparată proaspăt pe loc pentru copii.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Mașină de Popcorn</strong><br><span style="font-size: 0.95rem; color: #475569;">Gustarea caldă și crocantă adorată de copiii de toate vârstele.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Candy Bar & Tort</strong><br><span style="font-size: 0.95rem; color: #475569;">Mese dulci decorate tematic și asortate cu mascota aleasă.</span></div></li>
            </ul>
        </div>

        <!-- Atracții & Jocuri -->
        <div style="background: #f8fafc; border-radius: 16px; padding: 2rem; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🏰</span> Atracții & Jocuri</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Tobogane Gonflabile</strong><br><span style="font-size: 0.95rem; color: #475569;">Spații de sărit sigure și distractive, perfecte pentru curte sau locații open-space.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Joc Piñata</strong><br><span style="font-size: 0.95rem; color: #475569;">Momentul culminant al petrecerii, aducând surprize și dulciuri.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Ateliere Creative</strong><br><span style="font-size: 0.95rem; color: #475569;">Ateliere de slime, pictură sau creație pentru activități interactive liniștite.</span></div></li>
            </ul>
        </div>

        <!-- Decor & Atmosferă -->
        <div style="background: #f8fafc; border-radius: 16px; padding: 2rem; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🎈</span> Decor & Atmosferă</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;"><a href="/decoratiuni-baloane-bucuresti/" style="color: var(--primary); text-decoration: none;">Decoruri din Baloane</a></strong><br><span style="font-size: 0.95rem; color: #475569;">Arcade organice, panouri foto, cifre din baloane și baloane cu heliu.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Aranjamente Mese</strong><br><span style="font-size: 0.95rem; color: #475569;">Aranjamente festive asortate cu tematica și culorile evenimentului.</span></div></li>
                <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Mașină Baloane Săpun</strong><br><span style="font-size: 0.95rem; color: #475569;">Un detaliu magic care garantează zâmbete și fotografii superbe.</span></div></li>
            </ul>
        </div>
        
        <!-- Media & Amintiri -->
        <div style="background: #f8fafc; border-radius: 16px; padding: 2rem; border: 1px solid #e2e8f0; grid-column: 1 / -1; max-width: 800px; margin: 0 auto; width: 100%;">
            <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem; justify-content: center;"><span style="font-size: 1.5rem;">📸</span> Amintiri & Media</h3>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;">
                <div style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Servicii Foto / Video</strong><br><span style="font-size: 0.95rem; color: #475569;">Imortalizăm zâmbetele cu fotografi și videografi dedicați evenimentelor de copii.</span></div></div>
                <div style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Cabină Foto / Oglindă Magică</strong><br><span style="font-size: 0.95rem; color: #475569;">Poze printate pe loc, o super-activitate pentru invitați de toate vârstele.</span></div></div>
            </div>
        </div>
    </div>
</div>`;

    await supabase.from('kassia_page_sections').update({
        content: { is_active: true, body: megaHubHTML }
    }).eq('page_id', page.id).eq('order_index', 83);

    console.log("Updated order_index 83 with the MEGA HUB of services.");
}
run();
