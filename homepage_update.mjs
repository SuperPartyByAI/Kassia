import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'home';

async function run() {
    console.log("--- DB UPDATE ---");
    const { data: pageBefore, error: errBefore } = await sb.from('kassia_pages').select('id, meta_title, meta_description, h1').eq('slug', targetSlug).single();
    if (errBefore) {
        console.log("Error fetching page:", errBefore);
        return;
    }
    
    console.log("Before:");
    console.log("Title:", pageBefore.meta_title);
    console.log("H1:", pageBefore.h1);
    console.log("Meta:", pageBefore.meta_description);

    const newTitle = 'Organizare petreceri copii și decoruri baloane București | Kassia Events';
    const newH1 = 'Kassia Events: organizare petreceri pentru copii și decoruri cu baloane';
    const newMeta = 'Kassia Events organizează petreceri pentru copii în București și Ilfov, cu animatori, mascote, activități interactive și decoruri cu baloane adaptate evenimentului.';

    const { error: errUpdate } = await sb.from('kassia_pages').update({
        meta_title: newTitle,
        h1: newH1,
        meta_description: newMeta
    }).eq('id', pageBefore.id);

    if (errUpdate) {
        console.log("Update failed:", errUpdate);
        return;
    }

    console.log("\nUpdate successful! Waiting 3s for revalidation...");
    await new Promise(r => setTimeout(r, 3000));

    console.log("\n--- LIVE DOM VALIDATION ---");
    const targetUrl = 'https://www.kassia.ro/?v=' + Date.now();
    const res = await fetch(targetUrl, { headers: { 'Cache-Control': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const h1Count = $('h1').length;
    const liveH1 = $('h1').text().trim().replace(/\s+/g, ' ');
    const liveTitle = $('title').text().trim().replace(/\s+/g, ' ');
    const liveMeta = $('meta[name="description"]').attr('content')?.trim().replace(/\s+/g, ' ');
    
    const hubLinks = $('a[href*="/animatori-petreceri-copii"]').map((i, el) => $(el).text().trim()).get().filter(t => t.toLowerCase().includes('animatori'));
    
    let schemaFound = false;
    $('script[type="application/ld+json"]').each((_, el) => {
        if ($(el).html().includes('AggregateRating') || $(el).html().includes('Review')) schemaFound = true;
    });

    const reviewsIntact = html.includes('excelent') && html.includes('perfect');

    console.log(JSON.stringify({
        status: res.status,
        h1Count,
        liveH1,
        liveTitle,
        liveMeta,
        hubLinksCount: hubLinks.length,
        hubLinksSamples: hubLinks.slice(0, 3),
        schemaFound,
        reviewsIntact
    }, null, 2));
}

run();
