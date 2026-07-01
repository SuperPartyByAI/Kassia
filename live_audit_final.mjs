import fs from 'fs';
import * as cheerio from 'cheerio';

async function run() {
    try {
        const html = fs.readFileSync('live_page_updated.html', 'utf-8');
        const $ = cheerio.load(html);

        // 1. H1 Count
        const h1s = [];
        $('h1').each((_, el) => {
            h1s.push($(el).text().trim());
        });

        // 2. FAQ Visible Section Count
        const faqSections = $('.faq-section').length;

        // 3. FAQ Items Count
        const faqItems = $('.faq-details').length; // from the validFaqs loop
        const allDetails = $('details').length;

        // 4. Reviews Block Count
        let reviewsBlockCount = 0;
        $('h2, h3, div').each((_, el) => {
            const t = $(el).text();
            if (t.trim() === "Ce spun clienții noștri") reviewsBlockCount++;
        });

        // 5. Ghost Block Check
        const hasGhost = html.includes('Ghid pentru planificarea programului de animație');

        // Term Audit - Exclude non-editable stuff
        $('header').remove();
        $('footer').remove();
        $('.aprecieri-clienti').remove();
        $('.site-footer').remove();
        $('.navbar').remove();
        
        const cleanText = $('body').text().replace(/\s+/g, ' ');

        const termsToSearch = [
            'cost', 'prețuri', 'tarife', 'lei', 'pachete', 
            'sigur', 'siguranță', 'perfect', 'ideal', 'excelent', 
            'profesional', 'calitate', 'garantat', 'câteva săptămâni', 'durate exacte'
        ];

        const foundTerms = {};
        for (const term of termsToSearch) {
            const regex = new RegExp(`\\b${term}\\b`, 'gi');
            const matches = cleanText.match(regex);
            
            if (matches && matches.length > 0) {
                foundTerms[term] = {
                    count: matches.length,
                    contexts: []
                };
                
                const sentences = cleanText.match(/[^.!?]+[.!?]+/g) || [];
                for (const sentence of sentences) {
                    if (sentence.match(regex)) {
                        foundTerms[term].contexts.push(sentence.trim());
                    }
                }
            }
        }

        console.log(JSON.stringify({
            h1s,
            faqSections,
            faqItems,
            allDetails,
            reviewsBlockCount,
            hasGhost,
            foundTerms
        }, null, 2));

    } catch (err) {
        console.error(err);
    }
}
run();
