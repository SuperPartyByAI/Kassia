import fs from 'fs';

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
  console.log("ID:", page.id);
  console.log("H1:", page.h1);
  
  const resFaqs = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs?page_id=eq.${page.id}`, { headers });
  const faqs = await resFaqs.json();
  console.log("FAQ COUNT:", faqs.length);
}
run();
