import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const url = "https://www.kassia.ro/animatori-petreceri-copii/";

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/indexing'],
  });

  const indexing = google.indexing({ version: 'v3', auth });

  try {
    const res = await indexing.urlNotifications.publish({
      requestBody: {
        url: url,
        type: 'URL_UPDATED'
      }
    });
    console.log("Success:", JSON.stringify(res.data, null, 2));
  } catch (e) {
    console.log(`Error: ${e.message}`);
  }
}
run();
