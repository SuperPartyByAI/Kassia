import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import * as cheerio from 'cheerio';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a'; // Sector 2
const SLUG = 'animatori-petreceri-copii-sector-2';

async function run() {
    console.log("=== LIVE HTML FETCH ===");
    const html = execSync(`curl -sL https://www.kassia.ro/${SLUG}/`).toString();
    const $ = cheerio.load(html);
    
    // 1. FAQ RECONCILIATION
    console.log("\n--- FAQ RECONCILIATION ---");
    const faqDetails = $('details.faq-details');
    console.log(`FAQ visible count live: ${faqDetails.length}`);
    const schemaMatches = html.match(/@type":\s*"FAQPage/gi);
    console.log(`FAQ schema count live: ${schemaMatches ? 'YES' : 'NO'}`);
    
    let dbFaqs = [];
    faqDetails.each((i, el) => {
        dbFaqs.push({ question: $(el).find('summary').text().trim(), answer: $(el).find('.faq-answer').text().trim() });
    });
    console.log(`Live questions found count: ${dbFaqs.length}`);

    // Where do they come from?
    const { data: pageFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    console.log(`kassia_faqs count for PAGE_ID: ${pageFaqs.length}`);
    if (pageFaqs.length > 0) {
        console.log("Found in kassia_faqs directly.");
    } else if (dbFaqs.length > 0) {
        console.log("NOT FOUND in kassia_faqs for S2. Looking globally...");
        const { data: globalFaqs } = await supabase.from('kassia_faqs').select('id, page_id, question, answer');
        const match = globalFaqs.find(f => f.question === dbFaqs[0].question);
        if (match) {
            console.log(`FOUND FAQ IN kassia_faqs BUT ON ANOTHER PAGE: page_id = ${match.page_id}`);
            // Let's check S1 page ID 33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4 or Voluntari ID.
        } else {
             console.log("FAQ NOT IN kassia_faqs AT ALL. Could be in sections.");
        }
        
        // Wait, what if the renderer pulls faqs unconditionally from kassia_faqs where page_id = current id, but falls back?
        // Let's check the code:
        const template = fs.readFileSync('../kassia-site/src/pages/[...slug].astro', 'utf8');
        // Actually, if pageFaqs == 0, then `validFaqs.length == 0`.
    }

    // 2. REVIEWS RECONCILIATION
    console.log("\n--- REVIEWS RECONCILIATION ---");
    const reviewWidget = html.includes('Ce spun clienții noștri');
    console.log(`Secțiunea "Ce spun clienții noștri" vizibilă live: ${reviewWidget ? 'YES' : 'NO'}`);
    
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    console.log(`Sector 2 show_reviews current value in DB: ${page.show_reviews}`);
    
    if (reviewWidget && page.show_reviews === false) {
        console.log("Why are reviews showing if show_reviews is false?");
        // check template
        const template = execSync('cat ../kassia-site/src/pages/\\[...slug\\].astro').toString();
        const reviewsCall = template.match(/<ReviewsCarousel[^>]*>/);
        console.log(`Template call: ${reviewsCall ? reviewsCall[0] : 'None'}`);
        console.log("Verdict: The component <ReviewsCarousel /> is rendered unconditionally in [...slug].astro!");
    } else if (page.show_reviews) {
        console.log("show_reviews IS true. I misreported it earlier.");
    }

    // 3. PAGE ROW FLAGS
    console.log("\n--- PAGE ROW FLAGS ---");
    console.log(JSON.stringify({
        id: page.id,
        slug: page.slug,
        status: page.status,
        index_status: page.index_status,
        include_in_sitemap: page.include_in_sitemap,
        show_pricing_preview: page.show_pricing_preview,
        show_reviews: page.show_reviews,
        show_faq: page.show_faq,
        canonical_url: page.canonical_url,
        updated_at: page.updated_at
    }, null, 2));
    
    // 4. FORBIDDEN TERMS FULL SCAN
    console.log("\n--- FORBIDDEN TERMS FULL SCAN ---");
    const terms = ['pachet', 'pachete', 'pictură pe față', 'pictura pe fata', 'face-painting', 'face painting', 'asigur', 'asigura', 'asigură', 'asiguram', 'asigurăm', 'asigurându-ne', 'perfect', 'premium', 'corporate', 'de neuitat', 'cost', 'tarif', 'costuri', 'tarife'];
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    
    let editableMatches = [];
    sections.forEach(s => {
        const text = JSON.stringify(s.content).toLowerCase();
        terms.forEach(t => {
            if (text.includes(t)) {
                editableMatches.push({ table: 'kassia_page_sections', row_id: s.id, field: 'content', term: t });
            }
        });
    });
    console.log(JSON.stringify(editableMatches, null, 2));
    
    if (pageFaqs.length > 0) {
        pageFaqs.forEach(f => {
            const text = (f.question + " " + f.answer).toLowerCase();
            terms.forEach(t => {
                if (text.includes(t)) {
                    console.log(`FAQ FORBIDDEN MATCH: id ${f.id}, term: ${t}`);
                    console.log(`Q: ${f.question}`);
                    console.log(`A: ${f.answer}`);
                }
            });
        });
    }

}
run().catch(console.error);
