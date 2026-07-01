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
  
  let indexable = 0;
  let inSitemapDB = 0;
  let slugs = [];
  
  dbPages.forEach(p => {
    if (p.index_status === 'true' || p.index_status === true) indexable++;
    if (p.include_in_sitemap === 'true' || p.include_in_sitemap === true) {
      inSitemapDB++;
      slugs.push(p.slug);
    }
  });

  console.log(`DB Total Pages: ${dbPages.length}`);
  console.log(`DB Indexable: ${indexable}`);
  console.log(`DB in Sitemap: ${inSitemapDB}`);
  
  const sitemapRes = await fetch('https://www.kassia.ro/sitemap.xml');
  const sitemapText = await sitemapRes.text();
  const urlsInSitemapLive = (sitemapText.match(/<loc>/g) || []).length;
  console.log(`Live Sitemap URLs: ${urlsInSitemapLive}`);
}
run();
