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

    // 1. Delete old draft EEAT if any, or just insert new ones
    // We will insert E-E-A-T at order_index 35
    const eeatContent = {
        html: `
<div class="eeat-trust-section" style="background: white; border-radius: 16px; padding: 2.5rem; margin: 3rem 0; box-shadow: 0 10px 30px rgba(0,0,0,0.05); border: 1px solid #f1f5f9;">
    <h2 class="text-center" style="font-size: 1.8rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">De ce aleg părinții Kassia pentru petrecerile copiilor?</h2>
    <p class="text-center" style="color: #475569; font-size: 1.1rem; max-width: 800px; margin: 0 auto 2.5rem; line-height: 1.6;">
        Kassia Events are 11 ani de experiență în organizarea petrecerilor pentru copii în București și Ilfov. Echipa noastră a participat la peste 19.000 de petreceri și lucrează cu peste 60 de oameni implicați în animație, personaje, mascote, decoruri, coordonare și suport pentru evenimente.
    </p>
    
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">
        <!-- Card 1 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">11 ani experiență</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Programe testate în sute de contexte: apartamente, curți, restaurante, grădinițe, locuri de joacă și evenimente private.</div>
        </div>
        <!-- Card 2 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">19.000+ petreceri organizate</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Experiență acumulată direct în evenimente pentru copii, cu programe adaptate după vârstă, spațiu și numărul de invitați.</div>
        </div>
        <!-- Card 3 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">60+ oameni în echipă</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Animatori, personaje, mascote, coordonatori și colaboratori pregătiți pentru evenimente în București și Ilfov.</div>
        </div>
        <!-- Card 4 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">300+ costume disponibile</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Costume, mascote și personaje pentru aniversări, botezuri, tăiere de moț, grădinițe, școli și petreceri tematice.</div>
        </div>
        <!-- Card 5 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #f59e0b;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">4.9 rating</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Feedback constant de la părinți care au lucrat cu echipa Kassia pentru petreceri de copii.</div>
        </div>
        <!-- Card 6 -->
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #f59e0b;">
            <div style="font-weight: 800; font-size: 1.2rem; color: #0f172a; margin-bottom: 0.5rem;">970+ recenzii</div>
            <div style="color: #475569; font-size: 0.95rem; line-height: 1.5;">Dovadă socială acumulată în timp, susținută de experiența reală din evenimente.</div>
        </div>
    </div>
    
    <p class="text-center" style="color: #64748b; font-size: 0.9rem; margin-bottom: 2rem; font-style: italic;">
        În perioada următoare vom publica și o prezentare vizuală a echipei Kassia, cu animatori, coordonatori și personaje disponibile pentru evenimente.
    </p>

    <div class="text-center">
        <a href="https://wa.me/40763795919?text=Buna!%20As%20dori%20o%20recomandare%20pentru%20un%20program%20cu%20animatori." target="_blank" rel="noopener" style="display: inline-flex; align-items: center; justify-content: center; padding: 1rem 2rem; background: #25D366; color: white; border-radius: 99px; font-weight: 700; text-decoration: none; box-shadow: 0 4px 14px rgba(37, 211, 102, 0.4); font-size: 1.1rem; transition: transform 0.2s;">
            <svg style="width: 24px; height: 24px; margin-right: 8px;" fill="currentColor" viewBox="0 0 24 24"><path d="M12.031 0C5.385 0 0 5.388 0 12.037c0 2.124.553 4.195 1.603 6.01L.518 22.011l4.067-1.066A12.016 12.016 0 0012.031 24c6.646 0 12.031-5.388 12.031-12.037C24.062 5.388 18.677 0 12.031 0zm7.042 17.333c-.297.838-1.724 1.533-2.399 1.603-.548.058-1.282.046-2.525-.366-2.981-1.002-4.945-4.048-5.093-4.246-.149-.199-1.219-1.621-1.219-3.093 0-1.472.766-2.197 1.039-2.522.274-.325.597-.406.796-.406.199 0 .398 0 .571.01.185.01.433-.075.679.52.261.632.885 2.164.966 2.327.081.162.136.353.037.551-.099.199-.149.325-.299.5-.149.174-.311.365-.448.508-.149.162-.307.34-.129.646.178.306.79 1.306 1.696 2.115 1.166 1.042 2.146 1.362 2.457 1.511.311.149.497.125.683-.087.185-.212.796-.925.995-1.242.199-.317.398-.261.683-.149.285.112 1.802.847 2.113 1.004.311.157.518.235.594.368.076.133.076.772-.221 1.61z"/></svg>
            Scrie-ne pe WhatsApp și îți recomandăm programul potrivit
        </a>
    </div>
</div>
`
    };

    // Age Segmentation Hub (order_index 82)
    const ageHubContent = {
        html: `
<div class="age-decision-hub" style="background: #fff; padding: 2rem 0;">
    <h2 class="section-heading text-center" style="margin-bottom: 2rem;">Ce program alegi în funcție de vârsta copiilor?</h2>
    <div class="container" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem;">
        
        <!-- 1-3 ani -->
        <div style="background: #f1f5f9; padding: 2rem; border-radius: 16px; text-align: center;">
            <div style="background: var(--primary); color: white; width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.25rem; font-weight: 800; margin: 0 auto 1.5rem;">1–3</div>
            <h3 style="font-size: 1.3rem; margin-bottom: 1rem; color: #0f172a;">1–3 ani</h3>
            <ul style="list-style: none; padding: 0; margin: 0; text-align: left; color: #475569; display: flex; flex-direction: column; gap: 0.75rem;">
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> personaje blânde</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> mascote prietenoase</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> jocuri scurte și vizuale</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> modelaj baloane simplu</li>
            </ul>
        </div>

        <!-- 4-7 ani -->
        <div style="background: #f1f5f9; padding: 2rem; border-radius: 16px; text-align: center; border: 2px solid var(--primary); transform: scale(1.05); box-shadow: 0 10px 25px rgba(0,0,0,0.1);">
            <div style="background: var(--primary); color: white; width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.25rem; font-weight: 800; margin: 0 auto 1.5rem;">4–7</div>
            <h3 style="font-size: 1.3rem; margin-bottom: 1rem; color: #0f172a;">4–7 ani</h3>
            <ul style="list-style: none; padding: 0; margin: 0; text-align: left; color: #475569; display: flex; flex-direction: column; gap: 0.75rem;">
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> mini-disco și dansuri</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> jocuri interactive</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> concursuri cu recuzită</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> supereroi / prințese / mascote</li>
            </ul>
        </div>

        <!-- 8-12 ani -->
        <div style="background: #f1f5f9; padding: 2rem; border-radius: 16px; text-align: center;">
            <div style="background: var(--primary); color: white; width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.25rem; font-weight: 800; margin: 0 auto 1.5rem;">8–12</div>
            <h3 style="font-size: 1.3rem; margin-bottom: 1rem; color: #0f172a;">8–12 ani</h3>
            <ul style="list-style: none; padding: 0; margin: 0; text-align: left; color: #475569; display: flex; flex-direction: column; gap: 0.75rem;">
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> provocări de echipă</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> dansuri TikTok / Party</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> jocuri dinamice și stafete</li>
                <li style="display: flex; align-items: center; gap: 8px;"><span style="color: #10b981;">✓</span> personaje de acțiune</li>
            </ul>
        </div>
        
    </div>
    <div class="text-center mt-8">
        <a href="https://wa.me/40763795919?text=Buna!%20Ce%20program%20imi%20recomandati%20pentru%20un%20copil%20de..." target="_blank" rel="noopener" class="btn-primary" style="display: inline-block; padding: 0.8rem 2rem; border-radius: 99px; font-weight: 700; background: var(--primary); color: white; text-decoration: none;">
            Scrie-ne pe WhatsApp și îți recomandăm programul potrivit
        </a>
    </div>
</div>
`
    };

    // 3. Update Zone section (order_index 40)
    // We will find the existing Zone secton and replace its content with the robust internal linking structure.
    
    const internalLinksHtml = `
<div class="zone-acoperite-hub" style="margin-top: 3rem;">
    <h2 class="text-center" style="font-size: 1.8rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">Animatori copii în București și Ilfov — zone populare</h2>
    <p class="text-center" style="color: #475569; max-width: 800px; margin: 0 auto 2rem; line-height: 1.6;">
        Alegem programul în funcție de spațiu, vârsta copiilor și zona evenimentului. Avem pagini dedicate pentru cele mai cerute zone din București și Ilfov.
    </p>
    
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem;">
        
        <!-- București Sectoare -->
        <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); border: 1px solid #f1f5f9;">
            <h3 style="font-size: 1.2rem; margin-bottom: 1rem; color: #0f172a; border-bottom: 2px solid var(--primary); padding-bottom: 0.5rem; display: inline-block;">București Sectoare</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.5rem;">
                <li><a href="/animatori-petreceri-copii-sector-1/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 1</a></li>
                <li><a href="/animatori-petreceri-copii-sector-2/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 2</a></li>
                <li><a href="/animatori-petreceri-copii-sector-3/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 3</a></li>
                <li><a href="/animatori-petreceri-copii-sector-4/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 4</a></li>
                <li><a href="/animatori-petreceri-copii-sector-5/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 5</a></li>
                <li><a href="/animatori-petreceri-copii-sector-6/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Sector 6</a></li>
            </ul>
        </div>
        
        <!-- Cartiere -->
        <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); border: 1px solid #f1f5f9;">
            <h3 style="font-size: 1.2rem; margin-bottom: 1rem; color: #0f172a; border-bottom: 2px solid var(--primary); padding-bottom: 0.5rem; display: inline-block;">Cartiere Centrale</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.5rem;">
                <li><a href="/animatori-petreceri-copii-floreasca/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Floreasca</a></li>
                <li><a href="/animatori-petreceri-copii-berceni/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Berceni</a></li>
            </ul>
        </div>
        
        <!-- Ilfov -->
        <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); border: 1px solid #f1f5f9;">
            <h3 style="font-size: 1.2rem; margin-bottom: 1rem; color: #0f172a; border-bottom: 2px solid var(--primary); padding-bottom: 0.5rem; display: inline-block;">Ilfov & Împrejurimi</h3>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.5rem;">
                <li><a href="/animatori-petreceri-copii-voluntari/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Voluntari</a></li>
                <li><a href="/animatori-petreceri-copii-popesti-leordeni/" style="color: var(--primary); text-decoration: none; font-weight: 500;">Animatori copii Popești-Leordeni</a></li>
            </ul>
        </div>
        
    </div>
    <div style="text-align: center; margin-top: 2rem;">
        <a href="/preturi-animatori-copii-bucuresti/" style="display: inline-block; color: #475569; text-decoration: underline; font-weight: 500;">Vezi toate prețurile pentru animatori copii</a>
    </div>
</div>
`;

    // Try to update Zone section if exists, else create it. (order 40)
    const { data: existingZone } = await supabase.from('kassia_page_sections').select('id').eq('page_id', pageId).eq('heading', 'Zone acoperite în București și Ilfov').single();
    
    if (existingZone) {
        await supabase.from('kassia_page_sections').update({
            content: { html: internalLinksHtml }
        }).eq('id', existingZone.id);
        console.log("Updated Zone section.");
    } else {
        await supabase.from('kassia_page_sections').insert({
            page_id: pageId,
            section_type: 'service_details',
            heading: 'Zone acoperite în București și Ilfov',
            order_index: 40,
            content: { html: internalLinksHtml }
        });
        console.log("Inserted Zone section.");
    }

    // Insert EEAT at 35
    // first clean up any existing "De ce aleg părinții"
    await supabase.from('kassia_page_sections').delete().eq('page_id', pageId).ilike('heading', '%De ce aleg părinții Kassia%');
    await supabase.from('kassia_page_sections').insert({
        page_id: pageId,
        section_type: 'service_details',
        heading: 'De ce aleg părinții Kassia pentru petrecerile copiilor?',
        order_index: 35,
        content: eeatContent
    });
    console.log("Inserted EEAT section at order 35.");

    // Insert Age Hub at 82
    await supabase.from('kassia_page_sections').delete().eq('page_id', pageId).ilike('heading', '%Ce program alegi în funcție de vârsta%');
    await supabase.from('kassia_page_sections').insert({
        page_id: pageId,
        section_type: 'service_details',
        heading: 'Ce program alegi în funcție de vârsta copiilor?',
        order_index: 82,
        content: ageHubContent
    });
    console.log("Inserted Age Hub section at order 82.");
}

run();
