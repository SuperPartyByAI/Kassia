import { google } from 'googleapis';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const siteUrl = 'https://www.kassia.ro/';

async function run() {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFile,
    scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
  });
  const searchconsole = google.searchconsole({ version: 'v1', auth });

  try {
    const res = await searchconsole.searchanalytics.query({
      siteUrl: siteUrl,
      requestBody: {
        startDate: '2026-05-25',
        endDate: '2026-06-22',
        dimensions: ['query', 'page'],
        dimensionFilterGroups: [{
          filters: [{
            dimension: 'query',
            operator: 'contains',
            expression: 'animatori'
          }]
        }],
        rowLimit: 50
      }
    });
    console.log(JSON.stringify(res.data, null, 2));
  } catch (e) {
    console.log(`Error: ${e.message}`);
  }
}
run();
