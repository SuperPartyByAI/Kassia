import fs from 'fs';
import path from 'path';
import sharp from 'sharp';

const sourceDir = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';
const destDir = '/Users/universparty/wa-web-launcher/kassia-site/public/images/animatori-costume';

const catalogTitles = [
  "Prințesă tematică pentru petreceri copii",
  "Supererou pentru petreceri copii",
  "Mascotă veselă pentru aniversări",
  "Personaj de poveste pentru copii",
  "Costum tematic pentru animator copii",
  "Mascotă pentru momentul tortului",
  "Personaj tematic din catalogul Kassia",
  "Erou curajos pentru copii",
  "Zână magică pentru petreceri",
  "Mascotă prietenoasă",
  "Personaj îndrăgit pentru copii",
  "Costum de poveste"
];

async function run() {
  if (!fs.existsSync(destDir)) {
    fs.mkdirSync(destDir, { recursive: true });
  }

  const inventoryFile = 'audit_animatori_pillar_costume_gallery_v4/image_inventory.json';
  const inventory = JSON.parse(fs.readFileSync(inventoryFile));

  // Pick first 20 images
  const selectedImages = inventory.image_inventory.slice(0, 20);
  const catalogImgs = selectedImages.slice(0, 12);
  const galleryImgs = selectedImages.slice(12, 20);

  const finalSelection = [];

  // Process Catalog
  for (let i = 0; i < catalogImgs.length; i++) {
    const item = catalogImgs[i];
    const sourcePath = path.join(sourceDir, item.file);
    const safeName = `personaj-tematic-animatori-${(i + 1).toString().padStart(2, '0')}.webp`;
    const destPath = path.join(destDir, safeName);
    
    await sharp(sourcePath)
      .resize({ width: 900, withoutEnlargement: true })
      .webp({ quality: 80 })
      .toFile(destPath);
      
    finalSelection.push({
      selected_file: item.file,
      target_section: "catalog",
      sha256: item.sha256,
      optimized_file: safeName,
      generic_title: catalogTitles[i],
      safe_alt_text: catalogTitles[i],
      reason: "Catalog item"
    });
  }

  // Process Gallery
  for (let i = 0; i < galleryImgs.length; i++) {
    const item = galleryImgs[i];
    const sourcePath = path.join(sourceDir, item.file);
    const safeName = `galerie-petreceri-copii-kassia-${(i + 1).toString().padStart(2, '0')}.webp`;
    const destPath = path.join(destDir, safeName);
    
    await sharp(sourcePath)
      .resize({ width: 900, withoutEnlargement: true })
      .webp({ quality: 80 })
      .toFile(destPath);
      
    finalSelection.push({
      selected_file: item.file,
      target_section: "gallery",
      sha256: item.sha256,
      optimized_file: safeName,
      generic_title: `Fotografie de la o petrecere de copii Kassia ${i+1}`,
      safe_alt_text: `Fotografie de la o petrecere de copii Kassia ${i+1}`,
      reason: "Gallery item"
    });
  }

  fs.writeFileSync('audit_animatori_pillar_costume_gallery_v4/selected_images.json', JSON.stringify(finalSelection, null, 2));
  console.log("SELECTION_AND_OPTIMIZATION_DONE");
}

run();
