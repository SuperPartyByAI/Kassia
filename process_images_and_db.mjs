import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import sharp from 'sharp';
import path from 'path';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const brainDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/';
const publicDir = '/Users/universparty/wa-web-launcher/kassia-site/public/images/animatori/';

const imageMap = [
    // PAGINA 2: animatori-petreceri-copii
    { slug: 'animatori-petreceri-copii', prefix: 'hub_hero_', dest: 'animator-petrecere-copii-bucuresti-hero.webp', alt: 'Animator pentru petrecere de copii coordonând un joc interactiv', sectionMatch: 'Animatori pentru petreceri de copii' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_rol_', dest: 'rol-animator-petrecere-copii.webp', alt: 'Animator copii coordonând activități de grup la petrecere', sectionMatch: 'Ce rol are un animator' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_varste_', dest: 'personaje-animatori-copii-varste.webp', alt: 'Personaje animatoare alese în funcție de vârsta copiilor', sectionMatch: 'Cum alegi personajele potrivite' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_evenimente_', dest: 'animatori-evenimente-private-copii.webp', alt: 'Animator pentru copii la eveniment privat în București și Ilfov', sectionMatch: 'Tipuri de evenimente unde animatorii pot susține programul' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_program_', dest: 'desfasurare-program-animatie-copii.webp', alt: 'Program de animație pentru copii cu jocuri dinamice și dans', sectionMatch: 'Cum se desfășoară un program de animație' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_conexe_', dest: 'servicii-conexe-pictura-fata-baloane.webp', alt: 'Pictură pe față și modelaj de baloane la petrecere de copii', sectionMatch: 'Servicii conexe care completează' },
    { slug: 'animatori-petreceri-copii', prefix: 'hub_kassia_', dest: 'echipa-animatori-kassia-events.webp', alt: 'Echipă de animatori copii pregătind activități pentru petrecere', sectionMatch: 'De ce să alegi Kassia Events' },

    // PAGINA 1: preturi-animatori-copii-bucuresti
    { slug: 'preturi-animatori-copii-bucuresti', prefix: 'preturi_1_pers_', dest: 'pret-program-1-animator-copii.webp', alt: 'Program cu un personaj animator pentru petrecere de copii', sectionMatch: 'Program standard cu 1 personaj animator' },
    { slug: 'preturi-animatori-copii-bucuresti', prefix: 'preturi_2_pers_', dest: 'pret-program-2-animatori-copii.webp', alt: 'Program cu două personaje animatoare pentru petreceri de copii', sectionMatch: 'Program cu 2 personaje animatoare' },
    { slug: 'preturi-animatori-copii-bucuresti', prefix: 'preturi_picioroange_', dest: 'pret-animatori-picioroange-evenimente.webp', alt: 'Animator pe picioroange la eveniment pentru copii', sectionMatch: 'Animatori pe picioroange' },
    { slug: 'preturi-animatori-copii-bucuresti', prefix: 'preturi_activitati_', dest: 'activitati-incluse-program-animatie.webp', alt: 'Activități cu animatori copii pictură pe față și modelaj baloane', sectionMatch: 'Activități incluse în' },
    { slug: 'preturi-animatori-copii-bucuresti', prefix: 'preturi_exploder_', dest: 'pret-balloon-exploder-petrecere.webp', alt: 'Balloon Exploder cu bomboane la petrecere de copii', sectionMatch: 'Opționale recomandate' } // Fallback for Exploder
];

async function run() {
    const files = fs.readdirSync(brainDir);
    
    // Process Images
    for (const mapping of imageMap) {
        const sourceFile = files.find(f => f.startsWith(mapping.prefix) && f.endsWith('.png'));
        if (!sourceFile) {
            console.error('Missing generated image for prefix: ' + mapping.prefix);
            continue;
        }
        const srcPath = path.join(brainDir, sourceFile);
        const destPath = path.join(publicDir, mapping.dest);
        
        // Convert to WebP and optimize
        await sharp(srcPath)
            .resize({ width: 1200, withoutEnlargement: true }) // ensure max width 1200px
            .webp({ quality: 85 })
            .toFile(destPath);
        
        console.log(`Saved ${destPath}`);
    }

    // Update DB
    for (const slug of ['animatori-petreceri-copii', 'preturi-animatori-copii-bucuresti']) {
        const { data: page } = await sb.from('kassia_pages').select('id, page_content').eq('slug', slug).single();
        if (!page) continue;
        
        // Update hero image if applicable
        const heroMapping = imageMap.find(m => m.slug === slug && m.prefix === 'hub_hero_');
        if (heroMapping) {
            const pageContent = typeof page.page_content === 'string' ? JSON.parse(page.page_content) : page.page_content;
            if (pageContent.hero) {
                pageContent.hero.image_url = `/images/animatori/${heroMapping.dest}`;
                pageContent.hero.image_alt = heroMapping.alt;
                await sb.from('kassia_pages').update({ page_content: pageContent }).eq('id', page.id);
                console.log(`Updated Hero for ${slug}`);
            }
        }

        const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
        
        for (const section of sections) {
            let content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
            const mapping = imageMap.find(m => m.slug === slug && section.heading && section.heading.includes(m.sectionMatch));
            
            // Special check for Balloon exploder which might not be a section heading but in 'Opționale'
            const exploderMapping = imageMap.find(m => m.slug === slug && m.prefix === 'preturi_exploder_');
            const isExploderSection = section.heading && section.heading.includes('Opționale recomandate');

            if (mapping && mapping.prefix !== 'hub_hero_') {
                content.image_url = `/images/animatori/${mapping.dest}`;
                content.image_alt = mapping.alt;
                await sb.from('kassia_page_sections').update({ content }).eq('id', section.id);
                console.log(`Updated Section "${section.heading}" for ${slug} with image ${mapping.dest}`);
            } else if (isExploderSection && exploderMapping) {
                content.image_url = `/images/animatori/${exploderMapping.dest}`;
                content.image_alt = exploderMapping.alt;
                await sb.from('kassia_page_sections').update({ content }).eq('id', section.id);
                console.log(`Updated Section "${section.heading}" for ${slug} with image ${exploderMapping.dest}`);
            }
        }
    }
    console.log("DB Update Complete.");
}

run();
