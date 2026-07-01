import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const siteUrl = 'https://www.kassia.ro/';
const url = "https://www.kassia.ro/animatori-petreceri-copii/";

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
  });

  const searchconsole = google.searchconsole({ version: 'v1', auth });

  try {
    const res = await searchconsole.urlInspection.index.inspect({
      requestBody: {
        inspectionUrl: url,
        siteUrl: siteUrl,
        languageCode: 'ro'
      }
    });
    console.log(JSON.stringify(res.data, null, 2));
  } catch (e) {
    console.log(`Error: ${e.message}`);
  }
}
run();
