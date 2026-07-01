import fs from 'fs';
import path from 'path';

const dbDir = path.resolve('../db');

function renameInFile(filePath) {
    if (!fs.existsSync(filePath)) return;
    let content = fs.readFileSync(filePath, 'utf-8');
    
    // Rename tables
    content = content.replace(/\bpages\b/g, 'kassia_pages');
    content = content.replace(/\bpage_sections\b/g, 'kassia_page_sections');
    content = content.replace(/\binternal_links\b/g, 'kassia_internal_links');
    content = content.replace(/\bfaqs\b/g, 'kassia_faqs');
    content = content.replace(/\bgallery_items\b/g, 'kassia_gallery_items');
    content = content.replace(/\bpricing_packages\b/g, 'kassia_pricing_packages');
    content = content.replace(/\bservices\b/g, 'kassia_services');
    content = content.replace(/\bevents\b/g, 'kassia_events');
    content = content.replace(/\blocations\b/g, 'kassia_locations');

    // Rename types
    content = content.replace(/\bpage_status\b/g, 'kassia_page_status');
    content = content.replace(/\bindex_status_type\b/g, 'kassia_index_status_type');
    
    // Rename triggers/functions specifically matching the table names
    content = content.replace(/\bupdate_updated_at_column\b/g, 'kassia_update_updated_at_column');
    content = content.replace(/\bpublish_page\b/g, 'kassia_publish_page');
    content = content.replace(/\bget_canonical_url\b/g, 'kassia_get_canonical_url');

    fs.writeFileSync(filePath, content, 'utf-8');
    console.log(`Updated ${filePath}`);
}

renameInFile(path.join(dbDir, '01_schema.sql'));
renameInFile(path.join(dbDir, '02_functions.sql'));
renameInFile(path.join(dbDir, '03_seed_pages.sql'));
renameInFile(path.join(dbDir, '04_seed_internal_links.sql'));

