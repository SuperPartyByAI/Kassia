const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

async function processDirectory(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    const stat = fs.statSync(fullPath);
    if (stat.isDirectory()) {
      await processDirectory(fullPath);
    } else if (file.toLowerCase().endsWith('.png')) {
      const outputPath = path.join(dir, file.replace(/\.png$/i, '.webp'));
      console.log(`Converting ${fullPath} to WebP...`);
      try {
        await sharp(fullPath)
          .webp({ quality: 80, effort: 6 })
          .toFile(outputPath);
        console.log(`Successfully converted ${file}. Deleting original PNG...`);
        fs.unlinkSync(fullPath);
      } catch (err) {
        console.error(`Error converting ${file}:`, err);
      }
    }
  }
}

processDirectory(path.join(__dirname, 'public/images'));
