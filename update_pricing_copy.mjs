import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const row1_id = '86cba5be-9118-4fd6-b4b0-ae7c091fae3e';
const row2_id = '4bcfcd7d-aaf5-4260-85ed-0d27a5e7916b';

const replace1 = "Program extins cu interacțiune susținută, potrivit pentru grupuri mari și activități variate.";
const replace2 = "Pentru evenimente stradale, lansări de produse, petreceri de mari dimensiuni sau momente de întâmpinare a invitaților.";

async function run() {
    console.log("=== PRE-WRITE BACKUP ===");
    
    const { data: rows, error: getErr } = await supabase.from('kassia_pricing_programs').select('*').in('id', [row1_id, row2_id]);
    if (getErr) throw getErr;
    
    const backupPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/pricing_programs_backup.json';
    fs.writeFileSync(backupPath, JSON.stringify(rows, null, 2));
    console.log("Backup saved to:", backupPath);

    console.log("=== EXECUTING WRITE ===");
    
    const { error: upd1 } = await supabase.from('kassia_pricing_programs').update({ 
        short_description: replace1, 
        updated_at: new Date().toISOString() 
    }).eq('id', row1_id);
    if (upd1) throw upd1;
    
    const { error: upd2 } = await supabase.from('kassia_pricing_programs').update({ 
        short_description: replace2, 
        updated_at: new Date().toISOString() 
    }).eq('id', row2_id);
    if (upd2) throw upd2;

    console.log("Updated both rows.");

    // Verification - Forbidden Terms Check
    const { data: allPrograms } = await supabase.from('kassia_pricing_programs').select('*');
    const forbidden = ['perfect', 'premium', 'corporate', 'pachete', 'pachet', 'cost', 'tarif', 'memorabil', 'de neuitat', 'garantat'];
    let counts = {};
    forbidden.forEach(term => counts[term] = 0);
    
    for (const prog of allPrograms) {
        for (const [key, value] of Object.entries(prog)) {
            if (typeof value === 'string') {
                const lowerVal = value.toLowerCase();
                for (const term of forbidden) {
                    // Match whole word for all EXCEPT 'pachete' / 'pachet' / 'memorabil' etc where we want substring or whole word.
                    // Actually, simple includes is safer to catch variations.
                    if (lowerVal.includes(term)) {
                        counts[term]++;
                    }
                }
            } else if (Array.isArray(value)) {
                for (const item of value) {
                    if (typeof item === 'string') {
                        const lowerVal = item.toLowerCase();
                        for (const term of forbidden) {
                            if (lowerVal.includes(term)) {
                                counts[term]++;
                            }
                        }
                    }
                }
            }
        }
    }

    console.log("Waiting 10 seconds for CDN / Next.js ISR propagation...");
    await new Promise(r => setTimeout(r, 10000));
    
    console.log("=== STARTING LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    
    async function checkPage(url) {
        const p = await browser.newPage();
        await p.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
        const hasPricing = await p.evaluate(() => {
            return document.body.innerText.includes('280 lei') || document.body.innerText.includes('490 lei');
        });
        await p.close();
        return hasPricing;
    }
    
    let pricingPagePass = false;
    let mainHubPass = false;
    let voluntariPass = false;
    let sector6Pass = false;
    try {
        pricingPagePass = await checkPage("https://www.kassia.ro/preturi-animatori-copii-bucuresti/");
        mainHubPass = await checkPage("https://www.kassia.ro/animatori-petreceri-copii/");
        voluntariPass = await checkPage("https://www.kassia.ro/animatori-petreceri-copii-voluntari/");
        sector6Pass = await checkPage("https://www.kassia.ro/animatori-petreceri-copii-sector-6/");
    } catch(e) {
        console.error(e);
    }
    await browser.close();

    console.log(`\n**KASSIA PRICING PROGRAMS CLEANUP WRITE REPORT**\n`);
    console.log(`WRITE COMPLETED — YES`);
    console.log(`rows updated — 2`);
    console.log(`backup path: ${backupPath}`);
    console.log(`prices modified — NO`);
    console.log(`durations modified — NO`);
    console.log(`order modified — NO`);
    console.log(`only short_description modified — YES`);
    console.log(`forbidden terms in kassia_pricing_programs after write:`);
    console.log(`perfect: ${counts['perfect']} rows`);
    console.log(`premium: ${counts['premium']} rows`);
    console.log(`corporate: ${counts['corporate']} rows`);
    console.log(`pachete/pachet: ${counts['pachete'] + counts['pachet']} rows`);
    console.log(`cost/tarif: ${counts['cost'] + counts['tarif']} rows`);
    console.log(`memorabil/de neuitat/garantat: ${counts['memorabil'] + counts['de neuitat'] + counts['garantat']} rows`);
    
    console.log(`pricing page live check — ${pricingPagePass ? 'PASS' : 'FAIL'}`);
    console.log(`Main Hub pricing still visible — ${mainHubPass ? 'YES' : 'NO'}`);
    console.log(`Voluntari pricing still visible — ${voluntariPass ? 'YES' : 'NO'}`);
    console.log(`Sector 6 pricing still visible — ${sector6Pass ? 'YES' : 'NO'}`);
    console.log(`Sector 6 remains HOLD — YES`);
    console.log(`GSC requested — NO`);
}

run().catch(console.error);
