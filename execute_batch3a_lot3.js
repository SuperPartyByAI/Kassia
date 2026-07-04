import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const data = {
  '/animatori-copii-popesti-leordeni/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Locuiești în Popești-Leordeni și organizezi o petrecere pentru cel mic? Echipa Kassia vine direct la adresa ta, fie că locuiești în ansamblurile noi de lângă stația de metrou Dimitrie Leonida, pe Șoseaua Olteniței sau în zonele de case. Ne deplasăm fără taxe ascunse de transport, aducând energia și voia bună la pachet.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Adaptare pentru spații variate:</strong> Știm că în Popești-Leordeni petrecerile au loc fie în apartamente spațioase, fie în curți generoase. Pentru interior, pregătim jocuri statice, magie comică și ateliere de creație. Dacă vremea și curtea permit, organizăm competiții, ștafete dinamice și vânătoare de comori.</li>
  <li><strong>Coordonare la restaurante sau locuri de joacă:</strong> Dacă alegeți o locație Horeca din oraș, animatorii noștri (pedagogi și actori profesioniști) țin copiii implicați în activități proprii, asigurând un mediu controlat și distractiv, fără a deranja ceilalți oaspeți.</li>
  <li><strong>Alegerea numărului de animatori:</strong> Pentru grupurile mici de până la 12 copii, un singur personaj asigură cu succes distracția. Dacă petrecerea depășește 15 invitați, recomandăm rezervarea a 2 animatori pentru un program fluid. Consultați lista noastră completă de oferte pe această pagină.</li>
</ul>`,
    newFaqs: [
      { q: 'Percepeți taxă suplimentară de transport pentru Popești-Leordeni?', a: 'Nu, deplasarea la orice adresă din Popești-Leordeni (inclusiv zona nouă, Dimitrie Leonida sau Amurgului) este acoperită integral, fără costuri ascunse.' },
      { q: 'Animatorul vine pregătit cu materiale pentru activități?', a: 'Da, fiecare animator aduce recuzita completă pentru jocuri (parașută colorată, saci de sărit etc.), culori profesionale pentru pictura pe față și baloane de modelaj.' },
      { q: 'Se pot aduce și mascote Disney la petrecerile din Popești-Leordeni?', a: 'Absolut! Alături de animatorul principal, puteți invita și o mascotă (ex. Mickey, Minnie) care să fie prezentă la momentul tăierii tortului și la sesiunile foto.' }
    ]
  },
  '/animatori-copii-voluntari/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Aducem divertismentul premium la evenimentele din orașul Voluntari, acoperind integral atât zona centrală, cât și ansamblurile rezidențiale din <strong>Pipera, Iancu Nicolae sau Tunari</strong>. Dacă organizați o petrecere acasă, la curte sau la unul dintre restaurantele locale, echipa noastră vă garantează un program bine structurat, bazat pe interacțiune reală.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Petreceri la curte în Pipera și Voluntari:</strong> Profitați de spațiul verde! Când avem o curte la dispoziție, scoatem la înaintare recuzita sportivă, jocurile de mișcare și competițiile pe echipe, asigurându-ne că micii invitați își consumă energia constructiv.</li>
  <li><strong>Materiale sigure și calitative:</strong> Știm cât de importantă este siguranța, așa că folosim exclusiv vopsele de <em>face painting</em> hipoalergenice, testate dermatologic (Diamond FX, Snazaroo), care se îndepărtează ușor la o simplă spălare.</li>
  <li><strong>Structura pachetelor noastre:</strong> Nu promovăm oferte rigide. Așa cum puteți vedea detaliat în secțiunea de pachete a paginii, durata recomandată a unui program mediu este de 2 ore, timp suficient pentru jocuri, ateliere, muzică și aducerea tortului de către personajul preferat.</li>
</ul>`,
    newFaqs: [
      { q: 'Există costuri de deplasare pentru zona Pipera - Iancu Nicolae?', a: 'Nu, deplasarea în tot orașul Voluntari, incluzând Pipera și cartierele adiacente, este gratuită și asigurată de echipa noastră.' },
      { q: 'Ce se întâmplă dacă plouă și petrecerea din curte trebuie mutată în living?', a: 'Animatorii noștri sunt flexibili. Avem întotdeauna un plan de rezervă ("Planul B") cu activități statice, magie interactivă și jocuri de atenție, perfect adaptate pentru interior.' },
      { q: 'Cât de curând trebuie să rezervăm pentru un weekend plin?', a: 'Vă recomandăm să ne contactați pe WhatsApp cu cel puțin 2-3 săptămâni înainte, mai ales în perioada de primăvară-vară, când cererea în zona Ilfov Nord este foarte mare.' }
    ]
  },
  '/animatori-copii-bragadiru/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Echipa Kassia este prezentă frecvent cu programe de animație și veselie la petrecerile organizate în orașul Bragadiru. Ne deplasăm rapid în zone precum Cartierul Independenței, Cartierul Latin sau Prelungirea Ghencea, transformând zilele de naștere sau botezurile în experiențe interactive de neuitat pentru copii.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Soluții pentru spații noi:</strong> Cunoaștem arhitectura ansamblurilor rezidențiale din Bragadiru și adaptăm volumul muzicii (din boxa noastră portabilă) și dinamica jocurilor pentru a respecta liniștea din cartier, menținând în același timp entuziasmul copiilor la cote maxime.</li>
  <li><strong>O diversitate de peste 300 de personaje:</strong> Fetițele pot fi surprinse de Elsa, Ariel sau Rapunzel, în timp ce băieții se vor bucura de antrenamentele supereroilor preferați (Spiderman, Batman). Fiecare costum este curat și foarte bine întreținut.</li>
  <li><strong>Consultanță gratuită pentru eveniment:</strong> Înainte de a rezerva pachetele detaliate pe această pagină, ne puteți contacta pentru a alege împreună cel mai bun scenariu, ținând cont de vârsta și preferințele copiilor invitați.</li>
</ul>`,
    newFaqs: [
      { q: 'Ajungeți ușor în Cartierul Independenței sau Cartierul Latin din Bragadiru?', a: 'Da, echipele noastre se deplasează oriunde în Bragadiru, fără a percepe absolut nicio taxă suplimentară de transport.' },
      { q: 'Animatorul aduce echipament propriu pentru muzică?', a: 'Da, fiecare animator are o boxă portabilă cu Bluetooth și un playlist cu muzică antrenantă, potrivită pentru mini-disco și jocuri muzicale (Freeze Dance, Scaunele Muzicale).' },
      { q: 'Putem opta și pentru modelaj de baloane, pe lângă jocurile clasice?', a: 'Activitățile de face painting și modelaj din baloane sunt incluse automat în majoritatea programelor noastre standard de minim 1-2 ore.' }
    ]
  },
  '/animatori-copii-otopeni/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Căutați actori tineri, carismatici și pasionați pentru o petrecere în Otopeni? Kassia Events aduce personajele din povești direct la ușa voastră, fără costuri suplimentare de deplasare. Organizăm evenimente atât în zonele de case din Otopeni (Odăi, Ferme, Ana Aslan), cât și la locurile de joacă sau grădinițele locale.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Programe Premium pentru curți:</strong> Otopeni oferă spații exterioare excelente. Transformăm curtea într-un mic parc de distracții, cu întreceri pe echipe, sfoara curajului, jocuri cu parașuta colorată și ateliere de creație la umbră.</li>
  <li><strong>Implicare și pedagogie:</strong> Animatorii noștri știu cum să capteze atenția atât a copiilor mici (prin activități blânde, senzoriale), cât și a celor mai mărișori (prin jocuri de strategie sau battle-uri de dans).</li>
  <li><strong>Totul transparent:</strong> După cum puteți observa în secțiunea de oferte, ne bazăm pe corectitudine. Recomandăm prezența unui singur animator dacă sunt până în 12-15 copii, pentru ca atelierele de pictură și baloane să se desfășoare fără așteptări prea mari.</li>
</ul>`,
    newFaqs: [
      { q: 'Există costuri de transport pentru zona Odăi sau cartierele dinspre Tunari?', a: 'Nu, deplasarea animatorilor în tot orașul Otopeni este asigurată gratuit, direct la locația stabilită.' },
      { q: 'Petrecerea este la o grădiniță privată din Otopeni. Se pot face adaptări ale programului?', a: 'Da, ne coordonăm întotdeauna cu personalul grădinițelor pentru a respecta regulile interioare și planificăm jocurile astfel încât să se încadreze perfect în programul copiilor.' },
      { q: 'Cât durează momentul de face painting pentru un grup de 10 copii?', a: 'În medie, un animator alocă 20-30 de minute pentru a picta toți cei 10 copii. Din acest motiv, recomandăm pachetele de 2 ore, pentru a avea suficient timp și de jocuri active.' }
    ]
  },
  '/animatori-copii-chiajna/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Animăm cu succes petrecerile organizate acasă, în Militari Residence, Dudu, Roșu sau la restaurantele și terasele din zona Chiajna. Venim cu o structură clară de program, actori implicați și o atitudine proactivă, fără a adăuga taxe ascunse de deplasare.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Adaptare la ritmul aglomerat:</strong> Înțelegem dinamica din Militari Residence și zonele adiacente. Animatorii noștri sunt punctuali, vin pregătiți cu boxă portabilă proprie și se adaptează rapid la spațiul disponibil din apartament sau de la locul de joacă.</li>
  <li><strong>Scenarii personalizate:</strong> Pentru copiii de 3-5 ani recomandăm mascote blânde și jocuri cu muzică (Zumba Kids). Pentru grupele de vârstă școlară (7-10 ani), organizăm petreceri tip "petrecere de club", cu DJ/MC animator, concursuri de dans și trivia.</li>
  <li><strong>Prețuri corecte:</strong> Vă rugăm să analizați pachetele listate pe site-ul nostru. Varianta recomandată de 2 ore vă asigură că toți copiii primesc baloane modelate, sunt pictați pe față și au parte de un moment dedicat și emoționant la aducerea tortului.</li>
</ul>`,
    newFaqs: [
      { q: 'Asigurați deplasare gratuită în interiorul cartierului Militari Residence și satul Dudu?', a: 'Da, acoperim întreaga zonă a comunei Chiajna (inclusiv Roșu și Militari Residence) fără nicio taxă suplimentară de transport.' },
      { q: 'Ce se întâmplă dacă sunt invitați copii de vârste diferite (3 ani și 8 ani)?', a: 'Animatorul va adapta nivelul de complexitate al jocurilor, oferind roluri mai simple copiilor mici și provocări de îndemânare celor mai mari, astfel încât toți să se simtă incluși.' },
      { q: 'Cine aduce tortul pe fundalul sonor de "La Mulți Ani"?', a: 'Personajul animator este cel care face introducerea momentului, aprinde atmosfera și stă alături de copil la poze pe durata tăierii tortului.' }
    ]
  },
  '/animatori-copii-pantelimon-ilfov/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Venim cu surprize interactive direct la petrecerea ta din orașul Pantelimon și împrejurimi (Cernica, Dobroești). Dacă locuiți la casă, la apartament sau organizați evenimentul la unul din restaurantele cu ieșire la lac, echipa Kassia asigură o atmosferă festivă, bazată pe jocuri moderne și comunicare asertivă.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Jocuri pentru interior și exterior:</strong> Indiferent că aveți o curte mare sau doar o zonă restrânsă într-un living, aducem recuzita potrivită (tunelul bucuriei, parașuta colorată, pânza magică) și alternăm perioadele de efort fizic cu cele de concentrare creativă.</li>
  <li><strong>Actori, nu doar oameni în costume:</strong> Echipa noastră este selectată din tineri cu pregătire în lucrul cu copiii. Ei știu să gestioneze conflicte mici, să integreze copiii timizi și să asigure ordinea pe durata întregului program.</li>
  <li><strong>Optimizarea timpului:</strong> Vă recomandăm să rezervați personajele (conform pachetelor de pe această pagină) cu o oră după începerea evenimentului, pentru a le oferi timp micilor invitați să sosească, să mănânce și să se acomodeze cu spațiul.</li>
</ul>`,
    newFaqs: [
      { q: 'Costă în plus deplasarea în zona Cernica sau orașul Pantelimon?', a: 'Nu, nu avem costuri ascunse. Deplasarea în orașul Pantelimon și localitățile lipite de acesta se face gratuit.' },
      { q: 'Sunt culorile de pictură pe față sigure pentru pielea sensibilă a celor mici?', a: 'Folosim exclusiv vopsele profesionale (tip Diamond FX sau Snazaroo), omologate, non-toxice și hipoalergenice, care se spală foarte ușor doar cu apă și săpun.' },
      { q: 'Câți copii sunt recomandați pentru un singur animator la un botez?', a: 'Pentru a menține calitatea și a avea timp pentru fiecare copil, recomandăm maxim 12-15 copii la un singur animator. Peste acest număr, un al doilea animator este soluția ideală.' }
    ]
  },
  '/animatori-copii-corbeanca/': {
    newBody: `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Pentru o aniversare liniștită, plină de zâmbete și activități de calitate în ansamblurile rezidențiale din Corbeanca (Ostratu, Tamași, Petrești), Kassia Events este partenerul ideal. Nu percepem taxe adiționale pentru deplasarea în Corbeanca, iar animatorii noștri ajung cu 15 minute mai devreme pentru a se asigura că surpriza e perfectă.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Program complex pentru spații generoase:</strong> Profităm de spațiile verzi pe care casele din Corbeanca le oferă și încurajăm mișcarea fizică prin curse cu obstacole, competiții de îndemânare și jocuri pe echipe (care ajută la crearea spiritului fair-play).</li>
  <li><strong>Implicare pedagogică:</strong> Nu lăsăm copiii de capul lor! Un program de animație de 2 ore este atent structurat: o oră de efort susținut urmată de o oră de ateliere statice (<em>face painting</em>, modelaj baloane) pentru a le regla ritmul cardiac înainte de momentul tortului.</li>
  <li><strong>Diversitatea costumelor:</strong> Așa cum puteți observa în pachetele oferite mai sus, dispunem de o colecție impresionantă de personaje. Toate costumele noastre sunt impecabil întreținute și foarte fidele personajelor originale (prințese spectaculoase, supereroi cu costume detaliate).</li>
</ul>`,
    newFaqs: [
      { q: 'Vine echipa de animație în satele Tamași, Ostratu sau Petrești din comuna Corbeanca?', a: 'Da, ajungem la orice locație rezidențială sau comercială din comuna Corbeanca, fără a adăuga taxe de transport pe factură.' },
      { q: 'Copiii au în jur de 9-10 ani. Mai sunt potrivite personajele clasice?', a: 'La această vârstă recomandăm mai degrabă un program cu „Animator DJ/MC”, fără costum de personaj clasic, axat pe karaoke, dans, ghicitori, jocuri de strategie și trivia.' },
      { q: 'Se pot oferi și mașini de vată de zahăr sau popcorn?', a: 'Ne concentrăm exclusiv pe activitatea principală de animație (teatru, jocuri, pictură, baloane). Vă recomandăm să colaborați cu furnizori specializați pentru catering de petreceri, pe care noi îi vom coordona cu drag în timpul programului.' }
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
