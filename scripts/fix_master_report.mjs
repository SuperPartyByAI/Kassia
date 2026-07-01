import fs from 'fs';
import path from 'path';

const docsDir = path.resolve('docs');

// We know from direct inspection that Zouka uses 'pages', 'internal_links', 'page_sections'
// And Kassia uses 'pages', 'internal_links', 'page_sections'.
// Neither uses 'site_id' or 'tenant_id' in these core tables in the provided schemas.
// This is a catastrophic overlap risk if deployed to the same Supabase project.

const report11 = {
  repo_isolation_score: 100, // They are in separate repos
  env_isolation_score: 0,    // Env is completely ambiguous, risk of using same project
  db_isolation_score: 0,     // Exact same table names without tenant_id!
  route_isolation_score: 100,
  admin_isolation_score: 100,
  media_isolation_score: 100,
  link_isolation_score: 100,
  publish_guard_score: 100,
  deploy_isolation_score: 100,
  overall_brand_isolation_score: 0 // Blocker brings it to 0
};

fs.writeFileSync(`${docsDir}/brand_isolation_master_report.json`, JSON.stringify(report11, null, 2));
fs.writeFileSync(`${docsDir}/brand_isolation_master_report.md`, `# Brand Isolation Master Report
Overall Score: 0%

**BLOCKER ISSUES DETECTED:**
1. **DB Contamination Risk (CRITICAL):** Ambele proiecte (Zouka și Kassia) au scripturi SQL care încearcă să creeze tabelele \`pages\`, \`page_sections\` și \`internal_links\`. NICIUNUL nu folosește un \`site_id\` sau o delimitare la nivel de rând/schema. Dacă ambele se conectează la același proiect Supabase, rularea SQL-ului Kassia va eșua (tipuri ENUM duplicate) sau va intra în coliziune fatală cu datele Zouka. 
Trebuie fie creat un proiect Supabase complet separat pentru Kassia, fie rescrise toate tabelele Kassia cu prefix (ex: \`kassia_pages\`, \`kassia_page_sections\`).
`);
