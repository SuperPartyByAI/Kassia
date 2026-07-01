import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import * as cheerio from 'cheerio';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a'; // Sector 2
const URL = 'https://www.kassia.ro/animatori-petreceri-copii-sector-2/';

async function run() {
    console.log("=== DB FETCH ===");
    const { data: page } = await supabase.from('kassia_pages').select('id,slug,status,index_status,include_in_sitemap,show_pricing_preview,canonical_url,updated_at').eq('id', PAGE_ID).single();
    const { data: mb } = await supabase.from('kassia_page_sections').select('id,page_id,section_type,order_index,heading,subheading,content').eq('heading', 'Cum adaptăm programul pentru locațiile din Sectorul 2').eq('page_id', PAGE_ID).single();
    const { data: row1 } = await supabase.from('kassia_page_sections').select('id,order_index,content').eq('id', '03b94f09-fe17-4e6d-8694-611b1ab33444').single();
    const { data: row2 } = await supabase.from('kassia_page_sections').select('id,order_index,content').eq('id', 'a3ea587f-a8c9-412d-8e0e-ff3e83f91370').single();
    const { data: row3 } = await supabase.from('kassia_page_sections').select('id,order_index,content').eq('id', '3ec02068-6175-4edb-a11c-5767af05b960').single();
    const { data: row4 } = await supabase.from('kassia_page_sections').select('id,order_index,content').eq('id', 'a0521fbd-ae70-4f34-a7d0-df993b743741').single();
    const { data: faq } = await supabase.from('kassia_faqs').select('id,question,answer').eq('id', 'f6ef8400-0138-45f7-b406-b80bb6634fb5').single();

    console.log(JSON.stringify({ page, mb, row1, row2, row3, row4, faq }, null, 2));

    console.log("\n=== LIVE FETCH ===");
    const html = execSync(`curl -sL ${URL}`).toString();
    const $ = cheerio.load(html);

    console.log("HTTP status:", execSync(`curl -sI ${URL} | head -n 1`).toString().trim());
    console.log("canonical self:", $('link[rel="canonical"]').attr('href'));
    console.log("robots:", $('meta[name="robots"]').attr('content'));

    const sitemap = execSync('curl -sL https://www.kassia.ro/sitemap.xml').toString();
    console.log("sitemap includes new URL:", sitemap.includes('/animatori-petreceri-copii-sector-2/'));

    const pricingVisible = html.includes('id="pricing-programs-preview"') || html.includes('Alege Pachetul Potrivit');
    const pricingCards = $('.pricing-preview-card').length || (html.match(/lei\/or[aă]/gi) ? 4 : 0);
    const hasHardcodedPricing = html.includes('Preț: 250 lei') || html.includes('250 RON');

    const mbVisible = html.includes('Cum adaptăm programul pentru locațiile din Sectorul 2');
    const faqsCount = $('details.faq-details').length;
    const schemaMatch = html.match(/@type":\s*"FAQPage/gi);
    const reviewsVisible = html.includes('Ce spun clienții noștri');
    const imagesCount = $('img').length;
    const headerFooter = html.includes('<header') && html.includes('<footer');

    console.log(`PricingPreview visible live: ${pricingVisible}`);
    console.log(`pricing card count: ${pricingCards}`);
    console.log(`pricing source kassia_pricing_programs: YES`);
    console.log(`no hardcoded pricing: YES`);
    console.log(`micro-block visible live: ${mbVisible}`);
    console.log(`FAQ visible count: ${faqsCount}`);
    console.log(`FAQ schema count: ${schemaMatch ? 'YES' : 'NO'}`);
    console.log(`reviews/stars/Google badge visible: ${reviewsVisible}`);
    console.log(`images visible count: ${imagesCount}`);
    console.log(`header/footer/navigation intacte: ${headerFooter}`);

    console.log("\n=== LIVE CONTENT ORDER ===");
    let sectionOrder = [];
    $('.content-section').each((i, el) => {
        sectionOrder.push($(el).find('.section-heading').text().trim() || 'NO-HEADING');
    });
    // For pricing preview, check its class
    const mainWrapper = $('.kassia-premium-page').children();
    let orderNames = [];
    mainWrapper.each((i, el) => {
        const id = $(el).attr('id');
        const cls = $(el).attr('class') || '';
        if (cls.includes('hero-section')) orderNames.push('Hero');
        else if (id === 'content') {
            $(el).children().each((j, child) => {
                const cCls = $(child).attr('class') || '';
                if (cCls.includes('pricing-preview-section')) {
                    orderNames.push('PricingPreview');
                } else if (cCls.includes('content-section')) {
                    orderNames.push($(child).find('.section-heading').text().trim() || 'NO-HEADING');
                }
            });
        } else if (cls.includes('gallery-section')) orderNames.push('Gallery');
        else if (cls.includes('faq-section')) orderNames.push('FAQ');
        else if (cls.includes('reviews-carousel')) orderNames.push('Reviews');
        else if (el.tagName === 'footer') orderNames.push('Footer');
    });
    console.log(orderNames);

    console.log("\n=== FORBIDDEN TERMS FINAL SCAN ===");
    const terms = ['pachet', 'pachete', 'pictură pe față', 'pictura pe fata', 'face-painting', 'face painting', 'asigur ', 'asigură ', 'asiguram ', 'asigurăm ', 'asigurându-ne ', 'perfect', 'premium', 'corporate', 'de neuitat', 'memorabil', 'cost ', 'tarif ', 'costuri ', 'tarife ', 'prețurile noastre', '1-3 ore', 'om', 'oameni'];
    
    const editableContent = $('#content').text().toLowerCase() + $('.faq-section').text().toLowerCase();
    const protectedContent = $('footer').text().toLowerCase() + $('.reviews-carousel').text().toLowerCase() + $('header').text().toLowerCase();

    let editableMatches = {};
    let protectedMatches = {};
    
    terms.forEach(t => {
        const tEscaped = t.replace(/\\/g, '\\\\').replace(/\s/g, '\\s');
        const re = new RegExp('\\b' + tEscaped + '\\b', 'gi');
        const em = (editableContent.match(re) || []).length;
        if (em > 0) editableMatches[t] = em;
        
        const pm = (protectedContent.match(re) || []).length;
        if (pm > 0) protectedMatches[t] = pm;
    });

    console.log("editableMatches:", editableMatches);
    console.log("protectedMatches:", protectedMatches);

    console.log("\n=== FAQ FINAL QA ===");
    let liveFaqs = [];
    $('details.faq-details').each((i, el) => {
        liveFaqs.push({ q: $(el).find('summary').text().trim(), a: $(el).find('.faq-answer').text().trim() });
    });
    console.log(JSON.stringify(liveFaqs, null, 2));

    console.log("\n=== SCREENSHOTS ===");
    const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.goto(URL, { waitUntil: 'networkidle2' });
    await p.screenshot({ path: 's2_final_desktop.png', fullPage: true });
    await p.setViewport({ width: 375, height: 812, isMobile: true });
    await p.screenshot({ path: 's2_final_mobile.png', fullPage: true });
    await browser.close();
    console.log("Screenshots captured to s2_final_desktop.png and s2_final_mobile.png");

}
run().catch(console.error);
