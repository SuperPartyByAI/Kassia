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
  const res = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?select=slug,index_status,include_in_sitemap`, { headers });
  const dbPages = await res.json();
  const statuses = new Set();
  dbPages.forEach(p => statuses.add(p.index_status));
  console.log("Index statuses in DB:", Array.from(statuses));
  
  // check preturi-animatori-copii-bucuresti
  const preturi = dbPages.find(p => p.slug === 'preturi-animatori-copii-bucuresti');
  console.log("Preturi animatori page DB:", preturi);
}
run();
