const puppeteer = require('puppeteer');
const fs = require('fs');

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
                    title: titleNode.innerText,
                    snippet: snippetNode ? snippetNode.innerText : ''
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
        "animatori petreceri copii Drumul Taberei",
        "animatori copii Drumul Taberei",
        "animatori petreceri copii Sector 6 Drumul Taberei",
        "petreceri copii Drumul Taberei animatori",
        "animatori aniversări copii Drumul Taberei",
        "animatori copii Sector 6"
    ];
    
    const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const report = {};
    for (let q of queries) {
        console.log(`Scraping DDG for: ${q}`);
        const res = await scrapeDDG(browser, q);
        report[q] = res.slice(0, 12);
    }
    
    fs.writeFileSync('dt_serp.json', JSON.stringify(report, null, 2));
    console.log("Done. Saved to dt_serp.json");
    await browser.close();
})();
