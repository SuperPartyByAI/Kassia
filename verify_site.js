import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/siteverification'],
  });

  const siteverification = google.siteVerification({ version: 'v1', auth });

  try {
    const res = await siteverification.webResource.insert({
      verificationMethod: 'FILE',
      requestBody: {
        site: {
          identifier: 'https://www.kassia.ro/',
          type: 'SITE'
        }
      }
    });
    console.log("VERIFICATION RESPONSE:");
    console.log(JSON.stringify(res.data, null, 2));
  } catch(e) {
    console.error("Error:", e.message);
  }
}
run();
