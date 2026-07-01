const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const child_process = require('child_process');

const FOLDERS_TO_CHECK = [
  '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze',
  '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo',
  '/Users/universparty/Desktop/Kassia_GBP_Photos'
];

let result = {
  photo_audit_type: "technical_only",
  ai_or_authenticity_checked: false,
  folders_checked: [],
  total_images_found: 0,
  valid_images: [],
  duplicates_by_sha256: [],
  zero_byte_files: [],
  corrupt_or_unreadable_files: [],
  logo_candidate: "",
  cover_candidate: "",
  post_images_selected: [],
  gallery_images_selected: []
};

const hashes = {};
const duplicates = new Set();

function getFileHash(filePath) {
  const fileBuffer = fs.readFileSync(filePath);
  const hashSum = crypto.createHash('sha256');
  hashSum.update(fileBuffer);
  return hashSum.digest('hex');
}

function scanFolder(folder) {
  if (!fs.existsSync(folder)) return;
  result.folders_checked.push(folder);
  
  const files = fs.readdirSync(folder);
  for (const file of files) {
    const fullPath = path.join(folder, file);
    const stat = fs.statSync(fullPath);
    
    if (stat.isDirectory()) {
      scanFolder(fullPath);
    } else {
      const ext = path.extname(file).toLowerCase();
      if (['.jpg', '.jpeg', '.png', '.webp'].includes(ext)) {
        if (stat.size === 0) {
          result.zero_byte_files.push(fullPath);
          continue;
        }
        
        let hash;
        try {
           hash = getFileHash(fullPath);
        } catch (e) {
           result.corrupt_or_unreadable_files.push(fullPath);
           continue;
        }
        
        if (hashes[hash]) {
           duplicates.add(hash);
           hashes[hash].push(fullPath);
        } else {
           hashes[hash] = [fullPath];
        }
        
        result.total_images_found++;
        result.valid_images.push({
          filename: file,
          path: fullPath,
          extension: ext,
          size_bytes: stat.size,
          sha256: hash
        });
      }
    }
  }
}

FOLDERS_TO_CHECK.forEach(scanFolder);

for (const hash of duplicates) {
  result.duplicates_by_sha256.push({
    hash: hash,
    files: hashes[hash]
  });
}

// Mapare candidati 
let validPaths = result.valid_images.map(img => img.path);

const findFile = (namePart) => validPaths.find(p => p.includes(namePart));

result.logo_candidate = findFile('logo.png') || "";
result.cover_candidate = findFile('party2_mickey') || "";
result.post_images_selected = [
  findFile('party2_mickey') || "",
  findFile('mickey_mouse') || "",
  findFile('pink_silver_princess') || "",
  findFile('party2_sonic') || "",
  findFile('party2_bumblebee') || ""
].filter(Boolean);

// Gallery - All unique images minus logo/cover
let uniquePaths = [];
for (const hash in hashes) {
  uniquePaths.push(hashes[hash][0]);
}
result.gallery_images_selected = uniquePaths.filter(p => p !== result.logo_candidate && p !== result.cover_candidate);

fs.writeFileSync('/Users/universparty/Desktop/Kassia_GBP_Photo_Audit.json', JSON.stringify(result, null, 2));

// Generate Contact Sheet via HTML/CSV
let csvContent = "Index,Filename,Folder,SHA256,Size\\n";
result.valid_images.forEach((img, idx) => {
    csvContent += (idx + 1) + ',"' + img.filename + '","' + path.dirname(img.path) + '","' + img.sha256 + '",' + img.size_bytes + '\\n';
});
fs.writeFileSync('/Users/universparty/Desktop/Kassia_GBP_Photo_Inventory.csv', csvContent);

console.log("AUDIT DONE. Total images: " + result.total_images_found);
