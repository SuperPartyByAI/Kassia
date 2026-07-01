import fs from 'fs';
const html = fs.readFileSync('live_page.html', 'utf8');

const matches = [];
if (html.includes('Trimite detaliile')) matches.push('Trimite detaliile');
if (html.includes('Scrie-ne pe WhatsApp pentru detalii')) matches.push('Scrie-ne pe WhatsApp pentru detalii');
if (html.includes('<p>În cartierul Berceni')) matches.push('<p>În cartierul Berceni');
if (html.includes('<p>Da. Pentru cartierul Berceni')) matches.push('<p>Da. Pentru cartierul Berceni');

console.log("Matched exactly:", matches);
