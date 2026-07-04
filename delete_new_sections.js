import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function check() {
  const { data: page } = await supabase.from('kassia_pages').select('id, path').eq('path', '/animatori-petreceri-copii/').single();
  console.log('page_id:', page.id);
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, order_index, content').eq('page_id', page.id).order('order_index');
  const vipSections = sections.filter(s => s.content && (JSON.stringify(s.content).includes('950 lei') || JSON.stringify(s.content).includes('Nunți, Botezuri') || JSON.stringify(s.content).includes('OFERTĂ SPECIAL')));
  console.log('Found sections to delete:', vipSections.length);
  for (const s of vipSections) {
      console.log('Deleting:', s.id, s.section_type);
      await supabase.from('kassia_page_sections').delete().eq('id', s.id);
  }
  console.log('Rollback done');
}
check();
