import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const aiDir = 'public/images/ai';
    const files = fs.readdirSync(aiDir).filter(f => f.endsWith('.png'));
    const urlMap = {};

    for (let file of files) {
        const filePath = path.join(aiDir, file);
        const fileData = fs.readFileSync(filePath);
        
        const storagePath = `kassia/ai/${file}`;
        
        console.log(`Uploading ${file}...`);
        const { data, error } = await supabase.storage
            .from('storefront_media')
            .upload(storagePath, fileData, {
                contentType: 'image/png',
                upsert: true
            });
            
        if (error) {
            console.error("Upload error for", file, error);
        } else {
            const { data: publicUrlData } = supabase.storage.from('storefront_media').getPublicUrl(storagePath);
            urlMap[file] = publicUrlData.publicUrl;
        }
    }

    console.log("Uploads complete. Updating HTML...");

    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();

    const services = [
        { title: 'Animatori pe Picioroange', img: 'picioroange.png', desc: 'Personaje pe catalige (picioroange), atracția supremă pentru spații deschise.' },
        { title: 'Spectacole de Magie', img: 'magie.png', desc: 'Trucuri captivante cu un magician profesionist care îi vor lăsa uimiți.' },
        { title: 'Gheață Carbonică', img: 'gheata.png', desc: 'Experimente educative și spectaculoase cu gheață carbonică.' },
        { title: 'Statui Vivante', img: 'statui.png', desc: 'Apariții memorabile, elegante, perfecte pentru evenimente premium.' },
        { title: 'Ursitoare Botez & Moț', img: 'ursitoare.png', desc: 'Spectacol emoționant cu ursitoare și text dedicat.' },
        { title: 'Vată de Zahăr', img: 'vata.png', desc: 'Atracția dulce nelipsită, preparată proaspăt pe loc.' },
        { title: 'Aparat de Popcorn', img: 'popcorn.png', desc: 'Gustarea crocantă adorată de absolut toți copiii.' },
        { title: 'Torturi din Dulciuri', img: 'tort.png', desc: 'Torturi masive construite din ciocolățele Kinder și Barni.' },
        { title: 'Castele Gonflabile', img: 'gonflabile.png', desc: 'Spații uriașe de sărit pentru energie maximă în siguranță.' },
        { title: 'Joc Piñata', img: 'pinata.png', desc: 'Momentul de bucurie explozivă și dulciuri garantate.' },
        { title: 'Treasure Hunt', img: 'treasure.png', desc: 'Aventură captivantă și căutare de comori în aer liber.' },
        { title: 'Ateliere de Creație', img: 'ateliere.png', desc: 'Activități educative liniștite (slime, desen, pictură).' },
        { title: 'Petreceri Tematice', img: 'tematice.png', desc: 'Scenariu de petrecere 100% adaptat pasiunilor copiilor tăi.' },
        { title: 'Decoruri Baloane', img: 'decor.png', desc: 'Arcade organice, panouri foto și buchete premium.' },
        { title: 'Închiriere Mese & Scaune', img: 'mese.png', desc: 'Mobilier colorat (Kids Corner) la scară pentru cei mici.' },
        { title: 'Baloane de Săpun', img: 'sapun.png', desc: 'Momente magice cu baloane gigantice de săpun.' },
        { title: 'Moș Crăciun', img: 'mos.png', desc: 'Distribuim magia pură a sărbătorilor cu Moș Crăciun și elfii săi.' },
        { title: 'Iepurașul de Paște', img: 'iepuras.png', desc: 'Însoțit de sesiuni vesele de căutare a ouălor de ciocolată.' },
        { title: 'Personaje Halloween', img: 'halloween.png', desc: 'Costume simpatice pentru cele mai cool petreceri de toamnă.' },
        { title: 'Cabină Foto 360', img: 'cabina.png', desc: 'Video-uri dinamice de senzație, gata de repostat pe social media.' },
        { title: 'Foto & Video', img: 'foto.png', desc: 'Fotografii noștri nu ratează nicio secundă din emoția petrecerii.' }
    ];

    let gridHtml = '';
    for(let svc of services) {
        const publicUrl = urlMap[svc.img] || `/images/ai/${svc.img}`;
        gridHtml += `
        <div style="background: #ffffff; border-radius: 16px; overflow: hidden; border: 1px solid #e2e8f0; transition: transform 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.02);">
            <div style="width: 100%; height: 220px; background: #e2e8f0;">
                <img src="${publicUrl}" alt="${svc.title}" style="width: 100%; height: 100%; object-fit: cover;" loading="lazy" />
            </div>
            <div style="padding: 1.5rem;">
                <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">${svc.title}</h3>
                <p style="color: #475569; font-size: 0.95rem; line-height: 1.5;">${svc.desc}</p>
            </div>
        </div>`;
    }

    const finalHTML = `
<div class="kassia-ecosystem-grid" style="background: #f8fafc; padding: 4rem 2rem; border-radius: 24px; margin-bottom: 4rem;">
    <div style="text-align: center; margin-bottom: 4rem;">
        <span style="display: inline-block; background: #dcfce7; color: #16a34a; padding: 0.5rem 1rem; border-radius: 99px; font-weight: 700; font-size: 0.85rem; margin-bottom: 1rem; text-transform: uppercase; letter-spacing: 0.05em;">Portofoliu Complet</span>
        <h2 style="font-size: 2.5rem; font-weight: 800; color: #0f172a; margin-bottom: 1rem;">O Petrecere Fără Limite</h2>
        <p style="color: #64748b; font-size: 1.1rem; max-width: 700px; margin: 0 auto;">Organizăm ecosistemul complet Kassia pentru petrecerea copilului tău. De la decor la spectacole live de excepție, găsești absolut totul într-un singur loc.</p>
    </div>
    
    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 2rem;">
        ${gridHtml}
    </div>
</div>`;

    await supabase.from('kassia_page_sections').update({
        content: { is_active: true, body: finalHTML }
    }).eq('page_id', page.id).eq('order_index', 83);

    console.log("Updated HTML with ABSOLUTE Supabase URLs!");
}
run();
