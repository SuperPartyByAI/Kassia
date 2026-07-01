import fs from 'fs';

const data = JSON.parse(fs.readFileSync('legacy_audit_results.json', 'utf-8'));

let md = `# Kassia — Legacy Sector Pages Cannibalization Plan\n\n`;

md += `> [!WARNING]\n`;
md += `> Acest document este un plan de audit READ-ONLY. Nu a fost modificat DB, redirects, content sau setări GSC.\n\n`;

let tableRows = [];

for (const p of data) {
    md += `## URL Auditat: [${p.url}](${p.url})\n\n`;
    
    md += `- **1. HTTP status live:** ${p.statusLive}\n`;
    md += `- **2. canonical live:** ${p.canonical}\n`;
    md += `- **3. robots live:** ${p.robotsLive}\n`;
    md += `- **4. index_status DB:** ${p.dbIndexStatus}\n`;
    md += `- **5. include_in_sitemap DB:** ${p.dbSitemap}\n`;
    md += `- **6. apare în sitemap live:** ${p.inSitemapLive}\n`;
    md += `- **7. GSC status:** ${p.gscStatus}\n`;
    md += `- **8. last crawl:** ${p.lastCrawl}\n`;
    md += `- **9. impressions/clicks:** ${p.gscClicks}\n`;
    md += `- **10. title:** ${p.title}\n`;
    md += `- **11. meta:** ${p.metaDesc}\n`;
    md += `- **12. H1:** ${p.h1}\n`;
    md += `- **13. word count:** ~${p.wordCount}\n`;
    md += `- **14. content vechi/slab:** ${p.oldContent ? 'DA' : 'NU'}\n`;
    md += `- **15. termeni problematici:** ${p.problematicTerms ? 'DA (pachete/tarife/ieftin)' : 'NU'}\n`;
    md += `- **16. linkuri interne:** ${p.internalLinks}\n`;
    md += `- **17. backlinks/semnale:** ${p.backlinks}\n`;
    md += `- **18. URL nou corespondent:** [${p.targetNew}](${p.targetNew})\n`;
    md += `- **19. recomandare:** ${p.recommendation}\n`;
    md += `- **20. risc SEO:** ${p.riskSeo}\n`;
    md += `- **21. risc UX:** ${p.riskUx}\n`;
    md += `- **22. impact asupra hubului:** ${p.impact}\n\n`;

    md += `**Verdict:** ${p.verdict}\n\n`;
    md += `---\n\n`;

    let priority = "High";
    if (p.statusLive !== 200) priority = "Low (deja redirect/error)";

    tableRows.push(`| [${p.url.replace('https://www.kassia.ro', '')}](${p.url}) | [${p.targetNew.replace('https://www.kassia.ro', '')}](${p.targetNew}) | ${p.recommendation} | Canibalizare SEO (Duplicate intent) | ${p.riskSeo} | ${priority} |`);
}

md += `## Tabel Global: Legacy Pages Decision Plan\n\n`;
md += `| legacy URL | target URL nou | acțiune recomandată | motiv | risc | prioritate |\n`;
md += `|---|---|---|---|---|---|\n`;
md += tableRows.join('\n');
md += `\n`;

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/kassia_legacy_cannibalization_plan.md', md);
console.log("Legacy plan generated.");
