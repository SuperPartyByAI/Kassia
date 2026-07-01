import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';
import fs from 'fs';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: ws }
});

const PAGE_ID = '160e370f-0540-4501-b50f-62f88b6c8e83'; // animatori-petreceri-copii-bucuresti
const BACKUP_PATH = '/Users/universparty/.gemini/antigravity/brain/0ef2e4ed-9c7f-4113-a38e-7835fd2fb733/scratch/bucuresti_page_backup.json';

async function backup() {
  console.log("Starting backup for page ID:", PAGE_ID);
  
  const [
    { data: page },
    { data: sections },
    { data: faqs },
    { data: gallery },
    { data: links }
  ] = await Promise.all([
    supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single(),
    supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID).order('order_index'),
    supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID).order('order_index'),
    supabase.from('kassia_gallery_items').select('*').eq('page_id', PAGE_ID).order('order_index'),
    supabase.from('kassia_internal_links').select('*').eq('source_page_id', PAGE_ID)
  ]);

  const backupData = {
    page,
    sections,
    faqs,
    gallery,
    links,
    backed_up_at: new Date().toISOString()
  };

  fs.writeFileSync(BACKUP_PATH, JSON.stringify(backupData, null, 2), 'utf-8');
  console.log(`Backup completed successfully! Saved to: ${BACKUP_PATH}`);
}

backup().catch(console.error);
