import fs from 'fs';
const file = '/opt/kassia-site/src/middleware.ts';
let content = fs.readFileSync(file, 'utf8');

content = content.replace(
  'return new Response(\'Admin credentials not configured. Please set ADMIN_USER and ADMIN_PASSWORD in environment variables.\', { status: 500 });',
  'return new Response(\'Not found\', { status: 404 });'
);

fs.writeFileSync(file, content);
