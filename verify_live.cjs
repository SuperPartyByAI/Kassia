const fs = require('fs');

const pages = [
  {
    url: 'https://www.kassia.ro/animatori-botez-bucuresti/',
    expected: {
      title: 'Animatori botez București | Activități copii la botez | Kassia',
      meta: 'Programe cu animatori pentru botezuri în București și Ilfov, cu jocuri, personaje, pictură pe față și activități pentru copiii invitați.',
      h1: 'Animatori pentru botezuri în București',
      h2: ['De ce să chemi animatori la un botez în București?', 'Rezervă animatori pentru botezul copilului tău'],
      faq: 'Cât timp stă un animator la un botez în București?'
    },
    forbidden: 'în animatori botez bucuresti'
  },
  {
    url: 'https://www.kassia.ro/animatori-gradinita-bucuresti/',
    expected: {
      title: 'Animatori grădiniță București | Activități copii | Kassia',
      meta: 'Animatori pentru grădinițe, serbări și activități pentru copii în București. Jocuri interactive, mini-disco, personaje și activități adaptate vârstei preșcolare.',
      h1: 'Animatori pentru grădinițe în București',
      h2: ['De ce să aduci animatori la evenimentele de la grădiniță?', 'Rezervă un program special pentru serbarea de la grădiniță'],
      faq: 'Cât timp stă un animator la o activitate de grădiniță în București?'
    },
    forbidden: 'în animatori gradinita bucuresti'
  },
  {
    url: 'https://www.kassia.ro/animatori-scoala-bucuresti/',
    expected: {
      title: 'Animatori școală București | Banchete și serbări | Kassia',
      meta: 'Programe interactive și animatori pentru școli, afterschool-uri, banchete și petreceri de final de an în București. Jocuri de echipă și activități captivante.',
      h1: 'Animatori pentru petreceri și serbări școlare în București',
      h2: ['De ce să alegi animatori pentru petrecerile școlare?', 'Programează un eveniment memorabil pentru clasa ta'],
      faq: 'Cât timp stă un animator la o petrecere școlară în București?'
    },
    forbidden: 'în animatori scoala bucuresti'
  }
];

async function run() {
  let report = '';
  
  for (const p of pages) {
    report += `\n--- VERIFICARE: ${p.url} ---\n`;
    const res = await fetch(p.url, { headers: { 'Cache-Control': 'no-cache', 'User-Agent': 'Googlebot' } });
    const html = await res.text();
    
    // Extract elements
    const titleMatch = html.match(/<title>([^<]+)<\/title>/);
    const title = titleMatch ? titleMatch[1] : '';
    
    const metaMatch = html.match(/<meta\s+name="description"\s+content="([^"]+)"/);
    const meta = metaMatch ? metaMatch[1] : '';
    
    const h1Match = html.match(/<h1[^>]*>([^<]+)<\/h1>/);
    const h1 = h1Match ? h1Match[1] : '';
    
    report += `Title: ${title === p.expected.title ? '✅ PASS' : '❌ FAIL (' + title + ')'}\n`;
    report += `Meta Desc: ${meta === p.expected.meta ? '✅ PASS' : '❌ FAIL (' + meta + ')'}\n`;
    report += `H1: ${h1 === p.expected.h1 ? '✅ PASS' : '❌ FAIL (' + h1 + ')'}\n`;
    
    for (const h2 of p.expected.h2) {
      const hasH2 = html.includes(h2);
      report += `H2 ("${h2}"): ${hasH2 ? '✅ PASS' : '❌ FAIL'}\n`;
    }
    
    const hasFaq = html.includes(p.expected.faq);
    report += `FAQ ("${p.expected.faq}"): ${hasFaq ? '✅ PASS' : '❌ FAIL'}\n`;
    
    const hasForbidden = html.toLowerCase().includes(p.forbidden.toLowerCase());
    report += `Forbidden text ("${p.forbidden}"): ${!hasForbidden ? '✅ PASS (Nu a fost găsit)' : '❌ FAIL (A fost găsit)'}\n`;
    
    const oldSpam = "Animatori Petreceri Copii animatori";
    const hasOldSpam = html.toLowerCase().includes(oldSpam.toLowerCase());
    report += `Old Spam ("${oldSpam}"): ${!hasOldSpam ? '✅ PASS' : '❌ FAIL'}\n`;
    
    const robotsMatch = html.match(/<meta\s+name="robots"\s+content="([^"]+)"/);
    report += `Robots: ${robotsMatch ? robotsMatch[1] : 'Nu există'}\n`;
  }
  
  fs.writeFileSync('/tmp/live_verification.txt', report);
  console.log("Verificare finalizată. Raport salvat la /tmp/live_verification.txt");
}

run();
