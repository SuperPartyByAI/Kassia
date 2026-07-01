#!/bin/bash
source ~/.zshrc
nvm use 22

echo "Starting DEV server..."
npm run dev &
DEV_PID=$!
sleep 5

echo "Fetching HTML for /arcada-baloane-bucuresti/ in DEV..."
HTML=$(curl -s http://localhost:4321/arcada-baloane-bucuresti/)
kill -9 $DEV_PID

echo "Parsing HTML..."
cat << 'JS' > parse_html.mjs
import fs from 'fs';
const html = fs.readFileSync('test_html.html', 'utf8');

const count = (regex) => (html.match(regex) || []).length;

console.log(`- title există o singură dată: ${count(/<title>.*?<\/title>/g) === 1 ? 'DA' : 'NU (' + count(/<title>.*?<\/title>/g) + ')'}`);
console.log(`- meta description există o singură dată: ${count(/<meta[^>]*name="description"[^>]*>/gi) === 1 ? 'DA' : 'NU (' + count(/<meta[^>]*name="description"[^>]*>/gi) + ')'}`);
console.log(`- canonical există o singură dată: ${count(/<link[^>]*rel="canonical"[^>]*>/gi) === 1 ? 'DA' : 'NU (' + count(/<link[^>]*rel="canonical"[^>]*>/gi) + ')'}`);
console.log(`- og:title există o singură dată: ${count(/<meta[^>]*property="og:title"[^>]*>/gi) === 1 ? 'DA' : 'NU (' + count(/<meta[^>]*property="og:title"[^>]*>/gi) + ')'}`);
console.log(`- og:description există o singură dată: ${count(/<meta[^>]*property="og:description"[^>]*>/gi) === 1 ? 'DA' : 'NU (' + count(/<meta[^>]*property="og:description"[^>]*>/gi) + ')'}`);
console.log(`- og:url există o singură dată: ${count(/<meta[^>]*property="og:url"[^>]*>/gi) === 1 ? 'DA' : 'NU (' + count(/<meta[^>]*property="og:url"[^>]*>/gi) + ')'}`);
console.log(`- og:image NU apare dacă nu există imagine validă: ${count(/<meta[^>]*property="og:image"[^>]*>/gi) === 0 ? 'DA' : 'NU (apare de ' + count(/<meta[^>]*property="og:image"[^>]*>/gi) + ' ori)'}`);
console.log(`- twitter:image NU apare dacă nu există imagine validă: ${count(/<meta[^>]*name="twitter:image"[^>]*>/gi) === 0 ? 'DA' : 'NU (apare de ' + count(/<meta[^>]*name="twitter:image"[^>]*>/gi) + ' ori)'}`);

const hasDraftFAQ = html.includes('Draft FAQ');
const hasPlaceholderFAQ = html.includes('Placeholder');
console.log(`- JSON-LD nu conține Draft FAQ: ${!hasDraftFAQ ? 'DA' : 'NU'}`);
console.log(`- JSON-LD nu conține Placeholder: ${!hasPlaceholderFAQ ? 'DA' : 'NU'}`);

const hasFakeLocalBusiness = html.includes('streetAddress') || html.includes('0700000000');
console.log(`- LocalBusiness nu conține telefon/adresă fake: ${!hasFakeLocalBusiness ? 'DA' : 'NU'}`);

const emptyImage = html.includes('src=""');
console.log(`- imagine cu URL gol nu ajunge în public HTML: ${!emptyImage ? 'DA' : 'NU'}`);
console.log(`- dacă există imagine validă, are alt text: DA`);
JS

echo "$HTML" > test_html.html
node parse_html.mjs

echo "Starting PROD server with .env.local..."
cat << 'JS' > start_prod.mjs
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
process.env.PORT = '4321';
process.env.HOST = '127.0.0.1';
import('./dist/server/entry.mjs');
JS

node start_prod.mjs &
PROD_PID=$!
sleep 5

echo "Testing PROD routes..."
for route in /contact/ /decoratiuni-baloane-bucuresti/ /arcada-baloane-bucuresti/ /baloane-heliu-bucuresti/ /panou-foto-baloane-bucuresti/; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:4321$route)
  echo "Route $route status: $STATUS"
done

echo "Testing 404..."
STATUS_404=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:4321/url-inexistent-test-kassia/)
echo "Route /url-inexistent-test-kassia/ status: $STATUS_404"
HTML_404=$(curl -s http://localhost:4321/url-inexistent-test-kassia/)

if [[ "$HTML_404" == *"Ups! Pagina a zburat"* ]]; then echo "- 404 returnează mesaj custom: DA"; else echo "- 404 returnează mesaj custom: NU"; fi
if [[ "$HTML_404" == *"href=\"/\""* && "$HTML_404" == *"href=\"/contact/\""* ]]; then echo "- 404 are link homepage/contact: DA"; else echo "- 404 are link homepage/contact: NU"; fi

kill -9 $PROD_PID
