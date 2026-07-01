import fs from 'fs';

const data = JSON.parse(fs.readFileSync('live_validation_results.json', 'utf-8'));

let md = `# Kassia — Legacy Redirect Cleanup Live Production Validation Required\n\n`;

md += `## Task 1 — Confirmă build/deploy/reload\n\n`;
md += `- **1. a fost făcut build?** Nu (acțiune blocată local, lipsă permisiuni sau comandă Vercel/CI).\n`;
md += `- **2. a trecut build-ul?** N/A.\n`;
md += `- **3. a fost deploy pe producție?** Nu.\n`;
md += `- **4. a fost reload/restart dacă site-ul rulează SSR?** Nu.\n`;
md += `- **5. timestamp deploy/reload:** N/A.\n`;
md += `- **6. fișier modificat:** Modificat doar local \`src/middleware.ts\` și Supabase DB.\n`;
md += `- **7. middleware este live pe producție:** **NU**.\n\n`;

md += `## Task 5 — DB cleanup validation\n\n`;
for (const row of data.dbRowsAfected) {
    if (row.count > 0) {
        md += `- \`${row.path}\`: Găsit și afectat ${row.count} rând(uri) în tabela \`kassia_pages\`. Status actual: \`${row.status}\`.\n`;
    } else {
        md += `- \`${row.path}\`: **NOT FOUND IN DB**. Update-ul `.update().eq('path')` a afectat 0 rânduri.\n`;
    }
}
md += `\n*Notă:* Pentru paginile \`NOT FOUND IN DB\`, cleanup-ul bazei de date are efect nul, așadar **singurul mecanism capabil să le intercepteze este Middleware-ul Astro** (pe care l-am configurat).\n\n`;

md += `## Task 6 — Public HTML validation\n\n`;
md += `Deoarece modificările de Middleware nu sunt deployate public pe Kassia.ro, **paginile legacy (exceptând sectoarele 1 și 6) randează încă HTML-ul vechi 200** (title vechi, H1 vechi, și \`pachete\`).\n\n`;

md += `## Output final obligatoriu\n\n`;
md += `| legacy URL | status live OFF | Location | status final ON | final URL | redirect chain | sitemap legacy | target status | verdict |\n`;
md += `|---|---|---|---|---|---|---|---|---|\n`;

let overallVerdict = 'LEGACY REDIRECT CLEANUP — DEPLOY REQUIRED';

for (const row of data.reportTable) {
    let rowVerdict = row.verdict;
    if (row.statusLiveOFF === 200) rowVerdict = 'LEGACY REDIRECT CLEANUP — DEPLOY REQUIRED';
    md += `| [${row.legacyUrl.replace('https://www.kassia.ro', '')}](${row.legacyUrl}) | ${row.statusLiveOFF} | ${row.location} | ${row.statusFinalON} | [${row.finalUrl.replace('https://www.kassia.ro', '')}](${row.finalUrl}) | ${row.redirectChain} | ${row.sitemapLegacy} | ${row.targetStatus} | ${rowVerdict} |\n`;
}

md += `\n## Verdict General\n\n`;
md += `**${overallVerdict}**\n\n`;
md += `> [!WARNING]\n`;
md += `> Modificările din \`src/middleware.ts\` (care rezolvă inclusiv paginile inexistente în DB) sunt corecte, dar sistemul Kassia.ro necesită **Trigger Build / Deploy pe Vercel (sau server)**. Până la deploy-ul public al codului sursă, canibalizarea rămâne activă, deoarece scripturile mele lucrează izolat în mediul local (\`/Users/...\`).\n`;

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/kassia_legacy_live_validation.md', md);
console.log("Validation Markdown Generated.");
