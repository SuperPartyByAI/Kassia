import fs from 'fs';
import path from 'path';
import { createClient } from '@supabase/supabase-js';

const DEPRECATED_PRICES = ['350', '430', '560', '790', '860', '9999'];
const DIRS_TO_CHECK = ['src', 'scripts', 'dist'];

function walkDir(dir) {
    if (!fs.existsSync(dir)) return [];
    let results = [];
    const list = fs.readdirSync(dir);
    list.forEach(file => {
        file = path.join(dir, file);
        const stat = fs.statSync(file);
        if (stat && stat.isDirectory()) {
            results = results.concat(walkDir(file));
        } else if (file.endsWith('.astro') || file.endsWith('.mjs') || file.endsWith('.ts') || file.endsWith('.html') || file.endsWith('.json') || file.endsWith('.js')) {
            results.push(file);
        }
    });
    return results;
}

async function validate() {
    let hasError = false;

    // 1. Check Files
    for (const dir of DIRS_TO_CHECK) {
        const fullDir = path.join(process.cwd(), dir);
        const files = walkDir(fullDir);
        for (const file of files) {
            if (file.includes('kassia-pricing.mjs')) continue;
            if (file.includes('seo-validate.mjs')) continue;
            
            const content = fs.readFileSync(file, 'utf8');
            for (const price of DEPRECATED_PRICES) {
                const regex = new RegExp(`\\b${price}\\s*(?:lei|ron)\\b`, 'i');
                const jsonRegex = new RegExp(`["'](?:price|price_amount)["']\\s*[:=]\\s*["']?${price}\\b`, 'i');
                if (regex.test(content) || jsonRegex.test(content)) {
                    console.error(`[SEO-VALIDATE] Error: Deprecated price ${price} found in ${file}`);
                    hasError = true;
                }
            }
        }
    }

    // 2. Check Database
    try {
        const dotenv = await import('dotenv');
        dotenv.config({ path: '.env.local' });
        if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
    } catch(e) {}
    
    const sbUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
    const sbKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;
    
    if (sbUrl && sbKey) {
        const supabase = createClient(sbUrl, sbKey);
        const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, page_id, content, heading');
        if (!error && sections) {
            for (const sec of sections) {
                const contentStr = typeof sec.content === 'string' ? sec.content : JSON.stringify(sec.content);
                const headingStr = sec.heading || '';
                for (const price of DEPRECATED_PRICES) {
                    const regex = new RegExp(`\\b${price}\\s*(?:lei|ron)\\b`, 'i');
                    if (regex.test(contentStr) || regex.test(headingStr)) {
                        console.error(`[SEO-VALIDATE] Error: Deprecated price ${price} found in DB section ${sec.id} (page ${sec.page_id})`);
                        hasError = true;
                    }
                }
            }
        }
    } else {
        console.warn('[SEO-VALIDATE] SUPABASE_URL or SUPABASE_ANON_KEY missing, skipping DB check.');
    }

    if (hasError) {
        console.error('[SEO-VALIDATE] FAILED: Deprecated prices found.');
        process.exit(1);
    } else {
        console.log('[SEO-VALIDATE] PASS: No deprecated prices found.');
        process.exit(0);
    }
}

validate().catch(err => {
    console.error(err);
    process.exit(1);
});
