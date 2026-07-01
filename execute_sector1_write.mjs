import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';
import { execSync } from 'child_process';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4';
const SLUG = 'animatori-petreceri-copii-sector-1';

async function run() {
    console.log("=== PRE-WRITE BACKUP ===");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    const { data: oldUrl } = await supabase.from('kassia_pages').select('*').eq('slug', 'animatori-copii-sector-1').single();
    
    const backupPath = `/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/sector1_backup.json`;
    fs.writeFileSync(backupPath, JSON.stringify({ page, sections, faqs, oldUrl }, null, 2));
    console.log(`Backup saved to: ${backupPath}`);

    console.log("=== EXECUTING WRITE ===");
    
    // STEP 1
    await supabase.from('kassia_pages').update({ 
        show_pricing_preview: true,
        updated_at: new Date().toISOString()
    }).eq('id', PAGE_ID);
    
    // STEP 2 - Forbidden terms
    const s1Text = `Animatorul ghidează copiii prin jocuri, dansuri, momente creative și activități de grup, astfel încât petrecerea să aibă ritm, energie și interacțiune. Programul poate include momente de poveste, jocuri cu reguli simple, concursuri fizice și momente artistice. Fiecare moment este completat de servicii îndrăgite precum sesiuni de activități creative și creații inedite prin <a href="/modelaj-baloane-copii-bucuresti/">modelaj baloane pentru copii</a>, oferind o experiență variată care îi ține pe copii implicați activ pe parcursul programului de animație.`;
    const s1Data = sections.find(s => s.id === '17493caa-ab66-46f5-85f1-96dd35a2e3b7');
    if (s1Data && s1Data.content) {
        s1Data.content.body = s1Text;
        await supabase.from('kassia_page_sections').update({ content: s1Data.content }).eq('id', '17493caa-ab66-46f5-85f1-96dd35a2e3b7');
    }

    const s2Text = `Structura programului se stabilește în funcție de vârsta copiilor, spațiul disponibil, tematica petrecerii și activitățile dorite. Pentru copiii de vârstă preșcolară, punem accentul pe jocuri muzicale simple, interacțiune blândă și povești interactive. Pentru copiii din clasele primare și școală gimnazială, dezvoltăm concursuri de echipă, ștafete antrenante și provocări adaptate dinamicii lor. Fiecare detaliu contează pentru a oferi o atmosferă în care toți copiii se simt incluși, motiv pentru care adaptăm constant ritmul activităților. Pentru detalii adiționale despre modul în care personalizăm programele, poți consulta secțiunea <a href="/preturi-animatori-copii-bucuresti/">Programe animatori copii</a>.`;
    const s2Data = sections.find(s => s.id === '13321937-c24f-4bcd-a731-ebe4d24ec239');
    if (s2Data && s2Data.content) {
        s2Data.content.body = s2Text;
        await supabase.from('kassia_page_sections').update({ content: s2Data.content }).eq('id', '13321937-c24f-4bcd-a731-ebe4d24ec239');
    }

    const faqText = `Programul de animație poate include jocuri interactive, dansuri mini-disco, mascote, sesiuni de creativitate, modelaj din baloane și activități adaptate vârstei invitaților.`;
    await supabase.from('kassia_faqs').update({ answer: faqText }).eq('id', '823e50f8-0144-44f9-8ff9-04c8cbbebf56');

    // STEP 3 - Insert Micro-block
    const { data: newBlock } = await supabase.from('kassia_page_sections').insert({
        page_id: PAGE_ID,
        section_type: 'content',
        order_index: 2,
        heading: 'Cum alegi programul potrivit pentru locațiile din Sectorul 1',
        content: {
            subheading: 'Recomandări în funcție de spațiu și numărul copiilor',
            body: '<p>Organizarea evenimentului depinde de specificul locației alese în Sectorul 1, inclusiv Dorobanți, Floreasca, Domenii, Bucureștii Noi, Aviatorilor, Băneasa sau zonele rezidențiale aflate în proximitate.</p><ul><li><strong>Pentru apartamente și spații private restrânse:</strong> Recomandăm un singur personaj animator, potrivit pentru grupuri de 10-12 copii, cu activități creative, jocuri muzicale și modelaj de baloane.</li><li><strong>Pentru curți, terase sau locuri de joacă:</strong> Spațiul deschis permite jocuri dinamice, concursuri de mișcare și mini-disco. Pentru grupurile care depășesc 12-15 copii, recomandarea tehnică este implicarea a două personaje animatoare, astfel încât activitățile să poată fi coordonate mai clar.</li><li><strong>Pentru restaurante și săli de evenimente:</strong> Activitățile sunt alternate cu momentele de masă, iar programul este adaptat zonei alocate copiilor.</li></ul>'
        }
    }).select().single();
    const newSectionId = newBlock.id;

    // STEP 4 - Order index updates
    await supabase.from('kassia_page_sections').update({ order_index: 3 }).eq('id', 'f696d2bb-62e4-461c-95a4-8e08aa906439');
    await supabase.from('kassia_page_sections').update({ order_index: 4 }).eq('id', '13321937-c24f-4bcd-a731-ebe4d24ec239');
    await supabase.from('kassia_page_sections').update({ order_index: 5 }).eq('id', '6a88deb2-a6c3-4a33-9a2c-0311634936fa');
    await supabase.from('kassia_page_sections').update({ order_index: 6 }).eq('id', '55aa1627-ef3d-4c3e-8f19-33ab62ff8b54');
    await supabase.from('kassia_page_sections').update({ order_index: 7 }).eq('id', '66bb2738-fd4e-5d4f-9a2f-44bc73aa9c65');
    await supabase.from('kassia_page_sections').update({ order_index: 8 }).eq('id', '77cc3849-ae5f-6e5f-ab3f-55cd84bb0d76');
    await supabase.from('kassia_page_sections').update({ order_index: 9 }).eq('id', '88dd4950-bf6a-7f6f-bc4f-66de95cc1e87');
    await supabase.from('kassia_page_sections').update({ order_index: 10 }).eq('id', '724f32d0-175e-41eb-9305-b808d67ee62a');
    await supabase.from('kassia_page_sections').update({ order_index: 20 }).eq('id', '81bd424f-5071-4d44-a45f-557fd63832e5');

    console.log("Waiting 10 seconds for CDN / Next.js ISR propagation...");
    await new Promise(r => setTimeout(r, 10000));

    console.log("=== GATHERING REPORT EVIDENCE ===");
    const { data: verifyPage } = await supabase.from('kassia_pages').select('show_pricing_preview').eq('id', PAGE_ID).single();
    
    // Check forbidden words in DB editable fields
    const { data: newSections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    const { data: newFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    
    const forbiddenTerms = ['pachet', 'pachete', 'pictură pe față', 'pictura pe fata', 'face-painting'];
    let forbiddenMatches = [];
    const scanText = (text, source, rowId) => {
        if (!text) return;
        const lowerText = String(text).toLowerCase();
        forbiddenTerms.forEach(term => {
            const regex = new RegExp(`(^|\\s|[.,!?;:"'\\(\\)><\\/\\-])(${term})($|\\s|[.,!?;:"'\\(\\)><\\/\\-])`, 'i');
            if (regex.test(lowerText)) forbiddenMatches.push({term, source, rowId});
        });
    };
    newSections.forEach(s => {
        scanText(s.heading, 'section', s.id); scanText(s.content?.subheading, 'section', s.id); scanText(s.content?.body, 'section', s.id);
    });
    newFaqs.forEach(f => {
        scanText(f.question, 'faq', f.id); scanText(f.answer, 'faq', f.id);
    });

    const liveUrl = `https://www.kassia.ro/${SLUG}/`;
    
    console.log("--- CURL EVIDENCE ---");
    try {
        const canonicalCurl = execSync(`curl -sI '${liveUrl}' | grep -i 'HTTP/'`).toString().trim();
        console.log("curl -I canonical:", canonicalCurl);
        const html = execSync(`curl -sL '${liveUrl}'`).toString();
        
        console.log("curl grep heading:", html.includes("Cum alegi programul potrivit pentru locațiile din Sectorul 1") ? "FOUND" : "NOT FOUND");
        console.log("curl grep pictură pe față:", html.toLowerCase().includes("pictură pe față") ? "FOUND (might be in protected)" : "NOT FOUND");
        console.log("curl grep /pachete-animatori-copii-bucuresti/:", html.includes("/pachete-animatori-copii-bucuresti/") ? "FOUND" : "NOT FOUND");
    } catch(e) {}

    console.log("--- PUPPETEER EVIDENCE ---");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.setViewport({ width: 1280, height: 800 });
    const response = await p.goto(liveUrl, { waitUntil: 'networkidle2' });
    
    const pageData = await p.evaluate(() => {
        const textContent = document.body.innerText.toLowerCase();
        let schemaCount = 0;
        document.querySelectorAll('script[type="application/ld+json"]').forEach(s => {
            try {
                const j = JSON.parse(s.innerText);
                const checkFAQ = (obj) => {
                    if (obj['@type'] === 'FAQPage') {
                        schemaCount += obj.mainEntity ? obj.mainEntity.length : 0;
                    } else if (obj['@graph']) {
                        obj['@graph'].forEach(checkFAQ);
                    }
                };
                checkFAQ(j);
            } catch(e) {}
        });

        // Determine section order live
        const allSections = Array.from(document.querySelectorAll('section'));
        const pricingIdx = allSections.findIndex(s => s.classList.contains('pricing-preview-section'));
        const microBlockIdx = allSections.findIndex(s => s.innerText.includes('Cum alegi programul potrivit'));

        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            faqVisibleCount: document.querySelectorAll('details, .faq-details').length,
            schemaFaqCount: schemaCount,
            hasPricingPreview: !!document.querySelector('.pricing-preview-cards'),
            pricingCardCount: document.querySelectorAll('.pricing-preview-cards .pricing-card').length,
            imgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length,
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            microBlockPositionOk: pricingIdx !== -1 && microBlockIdx === pricingIdx + 1
        };
    });

    const screenshotPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/sector1_post_write.png';
    await p.screenshot({ path: screenshotPath, fullPage: true });
    
    await browser.close();

    console.log(JSON.stringify({ 
        backupPath,
        newSectionId,
        verifyPage,
        forbiddenMatches,
        pageData,
        screenshotPath
    }, null, 2));
}

run().catch(console.error);
