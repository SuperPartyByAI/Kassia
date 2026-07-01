import { google } from 'googleapis';
import fs from 'fs';

const auth = new google.auth.GoogleAuth({
  keyFile: '../vertex-ai-runner-key.json',
  scopes: ['https://www.googleapis.com/auth/webmasters.readonly']
});

async function run() {
    try {
        const searchconsole = google.searchconsole({ version: 'v1', auth });
        
        const siteUrl = 'https://www.kassia.ro/';
        const inspectionUrl = 'https://www.kassia.ro/animatori-petreceri-copii/';
        
        const res = await searchconsole.urlInspection.index.inspect({
            requestBody: {
                inspectionUrl: inspectionUrl,
                siteUrl: siteUrl,
                languageCode: 'ro-RO'
            }
        });
        
        console.log(JSON.stringify(res.data, null, 2));
    } catch (e) {
        console.error("GSC API Error:", e.message);
    }
}
run();
