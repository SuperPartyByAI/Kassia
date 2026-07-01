import puppeteer from 'puppeteer';
import fs from 'fs';

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    await page.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle2' });
    
    const data = await page.evaluate(() => {
        const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText : 'MISSING';
        const title = document.title;
        const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : 'MISSING';
        const h2s = Array.from(document.querySelectorAll('h2')).map(h => h.innerText);
        const faqs = document.querySelectorAll('details').length;
        const imgs = Array.from(document.querySelectorAll('img')).map(i => i.src);
        
        // Find internal links within main content (exclude header/footer if possible, or just all for now)
        const allLinks = Array.from(document.querySelectorAll('main a')).map(a => a.href);
        const internalLinks = allLinks.filter(l => l.includes('kassia.ro') && !l.includes('wa.me'));
        
        const hasWhatsAppFlow = allLinks.some(l => l.includes('wa.me'));
        const hasCallFlow = allLinks.some(l => l.includes('tel:'));
        const hasContactForm = allLinks.some(l => l.includes('/contact/'));
        
        const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : 'MISSING';
        const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : 'MISSING';
        const hasSchema = document.querySelectorAll('script[type="application/ld+json"]').length > 0;

        return {
            h1, title, metaDesc, h2s, faqs, 
            imgsCount: imgs.length, 
            internalLinksCount: internalLinks.length,
            hasWhatsAppFlow, hasCallFlow, hasContactForm,
            canonical, robots, hasSchema
        };
    });
    
    console.log(JSON.stringify(data, null, 2));
    await browser.close();
})();
