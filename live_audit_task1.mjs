import fs from 'fs';
import * as cheerio from 'cheerio';

async function run() {
    try {
        const url = `https://www.kassia.ro/animatori-petreceri-copii/?v=${Date.now()}`;
        const res = await fetch(url, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' }});
        const html = await res.text();
        const $ = cheerio.load(html);

        const h1s = [];
        $('h1').each((_, el) => h1s.push($(el).text().trim()));

        const faqVisibleSectionCount = $('.faq-section').length;
        const faqItemCount = $('.faq-details').length;

        // Strictly check heading tags
        let exactReviewHeadings = 0;
        $('h2, h3').each((_, el) => {
            if ($(el).text().trim() === "Ce spun clienții noștri") exactReviewHeadings++;
        });

        // Testimonials fallback (raw from db)
        const hasFallbackRaw = html.includes('style="display: block !important;"') && html.includes('.aprecieri-clienti-container {');
        const hasProcessSteps = html.includes('Ghid pentru planificarea programului de animație');

        // Content after reviews
        // We find the .aprecieri-clienti section and see if there are any <section> tags after it, excluding footer
        const reviewSection = $('.aprecieri-clienti');
        const nextSections = reviewSection.nextAll('section').length;

        console.log(JSON.stringify({
            h1s,
            faqVisibleSectionCount,
            faqItemCount,
            exactReviewHeadings,
            hasFallbackRaw,
            hasProcessSteps,
            nextSectionsAfterReviews: nextSections,
            hasTestimonialsRawSection: hasFallbackRaw
        }, null, 2));

    } catch (err) {
        console.error(err);
    }
}
run();
