import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const info = {
  newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Venim cu surprize interactive direct la petrecerea ta din orașul Pantelimon și împrejurimi (Cernica, Dobroești). Dacă locuiți la casă, la apartament sau organizați evenimentul la unul din restaurantele cu ieșire la lac, echipa Kassia asigură o atmosferă festivă, bazată pe jocuri moderne și comunicare asertivă.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Jocuri pentru interior și exterior:</strong> Indiferent că aveți o curte mare sau doar o zonă restrânsă într-un living, aducem recuzita potrivită (tunelul bucuriei, parașuta colorată, pânza magică) și alternăm perioadele de efort fizic cu cele de concentrare creativă.</li>
  <li><strong>Actori, nu doar oameni în costume:</strong> Echipa noastră este selectată din tineri cu pregătire în lucrul cu copiii. Ei știu să gestioneze conflicte mici, să integreze copiii timizi și să asigure ordinea pe durata întregului program.</li>
  <li><strong>Optimizarea timpului:</strong> Vă recomandăm să rezervați personajele (conform pachetelor de pe această pagină) cu o oră după începerea evenimentului, pentru a le oferi timp micilor invitați să sosească, să mănânce și să se acomodeze cu spațiul.</li>
</ul>`
};

async function execute() {
  const path = '/animatori-copii-pantelimon-ilfov/';
  const { data: page, error: pageErr } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  if (pageErr) { console.error('Page err:', pageErr); return; }
  
  const { data: secs } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
  const sec = secs.find(s => s.heading === 'Petreceri perfecte direct în locația ta');
  if (sec) {
    let newContent = { ...sec.content };
    newContent.body = info.newBody;
    const { error: updErr } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
    if (updErr) console.error('Update section err:', updErr);
    else console.log('Updated local section for Pantelimon successfully.');
  } else {
    console.log('Section not found');
  }
}

execute();
