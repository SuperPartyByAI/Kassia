import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const sectorsData = {
  1: {
    areas: "Băneasa, Aviației, Bucureștii Noi, Herăstrău, Domenii, Aviatorilor, Dorobanți și Floreasca",
    shortAreas: "Primăverii, Dorobanți, Floreasca, Băneasa"
  },
  2: {
    areas: "Obor, Colentina, Pantelimon, Iancului, Ștefan cel Mare, Tei, Moșilor și Fundeni",
    shortAreas: "Obor, Colentina, Iancului, Ștefan cel Mare"
  },
  3: {
    areas: "Titan, Dristor, Vitan, Balta Albă, Unirii, Timpuri Noi și Vitan-Bârzești",
    shortAreas: "Titan, Dristor, Vitan, Unirii"
  },
  4: {
    areas: "Berceni, Tineretului, Apărătorii Patriei, Olteniței, Giurgiului, Văcărești și Brâncoveanu",
    shortAreas: "Berceni, Tineretului, Apărătorii Patriei"
  },
  5: {
    areas: "Rahova, 13 Septembrie, Ferentari, Cotroceni, Sebastian și Panduri",
    shortAreas: "13 Septembrie, Cotroceni, Rahova"
  },
  6: {
    areas: "Drumul Taberei, Militari, Crângași, Giulești și Ghencea",
    shortAreas: "Drumul Taberei, Militari, Crângași"
  }
};

async function run() {
  for (let s = 1; s <= 6; s++) {
    const slug = `animatori-petreceri-copii-sector-${s}`;
    console.log(`Processing ${slug}...`);
    
    // Get page
    const { data: page, error: pageErr } = await supabase.from('kassia_pages').select('id').eq('slug', slug).single();
    if (pageErr || !page) {
      console.error(`Page not found: ${slug}`);
      continue;
    }
    
    // Get sections
    const { data: sections, error: secErr } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    if (secErr || !sections) {
      console.error(`Error fetching sections for ${slug}`);
      continue;
    }

    const { areas, shortAreas } = sectorsData[s];

    // Find the 'Animatori la domiciliu...' section (usually order_index 5)
    let domSection = sections.find(sec => sec.heading && (sec.heading.includes(`grădiniță sau spațiu de joacă`) || sec.heading.includes('Suntem acolo unde')));
    
    // If not found, look for something similar or just create one. Actually, let's update it if found, or insert.
    if (domSection) {
      console.log(`Found domicilil section for Sector ${s} (id: ${domSection.id})`);
      
      const newBody = `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Căutați actori pasionați și personaje autentice pentru petrecerea celui mic? Ne deplasăm rapid și <strong>fără taxe ascunse de transport</strong> în tot Sectorul ${s}. Acoperim integral cartierele rezidențiale liniștite și zonele aglomerate din <strong>${areas}</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Pentru curți și vile:</strong> Sectorul ${s} ne oferă adesea spații generoase în aer liber. Venim cu o recuzită profesională pentru concursuri interactive, ștafete și jocuri de echipă care consumă energia copiilor într-un mod educativ.</li>
  <li><strong>Restaurante și grădinițe private:</strong> Ne coordonăm cu personalul locației pentru a nu deranja alți clienți. Adaptăm volumul muzicii și transformăm rapid spațiul într-un atelier de <em>face painting</em> și modelaj de baloane.</li>
  <li><strong>Alegerea numărului de animatori:</strong> Așa cum puteți vedea în oferta noastră detaliată, pentru grupuri de 8–12 copii acasă, un singur animator este suficient; pentru grupuri mai mari sau restaurant/curte recomandăm prezența a 2 animatori pentru un program mai fluid.</li>
</ul>`;

      let content = typeof domSection.content === 'string' ? JSON.parse(domSection.content) : domSection.content;
      content.body = newBody;
      content.heading = `Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector ${s}`;
      
      await supabase.from('kassia_page_sections').update({ content: content, heading: content.heading }).eq('id', domSection.id);
      console.log(`Updated domicilil section for Sector ${s}`);
    } else {
      console.log(`Domicilil section NOT FOUND for Sector ${s}, looking for order 5...`);
      // Update order 5 if it exists and is service_details
      let sec5 = sections.find(sec => sec.order_index === 5);
      if (sec5 && sec5.section_type === 'service_details') {
          let content = typeof sec5.content === 'string' ? JSON.parse(sec5.content) : sec5.content;
          content.body = `<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Căutați actori pasionați și personaje autentice pentru petrecerea celui mic? Ne deplasăm rapid și <strong>fără taxe ascunse de transport</strong> în tot Sectorul ${s}. Acoperim integral cartierele rezidențiale liniștite și zonele aglomerate din <strong>${areas}</strong>.</p>
<ul style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem; padding-left:1.5rem;">
  <li><strong>Pentru curți și vile:</strong> Sectorul ${s} ne oferă adesea spații generoase în aer liber. Venim cu o recuzită profesională pentru concursuri interactive, ștafete și jocuri de echipă care consumă energia copiilor într-un mod educativ.</li>
  <li><strong>Restaurante și grădinițe private:</strong> Ne coordonăm cu personalul locației pentru a nu deranja alți clienți. Adaptăm volumul muzicii și transformăm rapid spațiul într-un atelier de <em>face painting</em> și modelaj de baloane.</li>
</ul>`;
          content.heading = `Animatori la domiciliu, la restaurant, grădiniță sau spațiu de joacă în Sector ${s}`;
          await supabase.from('kassia_page_sections').update({ content: content, heading: content.heading }).eq('id', sec5.id);
          console.log(`Updated order 5 for Sector ${s}`);
      }
    }

    // Find the content_block for characters
    let charsSection = sections.find(sec => sec.content && JSON.stringify(sec.content).includes('Alegerea personajului'));
    if (charsSection) {
      let content = typeof charsSection.content === 'string' ? JSON.parse(charsSection.content) : charsSection.content;
      content.body = `<p>Pentru petrecerile organizate în Sector ${s} (${shortAreas} etc.), poți alege dintr-o varietate de peste 300 de personaje pentru copii. Colecția include prințese, supereroi, mascote prietenoase și figuri populare din desene animate. Disponibilitatea se confirmă împreună cu echipa noastră în momentul rezervării.</p>`;
      
      await supabase.from('kassia_page_sections').update({ content: content }).eq('id', charsSection.id);
      console.log(`Updated characters block for Sector ${s}`);
    }

    // Update Hero section subtitle to be unique
    let heroSec = sections.find(sec => sec.section_type === 'hero');
    if (heroSec) {
      let content = typeof heroSec.content === 'string' ? JSON.parse(heroSec.content) : heroSec.content;
      content.body = `Creează o experiență de neuitat pentru copilul tău cu animatori profesioniști în Sectorul ${s}. Venim cu personaje iubite, jocuri interactive, pictură pe față și baloane modelate, direct la locația ta din ${shortAreas} (fără taxe de transport)!`;
      await supabase.from('kassia_page_sections').update({ content: content }).eq('id', heroSec.id);
      console.log(`Updated Hero section for Sector ${s}`);
    }
  }
}

run().then(() => console.log('Done'));
