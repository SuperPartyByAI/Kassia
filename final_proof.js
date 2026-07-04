import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

(async () => {
  console.log('--- DOVADA BAZĂ DE DATE ---');
  
  // Popesti Sections
  const { data: pagePop } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-copii-popesti-leordeni/').single();
  const { data: secsPop } = await supabase.from('kassia_page_sections').select('heading').eq('page_id', pagePop.id);
  console.log('POPESTI SECTIONS:');
  console.log(secsPop.map(s => s.heading).filter(h => h && h.includes('Popesti')));
  
  // Voluntari Gallery
  const { data: pageVol } = await supabase.from('kassia_pages').select('id').eq('path', '/decoratiuni-baloane-voluntari/').single();
  const { data: galVol } = await supabase.from('kassia_gallery_items').select('alt_text').eq('page_id', pageVol.id);
  console.log('\nVOLUNTARI GALLERY (ALT TEXT):');
  console.log(galVol.map(g => g.alt_text));
  
  // Sector 6 Gallery
  const { data: pageS6 } = await supabase.from('kassia_pages').select('id').eq('path', '/decoratiuni-baloane-sector-6/').single();
  const { data: galS6 } = await supabase.from('kassia_gallery_items').select('alt_text').eq('page_id', pageS6.id);
  console.log('\nSECTOR 6 GALLERY (ALT TEXT):');
  console.log(galS6.map(g => g.alt_text));
  
  console.log('\n--- DOVADA CURL LIVE HTML ---');
  try {
    const res = await fetch('https://www.kassia.ro/animatori-copii-popesti-leordeni/', { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
    const html = await res.text();
    const bucurestiMatches = html.match(/petrecerile din București/gi) || [];
    console.log(`București pe pagina Popesti (live bypass cache): ${bucurestiMatches.length} rezultate.`);
  } catch (e) {
    console.log('Eroare fetch Popesti:', e);
  }
})();
