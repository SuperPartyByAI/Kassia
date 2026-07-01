import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const forbidden = ['perfect', 'premium', 'corporate'];

async function run() {
    const { data: programs } = await supabase.from('kassia_pricing_programs').select('*');
    
    let results = [];
    
    for (const prog of programs) {
        for (const [key, value] of Object.entries(prog)) {
            if (typeof value === 'string') {
                const lowerVal = value.toLowerCase();
                let foundTerms = [];
                for (const term of forbidden) {
                    if (new RegExp('\\b' + term + '\\b').test(lowerVal)) {
                        foundTerms.push(term);
                    }
                }
                if (foundTerms.length > 0) {
                    results.push({
                        row_id: prog.id,
                        program_name: prog.title,
                        duration: prog.duration_label,
                        column: key,
                        terms: foundTerms,
                        current_text: value
                    });
                }
            } else if (Array.isArray(value)) {
                for (let i = 0; i < value.length; i++) {
                    if (typeof value[i] === 'string') {
                        const lowerVal = value[i].toLowerCase();
                        let foundTerms = [];
                        for (const term of forbidden) {
                            if (new RegExp('\\b' + term + '\\b').test(lowerVal)) {
                                foundTerms.push(term);
                            }
                        }
                        if (foundTerms.length > 0) {
                            results.push({
                                row_id: prog.id,
                                program_name: prog.title,
                                duration: prog.duration_label,
                                column: `${key}[${i}]`,
                                terms: foundTerms,
                                current_text: value[i]
                            });
                        }
                    }
                }
            }
        }
    }
    console.log(JSON.stringify(results, null, 2));
}

run().catch(console.error);
