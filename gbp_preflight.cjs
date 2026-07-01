const fs = require('fs');
const path = require('path');

const SOURCE_FOLDER = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';

let result = {
  source_folder: SOURCE_FOLDER,
  expected_maps_photo_count: 75,
  actual_image_count_in_source_folder: 0,
  image_files_sorted: [],
  non_image_files: [],
  zero_byte_files: [],
  corrupt_or_unreadable_files: [],
  ready_for_upload: false
};

if (fs.existsSync(SOURCE_FOLDER)) {
  const files = fs.readdirSync(SOURCE_FOLDER);
  for (const file of files) {
    const fullPath = path.join(SOURCE_FOLDER, file);
    const stat = fs.statSync(fullPath);
    if (!stat.isDirectory()) {
      const ext = path.extname(file).toLowerCase();
      if (['.jpg', '.jpeg', '.png', '.webp'].includes(ext)) {
        if (stat.size === 0) {
          result.zero_byte_files.push(file);
        } else {
          result.actual_image_count_in_source_folder++;
          result.image_files_sorted.push(file);
        }
      } else {
        result.non_image_files.push(file);
      }
    }
  }
}

result.image_files_sorted.sort();
if (result.actual_image_count_in_source_folder === 75 && result.zero_byte_files.length === 0 && result.corrupt_or_unreadable_files.length === 0) {
  result.ready_for_upload = true;
}

console.log(JSON.stringify(result, null, 2));
