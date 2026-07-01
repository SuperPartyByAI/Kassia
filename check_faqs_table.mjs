import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-popesti-leordeni').single();
    
    if (page) {
        const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id).order('order_index', { ascending: true });
        
        console.log("=== FAQ DB RECONCILIATION ===");
        console.log(`kassia_faqs count: ${faqs ? faqs.length : 0}`);
        
        const forbidden = ['perfect', 'premium', 'corporate', 'pachete', 'pachet', 'cost', 'tarif', 'memorabil', 'de neuitat', 'garantat', 'magie', '1-3 ore', 'om', 'oameni'];
        let forbiddenCounts = {};
        forbidden.forEach(t => forbiddenCounts[t] = 0);
        
        if (faqs) {
            faqs.forEach(f => {
                const text = (f.question + ' ' + f.answer).toLowerCase();
                console.log(`\nID: ${f.id}`);
                console.log(`Q: ${f.question}`);
                console.log(`A: ${f.answer}`);
                
                forbidden.forEach(term => {
                    if (new RegExp('\\b' + term + '\\b').test(text)) {
                        forbiddenCounts[term]++;
                    }
                });
            });
        }
        
        console.log("\nForbidden terms found in kassia_faqs:", Object.entries(forbiddenCounts).filter(([k,v])=>v>0));
    }
}

run().catch(console.error);
