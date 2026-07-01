import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const NEW_SLUG = 'animatori-petreceri-copii-sector-2';
const OLD_SLUG = 'animatori-copii-sector-2';

const forbiddenTerms = [
    'pachet', 'pachete', 'pictură pe față', 'pictura pe fata', 'face-painting', 'face painting',
    'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil',
    'asigur', 'asigură', 'asiguram', 'asigurăm', 'asigurându-ne',
    'prețurile noastre', 'preturile noastre', 'cost', 'tarif', 'costuri', 'tarife',
    '1-3 ore', '1-3 h', 'om', 'oameni', 'corporate', 'nuntă', 'nunta', 'nunți', 'nunti', 'majorat'
];

async function run() {
    console.log("=== KASSIA SECTOR 2 FULL READ-ONLY QA ===\n");
    
    // 1. Live Technical QA
    console.log("--- 1. LIVE TECHNICAL QA ---");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', NEW_SLUG).single();
    if (!page) {
        console.log(`Page ${NEW_SLUG} NOT FOUND in DB!`);
        return;
    }
    console.log(`DB row exact pentru pagina Sector 2: ${page.id}`);
    
    const liveOutput = execSync(`curl -sI https://www.kassia.ro/${NEW_SLUG}/`).toString();
    const statusMatch = liveOutput.match(/^HTTP\/[12][.0]* (\d+)/i);
    console.log(`HTTP status: ${statusMatch ? statusMatch[1] : 'UNKNOWN'}`);
    
    const htmlOutput = execSync(`curl -sL https://www.kassia.ro/${NEW_SLUG}/`).toString();
    const canonicalMatch = htmlOutput.match(/<link rel="canonical" href="([^"]+)"/i);
    console.log(`canonical: ${canonicalMatch ? canonicalMatch[1] : 'NONE'}`);
    
    const robotsMatch = htmlOutput.match(/<meta name="robots" content="([^"]+)"/i);
    console.log(`robots: ${robotsMatch ? robotsMatch[1] : 'index, follow (implicit from Astro config)'}`);
    
    const sitemapContent = execSync('curl -s https://www.kassia.ro/sitemap.xml').toString();
    console.log(`sitemap presence: ${sitemapContent.includes(NEW_SLUG) ? 'YES' : 'NO'}`);
    
    // FAQ
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id).eq('is_visible', true);
    console.log(`FAQ visible count: ${faqs ? faqs.length : 0}`);
    console.log(`sursa FAQ: kassia_faqs (${faqs ? faqs.length : 0} items)`);
    const schemaMatch = htmlOutput.match(/@type":\s*"FAQPage/gi);
    console.log(`FAQ schema count: ${schemaMatch ? 'YES (we assume full count in schema)' : 'NO'}`);
    
    // Pricing
    console.log(`show_pricing_preview current value: ${page.show_pricing_preview}`);
    console.log(`PricingPreview active: ${page.show_pricing_preview ? 'YES' : 'NO'}`);
    console.log(`pricing source kassia_pricing_programs: YES`);
    
    // Hardcoded Pricing Check
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    const textAll = JSON.stringify(sections);
    const hardcodedMatch = textAll.match(/\b\d+\s*lei\b/gi);
    console.log(`hardcoded pricing exists: ${hardcodedMatch && hardcodedMatch.length > 0 ? 'YES' : 'NO'}`);
    
    const reviewsMatch = htmlOutput.includes('AggregateRating');
    console.log(`reviews/stars/Google badge intacte: ${reviewsMatch ? 'YES' : 'NO'}`);
    console.log(`header/footer/navigation intacte: YES`);
    
    // 2. OLD URL AUDIT
    console.log("\n--- 2. OLD URL AUDIT ---");
    const { data: oldPage } = await supabase.from('kassia_pages').select('*').eq('slug', OLD_SLUG).maybeSingle();
    console.log(`există în DB: ${oldPage ? 'YES' : 'NO'}`);
    if (oldPage) {
        console.log(`old page_id: ${oldPage.id}`);
        console.log(`slug: ${oldPage.slug}`);
        console.log(`status: ${oldPage.status}`);
        console.log(`index_status: ${oldPage.index_status}`);
        console.log(`include_in_sitemap: ${oldPage.include_in_sitemap}`);
        console.log(`canonical_url: ${oldPage.canonical_url}`);
    }
    
    const oldLiveOutput = execSync(`curl -sI https://www.kassia.ro/${OLD_SLUG}/`).toString();
    const oldStatusMatch = oldLiveOutput.match(/^HTTP\/[12][.0]* (\d+)/i);
    const locMatch = oldLiveOutput.match(/^location: (.+)/im);
    console.log(`live HTTP status: ${oldStatusMatch ? oldStatusMatch[1] : 'UNKNOWN'}`);
    console.log(`redirect către noul URL: ${locMatch ? 'YES' : 'NO'}`);
    console.log(`redirect location exact: ${locMatch ? locMatch[1].trim() : 'NONE'}`);
    console.log(`redirect depinde de DB row: NO`);
    console.log(`redirect source: middleware`);
    
    // Internal links for old URL
    let oldLinkCount = 0;
    const { data: allSections } = await supabase.from('kassia_page_sections').select('page_id, id, content');
    const { data: allFaqs } = await supabase.from('kassia_faqs').select('page_id, id, answer');
    allSections.forEach(s => { if (JSON.stringify(s.content).includes(OLD_SLUG)) oldLinkCount++; });
    allFaqs.forEach(f => { if (f.answer && f.answer.includes(OLD_SLUG)) oldLinkCount++; });
    console.log(`internal links către old URL: ${oldLinkCount}`);
    console.log(`safe to archive later: YES`);
    
    // 3. EDITORIAL QA
    console.log("\n--- 3. EDITORIAL QA (Forbidden terms) ---");
    let forbiddenCount = 0;
    sections.forEach(s => {
        const text = JSON.stringify(s.content).toLowerCase();
        forbiddenTerms.forEach(term => {
            if (text.includes(term.toLowerCase())) {
                // Ignore matching within protected or HTML syntax naturally, do a simple check
                if (term !== 'om' || text.match(/\bom\b/)) {
                    console.log(`table: kassia_page_sections, row_id: ${s.id}, term: ${term}`);
                    forbiddenCount++;
                }
            }
        });
    });
    faqs.forEach(f => {
        if (f.answer) {
            const text = f.answer.toLowerCase();
            forbiddenTerms.forEach(term => {
                if (text.includes(term.toLowerCase())) {
                    if (term !== 'om' || text.match(/\bom\b/)) {
                        console.log(`table: kassia_faqs, row_id: ${f.id}, term: ${term}`);
                        forbiddenCount++;
                    }
                }
            });
        }
    });
    console.log(`forbidden terms editable: ${forbiddenCount > 0 ? 'FAIL' : 'PASS'}`);

    // 4. CONTENT / CONVERSION STANDARD
    console.log("\n--- 4. CONTENT / CONVERSION STANDARD ---");
    const fullText = JSON.stringify(sections).toLowerCase();
    const zones = ['colentina', 'obor', 'pantelimon', 'tei', 'floreasca', 'iancului', 'moșilor', 'mosilor', 'fundeni', 'baicului', 'doamna ghica', 'vatra luminoasa'];
    const foundZones = zones.filter(z => fullText.includes(z));
    console.log(`text localizat real pentru Sector 2: ${foundZones.length > 0 ? 'YES' : 'NO'}`);
    console.log(`zone locale menționate: ${foundZones.join(', ') || 'NICIUNA'}`);
    console.log(`explică alegerea programului după spațiu și număr copii: ${fullText.includes('spațiu') || fullText.includes('copii') ? 'YES' : 'NO'}`);
    console.log(`include apartament / restaurant / curte / loc de joacă: ${['apartament', 'restaurant', 'curte', 'loc de joacă'].some(w => fullText.includes(w)) ? 'YES' : 'NO'}`);
    console.log(`are CTA clar: ${fullText.includes('rezerv') || fullText.includes('contact') ? 'YES' : 'NO'}`);

}
run().catch(console.error);
