import fs from 'fs';
import * as cheerio from 'cheerio';

const envFile = fs.readFileSync('.env.local', 'utf8');
const envVars = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) envVars[match[1]] = match[2].trim().replace(/^"|"$/g, '');
});

const supabaseUrl = envVars['PUBLIC_SUPABASE_URL'];
const supabaseKey = envVars['SUPABASE_SERVICE_ROLE_KEY'];
const headers = { 'apikey': supabaseKey, 'Authorization': `Bearer ${supabaseKey}` };

async function run() {
  const pageId = "1a87e5b5-4b13-40f4-b1eb-e9702206c953"; // Hub Animatori
  const resPages = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?id=eq.${pageId}`, { headers });
  const page = (await resPages.json())[0];
  const resSections = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?page_id=eq.${pageId}`, { headers });
  const sections = await resSections.json();
  const resFaqs = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs?page_id=eq.${pageId}`, { headers });
  const faqs = await resFaqs.json();

  let textArray = [];
  textArray.push(page.h1);

  for (const s of sections) {
    if (s.heading) textArray.push(s.heading);
    if (s.content && s.content.body) {
      const text = cheerio.load(s.content.body).text();
      textArray.push(text);
    }
  }

  for (const f of faqs) {
    textArray.push(f.question);
    textArray.push(f.answer);
  }

  const fullText = textArray.join(" ").replace(/\s+/g, ' ').trim();
  const wordCount = fullText.split(' ').filter(w => w.length > 0).length;
  console.log("FAQ COUNT:", faqs.length);
  console.log("CLEAN WORD COUNT:", wordCount);
}
run();
