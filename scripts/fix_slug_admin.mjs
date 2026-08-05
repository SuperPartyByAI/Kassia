import fs from 'fs';
const file = '/opt/kassia-site/src/pages/[...slug].astro';
let content = fs.readFileSync(file, 'utf8');

if (!content.includes('if (currentPath.startsWith(\'/admin\') || currentPath.startsWith(\'/administrator\')) {')) {
  content = content.replace(
    'const currentPath = Astro.url.pathname;',
    'const currentPath = Astro.url.pathname;\nif (currentPath.startsWith(\'/admin\') || currentPath.startsWith(\'/administrator\')) {\n  Astro.response.status = 404;\n  return Astro.rewrite(\'/404\');\n}'
  );
}

fs.writeFileSync(file, content);
