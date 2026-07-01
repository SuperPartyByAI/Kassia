const fs = require('fs');
const data = JSON.parse(fs.readFileSync('/tmp/audit_global.json', 'utf8'));

let out = "────────────────────────\n### FAZA 0 — CLEAN CHECK\n────────────────────────\n";
out += "- Git status: Curat\n- Niciun proces suspect.\n- Niciun update sau deploy.\n";

out += "\n────────────────────────\n### FAZA 1 — INVENTAR COMPLET TOATE PAGINILE\n────────────────────────\n";
out += "A. Pagini centrale (Home / Bază): " + data.A.length + "\n";
out += "B. Pagini locale: " + data.B.length + "\n";
out += "C. Pagini servicii animatori: " + data.C.length + "\n";
out += "D. Pagini non-animatori (Baloane, Nunta, Corporate): " + data.D.length + "\n";

out += "\n────────────────────────\n### TABEL D — NON-ANIMATORI (Out of Scope)\n────────────────────────\n";
out += "| Index | Slug | Status |\n| --- | --- | --- |\n";
data.D.forEach((p, i) => {
  out += `| D${i+1} | /${p.slug}/ | OUT OF SCOPE |\n`;
});

out += "\n────────────────────────\n### TABEL PASS + MONITOR / LOCKED\n────────────────────────\n";
out += "| Index | Categorie | Slug | Status |\n| --- | --- | --- | --- |\n";
let passList = [...data.A, ...data.B, ...data.C].filter(p => p.isPass);
passList.forEach((p, i) => {
  out += `| P${i+1} | ${p.cat} | /${p.slug}/ | PASS + MONITOR / LOCKED |\n`;
});

out += "\n────────────────────────\n### TABEL PAGINI SUSPECTE / DEFECTUOASE (MECANICE)\n────────────────────────\n";
if (data.Defects.length > 0) {
  out += "| Slug | Motiv | Prioritate |\n| --- | --- | --- |\n";
  data.Defects.forEach(p => {
    out += `| /${p.slug}/ | ${p.defect_reason} | P0 |\n`;
  });
} else {
  out += "Nu au fost detectate pagini mecanice suspecte indexabile.\n";
}

out += "\n────────────────────────\n### TABEL CENTRAL GLOBAL (A + B + C - AUDIT)\n────────────────────────\n";
out += "| Index | Cat | Slug | Keyword | Kassia Rank | Top SERP | Lider | Has Pricing | Verdict |\n";
out += "| --- | --- | --- | --- | --- | --- | --- | --- | --- |\n";
let auditList = [...data.A, ...data.B, ...data.C].filter(p => !p.isPass && p.index_status === 'index');
auditList.forEach((p, i) => {
  let rank = p.kassia_rank || 'N/A';
  let verdict = 'NEEDS DETAILED AUDIT';
  if (data.Defects.find(d => d.slug === p.slug)) verdict = 'IMPROVE CRITIC';
  out += `| A${i+1} | ${p.cat} | /${p.slug}/ | ${p.query} | ${rank} | ${p.serp_total} | ${p.lider} | ${p.has_pricing} | ${verdict} |\n`;
});

console.log(out);

out = "\n────────────────────────\n### PRIORITIZARE REALĂ\n────────────────────────\n";
out += "1. P0 — Pagini defectuoase/spam-like/indexabile:\n";
if (data.Defects.length > 0) {
  data.Defects.forEach(p => out += `   - /${p.slug}/ (${p.defect_reason})\n`);
} else {
  out += "   - Niciuna detectată.\n";
}

out += "2. Pagini poziția 2–4 care pot ajunge #1:\n";
auditList.filter(p => p.kassia_rank !== 'N/A' && p.kassia_rank > 1 && p.kassia_rank <= 5).forEach(p => {
  out += `   - /${p.slug}/ (Rank: ${p.kassia_rank})\n`;
});

out += "3. Pagini invizibile cu valoare comercială mare:\n";
auditList.filter(p => p.kassia_rank === 'N/A' && ['mascote', 'personaje', 'botez', 'pictura'].some(x => p.slug.includes(x))).forEach(p => {
  out += `   - /${p.slug}/\n`;
});

console.log(out);
