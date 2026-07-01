import dotenv from 'dotenv';

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}
dotenv.config({ path: '.env.local' });
const SUPABASE_URL = process.env.PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function goLive() {
    console.log("Publishing all 169 Kassia pages...");
    
    // We update all pages where page_type != 'foo' (which is all of them)
    const res = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?status=eq.draft`, {
        method: 'PATCH',
        headers: {
            'apikey': SUPABASE_KEY,
            'Authorization': `Bearer ${SUPABASE_KEY}`,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation'
        },
        body: JSON.stringify({
            status: 'published',
            index_status: 'index',
            include_in_sitemap: true
        })
    });
    
    if (res.ok) {
        const data = await res.json();
        console.log(`✅ Successfully published ${data.length} pages!`);
    } else {
        console.error("Failed:", await res.text());
    }
}
goLive();
