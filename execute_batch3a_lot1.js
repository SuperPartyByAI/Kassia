import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const data = {
  '/animatori-petreceri-copii-sector-1/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 1',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Căutați actori pasionați și personaje autentice pentru petrecerea celui mic? Ne deplasăm rapid și <strong>fără taxe ascunse de transport</strong> în tot Sectorul 1. Acoperim integral cartierele rezidențiale liniștite din <strong>Băneasa, Aviației, Bucureștii Noi, Herăstrău și Domenii</strong>, precum și zonele exclusiviste din <strong>Aviatorilor, Dorobanți și Floreasca</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Pentru curți și vile:</strong> Sectorul 1 ne oferă adesea spații generoase în aer liber. Venim cu o recuzită profesională pentru concursuri interactive, ștafete și jocuri de echipă care consumă energia copiilor într-un mod educativ.</li>
  <li><strong>Restaurante și grădinițe private:</strong> Ne coordonăm cu personalul locației pentru a nu deranja alți clienți. Adaptăm volumul muzicii și transformăm rapid spațiul într-un atelier de <em>face painting</em> și modelaj de baloane.</li>
  <li><strong>Alegerea numărului de animatori:</strong> Așa cum puteți vedea în oferta noastră detaliată, pentru grupuri de 8–12 copii acasă, un singur animator este suficient; pentru grupuri mai mari sau restaurant/curte recomandăm prezența a 2 animatori pentru un program mai fluid.</li>
</ul>`,
    newFaqs: [
      { q: 'Asigurați transportul gratuit pentru animatorii din Sectorul 1?', a: 'Da, ne deplasăm la orice adresă, restaurant sau grădiniță din Sectorul 1 fără nicio taxă suplimentară de transport.' },
      { q: 'Cum aleg varianta potrivită pentru o petrecere în aer liber în zona Băneasa/Domenii?', a: 'Vă invităm să consultați secțiunea noastră de Pachete și Oferte de pe această pagină. Vă sugerăm o variantă care să lase timp suficient atât pentru jocurile de mișcare, cât și pentru atelierele de creație.' },
      { q: 'Cum pot face o rezervare rapidă?', a: 'Ne poți scrie direct pe WhatsApp pentru a verifica instant disponibilitatea personajului preferat (Spiderman, Elsa etc.) în data dorită.' }
    ]
  },
  '/animatori-petreceri-copii-sector-2/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 2',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Indiferent dacă serbați acasă în <strong>Obor, Colentina, Pantelimon și Iancului</strong>, sau la un restaurant din zona <strong>Ștefan cel Mare, Tei și Moșilor</strong>, echipa Kassia vine cu <strong>energie și recuzită premium</strong>. Organizăm petreceri unde copiii sunt implicați total, iar părinții se pot bucura de eveniment.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Adaptare pentru apartamente:</strong> Știm exact ce funcționează într-un spațiu restrâns (ex. blocurile din Pantelimon sau Colentina). Înlocuim alergătura cu magie interactivă, teatru scurt, pictură pe față și coregrafii muzicale statice.</li>
  <li><strong>Locuri de joacă și parcuri de trambuline:</strong> Ne sincronizăm programul cu cel al locației. Când copiii obosesc pe trambuline, intervenim noi cu momentele de concentrare și tortul.</li>
  <li><strong>Recomandare practică:</strong> Consultați pachetele noastre oficiale mai jos; de regulă, dacă aveți sub 12 copii într-un spațiu de apartament, prezența unui singur animator este opțiunea ideală.</li>
</ul>`,
    newFaqs: [
      { q: 'Puteți organiza programul într-un apartament de bloc din Sectorul 2?', a: 'Sigur! Animatorii noștri știu exact ce tip de jocuri educative și ateliere (face painting, baloane) se pretează excelent în spații închise.' },
      { q: 'Ne costă în plus dacă locația este în Pantelimon sau Colentina?', a: 'Nu, acoperim întreg Sectorul 2 fără taxe ascunse de deplasare.' },
      { q: 'Se poate organiza programul la un loc de joacă închiriat din zona Iancului/Obor?', a: 'Da, ne coordonăm cu personalul locațiilor pentru ca momentul aducerii tortului și show-ul nostru să decurgă perfect.' }
    ]
  },
  '/animatori-petreceri-copii-sector-3/': {
    targetHeading: 'Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector 3',
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Aducem spectacolul direct la tine, acoperind integral Sectorul 3: de la apartamentele și blocurile noi din <strong>Titan, Dristor, Vitan, Pallady și Balta Albă</strong>, până la zona <strong>Unirii / Alba Iulia / Nicolae Grigorescu</strong>. Oferim divertisment interactiv, nu doar o simplă prezență în costum.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Apartamente noi (Pallady / Titan):</strong> Aducem propria boxă portabilă și o mulțime de surprize. Transformăm un living normal într-o zonă de petrecere cu jocuri de echipă (care nu necesită spațiu vast) și sesiuni foto cu personajul preferat.</li>
  <li><strong>Restaurante de familie:</strong> Dacă alegeți o locație Horeca din Sectorul 3, animatorul nostru (cu pregătire pedagogică și actoricească) va capta complet atenția grupului de copii într-un separeu.</li>
  <li><strong>Alegerea numărului de animatori:</strong> În funcție de pachetul ales, pentru 15-20 de copii recomandăm 2 animatori. Astfel, în timp ce unul face <em>face painting</em>, celălalt continuă jocurile, creând o atmosferă veselă și fluidă.</li>
</ul>`,
    newFaqs: [
      { q: 'Veniți la ansamblurile rezidențiale noi din zona Pallady sau Vitan?', a: 'Da, echipa noastră se deplasează oriunde în Sectorul 3, la adresa exactă oferită pe WhatsApp.' },
      { q: 'Aduceți și muzică / boxă portabilă pentru petrecere?', a: 'Da, animatorul vine echipat cu boxă proprie și un playlist adaptat copiilor pentru mini-disco și momentul tortului.' },
      { q: 'Câți animatori recomandați pentru o grupă de grădiniță (peste 15 copii) din Sectorul 3?', a: 'Pentru grupurile mari, recomandăm 2 animatori. Aceasta asigură un program mai fluid și mai ușor de gestionat, fără timpi morți la atelierele de pictură.' }
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
