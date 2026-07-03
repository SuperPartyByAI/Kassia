import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
import fs from 'fs';

config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data: page, error: pageErr } = await supabase
    .from('kassia_pages')
    .select('id')
    .eq('path', '/animatori-petreceri-copii/')
    .single();

  if (pageErr) {
    console.error("Page error", pageErr);
    return;
  }
  const pageId = page.id;

  const inventoryFile = JSON.parse(fs.readFileSync('audit_animatori_pillar_costume_gallery_v4/selected_images.json'));
  const catalogImages = inventoryFile.filter(img => img.target_section === 'catalog');
  const galleryImages = inventoryFile.filter(img => img.target_section === 'gallery');

  // Insert or Update Catalog Section (Costume)
  const { data: existingSections } = await supabase
    .from('kassia_page_sections')
    .select('id, section_type')
    .eq('page_id', pageId)
    .eq('section_type', 'costume_catalog');

  const catalogContent = {
    body: "Poți combina programul de animație cu personaje tematice, mascote și costume potrivite pentru vârsta copiilor, tema petrecerii și spațiul ales. Disponibilitatea se confirmă în funcție de data evenimentului.",
    cards: catalogImages.map(img => ({
      image_url: `/images/animatori-costume/${img.optimized_file}`,
      title: img.generic_title,
      cta_text: "Verifică disponibilitatea personajului",
      cta_url: "/contact/"
    }))
  };

  if (existingSections && existingSections.length > 0) {
    // Update
    await supabase.from('kassia_page_sections')
      .update({
        heading: "Alege personajul sau mascota pentru petrecerea copilului",
        content: JSON.stringify(catalogContent)
      })
      .eq('id', existingSections[0].id);
  } else {
    // Insert
    // First figure out the order index to put it somewhere (e.g. at the bottom before gallery)
    const { data: allSec } = await supabase
      .from('kassia_page_sections')
      .select('order_index')
      .eq('page_id', pageId)
      .order('order_index', { ascending: false })
      .limit(1);
    
    let maxOrder = allSec && allSec.length > 0 ? allSec[0].order_index : 10;
    
    await supabase.from('kassia_page_sections').insert({
      page_id: pageId,
      section_type: 'costume_catalog',
      heading: "Alege personajul sau mascota pentru petrecerea copilului",
      content: JSON.stringify(catalogContent),
      order_index: maxOrder + 1
    });
  }

  // Insert or Update Gallery heading
  const { data: existingGallerySection } = await supabase
    .from('kassia_page_sections')
    .select('id, section_type')
    .eq('page_id', pageId)
    .eq('section_type', 'gallery');

  if (existingGallerySection && existingGallerySection.length > 0) {
    await supabase.from('kassia_page_sections')
      .update({
        heading: "Galerie petreceri copii Kassia"
      })
      .eq('id', existingGallerySection[0].id);
  } else {
    const { data: allSec } = await supabase
      .from('kassia_page_sections')
      .select('order_index')
      .eq('page_id', pageId)
      .order('order_index', { ascending: false })
      .limit(1);
    let maxOrder = allSec && allSec.length > 0 ? allSec[0].order_index : 10;
    
    await supabase.from('kassia_page_sections').insert({
      page_id: pageId,
      section_type: 'gallery',
      heading: "Galerie petreceri copii Kassia",
      content: JSON.stringify({}),
      order_index: maxOrder + 2
    });
  }

  // Insert gallery items into kassia_gallery_items
  // Delete old generic gallery items if any or just upsert by URL
  for (let i = 0; i < galleryImages.length; i++) {
    const img = galleryImages[i];
    const url = `/images/animatori-costume/${img.optimized_file}`;
    
    // check if exists
    const { data: extImg } = await supabase
      .from('kassia_gallery_items')
      .select('id')
      .eq('page_id', pageId)
      .eq('url', url);

    if (!extImg || extImg.length === 0) {
      await supabase.from('kassia_gallery_items').insert({
        page_id: pageId,
        url: url,
        alt_text: img.generic_title,
        order_index: (i + 1) * 10
      });
    }
  }

  console.log("INSERT_DONE");
}

run();
