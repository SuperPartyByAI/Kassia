import puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    // Desktop
    await page.setViewport({ width: 1280, height: 1024 });
    await page.goto('https://www.kassia.ro/animatori-petreceri-copii-berceni/', { waitUntil: 'networkidle0' });
    
    // Scroll to FAQ
    await page.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('h2'));
        const faqH2 = h2s.find(h => h.textContent.includes('Întrebări Frecvente'));
        if (faqH2) faqH2.scrollIntoView({ block: 'center' });
    });
    // Open the specific FAQs to prove <p> tags are gone
    await page.evaluate(() => {
        const details = Array.from(document.querySelectorAll('details'));
        details.forEach(d => {
            if (d.textContent.includes('Care este diferența') || d.textContent.includes('Metalurgiei')) {
                d.setAttribute('open', '');
            }
        });
    });
    await new Promise(r => setTimeout(r, 1000));
    await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/qa_berceni_faq.png' });

    // Scroll to the body CTA
    await page.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('h2'));
        const spaceH2 = h2s.find(h => h.textContent.includes('Berceni urban sau comuna Berceni'));
        if (spaceH2) spaceH2.scrollIntoView({ block: 'center' });
    });
    await new Promise(r => setTimeout(r, 1000));
    await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/qa_berceni_cta.png' });

    await browser.close();
    console.log("Screenshots captured.");
})();
