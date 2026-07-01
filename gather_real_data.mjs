import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function gatherData() {
    console.log("--- MAIN HUB PAGE ---");
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    console.log("--- MAIN HUB SECTIONS ---");
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading, order_index').eq('page_id', page.id).order('order_index');
    sections.forEach(s => console.log(`[${s.order_index}] ${s.section_type} | ${s.heading} | ID: ${s.id}`));
    
    console.log("\n--- MAIN HUB FAQS ---");
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, order_index').eq('page_id', page.id).order('order_index');
    faqs.forEach(f => console.log(`[${f.order_index}] ${f.question} | ID: ${f.id}`));

    console.log("\n--- OTHER PAGES FOR INTERNAL LINKS ---");
    const slugs = [
        'preturi-animatori-copii-bucuresti',
        'personaje-petreceri-copii-bucuresti',
        'animatori-petreceri-copii-sector-1',
        'animatori-petreceri-copii-sector-2',
        'animatori-petreceri-copii-sector-3',
        'animatori-petreceri-copii-sector-4',
        'animatori-petreceri-copii-sector-5',
        'animatori-petreceri-copii-sector-6',
        'animatori-petreceri-copii-voluntari',
        'animatori-petreceri-copii-berceni',
        'animatori-petreceri-copii-popesti-leordeni',
        'animatori-petreceri-copii-drumul-taberei'
    ];
    const { data: pages } = await supabase.from('kassia_pages').select('slug, status').in('slug', slugs);
    pages.forEach(p => console.log(`${p.slug}: ${p.status}`));
    
    console.log("\n--- IMAGE AUDIT ---");
    const imgDir = path.join(process.cwd(), 'public', 'images', 'animatori');
    const files = fs.readdirSync(imgDir).filter(f => f.endsWith('.webp') || f.endsWith('.jpg') || f.endsWith('.png'));
    files.slice(0, 15).forEach(f => {
        const fullPath = path.join(imgDir, f);
        const stats = fs.statSync(fullPath);
        console.log(`- /images/animatori/${f} | size: ${Math.round(stats.size/1024)}KB | status: 200/Exists`);
    });
}
gatherData().catch(console.error);
