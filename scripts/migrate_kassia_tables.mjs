import fs from 'fs';
import path from 'path';

function walk(dir) {
    let results = [];
    const list = fs.readdirSync(dir);
    list.forEach(file => {
        file = path.join(dir, file);
        const stat = fs.statSync(file);
        if (stat && stat.isDirectory()) {
            results = results.concat(walk(file));
        } else {
            results.push(file);
        }
    });
    return results;
}

const files = walk('./src').filter(f => f.endsWith('.astro') || f.endsWith('.ts') || f.endsWith('.js') || f.endsWith('.tsx'));

for (const file of files) {
    let content = fs.readFileSync(file, 'utf8');
    let original = content;

    // Replace table names
    content = content.replace(/from\('pages'\)/g, "from('kassia_pages')");
    content = content.replace(/from\("pages"\)/g, 'from("kassia_pages")');
    content = content.replace(/from\('page_sections'\)/g, "from('kassia_page_sections')");
    content = content.replace(/from\("page_sections"\)/g, 'from("kassia_page_sections")');
    content = content.replace(/from\('faqs'\)/g, "from('kassia_faqs')");
    content = content.replace(/from\("faqs"\)/g, 'from("kassia_faqs")');
    content = content.replace(/from\('gallery_items'\)/g, "from('kassia_gallery_items')");
    content = content.replace(/from\("gallery_items"\)/g, 'from("kassia_gallery_items")');
    content = content.replace(/from\('internal_links'\)/g, "from('kassia_internal_links')");
    content = content.replace(/from\("internal_links"\)/g, 'from("kassia_internal_links")');
    // For pricing_packages, I will comment them out or map them if Kassia doesn't have it.
    // The user says "kassia_pages", "kassia_page_sections", "kassia_faqs", "kassia_gallery_items", "kassia_internal_links", "kassia_seo_map"
    // So there is no pricing_packages in Kassia schema. I will leave it as is or change to kassia_pricing_packages if it was intended, but wait...
    // The user says "Ține cont că schema live folosește: ... Nu folosi: section_key, sort_order, image_url dacă aceste coloane nu există live."

    // Replace column names
    content = content.replace(/\.sort_order/g, '.order_index');
    content = content.replace(/sort_order/g, 'order_index');
    content = content.replace(/\.section_key/g, '.section_type');
    content = content.replace(/section_key/g, 'section_type');
    content = content.replace(/\.image_url/g, '.url');
    content = content.replace(/image_url/g, 'url');
    
    // In src/pages/admin/pages/[id].astro, replace 'target_page:pages' to 'target_page:kassia_pages'
    content = content.replace(/target_page:pages!/g, 'target_page:kassia_pages!');

    if (content !== original) {
        fs.writeFileSync(file, content);
        console.log(`Updated ${file}`);
    }
}
