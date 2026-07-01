import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    console.log("=== DB UPDATE PHASE ===");
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', 'home').single();
    if(!page) throw new Error("Homepage not found in DB");

    // Fix 1: FAQ "câteva săptămâni"
    const oldFaq = "Recomandăm să ne scrii cu câteva săptămâni înainte, pentru a verifica disponibilitatea echipei și pentru a stabili detaliile legate de animație și decoruri.";
    const newFaq = "Recomandăm să ne contactezi din timp pentru a verifica disponibilitatea echipei și pentru a stabili detaliile legate de animație și decoruri.";
    
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.includes("câteva săptămâni")) {
            const updatedAnswer = faq.answer.replace(oldFaq, newFaq);
            await sb.from('kassia_faqs').update({ answer: updatedAnswer }).eq('id', faq.id);
            console.log("Updated FAQ");
        }
    }

    // Fix 2-5: kassia_page_sections
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    const oldHero = "Echipa Kassia îți transformă evenimentul într-o amintire de neuitat. Oferim programe de animație pentru copii cu mascote și jocuri interactive, completate de decoruri spectaculoase din baloane.";
    const newHero = "Echipa Kassia îți transformă evenimentul într-o amintire de neuitat. Oferim programe de animație pentru copii cu mascote și jocuri interactive, completate de decoruri din baloane.";
    
    const oldEtape = "Totul începe cu o discuție inițială despre dorințele tale. Alegem împreună paleta de culori și conceptul vizual, îți trimitem o ofertă adaptată, iar în ziua evenimentului echipa noastră se ocupă integral de montaj la locație.";
    const newEtape = "Totul începe cu o discuție inițială despre dorințele tale. Alegem împreună paleta de culori și conceptul vizual, stabilim detaliile finale, iar în ziua evenimentului echipa noastră se ocupă integral de montaj la locație.";
    
    const oldPictura = "Modele colorate și sigure pentru copii, adaptate tematicii evenimentului.";
    const newPictura = "Modele colorate pentru copii, adaptate tematicii evenimentului.";
    
    const oldPersonaje = "O selecție excelentă de personaje îndrăgite pentru a bucura copiii la orice eveniment.";
    const newPersonaje = "O gamă variată de personaje îndrăgite pentru a bucura copiii la orice eveniment.";

    for (const sec of sections) {
        if (!sec.content) continue;
        let modified = false;
        let newContent = { ...sec.content };
        
        if (newContent.body && newContent.body.includes("spectaculoase")) {
            newContent.body = newContent.body.replace(oldHero, newHero);
            modified = true;
            console.log("Updated Hero");
        }
        if (newContent.body && newContent.body.includes("ofertă adaptată")) {
            newContent.body = newContent.body.replace(oldEtape, newEtape);
            modified = true;
            console.log("Updated Etape");
        }
        if (newContent.subheading && newContent.subheading.includes("sigure")) {
            newContent.subheading = newContent.subheading.replace(oldPictura, newPictura);
            modified = true;
            console.log("Updated Pictura");
        }
        if (newContent.subheading && newContent.subheading.includes("excelentă")) {
            newContent.subheading = newContent.subheading.replace(oldPersonaje, newPersonaje);
            modified = true;
            console.log("Updated Personaje");
        }
        
        if (modified) {
            await sb.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
        }
    }

    console.log("Waiting 2s for DB propagation...");
    await new Promise(r => setTimeout(r, 2000));

    console.log("\n=== LIVE VALIDATION PHASE ===");
    const res = await fetch('https://www.kassia.ro/?bust=' + Date.now());
    const html = await res.text();
    const $ = cheerio.load(html);
    const txt = $('body').text().replace(/\s+/g, ' ');

    console.log(`HTTP 200: ${res.status === 200}`);
    console.log(`H1 neschimbat: ${$('h1').text().trim().includes('Kassia Events')}`);
    console.log(`Title neschimbat: ${$('title').text().trim().includes('Organizare petreceri')}`);
    console.log(`Canonical neschimbat: ${$('link[rel="canonical"]').attr('href') === 'https://www.kassia.ro/'}`);
    
    let hubLinkIntact = false;
    $('a').each((i, el) => {
        if ($(el).attr('href') === '/animatori-petreceri-copii/') hubLinkIntact = true;
    });
    console.log(`Linkuri Hub intacte: ${hubLinkIntact}`);

    const badTerms = ["câteva săptămâni", "spectaculoase", "ofertă adaptată", "sigure", "excelentă"];
    console.log("\nChecking fluff terms in live DOM:");
    badTerms.forEach(t => {
        console.log(`- ${t}: ${txt.toLowerCase().includes(t.toLowerCase())}`);
    });
}
run();
