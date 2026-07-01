const { execSync } = require('child_process');

const queries = [
  {
    name: 'Botez',
    url: 'https://www.kassia.ro/animatori-botez-bucuresti/',
    pattern: 'Animatori pentru botezuri în București|Animatori botez București|Programe cu animatori pentru botezuri|De ce să chemi animatori la un botez în București|Rezervă animatori pentru botezul copilului tău|Cât timp stă un animator la un botez în București|Animatori Petreceri Copii animatori|în animatori botez bucuresti'
  },
  {
    name: 'Gradinita',
    url: 'https://www.kassia.ro/animatori-gradinita-bucuresti/',
    pattern: 'Animatori pentru grădinițe în București|Animatori grădiniță București|Animatori pentru grădinițe, serbări și activități|De ce să aduci animatori la evenimentele de la grădiniță|Rezervă un program special pentru serbarea de la grădiniță|Cât timp stă un animator la o activitate de grădiniță în București|Animatori Petreceri Copii animatori|în animatori gradinita bucuresti'
  },
  {
    name: 'Scoala',
    url: 'https://www.kassia.ro/animatori-scoala-bucuresti/',
    pattern: 'Animatori pentru petreceri și serbări școlare în București|Animatori școală București|Programe interactive și animatori pentru școli|De ce să alegi animatori pentru petrecerile școlare|Programează un eventsiment memorabil pentru clasa ta|Cât timp stă un animator la o petrecere școlară în București|Animatori Petreceri Copii animatori|în animatori scoala bucuresti'
  }
];

const flags = [
  { desc: 'Normal', curlArgs: '-sL' },
  { desc: 'No-Cache', curlArgs: '-sL -H "Cache-Control: no-cache"' },
  { desc: 'Googlebot', curlArgs: '-sL -A "Googlebot"' }
];

for (const q of queries) {
  console.log(`\n\n--- Testing ${q.name} ---`);
  for (const f of flags) {
    console.log(`\n> [${f.desc}]`);
    try {
      const output = execSync(`curl ${f.curlArgs} ${q.url} | grep -Ei "${q.pattern}" || true`).toString();
      console.log(output);
    } catch(e) {}
  }
}
