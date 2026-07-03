import fs from 'fs';
import path from 'path';
import sharp from 'sharp';
import crypto from 'crypto';

const srcDir = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';
const outDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_animatori_pillar_costume_gallery_v4';

if (!fs.existsSync(outDir)) {
  fs.mkdirSync(outDir, { recursive: true });
}

async function run() {
  const files = fs.readdirSync(srcDir).filter(f => f.match(/\.(jpg|jpeg|png|webp|avif)$/i));
  const results = [];
  const hashes = new Set();
  const duplicates = [];

  for (const f of files) {
    const p = path.join(srcDir, f);
    const buf = fs.readFileSync(p);
    const hash = crypto.createHash('sha256').update(buf).digest('hex');
    if (hashes.has(hash)) {
      duplicates.push(f);
      continue;
    }
    hashes.add(hash);
    const meta = await sharp(buf).metadata();
    results.push({
      source_file: f,
      sha256: hash,
      width: meta.width || 0,
      height: meta.height || 0,
      format: meta.format || 'unknown',
      size_kb: Math.round(buf.length / 1024)
    });
  }

  const report = {
    source_images_found: files.length,
    valid_source_images: results.length,
    duplicates_by_hash: duplicates,
    images: results
  };

  fs.writeFileSync(path.join(outDir, 'full_73_inventory.json'), JSON.stringify(report, null, 2));
  console.log('Inventory done', results.length, 'images found.');
}
run();
