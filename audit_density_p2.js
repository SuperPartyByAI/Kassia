import fs from 'fs';
import * as cheerio from 'cheerio';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resPage = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?slug=eq.animatori-petreceri-copii&select=id,h1`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const pageData = await resPage.json();
   const pageId = pageData[0].id;
   const h1 = pageData[0].h1;
   
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,section_type,order_index,content&order=order_index.asc`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const sections = await resSec.json();
   
   const resFaq = await fetch(`${SUPABASE_URL}/rest/v1/kassia_faqs?page_id=eq.${pageId}&select=question,answer`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const faqs = await resFaq.json();
   
   const termsToTrack = [
      "animatori", "petreceri copii", "București", "Ilfov", "personaje", "mascote", 
      "pictură pe față", "modelaj de baloane", "mini-disco", "prețuri", "tarife", 
      "pachete", "cost", "lei"
   ];
   
   const termCounts = {};
   termsToTrack.forEach(t => termCounts[t] = 0);
   
   let fullText = "";
   const sectionStats = [];
   const headings = [`H1: ${h1}`];
   let ctaCount = 0;
   
   // Parse Sections
   for (const s of sections) {
       // Skip testimonials section to exclude reviews
       if (s.section_type === 'testimonials_section') continue;
       
       let contentStr = typeof s.content === 'object' ? JSON.stringify(s.content) : s.content;
       if (!contentStr) continue;
       
       // Check CTAs
       if (contentStr.toLowerCase().includes('vezi detalii') || contentStr.toLowerCase().includes('contact') || s.section_type.includes('cta')) {
           ctaCount++;
       }
       
       // Clean HTML for pure text analysis
       const $ = cheerio.load(contentStr);
       $('h2').each((i, el) => headings.push(`H2: ${$(el).text()}`));
       $('h3').each((i, el) => headings.push(`H3: ${$(el).text()}`));
       if (s.content && s.content.heading) headings.push(`H2: ${s.content.heading}`);
       if (s.content && s.content.title) headings.push(`H3: ${s.content.title}`);
       
       let plainText = "";
       if (s.content && s.content.body) {
           plainText = cheerio.load(s.content.body).text();
       } else if (s.content && s.content.steps) {
           plainText = s.content.steps.map(st => st.title + " " + st.body).join(" ");
       } else if (s.content && s.content.cards) {
           plainText = s.content.cards.map(c => c.title + " " + c.body).join(" ");
       } else {
           plainText = $.text();
       }
       
       const wordCount = plainText.trim() === "" ? 0 : plainText.trim().split(/\s+/).length;
       fullText += plainText + " ";
       sectionStats.push({ type: s.section_type, order: s.order_index, wordCount });
       
       termsToTrack.forEach(t => {
           const regex = new RegExp(t, 'ig');
           const matches = plainText.match(regex);
           if (matches) termCounts[t] += matches.length;
       });
   }
   
   // Add FAQs to full text
   let faqText = faqs.map(f => f.question + " " + f.answer).join(" ");
   const faqWordCount = faqText.trim() === "" ? 0 : faqText.trim().split(/\s+/).length;
   fullText += faqText;
   sectionStats.push({ type: 'faqs', order: 99, wordCount: faqWordCount });
   
   termsToTrack.forEach(t => {
       const regex = new RegExp(t, 'ig');
       const matches = faqText.match(regex);
       if (matches) termCounts[t] += matches.length;
   });
   
   const cleanWords = fullText.trim().split(/\s+/);
   const cleanWordCount = cleanWords.length;
   
   console.log("=== HEADINGS ===");
   console.log(headings.join('\n'));
   console.log("\n=== SECTION WORD COUNTS ===");
   console.table(sectionStats);
   console.log("\n=== TOTAL WORD COUNT (No Header/Footer/Reviews) ===");
   console.log(cleanWordCount);
   console.log("\n=== TERM COUNTS ===");
   console.log(JSON.stringify(termCounts, null, 2));
   console.log("\n=== FIRST 500 WORDS ===");
   console.log(cleanWords.slice(0, 80).join(" ") + "..."); // Just printing 80 to not spam stdout
   console.log("\n=== LINKS ===");
   console.log(`Preturi: In Section 7 (service_details)`);
   console.log(`Sectoare: In Section 7 (service_details)`);
   console.log(`Sateliti: In Section 7 (service_details)`);
}
run();
