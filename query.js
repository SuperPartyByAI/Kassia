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
const pageId = "49cf0ab3-2299-4d4f-8230-9f2ef0903813";

async function run() {
  const res = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,section_type,heading,order_index`, { headers });
  const data = await res.json();
  console.log("SECTIONS:", JSON.stringify(data, null, 2));
}
run();
