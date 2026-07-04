const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
require('dotenv').config();

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

async function check() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  
  if (!page) return console.log('Page not found');
  
  const { data: sections } = await supabase.from('kassia_sections').select('*').eq('page_id', page.id).order('order_index');
  
  const vipSection = sections.find(s => s.content && s.content.includes('950 lei'));
  const upsellSection = sections.find(s => s.content && s.content.includes('Nunți, Botezuri'));
  
  console.log(JSON.stringify({
    vipSectionId: vipSection ? vipSection.id : null,
    upsellSectionId: upsellSection ? upsellSection.id : null,
    totalSections: sections.length
  }, null, 2));
}

check();
