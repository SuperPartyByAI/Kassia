import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const data = {
  '/animatori-petreceri-copii-sector-4/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 4',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Cauți actori dedicați pentru petrecerea celui mic în zona de Sud a Capitalei? Ne deplasăm rapid, <strong>fără taxe ascunse de transport</strong>, în tot Sectorul 4. Ajungem cu ușurință la evenimente organizate în apartamente, curți sau restaurante din <strong>Berceni, Tineretului, Timpuri Noi, Văcărești, Olteniței, Giurgiului și Apărătorii Patriei</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Pentru apartamente și spații rezidențiale:</strong> Locuințele din Berceni sau Tineretului necesită o adaptare atentă a spațiului. Venim cu jocuri interactive, ateliere de <em>face painting</em> și modelaj baloane care țin copiii captivați fără a necesita o suprafață mare de alergare.</li>
  <li><strong>Parcuri și locuri de joacă:</strong> Dacă alegeți un spațiu deschis lângă Parcul Tineretului sau Lumea Copiilor, organizăm concursuri dinamice, ștafete și mini-disco cu boxă portabilă.</li>
  <li><strong>Numărul de animatori recomandat:</strong> Așa cum detaliem în oferta noastră de pachete, un singur animator gestionează excelent un grup de până la 12 copii. Pentru grupe întregi de grădiniță, recomandăm varianta cu 2 animatori.</li>
</ul>`,
    newFaqs: [
      { q: 'Asigurați deplasare fără costuri suplimentare în cartierul Berceni sau Tineretului?', a: 'Da, pentru absolut toate locațiile din Sectorul 4 ne deplasăm fără nicio taxă suplimentară de transport.' },
      { q: 'Ce jocuri organizați dacă petrecerea are loc într-un apartament mic din Apărătorii Patriei?', a: 'Adaptăm activitățile la spațiul disponibil. În loc de ștafete care necesită alergare, ne concentrăm pe magie comică, ghicitori, dansuri statice, pictură pe față și baloane modelate.' },
      { q: 'Cât timp stă animatorul la petrecere?', a: 'Consultați pachetele noastre oficiale; în mod normal, recomandăm o prezență de 2 ore pentru a avea timp suficient atât pentru jocurile active, cât și pentru momentul aducerii tortului.' }
    ]
  },
  '/animatori-petreceri-copii-sector-5/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 5',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Venim cu surprize, recuzită premium și energie la orice petrecere din Sectorul 5. Ne deplasăm gratuit, indiferent dacă sărbătoriți acasă, la un loc de joacă sau la restaurant în <strong>Rahova, 13 Septembrie, Sebastian, Panduri, Ferentari, Progresul sau zona Cotroceni</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Activități sigure și adaptate:</strong> Ne asigurăm că toți copiii sunt incluși în joc, folosind doar culori sigure pentru pictura pe față și baloane calitative. În zonele mai aglomerate, precum Rahova sau 13 Septembrie, animatorii noștri sunt punctuali și vin pregătiți cu soluții pentru a capta imediat atenția grupului.</li>
  <li><strong>Evenimente la restaurant sau grădiniță:</strong> Pentru petrecerile organizate la restaurantele din zona Panduri sau Cotroceni, ne sincronizăm cu personalul locației pentru a nu deranja restul clienților, menținând copiii ocupați cu ateliere creative.</li>
  <li><strong>Pachete flexibile:</strong> Detaliile complete despre prețuri și durată le găsiți în secțiunea noastră de oferte. Recomandarea tehnică pentru o petrecere medie de apartament este de 1 personaj animator timp de 2 ore.</li>
</ul>`,
    newFaqs: [
      { q: 'Percepeți taxe de deplasare pentru Rahova, 13 Septembrie sau Ferentari?', a: 'Nu. Deplasarea în Sectorul 5, la fel ca în tot restul Bucureștiului, este inclusă în prețul pachetelor noastre. Nu există taxe ascunse.' },
      { q: 'Aduceți și muzică pentru petrecerea organizată acasă în zona Sebastian?', a: 'Sigur! Animatorii noștri vin echipați cu boxă portabilă și playlist-uri specifice (mini-disco, muzică de petrecere pentru copii).' },
      { q: 'Se pot combina animatorii cu decoruri din baloane la locațiile din Sectorul 5?', a: 'Da, echipele noastre pot asigura atât programul de animație interactivă, cât și panourile foto sau arcadele din baloane pentru un eveniment complet.' }
    ]
  },
  '/animatori-petreceri-copii-sector-6/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 6',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Indiferent că locuiești în ansamblurile noi sau în cartierele clasice, îți aducem distracția direct la locație în Sectorul 6. Acoperim rapid și fără taxe suplimentare zonele: <strong>Militari, Drumul Taberei, Ghencea, Crângași, Giulești, Regie, Grozăvești și Brâncuși</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Acasă, în cartierele rezidențiale:</strong> Fie că sunteți în Drumul Taberei, în zona Brâncuși sau în Militari, știm că spațiul din apartamente sau terase poate fi limitat. Venim cu programe concentrate pe teatru interactiv, face painting și jocuri de echipă statice.</li>
  <li><strong>Petreceri la locurile de joacă și parcuri:</strong> Sectorul 6 are numeroase parcuri (precum Moghioroș/Drumul Taberei). Dacă alegeți să sărbătoriți în aer liber sau la o grădiniță din Giulești/Crângași, trecem direct la jocuri de mișcare, competiții și ștafete distractive.</li>
  <li><strong>Cum alegeți varianta corectă:</strong> Pentru a avea o petrecere reușită, consultați pachetele de pe această pagină. Regula noastră: până la 12-15 copii, 1 animator face față excelent. Dacă depășiți acest număr (ex. colegii de clasă), 2 animatori sunt soluția ideală.</li>
</ul>`,
    newFaqs: [
      { q: 'Veniți la ansamblurile rezidențiale noi din zona Brâncuși sau Militari?', a: 'Da, ajungem la orice adresă exactă din cartierul Brâncuși, Militari, Prelungirea Ghencea și restul Sectorului 6, fără taxe de transport.' },
      { q: 'Unde este cel mai bine să organizăm petrecerea în Drumul Taberei?', a: 'Putem organiza programul la fel de eficient atât în confortul propriului apartament, cât și la un restaurant, terasă sau un loc de joacă închiriat din zonă.' },
      { q: 'Cât timp durează un program complet de animație?', a: 'Majoritatea părinților optează pentru pachetele de 2 ore, fiind timpul optim pentru ca personajele să desfășoare toate jocurile, atelierele de creație și momentul special al tortului.' }
    ]
  }
};

async function execute() {
  for (const [path, info] of Object.entries(data)) {
    console.log('Processing', path);
    const { data: page, error: pageErr } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
    if (pageErr) { console.error('Page err:', pageErr); continue; }
    
    // 1. Update the local section
    const { data: secs, error: secsErr } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    if (secsErr) { console.error('Sec err:', secsErr); continue; }
    
    const sec = secs.find(s => s.heading && (s.heading.includes('Suntem acolo unde') || s.heading.includes('la domiciliu')));
    if (sec) {
      let newContent = { ...sec.content };
      newContent.body = info.newBody;
      const { error: updErr } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
      if (updErr) console.error('Update section err:', updErr);
      else console.log('  Updated local section successfully.');
    } else {
      console.log('  Local section not found for', path);
    }
    
    // 2. Prepend FAQs
    // First, shift existing FAQs order_index by 10 to make room at the top
    const { data: existingFaqs } = await supabase.from('kassia_faqs').select('id, order_index').eq('page_id', page.id);
    if (existingFaqs && existingFaqs.length > 0) {
      for (const ef of existingFaqs) {
        await supabase.from('kassia_faqs').update({ order_index: (ef.order_index || 0) + 10 }).eq('id', ef.id);
      }
    }
    
    // Insert new FAQs
    let fIdx = 1;
    for (const f of info.newFaqs) {
      // Check if it already exists to avoid duplicates
      const { data: chk } = await supabase.from('kassia_faqs').select('id').eq('page_id', page.id).eq('question', f.q).single();
      if (!chk) {
        const { error: fErr } = await supabase.from('kassia_faqs').insert({
          page_id: page.id,
          question: f.q,
          answer: f.a,
          order_index: fIdx++
        });
        if (fErr) console.error('FAQ insert err:', fErr);
        else console.log('  Inserted FAQ:', f.q);
      } else {
        console.log('  FAQ already exists:', f.q);
      }
    }
    console.log('---------------------------------');
  }
}

execute();
