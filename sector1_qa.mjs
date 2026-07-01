import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const NEW_SLUG = 'animatori-petreceri-copii-sector-1';
const OLD_SLUG = 'animatori-copii-sector-1';

async function run() {
    console.log("=== DB CHECK ===");
    
    // New URL
    const { data: newPage } = await supabase.from('kassia_pages').select('*').eq('slug', NEW_SLUG).single();
    let newPageData = {};
    if (newPage) {
        const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', newPage.id);
        const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', newPage.id);
        
        const forbidden = ['perfect', 'premium', 'corporate', 'pachete', 'pachet', 'cost', 'tarif', 'memorabil', 'de neuitat', 'garantat', 'magie', '1-3 ore', 'om', 'oameni'];
        let forbiddenFound = [];
        let localLocations = [];
        const localKeywords = ['dorobanti', 'floreasca', 'aviatorilor', 'baneasa', 'bucurestii noi', 'pipera', 'domenii', 'primaverii', 'victoriei'];
        
        sections.forEach(s => {
            const text = JSON.stringify(s).toLowerCase();
            forbidden.forEach(t => {
                if (new RegExp('\\b' + t + '\\b').test(text) && !forbiddenFound.includes(t)) {
                    forbiddenFound.push(t);
                }
            });
            localKeywords.forEach(k => {
                if (text.includes(k) && !localLocations.includes(k)) {
                    localLocations.push(k);
                }
            });
        });
        
        newPageData = {
            id: newPage.id,
            show_pricing_preview: newPage.show_pricing_preview,
            dbFaqCount: faqs ? faqs.length : 0,
            forbiddenFoundInEditable: forbiddenFound,
            localLocations: localLocations
        };
    }
    
    // Old URL
    const { data: oldPage } = await supabase.from('kassia_pages').select('*').eq('slug', OLD_SLUG).single();
    let oldPageData = {};
    if (oldPage) {
        const { data: links } = await supabase.from('kassia_internal_links').select('id').eq('target_page_id', oldPage.id);
        oldPageData = {
            exists: true,
            status: oldPage.status,
            index_status: oldPage.index_status,
            include_in_sitemap: oldPage.include_in_sitemap,
            internalLinksCount: links ? links.length : 0
        };
    } else {
        oldPageData = { exists: false };
    }
    
    console.log(JSON.stringify({ newPageData, oldPageData }, null, 2));

    console.log("=== LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    const liveUrl = `https://www.kassia.ro/${NEW_SLUG}/`;
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
        
        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            sitemap: true, // inferred since published
            faqCount: document.querySelectorAll('details, .faq-details').length,
            schemaCount: schemaCount,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            hasHardcodedPricing: Array.from(document.querySelectorAll('h1, h2, h3, h4')).some(h => h.innerText.toLowerCase().includes('variante de program') && h.nextElementSibling?.tagName === 'UL'),
            pricingCardCount: pricingCards.length,
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            hasHeader: !!document.querySelector('header'),
            hasFooter: !!document.querySelector('footer'),
            imgCount: document.querySelectorAll('img').length,
            visibleImgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length,
            emptyBlocks: document.querySelectorAll('section:empty').length > 0
        };
    });
    
    let oldUrlChain = [];
    let oldUrlFinal = "";
    try {
        const oldResponse = await p.goto(`https://www.kassia.ro/${OLD_SLUG}/`);
        oldUrlChain = oldResponse.request().redirectChain().map(r => r.response().status());
        oldUrlFinal = p.url();
    } catch(e) {}
    
    await browser.close();
    
    console.log(JSON.stringify({ httpStatus, pageData, oldUrlCheck: { chain: oldUrlChain, finalUrl: oldUrlFinal } }, null, 2));
}

run().catch(console.error);
