const puppeteer = require('puppeteer');
const fs = require('fs');

async function scrapeGoogle(browser, query) {
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');
    await page.goto(`https://www.google.ro/search?q=${encodeURIComponent(query)}&gl=ro&hl=ro&num=20`, { waitUntil: 'networkidle2' });

    try {
        await page.waitForSelector('button#W0wltc', { timeout: 2000 });
        await page.click('button#W0wltc'); 
        await page.waitForNavigation({ waitUntil: 'networkidle2', timeout: 5000 }).catch(()=>null);
    } catch(e) {}

    const results = await page.evaluate(() => {
        const items = [];
        const organicNodes = document.querySelectorAll('div.g');
        let position = 1;
        organicNodes.forEach(node => {
            const titleNode = node.querySelector('h3');
            const linkNode = node.querySelector('a');
            if (titleNode && linkNode) {
                const url = linkNode.href;
                if (!url.includes('google.com/aclk') && !node.closest('.ULSxyf')) {
                    items.push({
                        position: position++,
                        url: url,
                        title: titleNode.innerText
                    });
                }
            }
        });
        return items;
    });
    await page.close();
    return results;
}

async function scrapeDDG(browser, query) {
    const page = await browser.newPage();
    await page.goto(`https://html.duckduckgo.com/html/?q=${encodeURIComponent(query)}&kl=ro-ro`, { waitUntil: 'networkidle2' });
    const results = await page.evaluate(() => {
        const items = [];
        document.querySelectorAll('.result').forEach((node, idx) => {
            const titleNode = node.querySelector('.result__title a');
            const snippetNode = node.querySelector('.result__snippet');
            if (titleNode) {
                items.push({
                    position: idx + 1,
                    url: titleNode.href,
                    title: titleNode.innerText
                });
            }
        });
        return items;
    });
    await page.close();
    return results;
}

(async () => {
    const queries = [
        "animatori petreceri copii Voluntari",
        "animatori copii Voluntari",
        "animatori petreceri copii Pipera",
        "animatori copii Pipera",
        "petreceri copii Voluntari animatori",
        "animatori aniversări copii Voluntari"
    ];
    
    const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const report = {};
    for (let q of queries) {
        console.log(`Scraping: ${q}`);
        let res = await scrapeGoogle(browser, q);
        if (res.length === 0) {
             console.log(`Google blocked or returned 0. Using DDG fallback for ${q}`);
             res = await scrapeDDG(browser, q);
        }
        report[q] = res.slice(0, 12);
    }
    
    fs.writeFileSync('voluntari_serp.json', JSON.stringify(report, null, 2));
    console.log("Done. Saved to voluntari_serp.json");
    await browser.close();
})();
