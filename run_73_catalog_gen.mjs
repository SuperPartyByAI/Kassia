import fs from 'fs';
import path from 'path';
import sharp from 'sharp';
import crypto from 'crypto';

const srcDir = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';
const outDir = '/Users/universparty/wa-web-launcher/kassia-site/public/images/animatori-costume';
const auditDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_animatori_pillar_costume_gallery_v4';

if (!fs.existsSync(outDir)) {
  fs.mkdirSync(outDir, { recursive: true });
}
if (!fs.existsSync(auditDir)) {
  fs.mkdirSync(auditDir, { recursive: true });
}

// Brand safe vocabulary
const types = [
  'Prințesă tematică', 'Supererou', 'Mascotă veselă', 'Personaj de poveste', 'Costum tematic',
  'Animator vesel', 'Mascotă prietenoasă', 'Zână', 'Pirat', 'Cavaler', 'Personaj magic'
];

const attributes = [
  'cu rochie elegantă', 'în costum strălucitor', 'foarte îndrăgit de copii', 'plin de energie',
  'cu detalii premium', 'foarte pufos și moale', 'colorat și vesel', 'cu pelerină lungă',
  'mereu zâmbitor', 'gata de joacă', 'foarte fotogenic', 'elegant și grațios',
  'cu mască și mantie', 'cu pălărie și sabie de jucărie', 'cu sclipici', 'uimitor de agil'
];

const scenarios = [
  'pentru momentul tortului', 'pentru jocuri dinamice', 'pentru poze memorabile cu invitații',
  'pentru aniversări de neuitat', 'pentru petreceri în aer liber', 'pentru o atmosferă magică',
  'care aduce zâmbete garantate', 'ideal pentru surprize muzicale', 'pentru activități interactive',
  'perfect pentru mini-disco', 'pentru întâmpinarea invitaților', 'pentru sesiuni de pictură pe față'
];

async function run() {
  const files = fs.readdirSync(srcDir).filter(f => f.match(/\.(jpg|jpeg|png|webp|avif)$/i));
  let count = 0;
  
  const inventory = {
    source_images_found: files.length,
    valid_source_images: 0,
    duplicates_by_hash: [],
    images: []
  };

  const catalog = [];
  const hashes = new Set();
  const usedTitles = new Set();
  const usedAlts = new Set();
  const usedDesc = new Set();

  for (let i = 0; i < files.length; i++) {
    const f = files[i];
    const srcPath = path.join(srcDir, f);
    const buf = fs.readFileSync(srcPath);
    const hash = crypto.createHash('sha256').update(buf).digest('hex');
    
    if (hashes.has(hash)) {
      inventory.duplicates_by_hash.push(f);
      continue;
    }
    hashes.add(hash);
    inventory.valid_source_images++;

    // Generate unique copy
    let title, alt, desc;
    let attempts = 0;
    while(true) {
      attempts++;
      const t = types[(i + attempts) % types.length];
      const a = attributes[(i * 3 + attempts) % attributes.length];
      const s = scenarios[(i * 5 + attempts) % scenarios.length];
      
      title = `${t} ${a}`;
      alt = `Imagine cu ${t.toLowerCase()} ${a} la o petrecere de copii, ${s}`;
      desc = `Un ${t.toLowerCase()} ${a}, absolut ${s}. Ideal pentru a surprinde copiii la petrecere! (Ref: ${String(i).padStart(2,'0')})`;
      
      if (!usedTitles.has(title) && !usedAlts.has(alt) && !usedDesc.has(desc)) {
        usedTitles.add(title);
        usedAlts.add(alt);
        usedDesc.add(desc);
        break;
      }
    }

    // Process image
    const optimizedFile = `catalog-costume-kassia-${String(count + 1).padStart(2, '0')}.webp`;
    const outPath = path.join(outDir, optimizedFile);
    
    const meta = await sharp(buf).metadata();
    const width = meta.width || 0;
    const height = meta.height || 0;
    
    inventory.images.push({
      source_file: f,
      sha256: hash,
      width, height, format: meta.format || 'unknown',
      size_kb: Math.round(buf.length / 1024)
    });

    // Resize max 1000px, webp
    let s = sharp(buf);
    if (width > 1000) {
      s = s.resize(1000, null, { withoutEnlargement: true });
    }
    await s.webp({ quality: 80 }).toFile(outPath);
    
    const finalMeta = await sharp(outPath).metadata();

    catalog.push({
      source_file: f,
      optimized_file: `/images/animatori-costume/${optimizedFile}`,
      generic_title: title,
      short_description: desc,
      safe_alt_text: alt,
      category: types[i % types.length].includes('Mascot') ? 'mascotă' : 'personaj tematic',
      brand_risky_terms_used: false,
      width: finalMeta.width,
      height: finalMeta.height
    });

    count++;
  }

  fs.writeFileSync(path.join(auditDir, 'full_73_inventory.json'), JSON.stringify(inventory, null, 2));
  fs.writeFileSync(path.join(auditDir, 'full_73_catalog_copy.json'), JSON.stringify(catalog, null, 2));
  
  console.log(`Processed ${count} images.`);
}
run();
