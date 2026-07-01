import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '7bd530f1-2f5b-4c2a-b591-aae69f2ab473';
const slug = 'animatori-petreceri-copii-popesti-leordeni';

async function run() {
    console.log("=== PRE-WRITE BACKUP ===");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID).order('order_index', { ascending: true });
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    
    const backupObj = { page, sections, faqs };
    const backupPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/popesti_micro_block_backup.json';
    fs.writeFileSync(backupPath, JSON.stringify(backupObj, null, 2));
    console.log(`Backup saved to: ${backupPath}`);
    
    console.log("=== EXECUTING WRITE ===");
    
    // Shift existing sections with order_index >= 1
    const sectionsToShift = sections.filter(s => s.order_index >= 1);
    for (const sec of sectionsToShift) {
        await supabase.from('kassia_page_sections')
            .update({ order_index: sec.order_index + 1 })
            .eq('id', sec.id);
    }
    
    // Insert new section
    const newSection = {
        page_id: PAGE_ID,
        section_type: 'content',
        order_index: 1,
        heading: 'Cum alegi programul potrivit pentru petrecerea din Popești-Leordeni',
        content: {
            subheading: 'Recomandări practice în funcție de spațiu și numărul de copii',
            body: '<p>Organizarea evenimentului depinde mult de locația pe care o aveți la dispoziție și de mărimea grupului.</p><ul><li><strong>Pentru apartamente și spații restrânse din Popești-Leordeni:</strong> Recomandăm varianta cu un singur personaj animator, axată pe jocuri de grup statice, activități creative și modelaj de baloane. Această opțiune este potrivită pentru grupuri de până la 10-12 copii.</li><li><strong>Pentru curte, terasă sau loc de joacă închiriat:</strong> Spațiul deschis permite jocuri dinamice, concursuri de mișcare și mini-disco. Pentru grupurile care depășesc 12-15 copii, recomandarea tehnică este prezența a două personaje animatoare. Astfel, energia este gestionată eficient, iar copiii participă simultan la activități.</li><li><strong>Pentru restaurante și spații mixte:</strong> Programul se adaptează zonei alocate copiilor, alternând jocurile interactive cu pauzele necesare pentru masă.</li></ul>'
        }
    };
    
    const { data: insertedData, error: insErr } = await supabase.from('kassia_page_sections').insert([newSection]).select();
    if (insErr) throw insErr;
    console.log("Inserted new section:", insertedData[0].id);
    
    // Bump updated_at
    const { error: updErr } = await supabase.from('kassia_pages').update({ 
        updated_at: new Date().toISOString() 
    }).eq('id', PAGE_ID);
    if (updErr) throw updErr;
    
    console.log("Bumped page updated_at.");
    
    console.log("Waiting 10 seconds for CDN / Next.js ISR propagation...");
    await new Promise(r => setTimeout(r, 10000));
    
    console.log("=== LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const liveUrl = `https://www.kassia.ro/${slug}/`;
    
    const response = await p.goto(liveUrl, { waitUntil: 'networkidle2' });
    const httpStatus = response.status();
    
    const pageData = await p.evaluate(() => {
        let schemaCount = 0;
        const scripts = document.querySelectorAll('script[type="application/ld+json"]');
        scripts.forEach(s => {
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

        const pricingCards = document.querySelectorAll('.pricing-preview-cards .pricing-card');
        const textContent = document.body.innerText.toLowerCase();
        
        // Find if new block is visible and roughly where
        const newHeadingText = 'cum alegi programul potrivit pentru petrecerea din popești-leordeni';
        const hasNewBlock = textContent.includes(newHeadingText);
        
        const headings = Array.from(document.querySelectorAll('h2, h3'));
        const newHeadingIdx = headings.findIndex(h => h.innerText.toLowerCase().includes(newHeadingText));
        
        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            faqCount: document.querySelectorAll('details, .faq-details').length,
            schemaCount: schemaCount,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            hasNewBlock: hasNewBlock,
            newHeadingIdx: newHeadingIdx,
            pricingCardCount: pricingCards.length,
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            imgCount: document.querySelectorAll('img').length,
            visibleImgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length
        };
    });
    
    await browser.close();
    
    console.log(JSON.stringify({ 
        httpStatus, 
        pageData, 
        newSectionId: insertedData[0].id 
    }, null, 2));
}

run().catch(console.error);
