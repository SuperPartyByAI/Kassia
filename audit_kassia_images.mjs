import fs from 'fs';
import path from 'path';
import crypto from 'crypto';

const dir = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';

function getHash(file) {
  const content = fs.readFileSync(file);
  return crypto.createHash('sha256').update(content).digest('hex');
}

function run() {
  const exists = fs.existsSync(dir);
  let files = [];
  let valid_images = 0;
  let invalid_files = [];
  let duplicates = [];
  const inventory = [];
  const hashes = new Map();

  if (exists) {
    files = fs.readdirSync(dir).filter(f => !f.startsWith('.'));
    for (const f of files) {
      const p = path.join(dir, f);
      const stat = fs.statSync(p);
      if (stat.isFile()) {
        const ext = path.extname(f).toLowerCase();
        if (['.jpg', '.jpeg', '.png', '.webp'].includes(ext)) {
          const hash = getHash(p);
          if (hashes.has(hash)) {
            duplicates.push(f);
          } else {
            hashes.set(hash, f);
            valid_images++;
            inventory.push({
              file: f,
              sha256: hash,
              format: ext,
              size_kb: Math.round(stat.size / 1024)
            });
          }
        } else {
          invalid_files.push(f);
        }
      }
    }
  }

  const result = {
    source_folder_exists: exists,
    images_found: files.length,
    valid_images,
    invalid_files,
    duplicates_by_hash: duplicates,
    image_inventory: inventory
  };

  fs.writeFileSync('audit_animatori_pillar_costume_gallery_v4/image_inventory.json', JSON.stringify(result, null, 2));
  console.log("IMAGE_INVENTORY_DONE");
}

if (!fs.existsSync('audit_animatori_pillar_costume_gallery_v4')) {
  fs.mkdirSync('audit_animatori_pillar_costume_gallery_v4', { recursive: true });
}

run();
