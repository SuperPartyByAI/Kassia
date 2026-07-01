require('dotenv').config({path: '.env.local'});

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  // Find pages with mechanical H1 or title
  const queryUrl = `${url}/rest/v1/kassia_pages?status=eq.published&index_status=eq.index&or=(h1.ilike.*Animatori Petreceri Copii animatori*,title.ilike.*Animatori Petreceri Copii animatori*)&select=id,slug,title,h1,meta_description&order=slug.asc`;
  
  const pages = await (await fetch(queryUrl, { headers })).json();
  
  console.log(`Found ${pages.length} mechanical pages remaining.`);
  if (pages.length > 0) {
    console.log(JSON.stringify(pages.slice(0, 5), null, 2)); // Show next 5 for Batch 3
    require('fs').writeFileSync('/tmp/batch3_candidates.json', JSON.stringify(pages.slice(0, 5), null, 2));
  }
}

run();
