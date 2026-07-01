import puppeteer from 'puppeteer';

const urls = [
    { name: 'pricing_page', url: 'https://www.kassia.ro/preturi-animatori-copii-bucuresti/' },
    { name: 'main_hub', url: 'https://www.kassia.ro/animatori-petreceri-copii/' },
    { name: 'voluntari', url: 'https://www.kassia.ro/animatori-petreceri-copii-voluntari/' },
    { name: 'sector_6', url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/' }
];

const forbiddenTerms = ['pachete', 'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil', 'cost', 'tarif', 'prețurile noastre', '1-3 ore', 'om', 'oameni'];

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.setViewport({ width: 1280, height: 1024 });

    for (const item of urls) {
        console.log(`Navigating to ${item.url}...`);
        await p.goto(item.url, { waitUntil: 'networkidle2' });
        await p.screenshot({ path: `/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/pricing_audit_${item.name}.png`, fullPage: true });

        if (item.name === 'pricing_page') {
            const bodyText = await p.evaluate(() => document.body.innerText);
            let found = [];
            forbiddenTerms.forEach(term => {
                if (new RegExp('\\b' + term + '\\b', 'i').test(bodyText)) {
                    found.push(term);
                }
            });
            console.log(`Forbidden terms on pricing page: ${found.length > 0 ? found.join(', ') : 'NONE'}`);
        }
    }

    await browser.close();
}

run().catch(console.error);
