import { google } from 'googleapis';
import fs from 'fs';

const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-sector-4/';

async function run() {
    console.log("=== GSC INDEXABILITY AUDIT ===");
    try {
        const keyFilePath = '/Users/universparty/wa-web-launcher/kassia-site/service-account.json';
        if(!fs.existsSync(keyFilePath)) throw new Error("Service account key not found");
        
        const auth = new google.auth.GoogleAuth({
            keyFile: keyFilePath,
            scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
        });
        const searchconsole = google.searchconsole({ version: 'v1', auth });
        
        const response = await searchconsole.urlInspection.index.inspect({
            requestBody: { inspectionUrl: targetUrl, siteUrl: 'https://www.kassia.ro/' }
        });
        
        const res = response.data.inspectionResult.indexStatusResult;
        console.log(`URL: ${targetUrl}`);
        console.log(`Coverage State: ${res.coverageState}`);
        console.log(`Verdict: ${res.verdict}`);
        console.log(`Last Crawl Time: ${res.lastCrawlTime}`);
        console.log(`Robots Txt State: ${res.robotsTxtState}`);
        console.log(`Indexing State: ${res.indexingState}`);
        console.log(`User Canonical: ${res.userCanonical}`);
        console.log(`Google Canonical: ${res.googleCanonical}`);
    } catch (error) {
        console.error("GSC API Error:", error.message);
    }
}

run();
