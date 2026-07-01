import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const SECTOR1_SLUG = 'animatori-petreceri-copii-sector-1';
const VOLUNTARI_SLUG = 'animatori-petreceri-copii-voluntari';
const OLD_SLUG = 'animatori-copii-sector-1';

const forbiddenTerms = [
    'pachet', 'pachete', 'pictură pe față', 'pictura pe fata', 'face-painting', 'perfect', 
    'premium', 'magie', 'garantat', 'de neuitat', 'memorabil', 'asigur', 'asigură', 
    'asigurăm', 'asigurându-ne', 'prețurile noastre', 'preturile noastre', 'cost', 
    'tarif', 'costuri', 'tarife', '1-3 ore', 'om', 'oameni', 'corporate', 'nuntă', 'nunti', 'nunți', 'majorat'
];

function buildRegex() {
    // using \b for boundaries where possible, but words with special characters might be tricky in JS regex
    return new RegExp(`\\b(?:${forbiddenTerms.join('|')})\\b`, 'gi');
}

async function run() {
    console.log("=== DB DATA FETCH ===");
    const { data: pages } = await supabase.from('kassia_pages').select('*').in('slug', [SECTOR1_SLUG, VOLUNTARI_SLUG, OLD_SLUG]);
    
    const s1Page = pages.find(p => p.slug === SECTOR1_SLUG);
    const volPage = pages.find(p => p.slug === VOLUNTARI_SLUG);
    const oldPage = pages.find(p => p.slug === OLD_SLUG);
    
    const { data: s1Sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', s1Page.id).order('order_index', { ascending: true });
    const { data: s1Faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', s1Page.id).order('order_index', { ascending: true });
    
    console.log("\n=== FORBIDDEN TERMS STRICT RE-SCAN (DB) ===");
    let forbiddenMatches = [];
    
    const scanText = (text, source, rowId, field) => {
        if (!text) return;
        const lowerText = String(text).toLowerCase();
        
        forbiddenTerms.forEach(term => {
            // simpler matching to avoid \b issues with unicode/romanian chars, but ensuring spaces/punctuation boundaries
            const regex = new RegExp(`(^|\\s|[.,!?;:"'\\(\\)><\\/\\-])(${term})($|\\s|[.,!?;:"'\\(\\)><\\/\\-])`, 'i');
            if (regex.test(lowerText)) {
                // Find exact match string snippet
                const match = lowerText.match(regex);
                forbiddenMatches.push({
                    term: term,
                    table: source === 'faq' ? 'kassia_faqs' : 'kassia_page_sections',
                    row_id: rowId,
                    field: field,
                    current_text_snippet: lowerText.substring(Math.max(0, lowerText.indexOf(term) - 20), Math.min(lowerText.length, lowerText.indexOf(term) + term.length + 20))
                });
            }
        });
    };

    s1Sections.forEach(s => {
        scanText(s.heading, 'section', s.id, 'heading');
        scanText(s.content?.subheading, 'section', s.id, 'content.subheading');
        scanText(s.content?.body, 'section', s.id, 'content.body');
    });
    s1Faqs.forEach(f => {
        scanText(f.question, 'faq', f.id, 'question');
        scanText(f.answer, 'faq', f.id, 'answer');
    });
    
    console.log(JSON.stringify(forbiddenMatches, null, 2));

    console.log("\n=== SECTOR 1 CURRENT ORDER MAP ===");
    s1Sections.forEach(s => {
        console.log(`order_index ${s.order_index} = [${s.section_type}] ${s.heading || 'No heading'}`);
    });

    console.log("\n=== SECTOR 1 INTERNAL LINKS ===");
    s1Sections.forEach(s => {
        if (s.content?.body && s.content.body.includes('href=')) {
            const links = s.content.body.match(/href="([^"]+)"/g);
            console.log(`Section ${s.order_index} links:`, links);
        }
    });

    console.log("\n=== LIVE QA (PUPPETEER) ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    
    const p1 = await browser.newPage();
    await p1.goto(`https://www.kassia.ro/${SECTOR1_SLUG}/`, { waitUntil: 'networkidle2' });
    const s1Live = await p1.evaluate(() => {
        return {
            hasPricingPreview: !!document.querySelector('.pricing-preview-cards'),
            pricingCardCount: document.querySelectorAll('.pricing-preview-cards .pricing-card').length,
            faqVisibleCount: document.querySelectorAll('details, .faq-details').length,
            schemaFaqCount: Array.from(document.querySelectorAll('script[type="application/ld+json"]')).reduce((acc, script) => {
                try {
                    const j = JSON.parse(script.innerText);
                    if (j['@type'] === 'FAQPage') return acc + (j.mainEntity ? j.mainEntity.length : 0);
                } catch(e) {}
                return acc;
            }, 0)
        };
    });
    
    const pVol = await browser.newPage();
    await pVol.goto(`https://www.kassia.ro/${VOLUNTARI_SLUG}/`, { waitUntil: 'networkidle2' });
    const volLive = await pVol.evaluate(() => {
        return {
            hasPricingPreview: !!document.querySelector('.pricing-preview-cards'),
            pricingCardCount: document.querySelectorAll('.pricing-preview-cards .pricing-card').length,
        };
    });

    const pOld = await browser.newPage();
    let oldChain = [];
    try {
        const resp = await pOld.goto(`https://www.kassia.ro/${OLD_SLUG}/`);
        oldChain = resp.request().redirectChain().map(r => r.response().status());
    } catch(e) {}

    await browser.close();

    console.log("SECTOR 1 LIVE:", JSON.stringify(s1Live));
    console.log("VOLUNTARI LIVE:", JSON.stringify(volLive));
    console.log("OLD URL CHAIN:", JSON.stringify(oldChain));
    
    console.log("\n=== DB DATA DUMP ===");
    console.log("Sector 1 show_pricing_preview:", s1Page.show_pricing_preview);
    console.log("Voluntari show_pricing_preview:", volPage.show_pricing_preview);
    console.log("Old URL Exists:", !!oldPage);
    if (oldPage) {
        console.log("Old URL Status:", oldPage.status, "Index:", oldPage.index_status);
    }
}

run().catch(console.error);
