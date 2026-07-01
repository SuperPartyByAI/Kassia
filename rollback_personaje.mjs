import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function rollback() {
  console.log("=== RUNNING ROLLBACK ===");
  const backup = JSON.parse(fs.readFileSync('db_backup_pre_personaje.json', 'utf-8'));
  
  for (const sec of backup.sections) {
    const { error } = await supabase
      .from('kassia_page_sections')
      .update({ content: sec.content, order_index: sec.order_index, section_type: sec.section_type })
      .eq('id', sec.id);
    if (error) console.error("Rollback failed for section", sec.id, error);
  }

  // Delete the new page and its cascades
  const { error: delErr } = await supabase
    .from('kassia_pages')
    .delete()
    .eq('path', '/personaje-animatori-copii-bucuresti/');
    
  if (delErr) {
    console.error("Failed to delete new page:", delErr);
  } else {
    console.log("Deleted the new page /personaje-animatori-copii-bucuresti/");
  }

  // Find newly added internal link sections on old pages and delete them
  // We identify them because their IDs won't be in the backup
  const backupSecIds = backup.sections.map(s => s.id);
  const pageIds = backup.pages.map(p => p.id);
  
  const { data: currentSecs } = await supabase.from('kassia_page_sections').select('id').in('page_id', pageIds);
  const toDelete = currentSecs.map(s => s.id).filter(id => !backupSecIds.includes(id));
  
  if (toDelete.length > 0) {
    const { error: delSecErr } = await supabase.from('kassia_page_sections').delete().in('id', toDelete);
    if (delSecErr) console.error("Failed to delete newly appended sections", delSecErr);
    else console.log("Deleted appended sections:", toDelete.length);
  }

  console.log("Rollback completed.");
}
rollback();
