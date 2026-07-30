import fs from 'fs';
import path from 'path';

const DEPRECATED_PRICES = ['350', '430', '560', '790', '860', '9999'];
const DIR_TO_CHECK = path.join(process.cwd(), 'src');

function walkDir(dir) {
    let results = [];
    const list = fs.readdirSync(dir);
    list.forEach(file => {
        file = path.join(dir, file);
        const stat = fs.statSync(file);
        if (stat && stat.isDirectory()) {
            results = results.concat(walkDir(file));
        } else if (file.endsWith('.astro') || file.endsWith('.mjs') || file.endsWith('.ts')) {
            results.push(file);
        }
    });
    return results;
}

let hasError = false;
const files = walkDir(DIR_TO_CHECK);

for (const file of files) {
    // Skip kassia-pricing.mjs since it defines the deprecated prices!
    if (file.includes('kassia-pricing.mjs')) continue;

    const content = fs.readFileSync(file, 'utf8');
    for (const price of DEPRECATED_PRICES) {
        const regex = new RegExp(`\\b${price}\\s*(?:lei|ron)\\b`, 'i');
        if (regex.test(content)) {
            console.error(`[SEO-VALIDATE] Error: Deprecated price ${price} lei found in ${file}`);
            hasError = true;
        }
    }
}

if (hasError) {
    console.error('[SEO-VALIDATE] FAILED: Deprecated prices found in source code.');
    process.exit(1);
} else {
    console.log('[SEO-VALIDATE] PASS: No deprecated prices in source code.');
    process.exit(0);
}
