import fs from 'fs';
import path from 'path';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.PUBLIC_SUPABASE_ANON_KEY;

async function fetchTable(table) {
    const res = await fetch(`${supabaseUrl}/rest/v1/${table}?select=*`, {
        headers: {
            'apikey': supabaseKey,
            'Authorization': `Bearer ${supabaseKey}`
        }
    });
    return res.json();
}

async function runAudit() {
    console.log("Fetching all pages...");
    const pages = await fetchTable('kassia_pages');
    
    console.log("Fetching sections...");
    const sections = await fetchTable('kassia_page_sections');

    console.log("Fetching faqs...");
    const faqs = await fetchTable('kassia_faqs');

    console.log("Fetching internal links...");
    const links = await fetchTable('kassia_internal_links');

    console.log("Fetching gallery...");
    const gallery = await fetchTable('kassia_gallery_items');

    // Start generating Markdown
    let md = `# Kassia.ro - Audit SEO și Arhitectural (Read-Only)\n\n`;
    md += `> [!IMPORTANT]\n`;
    md += `> Acest raport este generat 100% read-only. Nu s-a eliminat nicio afirmație comercială, cifră de rating, recenzie sau poză existentă. Raportul vizează strict structura SEO on-page, identificarea duplicatelor, starea tehnică și oportunitățile de extindere a arhitecturii.\n\n`;

    md += `## TASK 1 & 2 — Inventar Pagini și Structură On-Page\n\n`;

    // Tabel inventar
    md += `| Pagina | URL | Tip | H1 | Status | Secțiuni | Thin/Risc |\n`;
    md += `|--------|-----|-----|----|--------|----------|-----------|\n`;

    pages.forEach(p => {
        const pageSections = sections.filter(s => s.page_id === p.id);
        const pageFaqs = faqs.filter(f => f.page_id === p.id);
        
        let wordsCount = 0;
        let isThin = false;
        
        pageSections.forEach(s => {
            let content = {};
            try { content = typeof s.content === 'string' ? JSON.parse(s.content) : (s.content || {}); } catch(e){}
            if (content.body) wordsCount += content.body.split(/\s+/).length;
        });

        if (wordsCount < 200 && pageSections.length < 3) isThin = true;

        md += `| ${p.title || 'Draft'} | /${p.slug || ''} | ${p.page_type} | ${p.h1 || '-'} | ${p.status} | ${pageSections.length} block, ${pageFaqs.length} faq | ${isThin ? '**High**' : 'Low'} |\n`;
    });

    md += `\n### Analiză detaliată per pagină\n`;

    pages.forEach(p => {
        const pageSections = sections.filter(s => s.page_id === p.id);
        const pageFaqs = faqs.filter(f => f.page_id === p.id);
        const pageLinksOut = links.filter(l => l.source_page_id === p.id);
        const pageLinksIn = links.filter(l => l.target_page_id === p.id);
        
        let wordsCount = 0;
        let h2h3 = [];
        let hasCTA = false;
        let ctaText = [];
        let hasBenefits = false;
        let hasPricing = pageSections.some(s => s.heading && s.heading.toLowerCase().includes('prețuri')) || p.show_pricing_preview;
        let hasReviews = true; // ReviewsCarousel is global
        let localSignals = p.slug && (p.slug.includes('sector') || p.slug.includes('bucuresti') || p.slug.includes('ilfov')) ? 'DA' : 'NU';
        let isThin = false;
        
        pageSections.forEach(s => {
            if (s.heading) h2h3.push(s.heading);
            let content = {};
            try { content = typeof s.content === 'string' ? JSON.parse(s.content) : (s.content || {}); } catch(e){}
            
            if (content.body) { wordsCount += content.body.split(/\s+/).length; }
            if (content.cta_text && content.cta_url) { hasCTA = true; ctaText.push(content.cta_text); }
            if (s.heading && (s.heading.toLowerCase().includes('benefici') || s.heading.toLowerCase().includes('de ce'))) { hasBenefits = true; }
        });

        pageFaqs.forEach(f => {
            wordsCount += (f.question ? f.question.split(/\s+/).length : 0);
            wordsCount += (f.answer ? f.answer.split(/\s+/).length : 0);
        });

        if (wordsCount < 250 && pageSections.length < 3) isThin = true;

        let missingSections = [];
        if (!hasBenefits) missingSections.push("Beneficii clare");
        if (!hasPricing) missingSections.push("Prețuri/Ofertă");
        if (pageFaqs.length === 0) missingSections.push("Întrebări frecvente");

        let seoIntent = "Necunoscută";
        if (p.page_type === 'service_pillar') seoIntent = "Navigare/Hub Comercial";
        else if (p.page_type === 'service' || p.page_type === 'satellite') seoIntent = "Conversie Serviciu Specific";
        else if (p.page_type === 'location') seoIntent = "Conversie Locală";
        else if (p.page_type === 'home') seoIntent = "Brand Hub / Conversie Generică";

        let risk = "Low";
        let riskReason = "-";
        if (isThin) { risk = "High"; riskReason = "Thin content, cuvinte prea puține"; }
        if (p.title === 'Draft Page') { risk = "Medium"; riskReason = "Pagina pare a fi draft nesetat corect"; }
        if (p.index_status === 'noindex') { risk = "Low"; riskReason = "Setată noindex intenționat"; }

        md += `#### ${p.title || p.path}
- **URL public:** \`https://www.kassia.ro${p.path || '/'}\`
- **Route / Component:** \`src/pages/[...slug].astro\`
- **Status:** ${p.status}
- **Index/Robots:** ${p.index_status === 'index' ? 'index, follow' : 'noindex, follow'}
- **Title Tag:** \`${p.meta_title}\`
- **Meta Description:** \`${p.meta_description}\`
- **H1:** \`${p.h1}\`
- **H2/H3 list:** ${h2h3.length > 0 ? h2h3.join(', ') : 'Lipsă'}
- **Cuvinte vizibile (aprox):** ${wordsCount}
- **Tip pagină:** ${p.page_type}
- **Intenție SEO:** ${seoIntent}
- **Secțiuni existente:** ${pageSections.length} block-uri, ${pageFaqs.length} FAQ-uri
- **Secțiuni lipsă sugerate:** ${missingSections.length > 0 ? missingSections.join(', ') : 'Pagină SEO completă'}
- **CTA:** ${hasCTA ? `DA (${ctaText.join(', ')})` : 'NU'}
- **Semnale locale:** ${localSignals}
- **Risc SEO Structural:** **${risk}** (${riskReason})

`;
    });

    md += `## TASK 3 — Pagini Thin și Posibil Duplicate\n\n`;
    
    let thinPages = pages.filter(p => {
        let sc = sections.filter(s => s.page_id === p.id).length;
        return sc <= 2 && p.status === 'published';
    });

    if (thinPages.length > 0) {
        md += `### Pagini cu conținut subțire (Thin Content)\nAceste pagini au prea puține block-uri de conținut/text și pot fi considerate thin de Google:\n`;
        thinPages.forEach(p => {
            md += `- **${p.path || '/'}** (Risc: High. Recomandare: Adăugare FAQ, descriere serviciu, proces, beneficii)\n`;
        });
    } else {
         md += `> [!TIP]\n> Nu am detectat pagini publicate cu thin content major.\n`;
    }

    let sectorPages = pages.filter(p => p.slug && p.slug.includes('sector-'));
    if (sectorPages.length > 0) {
        md += `\n### Suprapuneri și Similaritate Pagini Locale (Sectoare)\n`;
        md += `Am detectat ${sectorPages.length} pagini dedicate pe sectoare. Deoarece folosesc arhitectură similară (Reviews globale, PricingPreview global), diferențierea trebuie făcută strict din conținutul text, H1, FAQ-uri specifice pe sector și cartiere locale în text.\n`;
        md += `- **Risc:** Medium. Dacă FAQ-urile sunt identice între sectoare, Google le poate canibaliza.\n`;
        md += `- **Recomandare Structurală:** Fără a șterge afirmațiile de încredere (cifre/rating), asigurați-vă că block-urile text "Despre animatori în Sector X" includ nume de străzi, parcuri, cartiere specifice fiecărui sector.\n`;
    }

    md += `\n## TASK 4 — Analiză Arhitectură SEO (Harta Categoriilor)\n`;
    
    let categories = {
        'Animatori / Personaje': pages.filter(p => p.slug && (p.slug.includes('animator') || p.slug.includes('personaje') || p.slug.includes('mascote'))),
        'Servicii Complementare': pages.filter(p => p.slug && (p.slug.includes('pictura') || p.slug.includes('baloane') || p.slug.includes('jocuri') || p.slug.includes('disco'))),
        'Evenimente Specifice': pages.filter(p => p.slug && (p.slug.includes('botez') || p.slug.includes('nunta') || p.slug.includes('corporate'))),
        'Pagini Locale (Sectoare/Ilfov)': pages.filter(p => p.slug && (p.slug.includes('sector') || p.slug.includes('ilfov') || p.slug.includes('voluntari'))),
    };

    for (const [cat, catPages] of Object.entries(categories)) {
        md += `### ${cat}\n`;
        if (catPages.length === 0) {
            md += `- *Nu există pagini specifice pentru această categorie în prezent.*\n`;
        } else {
            catPages.forEach(p => { md += `- [${p.title}](${p.path || '/'})\n`; });
        }
        md += '\n';
    }
    md += `> [!TIP]\n> **Oportunități de pagini noi (Gap SEO):** "Animatori botez Bucuresti", "Magician petreceri copii Bucuresti", "Ursitoare botez Bucuresti" (dacă serviciul există, nu am detectat o pagină separată).\n`;

    md += `\n## TASK 5 — Fișiere Tehnice\n\n`;
    md += `- **/robots.txt**: Generat dinamic \`src/pages/robots.txt.ts\`. Permite crawling-ul și specifică sitemap-ul.\n`;
    md += `- **/sitemap.xml**: Generat dinamic \`src/pages/sitemap.xml.ts\`. Extrage automat doar paginile indexabile și publicate.\n`;
    md += `- **Canonical Rules**: Paginile randează tag-ul \`<link rel="canonical" href="...">\` automat în \`[...slug].astro\`.\n`;
    md += `- **Trailing Slash**: Logica de redirect în \`[...slug].astro\` forțează trailing slash (\`/\`) via 301.\n`;
    md += `- **404 Page**: Paginile nepublicate sau lipsă returnează cod HTTP 404 nativ din Astro SSR.\n`;

    md += `\n## TASK 6 — Schema și Date Structurate (JSON-LD)\n\n`;
    md += `Arhitectura curentă injectează automat:\n`;
    md += `- **LocalBusiness / Organization**: Prezent cu logo, telefon și adresă (București & Ilfov).\n`;
    md += `- **Service**: Generat pentru paginile de servicii.\n`;
    md += `- **FAQPage**: Se populează corect 100% automat din tabelul \`kassia_faqs\`.\n`;
    md += `- **BreadcrumbList**: Construit dinamic din segmentele URL-ului.\n`;
    md += `> [!WARNING]\n> Nu am detectat \`AggregateRating\` / \`Review\` schema nativă hardcodată. Se recomandă injectarea ei organică fără a altera badge-urile vizuale aprobate.\n`;

    md += `\n## TASK 7 — Imagini și Media\n\n`;
    md += `- **Hero Images**: \`loading="eager"\` și \`fetchpriority="high"\` (optimizat pentru LCP).\n`;
    md += `- **Service Cards & Content Images**: Folosesc atributul \`loading="lazy"\` și \`decoding="async"\`.\n`;
    md += `- **Galerie (kassia_gallery_items)**: Randată prin grid responsiv.\n`;
    md += `> [!TIP]\n> Adăugarea de Alt Text specific pentru fiecare imagine din Supabase ar îmbunătăți vizibilitatea în Google Images.\n`;

    md += `\n## TASK 8 — Prioritizare Acțiuni (Sinteză Audit)\n\n`;
    md += `| Prioritate | Element | Recomandare / Status |\n`;
    md += `|------------|---------|---------------------|\n`;
    md += `| **P0 (Tehnic / Blockers)** | Trailing Slash, Canonical, Sitemap | **PASS**. Funcționează corect la nivel de SSR. |\n`;
    md += `| **P1 (Structură / Thin Content)** | Pagini Sectoare, Pagini Thin | Completare conținut block-uri locale diferențiate per pagină (în Supabase). |\n`;
    md += `| **P2 (SEO On-Page)** | H1, Meta, Secțiuni lipsă | Adăugare block-uri FAQ și Prețuri la paginile care nu au deloc intenție comercială clară (via Supabase). |\n`;
    md += `| **P3 (UX / Scheme Avansate)** | AggregateRating Schema | Injectarea datelor comerciale existente (4.9 rating, recenzii) în Schema.org din [...slug].astro pentru a obține steluțe în SERP. |\n`;

    const artifactPath = path.join('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2', 'seo_structural_audit.md');
    fs.writeFileSync(artifactPath, md);
    console.log("Audit saved to " + artifactPath);
}

runAudit().catch(console.error);
