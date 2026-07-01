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
  const pageId = "49cf0ab3-2299-4d4f-8230-9f2ef0903813";
  const resPages = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?id=eq.${pageId}`, { headers });
  const page = (await resPages.json())[0];
  console.log("H1:", page.h1);
  console.log("Title:", page.title);
  console.log("Meta:", page.meta_description);
}
run();
