import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function verifyPages() {
  console.log("Fetching all published pages from Supabase via REST API...");
  const response = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?status=eq.published&select=path,id`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });

  const pages = await response.json();

  if (!Array.isArray(pages)) {
    console.error("Error fetching pages:", pages);
    return;
  }

  console.log(`Found ${pages.length} published pages. Initiating live local scan...`);
  
  let successCount = 0;
  let failCount = 0;
  let failures = [];

  for (const page of pages) {
    const url = `http://localhost:4321${page.path}`;
    try {
      const res = await fetch(url);
      if (res.ok) {
        successCount++;
        process.stdout.write('.');
      } else {
        failCount++;
        failures.push(`${url} - Status: ${res.status}`);
        process.stdout.write('X');
      }
    } catch (err) {
      failCount++;
      failures.push(`${url} - Fetch Error: ${err.message}`);
      process.stdout.write('E');
    }
  }

  console.log("\n\n--- SCAN RESULTS ---");
  console.log(`Total Pages Checked: ${pages.length}`);
  console.log(`✅ Success (200 OK): ${successCount}`);
  console.log(`❌ Failed: ${failCount}`);

  if (failures.length > 0) {
    console.log("\nFailed Pages Details:");
    failures.forEach(f => console.log(f));
  } else {
    console.log("\n🎉 TOATE CELE " + pages.length + " DE PAGINI SE RANDEAZĂ PERFECT! Nu există erori de structură.");
  }
}

verifyPages();
