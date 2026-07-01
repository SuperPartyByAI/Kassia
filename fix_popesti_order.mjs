import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '7bd530f1-2f5b-4c2a-b591-aae69f2ab473';

async function run() {
    console.log("=== EXECUTING RECONCILIATION FIX ===");
    
    // Fetch all sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    
    const hero = sections.find(s => s.section_type === 'hero');
    const petreceriAcasa = sections.find(s => s.heading === 'Petreceri acasă, la curte sau la restaurant');
    const cumAlegi = sections.find(s => s.heading === 'Cum alegi programul potrivit pentru petrecerea din Popești-Leordeni');
    const personaje = sections.find(s => s.heading === 'Personaje și mascote pentru tematici diferite');
    const detalii = sections.find(s => s.heading === 'Detalii pentru program și deplasare');
    const asistenta = sections.find(s => s.heading === 'Asistență pentru părinți');
    
    // Set correct order_index
    if (hero) await supabase.from('kassia_page_sections').update({ order_index: 1 }).eq('id', hero.id);
    if (petreceriAcasa) await supabase.from('kassia_page_sections').update({ order_index: 2 }).eq('id', petreceriAcasa.id);
    if (cumAlegi) await supabase.from('kassia_page_sections').update({ order_index: 3 }).eq('id', cumAlegi.id);
    if (personaje) await supabase.from('kassia_page_sections').update({ order_index: 4 }).eq('id', personaje.id);
    if (detalii) await supabase.from('kassia_page_sections').update({ order_index: 5 }).eq('id', detalii.id);
    if (asistenta) await supabase.from('kassia_page_sections').update({ order_index: 6 }).eq('id', asistenta.id);
    
    // Bump updated_at
    await supabase.from('kassia_pages').update({ updated_at: new Date().toISOString() }).eq('id', PAGE_ID);
    
    console.log("Fixed order_index in DB and bumped updated_at.");
    
    console.log("Waiting 10 seconds for CDN / Next.js ISR propagation...");
    await new Promise(r => setTimeout(r, 10000));
    
    console.log("=== LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const liveUrl = `https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/`;
    
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
        
        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            faqCount: document.querySelectorAll('details, .faq-details').length,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            hasNewBlock: hasNewBlock,
        };
    });
    
    await browser.close();
    
    console.log(JSON.stringify({ 
        httpStatus, 
        pageData
    }, null, 2));
}

run().catch(console.error);
