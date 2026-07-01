import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', 'home').single();
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    sections.forEach(sec => {
        const contentStr = sec.content ? JSON.stringify(sec.content).toLowerCase() : '';
        const titleStr = sec.title ? String(sec.title).toLowerCase() : '';
        const subtitleStr = sec.subtitle ? String(sec.subtitle).toLowerCase() : '';
        const rawStr = sec.raw_html ? String(sec.raw_html).toLowerCase() : '';
        const fullStr = contentStr + titleStr + subtitleStr + rawStr;
        
        const terms = ["ofertă", "oferta", "spectaculoase", "excelentă", "excelenta", "sigure"];
        
        let found = [];
        terms.forEach(t => {
            if(fullStr.includes(t)) found.push(t);
        });
        
        if(found.length > 0) {
            console.log(`\nFound in section ID ${sec.id} (${sec.section_type}):`);
            console.log(`Terms found: ${found.join(', ')}`);
            if(contentStr.includes('ofertă') || contentStr.includes('oferta')) console.log('- content contains ofertă');
            console.log('Title:', sec.title);
            console.log('Content dump:', JSON.stringify(sec.content));
        }
    });
}
run();
