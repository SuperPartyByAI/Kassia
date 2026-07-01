import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

async function run() {
    const url = `https://www.kassia.ro/animatori-petreceri-copii/?v=${Date.now()}`;
    const res = await fetch(url, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    const bodyText = $('body').text();

    const report = {};

    // Task 1: Images in content body
    const contentSections = $('section.content-section');
    const imagesInContent = contentSections.find('img');
    
    let imgCount = imagesInContent.length;
    let imagesWithoutDims = 0;
    let duplicatePairs = false;
    imagesInContent.each((_, el) => {
        if (!$(el).attr('width') || !$(el).attr('height')) {
            imagesWithoutDims++;
        }
    });

    let sectionsWithMultipleImgs = 0;
    contentSections.each((_, sec) => {
        const imgs = $(sec).find('.section-image-placeholder img');
        if (imgs.length > 1) {
            sectionsWithMultipleImgs++;
            duplicatePairs = true;
        }
    });

    report.task1 = {
        totalContentImages: imgCount,
        imagesWithoutWidthHeight: imagesWithoutDims,
        duplicateTagsInSameSection: duplicatePairs,
        sectionsWithMultipleImgs
    };

    // Task 2: Residual blocks
    report.task2 = {
        hasGhidFantomă: bodyText.includes('Ghid pentru planificarea programului de animație'),
        hasPlanifica: bodyText.includes('Planifică activitățile pentru petrecerea copilului'),
        contentAfterReviews: false
    };

    const reviewsIndex = html.indexOf('aprecieri-clienti');
    const footerIndex = html.indexOf('site-footer');
    if (reviewsIndex !== -1 && footerIndex !== -1) {
        const afterReviews = html.slice(reviewsIndex + 5000, footerIndex); // Skip inside reviews
        // Check if there are content-sections AFTER reviews
        const $after = cheerio.load(afterReviews);
        if ($after('.content-section').length > 0 || $after('.faq-section').length > 0) {
            report.task2.contentAfterReviews = true;
        }
    }

    // Task 3: Reviews duplicate
    const reviewsHeadingCount = $('h3').filter((_, el) => $(el).text().trim() === 'Ce spun clienții noștri').length;
    
    const carouselItems = $('.apreciere-item').length;
    const uniqueReviewNames = new Set();
    $('.apreciere-nume').each((_, el) => uniqueReviewNames.add($(el).text().trim()));

    report.task3 = {
        reviewsHeadingCount,
        totalReviewCardsInDOM: carouselItems,
        uniqueReviews: uniqueReviewNames.size,
        isMarqueeLogic: carouselItems > uniqueReviewNames.size
    };

    // Task 4: General QA
    report.task4 = {
        httpStatus: res.status,
        canonical: $('link[rel="canonical"]').attr('href'),
        h1Count: $('h1').length,
        faqSectionCount: $('.faq-section').length,
        faqItemCount: $('.faq-details').length,
        schemaCount: html.match(/FAQPage/g)?.length || 0,
        asset404: 0
    };

    console.log(JSON.stringify(report, null, 2));
}
run();
