import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const forbidden = [
    '\\bcost\\b',
    '\\btarif\\b',
    '\\bcosturi\\b',
    '\\btarife\\b',
    'prețurile noastre',
    '\\bpachet\\b',
    '\\bpachete\\b',
    '\\bperfect\\b',
    '\\bpremium\\b',
    '\\bcorporate\\b',
    '\\bmemorabil\\b',
    'de neuitat',
    '\\bgarantat\\b'
];

async function run() {
    const { data: allPrograms } = await supabase.from('kassia_pricing_programs').select('*');
    
    let counts = {};
    forbidden.forEach(term => counts[term] = 0);
    let costumeCount = 0;
    
    for (const prog of allPrograms) {
        for (const [key, value] of Object.entries(prog)) {
            let textsToCheck = [];
            if (typeof value === 'string') {
                textsToCheck.push(value.toLowerCase());
            } else if (Array.isArray(value)) {
                value.forEach(v => {
                    if (typeof v === 'string') textsToCheck.push(v.toLowerCase());
                });
            }
            
            for (const text of textsToCheck) {
                // Check false positive "costume"
                if (text.includes('costume')) {
                    costumeCount++;
                }
                
                // Strict check for forbidden terms
                for (const term of forbidden) {
                    const regex = new RegExp(term, 'g');
                    if (regex.test(text)) {
                        counts[term]++;
                        console.log(`Found ${term} in ${prog.title} (ID: ${prog.id}) [${key}]: ${text}`);
                    }
                }
            }
        }
    }
    
    console.log(JSON.stringify({
        counts: counts,
        costumeCount: costumeCount
    }, null, 2));
}

run().catch(console.error);
