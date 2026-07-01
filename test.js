import * as cheerio from 'cheerio';
import fs from 'fs';

const html = fs.readFileSync('page.html', 'utf8');
const $ = cheerio.load(html);

const sections = $('.aprecieri-clienti');
console.log("Found sections:", sections.length);
