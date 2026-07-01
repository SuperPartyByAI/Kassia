import puppeteer from 'puppeteer';
import fs from 'fs';

async function scrapeGoogle(query) {
    const browser = await puppeteer.launch({
        headless: "new",
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    const page = await browser.newPage();
    await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');
    await page.goto(`https://www.google.ro/search?q=${encodeURIComponent(query)}&gl=ro&hl=ro&num=50`, { waitUntil: 'networkidle2' });

    try {
        await page.waitForSelector('button#W0wltc', { timeout: 2000 });
        await page.click('button#W0wltc');
        await page.waitForNavigation({ waitUntil: 'networkidle2', timeout: 5000 }).catch(()=>null);
    } catch(e) {}

    const html = await page.content();
    if (html.includes('detected unusual traffic') || html.includes('captcha')) {
        console.log(`Captcha or block detected for ${query}`);
        await browser.close();
        return null;
    }

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

    await browser.close();
    return results;
}

(async () => {
    const queries = [
        "animatori petreceri copii București",
        "animatori copii București",
        "animatori pentru petreceri copii",
        "animatori petreceri copii"
    ];
    const report = {};
    for (let q of queries) {
        console.log(`Scraping: ${q}`);
        const res = await scrapeGoogle(q);
        report[q] = res || [];
    }
    fs.writeFileSync('serp_results_esm.json', JSON.stringify(report, null, 2));
    console.log("Done.");
})();
