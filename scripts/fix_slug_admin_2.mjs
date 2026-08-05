import fs from 'fs';
const file = '/opt/kassia-site/src/pages/[...slug].astro';
let content = fs.readFileSync(file, 'utf8');

content = content.replace(
  'return Astro.rewrite(\'/404\');',
  'return new Response(\'404 Not Found\', { status: 404 });'
);

fs.writeFileSync(file, content);
