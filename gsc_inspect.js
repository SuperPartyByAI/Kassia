import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const siteUrl = 'https://www.kassia.ro/';

const urls = [
  "https://www.kassia.ro/",
  "https://www.kassia.ro/animatori-petreceri-copii/",
  "https://www.kassia.ro/preturi-animatori-copii-bucuresti/",
  "https://www.kassia.ro/decoratiuni-baloane/",
  "https://www.kassia.ro/preturi-decoratiuni-baloane-bucuresti/",
  "https://www.kassia.ro/personaje-petreceri-copii-bucuresti/",
  "https://www.kassia.ro/mascote-petreceri-copii-bucuresti/",
  "https://www.kassia.ro/pictura-pe-fata-copii-bucuresti/",
  "https://www.kassia.ro/modelaj-baloane-copii-bucuresti/",
  "https://www.kassia.ro/mini-disco-copii-bucuresti/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-2/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-3/"
];

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
  });

  const searchconsole = google.searchconsole({ version: 'v1', auth });

  for (const url of urls) {
    try {
      const res = await searchconsole.urlInspection.index.inspect({
        requestBody: {
          inspectionUrl: url,
          siteUrl: siteUrl,
          languageCode: 'ro'
        }
      });
      console.log(`URL: ${url}`);
      console.log(`IndexStatus: ${res.data.inspectionResult.indexStatusResult.coverageState}`);
      console.log(`LastCrawl: ${res.data.inspectionResult.indexStatusResult.lastCrawlTime || 'N/A'}`);
      console.log(`PageFetchState: ${res.data.inspectionResult.indexStatusResult.pageFetchState}`);
      console.log(`GoogleCanonical: ${res.data.inspectionResult.indexStatusResult.googleCanonical || 'N/A'}`);
      console.log(`UserCanonical: ${res.data.inspectionResult.indexStatusResult.userCanonical || 'N/A'}`);
      console.log('---');
    } catch (e) {
      console.log(`URL: ${url}`);
      console.log(`Error: ${e.message}`);
      console.log('---');
    }
  }
}
run();
