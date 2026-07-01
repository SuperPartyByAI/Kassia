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
  const resPages = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?slug=eq.preturi-animatori-copii-bucuresti`, { headers });
  const page = (await resPages.json())[0];
  console.log("PAGE ID:", page.id);
  
  const resSec = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?page_id=eq.${page.id}`, { headers });
  const sections = await resSec.json();
  
  sections.forEach(s => {
    let body = "";
    if (typeof s.content === 'string') {
      try { body = JSON.parse(s.content).body; } catch(e) {}
    } else if (s.content) {
      body = s.content.body;
    }
    if (s.heading === 'Detalii pentru programele cu animatori copii' || s.heading === 'Ce poate include programul de animație') {
      console.log(`\nSECTION ID: ${s.id} | Heading: ${s.heading}`);
      console.log(`Content: ${body}`);
    }
  });
}
run();
