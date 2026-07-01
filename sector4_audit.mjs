import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-4';
const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';

const fluffTerms = ["câteva săptămâni", "pachete", "super eveniment", "vezi pachete"];
const s4Zones = ["tineretului", "berceni", "giurgiului", "apărătorii patriei", "aparatorii patriei", "olteniței", "oltenitei", "văcărești", "vacaresti", "constantin brâncoveanu", "brancoveanu", "eroii revoluției", "eroii revolutiei", "progresul", "piața sudului", "piata sudului", "metalurgiei"];

async function run() {
    console.log("=== DB AUDIT ===");
    const { data: page } = await sb.from('kassia_pages').select('*').eq('slug', targetSlug).single();
    if(!page) { console.log("Sector 4 not found in DB"); return; }
    
    console.log(`Page ID: ${page.id} | Active: ${page.is_active}`);
    console.log(`DB Title: ${page.meta_title}`);
    console.log(`DB H1: ${page.h1}`);
    
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    console.log(`Active DB Sections: ${sections.length}`);
    
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    console.log(`DB FAQs: ${faqs.length}`);

    let foundFluffDB = [];
    faqs.forEach(f => {
        fluffTerms.forEach(t => { if(f.answer.toLowerCase().includes(t)) foundFluffDB.push('FAQ: '+t); });
    });
    
    sections.forEach(sec => {
        if(!sec.content) return;
        const txt = JSON.stringify(sec.content).toLowerCase();
        fluffTerms.forEach(t => { if(txt.includes(t)) foundFluffDB.push('Section '+sec.section_type+': '+t); });
    });
    console.log(`DB Fluff Terms Found: ${foundFluffDB.length > 0 ? foundFluffDB.join(', ') : 'None'}`);

    console.log("\n=== LIVE DOM AUDIT ===");
    const res = await fetch(targetUrl);
    const html = await res.text();
    const $ = cheerio.load(html);
    const bodyTxt = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    
    console.log(`HTTP: ${res.status}`);
    console.log(`URL: ${targetUrl}`);
    console.log(`Title: ${$('title').text()}`);
    console.log(`Meta Desc: ${$('meta[name="description"]').attr('content')}`);
    console.log(`H1 Count: ${$('h1').length} | Text: ${$('h1').text().trim().replace(/\s+/g, ' ')}`);
    console.log(`Canonical: ${$('link[rel="canonical"]').attr('href')}`);
    console.log(`Robots: ${$('meta[name="robots"]').attr('content') || 'index, follow'}`);
    console.log(`FAQ Schema: ${html.includes('FAQPage')}`);
    console.log(`Review Schema: ${html.includes('AggregateRating') || html.includes('Review')}`);
    console.log(`Hub Link Present: ${$('a[href="/animatori-petreceri-copii/"]').length > 0}`);
    console.log(`Word Count: ~${bodyTxt.split(' ').length}`);
    
    let matchedZones = [];
    s4Zones.forEach(z => {
        if(bodyTxt.includes(z) && !matchedZones.includes(z)) matchedZones.push(z);
    });
    console.log(`Sector 4 Zones Found in DOM (${matchedZones.length}): ${matchedZones.join(', ')}`);
}

run();
