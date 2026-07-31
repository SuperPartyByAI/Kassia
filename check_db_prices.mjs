import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
dotenv.config();

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const DEPRECATED_PRICES = ['350', '430', '560', '790', '860', '9999'];

async function check() {
    let output = { before: [], after: [] };
    
    // Check kassia_page_sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('*');
    for (const row of (sections || [])) {
        let contentStr = typeof row.content === 'object' ? JSON.stringify(row.content) : String(row.content);
        let found = false;
        for (const price of DEPRECATED_PRICES) {
            if (new RegExp(`\\b${price}\\s*(?:lei|ron)\\b`, 'i').test(contentStr)) {
                found = true;
            }
        }
        if (found) {
            output.before.push({ table: 'kassia_page_sections', id: row.id, field: 'content', content: row.content });
        }
    }
    
    // Check kassia_faqs
    const { data: faqs } = await supabase.from('kassia_faqs').select('*');
    for (const row of (faqs || [])) {
        let contentStr = typeof row.answer === 'object' ? JSON.stringify(row.answer) : String(row.answer);
        let found = false;
        for (const price of DEPRECATED_PRICES) {
            if (new RegExp(`\\b${price}\\s*(?:lei|ron)\\b`, 'i').test(contentStr)) {
                found = true;
            }
        }
        if (found) {
            output.before.push({ table: 'kassia_faqs', id: row.id, field: 'answer', content: row.answer });
        }
    }
    
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/08_deprecated_prices_scan.json', JSON.stringify(output, null, 2));
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/09_database_rows_before_after.json', JSON.stringify(output, null, 2));
    console.log('Found rows:', output.before.length);
}
check();
