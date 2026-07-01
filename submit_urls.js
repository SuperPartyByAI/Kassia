import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';

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
  "https://www.kassia.ro/animatori-petreceri-copii-sector-3/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-4/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-5/",
  "https://www.kassia.ro/animatori-petreceri-copii-sector-6/"
];

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/indexing'],
  });

  const client = await auth.getClient();
  
  let successCount = 0;
  for (const url of urls) {
    try {
      const res = await client.request({
        url: 'https://indexing.googleapis.com/v3/urlNotifications:publish',
        method: 'POST',
        data: {
          url: url,
          type: 'URL_UPDATED'
        }
      });
      console.log(`SUBMITTED: ${url}`);
      successCount++;
    } catch(e) {
      console.error(`ERROR for ${url}:`, e.message);
    }
  }
  console.log(`\nSuccessfully submitted ${successCount}/${urls.length} URLs.`);
}
run();
