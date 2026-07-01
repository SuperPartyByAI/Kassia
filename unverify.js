import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/siteverification'],
  });

  const siteverification = google.siteVerification({ version: 'v1', auth });

  try {
    await siteverification.webResource.delete({
      id: 'https://www.kassia.ro/'
    });
    console.log("SUCCESSFULLY REMOVED OWNERSHIP.");
  } catch(e) {
    console.error("Error:", e.message);
  }
}
run();
