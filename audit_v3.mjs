import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import puppeteer from 'puppeteer';
import http from 'http';
import https from 'https';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function checkURL(url) {
    return new Promise((resolve) => {
        https.get(url, (res) => {
            resolve({ status: res.statusCode, headers: res.headers });
        }).on('error', (e) => {
            resolve({ status: 500, error: e.message });
        });
    });
}

async function runAudit() {
    console.log("--- 1. REAL DB IDs ---");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', 'animatori-petreceri-copii').single();
    console.log(`page_id: ${page.id}`);
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading, order_index').eq('page_id', page.id);
    const hero = sections.find(s => s.section_type === 'hero');
    const activitati = sections.find(s => s.heading && s.heading.includes('Activități tematice și divertisment'));
    const testimonials = sections.find(s => s.section_type === 'testimonials_section');
    
    console.log(`Hero section_id: ${hero?.id}`);
    console.log(`Activități section_id: ${activitati?.id}`);
    console.log(`Testimonials section_id: ${testimonials?.id}`);
    
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, order_index').eq('page_id', page.id).order('order_index');
    console.log("FAQ IDs:", faqs.map(f => f.id).join(', '));
    
    console.log("\n--- 2. PERSONAJE URL AUDIT ---");
    const charUrl = 'https://www.kassia.ro/personaje-animatori-copii-bucuresti/';
    const charRes = await checkURL(charUrl);
    console.log(`URL: ${charUrl} -> Status: ${charRes.status}`);
    
    if (charRes.status === 200 || charRes.status === 301) {
        console.log("Launching Puppeteer for deep audit...");
        const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
        const p = await browser.newPage();
        await p.goto(charUrl, { waitUntil: 'domcontentloaded' });
        
        const pageData = await p.evaluate(() => {
            return {
                h1: document.querySelector('h1')?.innerText,
                title: document.title,
                robots: document.querySelector('meta[name="robots"]')?.content,
                canonical: document.querySelector('link[rel="canonical"]')?.href,
            };
        });
        console.log("Personaje Page Data:", pageData);
        await browser.close();
    }
    
    console.log("\n--- 3. IMAGE PUBLIC URL AUDIT ---");
    const imagesToTest = [
        "animatori-copii-bucuresti-desfasurare-petrecere.webp",
        "animatori-copii-bucuresti-jocuri-interactive.webp",
        "animatori-copii-bucuresti-mini-disco.webp",
        "animatori-copii-bucuresti-modelaj-baloane.webp",
        "animatori-copii-bucuresti-mascota-generica.webp",
        "animatori-copii-bucuresti-atelier-creativ.webp",
        "animatori-copii-bucuresti-program-animatie.webp",
        "animatori-copii-bucuresti-evenimente.webp"
    ];
    
    for (const img of imagesToTest) {
        const imgUrl = `https://www.kassia.ro/images/animatori/${img}`;
        const res = await checkURL(imgUrl);
        console.log(`${imgUrl} -> HTTP ${res.status}`);
    }
}

runAudit().catch(console.error);
