import puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    
    // Desktop Screenshot
    const pageDesktop = await browser.newPage();
    await pageDesktop.setViewport({ width: 1440, height: 1080 });
    await pageDesktop.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle0' });
    await pageDesktop.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_desktop.png', fullPage: true });
    
    // Mobile Screenshot
    const pageMobile = await browser.newPage();
    await pageMobile.setViewport({ width: 390, height: 844, isMobile: true });
    await pageMobile.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle0' });
    await pageMobile.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_mobile.png', fullPage: true });
    
    await browser.close();
    console.log("Screenshots captured.");
})();
