import fs from 'fs';
const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const titles = rawData.cards.map(c => c.title);
console.log(JSON.stringify(titles, null, 2));
