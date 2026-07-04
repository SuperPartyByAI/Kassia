import fs from 'fs';
const file = 'src/components/Header.astro';
let content = fs.readFileSync(file, 'utf8');

// Remove dropdowns from desktop nav
content = content.replace(/<div class="dropdown">[\s\S]*?<\/div>\s*<\/div>\s*<\/div>/g, '');
// Wait, regex might be too greedy. Let's do it manually with multi replace or string replace.

// Let's just rewrite Header.astro to be clean since it's just the header.
