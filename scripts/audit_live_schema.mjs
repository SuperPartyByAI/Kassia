import fs from 'fs';

const content = fs.readFileSync('.env.local', 'utf-8');
const env = {};
content.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) env[match[1].trim()] = match[2].trim().replace(/^"|"$/g, '');
});
const SUPABASE_URL = env.PUBLIC_SUPABASE_URL || env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = env.SUPABASE_SERVICE_ROLE_KEY;

async function run() {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/?apikey=${SUPABASE_KEY}`);
  const openapi = await res.json();
  
  const tables = ['kassia_pages', 'kassia_page_sections', 'kassia_faqs', 'kassia_gallery_items', 'kassia_internal_links'];
  const report = {};
  
  tables.forEach(t => {
    if (openapi.definitions[t]) {
      report[t] = {
        required: openapi.definitions[t].required || [],
        columns: Object.keys(openapi.definitions[t].properties)
      };
    } else {
      report[t] = 'NOT_FOUND_IN_OPENAPI';
    }
  });
  
  fs.writeFileSync('docs/kassia_live_schema_compatibility_audit.json', JSON.stringify(report, null, 2));
  console.log("Schema dump saved to docs/kassia_live_schema_compatibility_audit.json");
}

run().catch(console.error);
