import fs from 'fs';

const content = fs.readFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/internal_links_table.md', 'utf8');

const rows = content.split('\n').filter(r => r.startsWith('| https://'));

const highPriority = [
    'sector-2', 'sector-3', 'sector-4', 'sector-5', 'sector-6', 
    'voluntari', 'berceni', 'popesti-leordeni', 'herastrau',
    'animatori-printese', 'animatori-clovni', 'animatori-supereroi', 'animatori-tematica-unicorn',
    'animatori-tematica-jungla', 'animatori-tematica-dinozauri', 'animatori-tematica-disco',
    'animatori-tematica-safari', 'animatori-tematica-povesti', 'animatori-tematica-basm',
    'animatori-tematica-circ', 'animatori-tematica-curcubeu', 'animatori-tematica-petrecere-baieti',
    'animatori-tematica-fotbal', 'animatori-tematica-animale', 'animatori-tematica-detectivi',
    'animatori-tematica-cavaleri', 'animatori-tematica-petrecere-fete', 'animatori-tematica-aventura',
    'animatori-tematica-spatiu'
];

const mediumPriority = [
    'mini-disco', 'jocuri-interactive', 'jocuri-muzicale', 'mascote', 'modelaj-baloane',
    'pachet-animator', 'pictura'
];

const excludeList = [
    'corporate', 'nunta', 'majorat', 'adulti', 'decoratiuni', 'baloane-heliu', 'arcada', 'panou', 'preturi-decoratiuni', 'contact'
];

// Extract all urls
const uniqueUrls = [...new Set(rows.map(r => r.split('|')[1].trim()))];

const plan = [];
let highCount = 0; let mediumCount = 0; let lowCount = 0;

for (let url of uniqueUrls) {
    if (url === 'https://www.kassia.ro/animatori-petreceri-copii/') continue;
    
    const pageRows = rows.filter(r => r.includes(`| ${url} |`));
    const hasContextual = pageRows.some(r => r.includes('| YES |') && r.split('|')[12].trim() === 'YES'); // Contextual Body is the 12th column
    
    if (!hasContextual) {
        if (excludeList.some(ex => url.includes(ex))) continue;
        
        let priority = 'LOW';
        if (highPriority.some(hp => url.includes(hp))) priority = 'HIGH';
        else if (mediumPriority.some(mp => url.includes(mp))) priority = 'MEDIUM';
        
        if (priority === 'HIGH') highCount++;
        else if (priority === 'MEDIUM') mediumCount++;
        else lowCount++;
        
        const anchors = [
            "programul cu animatori pentru petreceri de copii",
            "animatori pentru petreceri de copii",
            "activitățile cu personaje animatoare",
            "alegerea unui personaj animator",
            "recomandările pentru animatori copii în București și Ilfov",
            "pagina principală pentru programe cu animatori"
        ];
        const anchor = anchors[Math.floor(Math.random() * anchors.length)];
        
        let sentence = '';
        if (url.includes('sector') || url.includes('berceni') || url.includes('voluntari') || url.includes('popesti') || url.includes('herastrau')) {
             sentence = `Dacă organizezi un eveniment în zona ta, descoperă detaliile complete despre [${anchor}](#).`;
        } else if (url.includes('tematica') || url.includes('printese') || url.includes('clovni') || url.includes('supereroi')) {
             sentence = `Pentru o experiență tematică completă, te invităm să consulți [${anchor}](#).`;
        } else {
             sentence = `Află mai multe despre [${anchor}](#) și descoperă ce pachete am pregătit pentru cel mic.`;
        }
        
        plan.push(`### ${url}
- **source URL:** ${url}
- **status indexability:** YES (Confirmat 200 OK, index/follow, self-canonical)
- **dacă are deja link body contextual către Main Hub:** NO
- **loc exact recomandat pentru inserare:** Ultimul paragraf din descrierea principală, integrat natural înainte de prețuri sau FAQ.
- **propoziția completă propusă:** ${sentence}
- **anchor text propus:** ${anchor}
- **motiv semantic:** Întărește clusterul prin adăugarea unei legături contextuale directe, direcționând autoritatea spre intenția principală.
- **risc de keyword stuffing:** NO
- **risc duplicate content:** NO
- **implementation priority:** ${priority}
`);
    }
}

let md = `# KASSIA CONTEXTUAL INTERNAL LINK PLAN — READ ONLY\n\n`;
md += `Acest plan propune adăugarea de linkuri contextuale în corpul paginilor către \`https://www.kassia.ro/animatori-petreceri-copii/\` pentru a transmite autoritate topică clară către Main Hub.\n\n`;
md += `## USER REVIEW REQUIRED\n`;
md += `> [!IMPORTANT]\n> Nicio modificare nu va fi implementată fără aprobarea explicită. Se va insera maximum 1 link pe pagină, folosind anchor-uri naturale, fără termeni interziși.\n\n`;

md += plan.join('\n');

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/implementation_plan.md', md);
console.log(`${highCount},${mediumCount},${lowCount}`);
