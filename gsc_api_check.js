import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';

async function run() {
  try {
    const auth = new google.auth.GoogleAuth({
      keyFile: keyFile,
      scopes: ['https://www.googleapis.com/auth/webmasters.readonly', 'https://www.googleapis.com/auth/webmasters'],
    });

    const searchconsole = google.searchconsole({ version: 'v1', auth });

    const res = await searchconsole.sites.list();
    console.log("Sites authorized for this Service Account:");
    console.log(res.data.siteEntry ? res.data.siteEntry.map(s => s.siteUrl) : "None");
  } catch(e) {
    console.error("API Auth Error:", e.message);
  }
}
run();
