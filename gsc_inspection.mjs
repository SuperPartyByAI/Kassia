import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const siteUrl = 'sc-domain:kassia.ro'; // or https://www.kassia.ro/

async function run() {
    const auth = new google.auth.GoogleAuth({
        keyFile: keyFile,
        scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
    });
    const searchconsole = google.searchconsole({ version: 'v1', auth });

    const urls = [
        'https://www.kassia.ro/',
        'https://www.kassia.ro/animatori-petreceri-copii-sector-1/',
        'https://www.kassia.ro/animatori-petreceri-copii/'
    ];

    for (const url of urls) {
        console.log(`\nInspecting: ${url}`);
        try {
            const res = await searchconsole.urlInspection.index.inspect({
                requestBody: {
                    inspectionUrl: url,
                    siteUrl: 'https://www.kassia.ro/',
                    languageCode: 'en-US'
                }
            });
            const r = res.data.inspectionResult.indexStatusResult;
            console.log(`Status: ${r.coverageState}`);
            console.log(`Last Crawl: ${r.lastCrawlTime}`);
            console.log(`User Canonical: ${r.userCanonical}`);
            console.log(`Google Canonical: ${r.googleCanonical}`);
            console.log(`Crawled As: ${r.crawledAs}`);
        } catch (e) {
            console.log(`Error inspecting ${url}:`, e.message);
        }
    }
}
run();
