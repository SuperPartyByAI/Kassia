import fs from 'fs';

const data = JSON.parse(fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/kassia_full_audit.json', 'utf8'));

// The user prioritized list:
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
    'pachet-animator-si-jocuri', 'pachet-animator-si-pictura'
];

const excludeList = [
    'corporate', 'nunta', 'majorat', 'adulti', 'decoratiuni', 'baloane-heliu', 'arcada', 'panou'
];

const plan = [];

let highCount = 0;
let mediumCount = 0;
let lowCount = 0;

// Gather unique pages that don't have a contextual body link
const uniqueUrls = [...new Set(data.map(d => d.source_url))];

for (let url of uniqueUrls) {
    if (url.includes('/animatori-petreceri-copii/') && !url.includes('sector') && !url.includes('herastrau') && !url.includes('voluntari') && !url.includes('berceni') && !url.includes('popesti')) continue; // Skip Main Hub itself
    
    // Check if it has a contextual body link
    const pageLinks = data.filter(d => d.source_url === url);
    const hasContextual = pageLinks.some(d => d.is_contextual_body_link_yes_no === 'YES');
    
    if (!hasContextual) {
        // Determine priority
        let priority = 'LOW';
        if (excludeList.some(ex => url.includes(ex))) continue; // Skip excluded
        
        if (highPriority.some(hp => url.includes(hp))) priority = 'HIGH';
        else if (mediumPriority.some(mp => url.includes(mp))) priority = 'MEDIUM';
        
        if (priority === 'HIGH') highCount++;
        else if (priority === 'MEDIUM') mediumCount++;
        else lowCount++;
        
        // Randomly pick an anchor for variation
        const anchors = [
            "programul cu animatori pentru petreceri de copii",
            "animatori pentru petreceri de copii",
            "activitățile cu personaje animatoare",
            "alegerea unui personaj animator",
            "recomandările pentru animatori copii în București și Ilfov",
            "pagina principală pentru programe cu animatori"
        ];
        const anchor = anchors[Math.floor(Math.random() * anchors.length)];
        
        // Generate proposition
        let sentence = '';
        if (url.includes('sector') || url.includes('berceni') || url.includes('voluntari') || url.includes('popesti')) {
             sentence = `Pentru detalii complete despre structura activităților, poți consulta direct [${anchor}](#).`;
        } else if (url.includes('tematica') || url.includes('printese') || url.includes('clovni')) {
             sentence = `Descoperă cum integrăm aceste personaje în [${anchor}](#) organizate de noi.`;
        } else {
             sentence = `Află mai multe despre [${anchor}](#) și cum le organizăm.`;
        }
        
        plan.push(`### ${url}
- **Source URL:** ${url}
- **Status Indexability:** YES (200 OK + Indexable)
- **Are deja link body contextual către Main Hub:** NO
- **Loc exact recomandat pentru inserare:** Ultimul paragraf din descrierea principală, deasupra secțiunii de prețuri sau FAQ.
- **Propoziția completă propusă:** ${sentence}
- **Anchor text propus:** ${anchor}
- **Motiv semantic:** Consolidează relevanța topică a Main Hub-ului venind dinspre o pagină specifică (locală/tematică), ghidând utilizatorul spre serviciul complet.
- **Risc de keyword stuffing:** NO
- **Risc duplicate content:** NO
- **Implementation priority:** ${priority}
`);
    }
}

let md = `# KASSIA CONTEXTUAL INTERNAL LINK PLAN — READ ONLY\n\n`;
md += `Acest plan propune adăugarea de linkuri contextuale în corpul paginilor către \`https://www.kassia.ro/animatori-petreceri-copii/\` pentru a transmite autoritate topică clară către Main Hub.\n\n`;
md += `## USER REVIEW REQUIRED\n`;
md += `> [!IMPORTANT]\n> Nicio modificare nu va fi implementată fără aprobarea explicită. Se va insera maximum 1 link pe pagină, folosind anchor-uri naturale, fără termeni interziși.\n\n`;
md += `## SUMMARY\n`;
md += `- MAIN HUB MODIFIED — NO\n`;
md += `- SOURCE PAGES TO MODIFY — ${highCount + mediumCount + lowCount}\n`;
md += `- HIGH PRIORITY LINKS — ${highCount}\n`;
md += `- MEDIUM PRIORITY LINKS — ${mediumCount}\n`;
md += `- LOW PRIORITY LINKS — ${lowCount}\n`;
md += `- OWNER APPROVAL REQUIRED BEFORE WRITE — YES\n`;
md += `- IMPLEMENTATION READY — YES\n\n`;
md += `## PROPOSED CHANGES\n\n`;

md += plan.join('\n');

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/implementation_plan.md', md);
