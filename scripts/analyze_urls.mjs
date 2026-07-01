import dotenv from 'dotenv';

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}
dotenv.config({ path: '.env.local' });
const SUPABASE_URL = process.env.PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function getUrls() {
    const res = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?select=path,h1,meta_title`, {
        method: 'GET',
        headers: {
            'apikey': SUPABASE_KEY,
            'Authorization': `Bearer ${SUPABASE_KEY}`,
            'Content-Type': 'application/json'
        }
    });
    
    if (res.ok) {
        const data = await res.json();
        console.log(`Total pagini: ${data.length}`);
        data.slice(0, 50).forEach(p => console.log(`${p.path} -> ${p.h1}`));
    } else {
        console.error("Failed:", await res.text());
    }
}
getUrls();
