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
  const resPages = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?slug=eq.animatori-petreceri-copii`, { headers });
  const page = (await resPages.json())[0];
  const resSections = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?page_id=eq.${page.id}`, { headers });
  const sections = await resSections.json();
  const resFaqs = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs?page_id=eq.${page.id}`, { headers });
  const faqs = await resFaqs.json();

  let textArray = [];
  textArray.push(page.h1);

  for (const s of sections) {
    if (s.heading) textArray.push(s.heading);
    if (s.content && s.content.body) {
      const text = cheerio.load(s.content.body).text();
      textArray.push(text);
    }
    if (s.content && s.content.items) {
      s.content.items.forEach(i => {
        if (i.title) textArray.push(i.title);
        if (i.description) textArray.push(i.description);
      });
    }
    if (s.content && s.content.steps) {
      s.content.steps.forEach(i => {
        if (i.title) textArray.push(i.title);
        if (i.body) textArray.push(i.body);
      });
    }
    if (s.content && s.content.packages) {
      s.content.packages.forEach(pkg => {
        if (pkg.name) textArray.push(pkg.name);
        if (pkg.price) textArray.push(pkg.price);
        if (pkg.description) textArray.push(pkg.description);
        if (pkg.features) textArray.push(pkg.features.join(" "));
      });
    }
  }

  for (const f of faqs) {
    textArray.push(f.question);
    textArray.push(f.answer);
  }

  const fullText = textArray.join(" ").replace(/\s+/g, ' ').trim();
  const wordCount = fullText.split(' ').filter(w => w.length > 0).length;
  console.log("CLEAN WORD COUNT:", wordCount);
}
run();
