import fs from 'fs';

const data = JSON.parse(fs.readFileSync('preflight_results.json', 'utf-8'));

let md = `# Kassia — Legacy Redirect Preflight Required Before Implementation\n\n`;

md += `> [!WARNING]\n`;
md += `> Acest document este un PREFLIGHT READ-ONLY. Nu s-a implementat niciun redirect și nu a fost modificată nicio bază de date.\n\n`;

let tableRows = [];
let has301s = false;

for (const p of data) {
    md += `## Preflight URL: [${p.legacyUrl}](${p.legacyUrl})\n\n`;
    
    md += `- **1. HTTP status live (redirect-follow OFF):** ${p.statusLive}\n`;
    md += `- **2. Location (dacă este 301):** ${p.location}\n`;
    md += `- **3. HTTP status final (redirect-follow ON):** ${p.statusFinal}\n`;
    md += `- **4. canonical final:** ${p.canonicalFinal}\n`;
    md += `- **5. robots final:** ${p.robotsFinal}\n`;
    md += `- **6. title final:** ${p.titleFinal}\n`;
    md += `- **7. H1 final:** ${p.h1Final}\n`;
    md += `- **8. URL apare în sitemap live:** ${p.sitemapLegacy}\n`;
    md += `- **9. URL apare în DB:** ${p.dbPresence}\n`;
    md += `- **10. include_in_sitemap DB:** ${p.dbIncludeInSitemap}\n`;
    md += `- **11. GSC status:** ${p.gscStatus}\n`;
    md += `- **12. last crawl:** ${p.lastCrawl}\n`;
    md += `- **13. impressions/clicks:** ${p.gscClicks}\n`;
    md += `- **14. backlinks/semnale:** ${p.backlinks}\n`;
    md += `- **15. linkuri interne către legacy:** ${p.internalLinks}\n`;
    md += `- **16. target URL nou este 200:** ${p.targetStatus === 200 ? 'DA' : 'NU (' + p.targetStatus + ')'}\n`;
    md += `- **17. target URL nou este index/follow:** ${p.targetIndexFollow}\n`;
    md += `- **18. target URL nou are canonical self:** ${p.targetCanonicalSelf}\n`;
    md += `- **19. risc SEO redirect:** ${p.riskSeo}\n`;
    md += `- **20. risc UX redirect:** ${p.riskUx}\n`;
    md += `- **21. acțiune recomandată:** ${p.action}\n\n`;

    md += `**Verdict:** ${p.verdict}\n\n`;
    md += `---\n\n`;

    if (p.action === 'implement 301') has301s = true;

    tableRows.push(`| [${p.legacyUrl.replace('https://www.kassia.ro', '')}](${p.legacyUrl}) | ${p.statusLive} | ${p.location} | [${p.targetUrl.replace('https://www.kassia.ro', '')}](${p.targetUrl}) | ${p.targetStatus} | ${p.sitemapLegacy} | ${p.gscStatus} | ${p.action} | ${p.riskSeo.includes('RISC') ? 'HIGH' : 'LOW'} | ${p.verdict} |`);
}

md += `## Output final obligatoriu\n\n`;
md += `| legacy URL | status actual | Location dacă există | target URL | target status | sitemap legacy | GSC status | acțiune recomandată | risc | verdict |\n`;
md += `|---|---|---|---|---|---|---|---|---|---|\n`;
md += tableRows.join('\n');
md += `\n\n`;

md += `## Plan de implementare cerut, fără execuție\n\n`;
md += `> [!NOTE]\n`;
md += `> Deoarece există URL-uri care necesită \`implement 301\` și sunt confirmate ca 200 live și concurează intern, iată planul tehnic exact pentru a le curăța:\n\n`;

md += `1. **Unde se implementează redirectul:** Redirectul NU se face în server direct (deoarece Astro folosește mod hibrid/SSR) ci prin **tabela de redirecturi din baza de date Supabase** (pe care aplicația Next.js/Astro o citește la rutare). Adăugăm o intrare cu \`source = /animatori-copii-sector-X/\` și \`destination = /animatori-petreceri-copii-sector-X/\`, cu status 301.\n`;
md += `2. **Tabela DB Status:** Paginile legacy corespondente din tabela \`kassia_pages\` vor fi marcate cu \`is_active = false\` și \`include_in_sitemap = false\`.\n`;
md += `3. **Sitemap:** Datorită setării de la pasul 2, sitemap-ul dinamic (\`/sitemap.xml\`) le va exclude automat, păstrând doar targeturile noi.\n`;
md += `4. **Validare Live:** Se face \`curl -I https://www.kassia.ro/animatori-copii-sector-X/\` pentru a confirma \`HTTP/2 301\` și \`Location: /animatori-petreceri-copii-sector-X/\` exact, fără lanțuri de redirect (redirect chains).\n`;
md += `5. **GSC (Google Search Console):** Da, după ce redirecturile 301 sunt live, vom face Request Indexing pe GSC pe noile target-uri (\`/animatori-petreceri-copii-sector-X/\`) pentru a forța Google să treacă prin lanțul vechi și să transfere semnalele către ele. Pentru paginile vechi, Google le va arunca din index automat la următorul crawl.\n`;

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/kassia_legacy_preflight_plan.md', md);
console.log("Preflight Markdown Generated.");
