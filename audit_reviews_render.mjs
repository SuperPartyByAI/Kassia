import puppeteer from 'puppeteer';

async function audit() {
    console.log("Starting Protected Reviews Render Audit...");
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    // We will test Desktop and Mobile
    const viewports = [
        { name: 'Desktop', width: 1920, height: 1080, isMobile: false },
        { name: 'Mobile', width: 375, height: 812, isMobile: true }
    ];

    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });

    for (const vp of viewports) {
        console.log(`\n--- Testing on ${vp.name} ---`);
        const page = await browser.newPage();
        await page.setViewport(vp);
        await page.goto(url, { waitUntil: 'networkidle0' });

        const auditResults = await page.evaluate(() => {
            // Count components
            const elfsightContainers = document.querySelectorAll('.elfsight-app-eb100657-3dc6-48c9-af55-2172782e3678').length;
            const reviewSections = document.querySelectorAll('section[aria-labelledby="reviews-heading"]').length;
            
            // Check Google Badges / Logo
            const googleBadges = document.querySelectorAll('img[src*="google"], svg[class*="google"]').length;
            
            // Text checks for duplication of the exact review widget
            // The widget usually has a title like "Kassia Events - Animatori si Mascote"
            const allText = document.body.innerText;
            const titleMatches = (allText.match(/Kassia Events - Animatori/gi) || []).length;

            // Schema checks
            const schemas = document.querySelectorAll('script[type="application/ld+json"]');
            let aggregateRatingStrCount = 0;
            let reviewStrCount = 0;
            schemas.forEach(s => {
                const text = s.innerText;
                if (text.includes('"AggregateRating"')) aggregateRatingStrCount++;
                if (text.includes('"Review"')) reviewStrCount++;
            });

            return {
                elfsightContainers,
                reviewSections,
                googleBadges,
                titleMatches,
                aggregateRatingStrCount,
                reviewStrCount
            };
        });

        console.log(auditResults);
        await page.close();
    }
    
    await browser.close();
}

audit().catch(console.error);
