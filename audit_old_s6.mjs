import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const slug = 'animatori-copii-sector-6';
    const exactUrl = `https://www.kassia.ro/${slug}/`;
    
    // 1. DB Status
    const { data: page, error } = await supabase.from('kassia_pages').select('id, status, index_status, canonical_url, include_in_sitemap').eq('slug', slug).single();
    if (error || !page) {
        console.log("Page not found in DB");
        return;
    }
    
    // 2. Internal Links
    const { data: inboundLinks } = await supabase.from('kassia_internal_links').select('id').eq('target_page_id', page.id);
    const hasInternalLinks = inboundLinks && inboundLinks.length > 0;
    
    // 3. Sitemap (Assuming sitemap relies on include_in_sitemap field)
    const inSitemap = page.include_in_sitemap;
    
    // 4. Live Check
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    let liveStatus = 0;
    let canonical = 'N/A';
    let robots = 'N/A';
    
    try {
        const response = await p.goto(exactUrl, { waitUntil: 'networkidle2', timeout: 15000 });
        liveStatus = response.status();
        
        const meta = await p.evaluate(() => {
            return {
                canonical: document.querySelector('link[rel="canonical"]')?.href || 'missing',
                robots: document.querySelector('meta[name="robots"]')?.content || 'missing'
            }
        });
        canonical = meta.canonical;
        robots = meta.robots;
    } catch (e) {
        liveStatus = 'Error: ' + e.message;
    }
    await browser.close();
    
    console.log(`**KASSIA OLD SECTOR 6 URL AUDIT — READ ONLY**\n`);
    console.log(`- URL exact: ${exactUrl}`);
    console.log(`- status live: HTTP ${liveStatus}`);
    console.log(`- canonical: ${canonical}`);
    console.log(`- robots: ${robots}`);
    console.log(`- index_status în DB: ${page.index_status}`);
    console.log(`- status în DB: ${page.status}`);
    console.log(`- apare în sitemap: ${inSitemap ? 'YES' : 'NO'}`);
    console.log(`- are internal links către el: ${hasInternalLinks ? 'YES' : 'NO'}`);
}

run().catch(console.error);
