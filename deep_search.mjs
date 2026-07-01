import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const queries = [
    'face-painting',
    'experiență superioară',
    'Costurile pot varia',
    'Servicii conexe care completează',
    'De ce să alegi Kassia Events',
    'sectoarele Bucureștiului',
    'Ghid pentru planificarea programului de animație'
  ];

  for (const q of queries) {
    const { data: secs } = await supabase.from('kassia_page_sections')
        .select('id, page_id, heading, section_type, content')
        .ilike('content->>body', `%${q}%`);
    
    if (secs && secs.length > 0) {
        console.log(`\nFound "${q}" in content->body:`);
        for (const s of secs) {
            console.log(`- ID: ${s.id} | Page: ${s.page_id} | Active: ${s.content?.is_active}`);
        }
    } else {
        console.log(`\nNo sections found containing "${q}" in content->body.`);
    }

    // Also check heading just in case
    const { data: secsHead } = await supabase.from('kassia_page_sections')
        .select('id, page_id, heading, section_type, content')
        .ilike('heading', `%${q}%`);
    
    if (secsHead && secsHead.length > 0) {
        console.log(`Found "${q}" in heading:`);
        for (const s of secsHead) {
            console.log(`- ID: ${s.id} | Page: ${s.page_id} | Active: ${s.content?.is_active}`);
        }
    }
  }
})();
