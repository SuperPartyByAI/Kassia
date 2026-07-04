import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();

    const megaHubImagesHTML = `
<div class="kassia-ecosystem" style="background: #ffffff; padding: 4rem 2rem; border-radius: 24px; box-shadow: 0 20px 40px rgba(0,0,0,0.04); margin-bottom: 4rem; border: 1px solid #f1f5f9;">
    <div style="text-align: center; margin-bottom: 3rem;">
        <span style="display: inline-block; background: #f3e8ff; color: #a855f7; padding: 0.5rem 1rem; border-radius: 99px; font-weight: 700; font-size: 0.85rem; margin-bottom: 1rem; text-transform: uppercase; letter-spacing: 0.05em;">Atracții & Servicii Extra</span>
        <h2 style="font-size: 2.2rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">O Petrecere Completă, Fără Griji</h2>
        <p style="color: #64748b; font-size: 1.1rem; max-width: 600px; margin: 0 auto;">De la experimente cu gheață carbonică și cabine 360, până la statui vivante și mașini de vată de zahăr. Organizăm ecosistemul complet Kassia pentru petrecerea copilului tău.</p>
    </div>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 2rem;">
        
        <!-- Divertisment & Spectacol -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/animatori/pret-animatori-picioroange-evenimente.webp" alt="Animatori pe picioroange Kassia Events" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/10b981/ffffff?text=Divertisment+Premium'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🎭</span> Divertisment & Spectacol</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Personaje pe Catalige (Picioroange)</strong><br><span style="font-size: 0.95rem; color: #475569;">Atracția supremă, ideală pentru locații deschise.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Spectacol de Magie</strong><br><span style="font-size: 0.95rem; color: #475569;">Trucuri captivante cu magician care îi vor lăsa uimiți.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Experimente cu Gheață Carbonică</strong><br><span style="font-size: 0.95rem; color: #475569;">Show spectaculos, distractiv și profund educativ.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Statui Vivante</strong><br><span style="font-size: 0.95rem; color: #475569;">Decor viu, impresionant la evenimente de excepție.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Ursitoare Botez & Moț</strong><br><span style="font-size: 0.95rem; color: #475569;">Spectacol emoționant cu rochii de basm și text dedicat.</span></div></li>
                </ul>
            </div>
        </div>

        <!-- Food & Fun -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/animatori-costume/mascota-vesela-pentru-momentul-tortului-animator-copii-kassia.webp" alt="Momentul tortului petreceri copii" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/f59e0b/ffffff?text=Food+si+Dulciuri'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🍿</span> Food & Dulciuri</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Vată de Zahăr</strong><br><span style="font-size: 0.95rem; color: #475569;">Atracția dulce nelipsită, preparată proaspăt pe loc.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Aparat de Popcorn</strong><br><span style="font-size: 0.95rem; color: #475569;">Gustarea crocantă adorată de absolut toți copiii.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Torturi din Dulciuri</strong><br><span style="font-size: 0.95rem; color: #475569;">Celebrele torturi construite din ciocolățele Kinder, Barni sau Tedi.</span></div></li>
                </ul>
            </div>
        </div>

        <!-- Atracții & Jocuri -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
             <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp" alt="Ateliere creative si jocuri" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/3b82f6/ffffff?text=Jocuri+si+Atractii'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🏰</span> Jocuri & Petreceri</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Castele Gonflabile</strong><br><span style="font-size: 0.95rem; color: #475569;">Spații uriașe de sărit pentru energie maximă în siguranță.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Joc Piñata</strong><br><span style="font-size: 0.95rem; color: #475569;">Momentul de bucurie explozivă și dulciuri garantate.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Treasure Hunt (Căutare de Comori)</strong><br><span style="font-size: 0.95rem; color: #475569;">Aventură captivantă, organizată cap-coadă de animatori.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Ateliere de Creație</strong><br><span style="font-size: 0.95rem; color: #475569;">Activități educative și creative liniștite (slime, desen).</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Petreceri Tematice</strong><br><span style="font-size: 0.95rem; color: #475569;">Scenariu de petrecere 100% adaptat pasiunilor copiilor tăi.</span></div></li>
                </ul>
            </div>
        </div>

        <!-- Decor & Atmosferă -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/decoratiuni-baloane-hub-arcada.webp" alt="Decoruri baloane" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/8b5cf6/ffffff?text=Decoruri+Petreceri'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">🎈</span> Decor & Atmosferă</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;"><a href="/decoratiuni-baloane-bucuresti/" style="color: var(--primary); text-decoration: none;">Decoruri, Arcade & Baloane Heliu</a></strong><br><span style="font-size: 0.95rem; color: #475569;">Arcade organice, panouri foto și buchete premium cu heliu.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Închiriere Mese, Scaune & Kids Corner</strong><br><span style="font-size: 0.95rem; color: #475569;">Mobilier colorat, la scară, și colțuri amenajate pentru cei mici.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Baloane Gigantice de Săpun</strong><br><span style="font-size: 0.95rem; color: #475569;">Momente magice vizuale perfecte pentru fotografii de vis.</span></div></li>
                </ul>
            </div>
        </div>

        <!-- Sărbători Sezoniere -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/animatori/animatori-copii-bucuresti-hero.webp" alt="Personaje sezoniere Kassia" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/ef4444/ffffff?text=Sarbatori+Magice'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">❄️</span> Personaje Sezoniere</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Moș Crăciun & Spiriduși</strong><br><span style="font-size: 0.95rem; color: #475569;">Distribuim magia pură a sărbătorilor la tine acasă.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Iepurașul de Paște</strong><br><span style="font-size: 0.95rem; color: #475569;">Însoțit de sesiuni vesele de căutare a ouălor.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Personaje de Halloween</strong><br><span style="font-size: 0.95rem; color: #475569;">Costume specifice pentru cele mai cool petreceri tematice de toamnă.</span></div></li>
                </ul>
            </div>
        </div>
        
        <!-- Media & Amintiri -->
        <div style="background: #f8fafc; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s;">
            <div style="width: 100%; height: 180px; background: #e2e8f0;">
                <img src="/images/botez-hub-oferta.webp" alt="Amintiri botez foto video" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='https://placehold.co/600x400/ec4899/ffffff?text=Amintiri+si+Media'" />
            </div>
            <div style="padding: 2rem;">
                <h3 style="font-size: 1.3rem; font-weight: 800; color: #1e293b; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.75rem;"><span style="font-size: 1.5rem;">📸</span> Amintiri & Media</h3>
                <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Cabină 360 (Video Booth)</strong><br><span style="font-size: 0.95rem; color: #475569;">Video-uri dinamice de senzație, gata de repostat pe social media.</span></div></li>
                    <li style="display: flex; align-items: flex-start; gap: 0.75rem;"><span style="color: #10b981; font-weight: bold; font-size: 1.2rem;">✓</span> <div><strong style="color:#0f172a;">Foto & Video Profesional</strong><br><span style="font-size: 0.95rem; color: #475569;">Fotografii noștri nu ratează nicio secundă din emoția petrecerii.</span></div></li>
                </ul>
            </div>
        </div>
    </div>
</div>`;

    await supabase.from('kassia_page_sections').update({
        content: { is_active: true, body: megaHubImagesHTML }
    }).eq('page_id', page.id).eq('order_index', 83);

    console.log("Updated order_index 83 with IMAGES for the MEGA HUB.");
}
run();
