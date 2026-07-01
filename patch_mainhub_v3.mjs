import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function executePatchV3() {
    console.log("Starting DB patch V3 with proper integer order_indexes...");
    const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
    
    // First, shift all existing order_indexes >= 7 by +3
    const { data: rowsToShift } = await supabase.from('kassia_page_sections').select('id, order_index').eq('page_id', pageId).gte('order_index', 7);
    for (const row of rowsToShift) {
        await supabase.from('kassia_page_sections').update({ order_index: row.order_index + 3 }).eq('id', row.id);
    }
    
    // 1. UPDATE Hero
    console.log("Updating Hero...");
    await supabase.from('kassia_page_sections').update({
        content: { body: 'Structura programului este adaptată în funcție de vârsta copiilor, numărul invitaților și spațiul disponibil, astfel încât activitățile să rămână clare și ușor de urmărit.' }
    }).eq('id', 'e1f8ba36-0568-450f-a38e-09dcba821bc1');
    
    // 2. UPDATE Activități
    console.log("Updating Activități...");
    await supabase.from('kassia_page_sections').update({
        section_type: 'service_details',
        content: { body: 'Activitățile sunt alese în funcție de vârsta copiilor, spațiul disponibil și energia grupului. Programul poate include jocuri de grup, mini-disco, ghicitori, concursuri prietenoase, modelaj de baloane, ateliere creative și momente dedicate tortului. Într-un apartament păstrăm activitățile mai statice, iar într-o curte sau într-un spațiu de joacă putem include jocuri mai dinamice, cu recuzită și probe de echipă.' }
    }).eq('id', 'a1d82f34-1234-4567-89ab-cdef01234567');
    
    // 3. INSERT Personaje
    console.log("Inserting Personaje...");
    await supabase.from('kassia_page_sections').insert({
        page_id: pageId,
        section_type: 'service_details',
        heading: 'Personaje animatoare și teme potrivite pentru copii',
        content: { 
            body: 'Alegerea personajului se face în funcție de vârsta copilului, preferințele lui și tipul de activități dorit. Pentru copiii mici pot fi potrivite personaje blânde, mascote prietenoase sau personaje clasice. Pentru copiii mai mari pot fi alese teme cu supereroi, prințese, pirați, dansuri sau jocuri de echipă. Înainte de rezervare, verificăm disponibilitatea personajului și adaptăm jocurile la spațiul petrecerii.',
            cta_url: '/personaje-animatori-copii-bucuresti/',
            cta_text: 'Vezi personajele'
        },
        order_index: 7
    });

    // 4. INSERT Cum alegi corect
    console.log("Inserting Cum alegi corect...");
    await supabase.from('kassia_page_sections').insert({
        page_id: pageId,
        section_type: 'service_details',
        heading: 'Cum alegi corect programul cu animatori',
        content: { body: 'Alegerea programului depinde de spațiu, vârsta copiilor și numărul de invitați. Pentru un grup de până la 12 copii, un singur personaj animator poate coordona activitățile într-un spațiu bine delimitat. Pentru grupuri de peste 15 copii, două personaje animatoare ajută la păstrarea atenției și la împărțirea activităților pe ritmuri diferite. O oră poate fi potrivită pentru o petrecere restrânsă, iar două ore oferă mai mult timp pentru jocuri, modelaj de baloane, mini-disco, fotografii și momentul tortului.' },
        order_index: 8
    });
    
    // Wait, Testimonials was 8. It shifted to 11. Zone acoperite was 7, shifted to 10.
    // So 9 is empty! We will insert Social Proof Intro at 9, but wait, we want it BEFORE Testimonials. Testimonials is now 11.
    // If Social proof is 9, it is BEFORE Zone acoperite (10). But we want it AFTER Zone acoperite, right before Testimonials (11).
    // So we will insert Social Proof Intro at order_index 10.5? No, integers.
    // Let's just swap Zone acoperite and Social proof so Social proof is exactly before Testimonials.
    // "Zone acoperite" is currently at 10. We leave it at 9, and put Social Proof at 10.
    await supabase.from('kassia_page_sections').update({ order_index: 9 }).eq('heading', 'Zone acoperite în București și Ilfov').eq('page_id', pageId);
    
    console.log("Inserting Social Proof Intro...");
    await supabase.from('kassia_page_sections').insert({
        page_id: pageId,
        section_type: 'content_block',
        content: { body: 'Citește mai jos câteva recenzii primite de la clienți care au ales programele Kassia pentru petreceri de copii.' },
        order_index: 10
    });
    
    // 6. INSERT FAQs
    console.log("Inserting FAQs...");
    const { data: currentFaqs } = await supabase.from('kassia_faqs').select('order_index').eq('page_id', pageId);
    let maxOrder = 0;
    if (currentFaqs && currentFaqs.length > 0) {
        maxOrder = Math.max(...currentFaqs.map(f => f.order_index || 0));
    }
    
    const newFaqs = [
        { page_id: pageId, question: 'Când alegem un personaj animator și când sunt necesare două personaje animatoare?', answer: 'Pentru un grup de până la 12 copii, un singur personaj animator poate coordona jocurile și momentele creative. Pentru grupuri mai mari de 15 copii sau pentru spații deschise, două personaje animatoare ajută la păstrarea atenției și la împărțirea activităților.', order_index: maxOrder + 1 },
        { page_id: pageId, question: 'Ce program este potrivit pentru o petrecere la apartament?', answer: 'Într-un apartament sau într-un spațiu mic, alegem activități mai statice: ghicitori, ateliere creative, modelaj de baloane, jocuri de atenție și momente scurte de dans. Evităm jocurile cu alergare și păstrăm zona de activitate bine delimitată.', order_index: maxOrder + 2 },
        { page_id: pageId, question: 'Cum se adaptează jocurile la restaurant sau terasă?', answer: 'Într-un restaurant sau pe o terasă, stabilim o zonă clară pentru copii și alternăm jocurile de grup cu momente mai liniștite. Programul este adaptat astfel încât copiii să rămână grupați, fără să se suprapună cu servirea mesei.', order_index: maxOrder + 3 },
        { page_id: pageId, question: 'Cum alegem personajul în funcție de vârsta copilului?', answer: 'Pentru copiii mici sunt potrivite personaje blânde, mascote prietenoase sau personaje clasice. Pentru copiii mai mari pot fi alese teme cu supereroi, prințese, pirați, dansuri sau jocuri de echipă. Recomandarea finală se face în funcție de preferințele copilului și spațiul petrecerii.', order_index: maxOrder + 4 }
    ];
    await supabase.from('kassia_faqs').insert(newFaqs);
    
    console.log("DB Patch V3 Complete!");
}

executePatchV3().catch(console.error);
