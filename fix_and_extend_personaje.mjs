import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import { v4 as uuidv4 } from 'uuid';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  console.log("=== STARTING FIX AND EXTEND CATALOG ===");

  // 1. Get the Page ID
  const { data: pageData, error: pageErr } = await supabase
    .from('kassia_pages')
    .select('id')
    .eq('slug', 'personaje-animatori-copii-bucuresti')
    .single();

  if (pageErr || !pageData) {
    console.error("Failed to find page:", pageErr);
    process.exit(1);
  }
  const pageId = pageData.id;

  // 2. Backup existing sections and FAQs for this page
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId);
  const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pageId);

  fs.writeFileSync('db_backup_catalog_fix.json', JSON.stringify({ sections, faqs }, null, 2));
  console.log(`Backed up ${sections.length} sections and ${faqs.length} FAQs to db_backup_catalog_fix.json`);

  // 3. Fix Section Headings (Move content.title to heading)
  for (const sec of sections) {
    if (sec.content && sec.content.title && !sec.heading) {
      const newContent = { ...sec.content };
      const headingText = newContent.title;
      delete newContent.title;

      await supabase
        .from('kassia_page_sections')
        .update({ heading: headingText, content: newContent })
        .eq('id', sec.id);
    }
  }
  console.log("Fixed H2 headings for existing sections.");

  // 4. Fix FAQ raw HTML
  for (const faq of faqs) {
    if (faq.answer && faq.answer.includes('<p>')) {
      const cleanAnswer = faq.answer.replace(/<\/?p>/g, '');
      await supabase.from('kassia_faqs').update({ answer: cleanAnswer }).eq('id', faq.id);
    }
  }
  console.log("Fixed FAQ raw HTML tags.");

  // 5. Add Extended Catalog Section
  const catalogHtml = `
<p>Mai jos găsești o parte extinsă din colecția de personaje și costume disponibile pentru petreceri de copii, serbări, grădinițe, botezuri și evenimente tematice. Disponibilitatea fiecărui personaj se confirmă în funcție de data evenimentului și programul ales.</p>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 1 — Prințese, povești și basme</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Elsa</li><li>Anna</li><li>Olaf</li><li>Kristoff</li><li>Sven</li><li>Rapunzel</li><li>Flynn Rider</li><li>Pascal</li><li>Ariel</li><li>Sebastian</li><li>Flounder</li><li>Cenușăreasa</li><li>Nașa Zână</li><li>Belle</li><li>Bestia</li><li>Lumiere</li><li>Jasmine</li><li>Aladdin</li><li>Duhul lămpii</li><li>Abu</li><li>Moana / Vaiana</li><li>Maui</li><li>Albă ca Zăpada</li><li>Piticul Mutulică</li><li>Piticul Morocănos</li><li>Aurora</li><li>Maleficent</li><li>Merida</li><li>Mulan</li><li>Mushu</li><li>Tiana</li><li>Prințul Naveen</li><li>Pocahontas</li><li>Tinkerbell / Clopoțica</li><li>Peter Pan</li><li>Wendy</li><li>Căpitanul Hook</li><li>Alice</li><li>Pălărierul</li><li>Regina Inimilor</li><li>Pinocchio</li><li>Scufița Roșie</li><li>Lupul din poveste</li><li>Prințesă de gheață</li><li>Prințesă de poveste</li><li>Regină de poveste</li><li>Prinț de poveste</li><li>Cavaler</li><li>Zână</li><li>Sirenă</li><li>Unicorn</li><li>Dragon prietenos</li><li>Vrăjitor de poveste</li><li>Magician de basm</li><li>Spiriduș de poveste</li><li>Zmeu de poveste</li><li>Păpușă de poveste</li><li>Regina florilor</li><li>Prințesa curcubeu</li><li>Prințesa unicorn</li>
</ul>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 2 — Supereroi, acțiune și aventură</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Spider-Man</li><li>Miles Morales</li><li>Spider-Gwen</li><li>Venom</li><li>Batman</li><li>Robin</li><li>Batgirl</li><li>Superman</li><li>Supergirl</li><li>Wonder Woman</li><li>Flash</li><li>Aquaman</li><li>Green Lantern</li><li>Iron Man</li><li>Captain America</li><li>Hulk</li><li>Thor</li><li>Loki</li><li>Black Panther</li><li>Ant-Man</li><li>Wasp</li><li>Doctor Strange</li><li>Captain Marvel</li><li>Deadpool</li><li>Wolverine</li><li>Storm</li><li>Black Widow</li><li>Hawkeye</li><li>Joker</li><li>Harley Quinn</li><li>Bumblebee</li><li>Optimus Prime</li><li>Megatron</li><li>Transformers</li><li>Ninja</li><li>Ninja roșu</li><li>Ninja verde</li><li>Ninja albastru</li><li>Kai Ninjago</li><li>Lloyd Ninjago</li><li>Jay Ninjago</li><li>Cole Ninjago</li><li>Zane Ninjago</li><li>Leonardo TMNT</li><li>Raphael TMNT</li><li>Donatello TMNT</li><li>Michelangelo TMNT</li><li>Power Ranger roșu</li><li>Power Ranger albastru</li><li>Power Ranger roz</li><li>Avatar Aang</li><li>Katara</li><li>Harry Potter</li><li>Hermione</li><li>Dumbledore</li><li>Darth Vader</li><li>Jedi</li><li>Astronaut</li><li>Robot</li><li>Pirat</li><li>Căpitan pirat</li><li>Cowboy</li><li>Cowgirl</li><li>Războinic spațial</li><li>Erou de aventură</li>
</ul>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 3 — Desene animate, gaming și personaje moderne</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Mickey Mouse</li><li>Minnie Mouse</li><li>Donald Duck</li><li>Daisy Duck</li><li>Goofy</li><li>Pluto</li><li>Stitch</li><li>Angel</li><li>Sonic</li><li>Tails</li><li>Knuckles</li><li>Amy Rose</li><li>Shadow</li><li>Mario</li><li>Luigi</li><li>Peach</li><li>Yoshi</li><li>Toad</li><li>Bowser</li><li>Pikachu</li><li>Ash / Pokémon Trainer</li><li>Charmander</li><li>Squirtle</li><li>Bulbasaur</li><li>Eevee</li><li>Minecraft Steve</li><li>Minecraft Alex</li><li>Minecraft Creeper</li><li>Minecraft Enderman</li><li>Wednesday Addams</li><li>Enid Sinclair</li><li>Labubu</li><li>Bluey</li><li>Bingo</li><li>Bandit</li><li>Chilli</li><li>Gabby</li><li>Pandy Paws</li><li>Cakey Cat</li><li>Mercat</li><li>DJ Catnip</li><li>SuperKitties Ginny</li><li>SuperKitties Bitsy</li><li>SuperKitties Buddy</li><li>SuperKitties Sparks</li><li>Hello Kitty</li><li>Kuromi</li><li>My Melody</li><li>Cinnamoroll</li><li>Peppa Pig</li><li>George Pig</li><li>Mummy Pig</li><li>Daddy Pig</li><li>Cocomelon JJ</li><li>Masha</li><li>Ursul din Masha</li><li>Scooby Doo</li><li>Shaggy</li><li>Lightning McQueen</li><li>Mater</li><li>Barbie</li><li>Ken</li><li>Mirabel</li><li>Isabela</li><li>Luisa</li><li>Ladybug</li><li>Cat Noir</li><li>Minion Bob</li><li>Minion Kevin</li><li>Minion Stuart</li><li>Gumball</li><li>Darwin</li><li>Strumf</li><li>Strumfița</li><li>Bugs Bunny</li><li>Lola Bunny</li><li>Tom</li><li>Jerry</li><li>Garfield</li><li>Winnie the Pooh</li><li>Tigger</li><li>Piglet</li><li>Eeyore</li><li>Paddington</li><li>Miffy</li><li>Care Bear</li><li>Elmo</li><li>Cookie Monster</li><li>Big Bird</li><li>Dora</li><li>Boots</li><li>Diego</li><li>Blippi</li><li>Baby Shark</li><li>Pinkfong</li><li>Pocoyo</li><li>Pingu</li><li>Shaun the Sheep</li><li>Teletubby Tinky Winky</li><li>Teletubby Dipsy</li><li>Teletubby Laa-Laa</li><li>Teletubby Po</li><li>Boss Baby</li>
</ul>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 4 — Patrula Cățelușilor, PJ Masks și copii mici</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Patrula Cățelușilor / Paw Patrol</li><li>Chase</li><li>Marshall</li><li>Skye</li><li>Rubble</li><li>Everest</li><li>Rocky</li><li>Zuma</li><li>Ryder</li><li>Tracker</li><li>Catboy</li><li>Owlette</li><li>Gekko</li><li>PJ Robot</li>
</ul>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 5 — Mascote animale și personaje tematice</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Mascotă ursuleț</li><li>Mascotă iepuraș</li><li>Mascotă cățel</li><li>Mascotă pisică</li><li>Mascotă panda</li><li>Mascotă pinguin</li><li>Mascotă tigru</li><li>Mascotă leu</li><li>Girafă</li><li>Elefant</li><li>Maimuță</li><li>Dinozaur</li><li>Dragon vesel</li><li>Fluturaș</li><li>Albinuță</li><li>Buburuză</li><li>Rățușcă</li><li>Cal</li><li>Ponei</li><li>Rechin</li><li>Crocodil</li><li>Vulpe</li><li>Lup</li><li>Bufniță</li><li>Koala</li><li>Broască țestoasă</li>
</ul>

<h3 style="color: var(--primary-dark); margin-top: 2rem; margin-bottom: 1rem; font-size: 1.5rem; font-weight: 700;">Categoria 6 — Sărbători, serbări și evenimente speciale</h3>
<ul style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 10px; list-style: none; padding: 0;">
  <li>Moș Crăciun</li><li>Crăciuniță</li><li>Spiriduș</li><li>Spiridușă</li><li>Rudolf</li><li>Ren</li><li>Om de zăpadă</li><li>Grinch</li><li>Brad de Crăciun</li><li>Turtă dulce / Gingerbread</li><li>Iepurașul de Paște</li><li>Iepuriță de Paște</li><li>Puișor de Paște</li><li>Mascotă de primăvară</li><li>Vrăjitoare</li><li>Dovleac</li><li>Vampir prietenos</li><li>Fantomă veselă</li><li>Schelet prietenos</li><li>Pisică neagră Halloween</li><li>Liliac Halloween</li><li>Clovn</li><li>Magician</li><li>Mimoz / Mime</li><li>Prezentator copii / MC</li><li>Balerină</li><li>Dansatoare</li><li>Doctor</li><li>Pompier</li><li>Polițist</li><li>Bucătar</li><li>Personaj de carnaval</li>
</ul>

<p style="margin-top: 2rem;">Lista de mai sus include o parte importantă din colecția de personaje și costume disponibile. Pentru alegerea finală, trimite detaliile petrecerii, vârsta copiilor, tematica dorită și data evenimentului, iar echipa Kassia confirmă variantele disponibile.</p>
  `;

  // Get max order index for this page
  const { data: maxOrderData } = await supabase
    .from('kassia_page_sections')
    .select('order_index')
    .eq('page_id', pageId)
    .order('order_index', { ascending: false })
    .limit(1);

  let nextOrder = 100;
  if (maxOrderData && maxOrderData.length > 0) {
    nextOrder = maxOrderData[0].order_index + 1;
  }

  // Insert Extended Catalog Section
  const extendedCatalogSection = {
    id: uuidv4(),
    page_id: pageId,
    section_type: 'content_block',
    order_index: nextOrder,
    heading: 'Catalog extins de personaje disponibile',
    content: {
      body: catalogHtml,
      cta_text: 'Trimite detaliile petrecerii',
      cta_url: 'https://wa.me/40768098268?text=Buna!%20As%20dori%20detalii%20despre%20animatori%20pentru%20petrecere%20copii.'
    }
  };

  const { error: insertErr } = await supabase.from('kassia_page_sections').insert(extendedCatalogSection);
  if (insertErr) {
    console.error("Failed to insert extended catalog:", insertErr);
  } else {
    console.log("Successfully inserted extended catalog section.");
  }

  console.log("=== DONE ===");
}

run();
