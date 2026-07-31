import http from 'http';
import fs from 'fs';

async function fetchPath(path) {
    return new Promise((resolve) => {
        http.get({ hostname: '127.0.0.1', port: 3050, path, headers: { 'Host': 'www.kassia.ro' } }, (res) => {
            let body = '';
            res.on('data', chunk => body += chunk);
            res.on('end', () => resolve(body));
        }).on('error', () => resolve(''));
    });
}

async function run() {
    const p1 = await fetchPath('/animatori-petreceri-copii/');
    const p2 = await fetchPath('/catalog-costume/');
    
    // Counting occurrences of some card class, or we can just count instances of 'article' or something.
    // The components/CostumeCatalog.astro probably outputs <li> or <article>.
    // Let's count <div class="costume-card" or similar. 
    // Wait, let's just use regex to count costume entries.
    const previewCount = (p1.match(/<article[^>]*class="[^"]*costume-card/g) || []).length || (p1.match(/class="[^"]*costume-item/gi) || []).length || (p1.match(/<div[^>]*class="[^"]*costume-grid-item/g) || []).length;
    const fullCount = (p2.match(/<article[^>]*class="[^"]*costume-card/g) || []).length || (p2.match(/class="[^"]*costume-item/gi) || []).length || (p2.match(/<div[^>]*class="[^"]*costume-grid-item/g) || []).length;
    
    // Fallback if the classes are different
    const p1Items = (p1.match(/<img[^>]*alt="Costum/gi) || []).length;
    const p2Items = (p2.match(/<img[^>]*alt="Costum/gi) || []).length;

    const data = {
        pillar_preview_count: Math.max(previewCount, p1Items),
        catalog_full_count: Math.max(fullCount, p2Items)
    };
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/10_catalog_inventory_and_preview.json', JSON.stringify(data, null, 2));
    console.log(data);
}
run();
