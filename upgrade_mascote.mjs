import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/mascote-petreceri-copii-bucuresti/').single();
  const pageId = page.id;

  // 1. Fix FAQ raw HTML
  const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pageId);
  for (const faq of faqs) {
    let newAnswer = faq.answer.replace(/<p>/g, '').replace(/<\/p>/g, '');
    await supabase.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
  }
  console.log('FAQs cleaned.');

  // 2. Editorial Cleanup & Semantic Clarification
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId);
  for (const sec of sections) {
    if (sec.content && sec.content.body) {
      let body = sec.content.body;
      
      // Basic replacements
      body = body.replace(/Mascote Spectaculoase/gi, 'Mascote pentru Petreceri Copii');
      body = body.replace(/Momentul de Uimire Maximă/gi, 'Momentul Surpriză');
      body = body.replace(/Wow!/gi, 'deosebit');
      body = body.replace(/colecție impresionantă/gi, 'colecție mare');
      body = body.replace(/impresionantă/gi, 'mare');
      body = body.replace(/impact vizual masiv/gi, 'impact vizual clar');
      body = body.replace(/fabulos/gi, 'atrăgător');
      body = body.replace(/clasicul suprem/gi, 'un moment clasic');
      body = body.replace(/cele mai înalte standarde de curățenie și estetică/gi, 'un nivel ridicat de curățenie și estetică');
      body = body.replace(/cele mai înalte standarde/gi, 'atenție la detalii');
      body = body.replace(/igienă strictă/gi, 'curățenie');
      body = body.replace(/Chiar dacă operăm cu variante adecvate și neprotejate comercial, expresivitatea și designul/gi, 'Expresivitatea și designul');
      body = body.replace(/variante adecvate și neprotejate comercial/gi, '');
      body = body.replace(/experiență deosebită/gi, 'experiență frumoasă');
      
      // Banned words
      body = body.replace(/ofertă|oferte|pachet|pachete|perfect|ideal|garantat|premium|excelent|impecabil|spectaculos|gratuit|non-toxic|antialergic|hipoalergenic|face painting/gi, '');
      
      body = body.replace(/transport gratuit/gi, 'transport inclus');

      // Add Semantic Clarification in Hero (order_index: 1)
      if (sec.order_index === 1 && !body.includes('catalog extins de personaje')) {
         const semantics = `<p>Pentru claritate, în organizarea noastră: <strong>Mascotele</strong> reprezintă costume voluminoase, de tip mascotă, potrivite pentru apariții, fotografii, întâmpinare, dans, momentul tortului și interacțiune vizuală. În schimb, colecția de <strong>Personaje</strong> reprezintă un catalog extins de personaje tematice, prințese, supereroi, personaje moderne, sezoniere și mascote.</p>`;
         body = body.replace('</div>', semantics + '</div>');
      }

      await supabase.from('kassia_page_sections').update({ content: { body } }).eq('id', sec.id);
    }
  }
  console.log('Editorial cleanup complete.');

  // 3. Add Catalog of 100+ Mascots
  const catalogBody = `
    <h2>Mascote disponibile pentru petreceri de copii</h2>
    <p>Kassia are peste 100 de mascote și costume de mascotă pentru petreceri de copii, evenimente de familie, serbări și evenimente cu tematică pentru copii în București și Ilfov. Disponibilitatea unei mascote se confirmă în funcție de data evenimentului, locație și program.</p>
    
    <h3>Mascote clasice pentru copii</h3>
    <ul>
      <li>Mickey Mouse</li><li>Minnie Mouse</li><li>Donald Duck</li><li>Daisy Duck</li><li>Goofy</li><li>Pluto</li><li>Bugs Bunny</li><li>Lola Bunny</li><li>Tom</li><li>Jerry</li><li>Scooby Doo</li><li>Shaggy</li><li>Garfield</li><li>SpongeBob</li><li>Patrick Star</li>
    </ul>

    <h3>Mascote Paw Patrol și eroi pentru copii mici</h3>
    <ul>
      <li>Chase</li><li>Marshall</li><li>Skye</li><li>Rubble</li><li>Everest</li><li>Rocky</li><li>Zuma</li><li>Ryder</li><li>Bluey</li><li>Bingo</li><li>Peppa Pig</li><li>George Pig</li><li>Baby Shark</li><li>Pinkfong</li><li>Cocomelon JJ</li>
    </ul>

    <h3>Mascote moderne, gaming și personaje populare</h3>
    <ul>
      <li>Stitch</li><li>Angel</li><li>Sonic</li><li>Tails</li><li>Knuckles</li><li>Mario</li><li>Luigi</li><li>Peach</li><li>Yoshi</li><li>Pikachu</li><li>Minecraft Creeper</li><li>Minecraft Steve</li><li>Minion Bob</li><li>Minion Kevin</li><li>Minion Stuart</li>
    </ul>

    <h3>Mascote pisicuțe, ursuleți și personaje blânde</h3>
    <ul>
      <li>Hello Kitty</li><li>Kuromi</li><li>My Melody</li><li>Cinnamoroll</li><li>Winnie the Pooh</li><li>Tigger</li><li>Piglet</li><li>Eeyore</li><li>Masha</li><li>Ursul din Masha</li><li>Gabby</li><li>Pandy Paws</li><li>Cakey Cat</li><li>Mercat</li><li>DJ Catnip</li><li>SuperKitties Ginny</li><li>SuperKitties Bitsy</li>
    </ul>

    <h3>Mascote supereroi și acțiune</h3>
    <ul>
      <li>Spider-Man</li><li>Batman</li><li>Bumblebee</li><li>Optimus Prime</li><li>Catboy</li><li>Owlette</li><li>Gekko</li><li>PJ Robot</li><li>Lightning McQueen</li><li>Mater</li>
    </ul>

    <h3>Mascote animale</h3>
    <ul>
      <li>Unicorn</li><li>Dinozaur</li><li>Dragon</li><li>Panda</li><li>Ursuleț</li><li>Iepuraș</li><li>Cățel</li><li>Pisică</li><li>Tigru</li><li>Leu</li><li>Elefant</li><li>Girafă</li><li>Maimuță</li><li>Pinguin</li><li>Rechin</li><li>Crocodil</li><li>Fluturaș</li><li>Albinuță</li>
    </ul>

    <h3>Mascote sezoniere și evenimente tematice</h3>
    <ul>
      <li>Moș Crăciun</li><li>Crăciuniță</li><li>Spiriduș</li><li>Spiridușă</li><li>Rudolf</li><li>Om de zăpadă</li><li>Grinch</li><li>Brad de Crăciun</li><li>Turtă dulce</li><li>Iepurașul de Paște</li><li>Iepuriță de Paște</li><li>Puișor de Paște</li><li>Vrăjitoare</li><li>Dovleac</li><li>Vampir prietenos</li><li>Fantomă veselă</li><li>Schelet prietenos</li><li>Pisică neagră Halloween</li><li>Liliac Halloween</li><li>Clovn</li><li>Magician</li><li>Mime</li>
    </ul>
  `;

  // Delete previous catalog if we run script multiple times
  await supabase.from('kassia_page_sections').delete().eq('page_id', pageId).eq('order_index', 80);
  
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    section_type: 'text',
    order_index: 80,
    content: { body: catalogBody }
  });
  console.log('Catalog inserted.');

  // 4. Add Link to Personaje
  const linkPersonajeBody = `
    <div class="content-section">
      <h2>Vezi catalogul de personaje disponibile</h2>
      <p>Pentru alegerea tematicii, poți consulta și catalogul de personaje Kassia, unde sunt prezentate peste 300 de costume și personaje pentru petreceri de copii în București și Ilfov.</p>
      <a href="/personaje-animatori-copii-bucuresti/" class="btn-primary">Vezi personajele disponibile</a>
    </div>
  `;
  
  await supabase.from('kassia_page_sections').delete().eq('page_id', pageId).eq('order_index', 81);
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    section_type: 'text',
    order_index: 81,
    content: { body: linkPersonajeBody }
  });
  console.log('Link to Personaje inserted.');

}

run();
