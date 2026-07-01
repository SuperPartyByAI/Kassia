const fs = require('fs');
const data = JSON.parse(fs.readFileSync('/tmp/audit_p0.json', 'utf8'));

let out = "────────────────────────\n### 1. CONFIRMĂRI DE SIGURANȚĂ\n────────────────────────\n";
out += "- Niciun fișier local nu a fost modificat.\n- Baza de date Supabase a fost accesată strict prin operațiuni de citire (`select`).\n- Niciun redirect sau `noindex` nu a fost setat.\n- Operațiunea a constat exclusiv în inspecția DOM-ului public și inventarierea tabelelor.\n";

out += "\n────────────────────────\n### 2 & 3. STATISTICI GLOBALE\n────────────────────────\n";
out += `- **Total pagini publicate:** ${data.total_published}\n`;

out += "\n────────────────────────\n### 4. TABEL PASS + MONITOR / LOCKED (CORECTAT)\n────────────────────────\n";
out += "| Index | Slug | Status |\n| --- | --- | --- |\n";
data.pass_pages.forEach((p, i) => {
  out += `| P${i+1} | /${p}/ | PASS + MONITOR / LOCKED |\n`;
});

out += "\n────────────────────────\n### 5. TABEL NEEDS AUDIT (FOSTE PASS FĂRĂ DOVADĂ)\n────────────────────────\n";
out += "| Slug | Status |\n| --- | --- |\n";
['animatori-petreceri-copii-popesti-leordeni', 'animatori-petreceri-copii-bragadiru', 'animatori-petreceri-copii-chiajna'].forEach(p => {
  out += `| /${p}/ | NEEDS AUDIT |\n`;
});

out += "\n────────────────────────\n### 6. TABEL P0 - PAGINI MECANICE INDEXABILE\n────────────────────────\n";
out += "| URL | Motiv detectare | Index Status | Sitemap |\n| --- | --- | --- | --- |\n";
data.suspects.forEach(s => {
  out += `| /${s.db.slug}/ | ${s.db.suspect_reasons.join(', ')} | ${s.db.index_status} | ${s.db.include_in_sitemap} |\n`;
});

out += "\n────────────────────────\n### 7 & 8. DOVEZI LIVE ȘI RECOMANDĂRI REMEDIERE PENTRU FIECARE P0\n────────────────────────\n";
data.suspects.forEach((s, idx) => {
  out += `\n#### ${idx+1}. /${s.db.slug}/\n`;
  out += `- **Live HTTP:** ${s.live.http}\n`;
  out += `- **Title Live:** ${s.live.title}\n`;
  out += `- **H1 Live:** ${s.live.h1}\n`;
  out += `- **Meta Live:** ${s.live.meta}\n`;
  out += `- **Pricing prezent:** ${s.live.has_pricing}\n`;
  if (s.live.text_mecanic.length > 0) {
    out += `- **Fragmente mecanice detectate în body:**\n`;
    s.live.text_mecanic.forEach(t => out += `  > "...${t.replace(/\n/g, ' ')}..."\n`);
  } else {
    out += `- **Fragmente mecanice detectate în body:** Nu s-au detectat (eroare este doar în H1/Title).\n`;
  }
  
  out += `\n**Recomandare: ${s.remediere.rec}**\n`;
  out += `- Motiv: ${s.remediere.motiv}\n`;
  out += `- Destinație: ${s.remediere.dest}\n`;
  out += `- Risc SEO: ${s.remediere.risc_seo}\n`;
  out += `- Risc User: ${s.remediere.risc_user}\n`;
  out += `- Verificare: ${s.remediere.verif}\n`;
});

out += "\n────────────────────────\n### 9. PRIORITATE EXECUȚIE\n────────────────────────\n";
out += "Aceste pagini reprezintă un **P0**. Toate au status `index`, apar în Sitemap și expun Google-ului (și utilizatorilor) un text generat mecanic de tipul `Animatori Petreceri Copii [slug]` direct în H1 și Titlu.\n";
out += "1. Remedierea trebuie să înceapă cu paginile locale valoroase (dacă există) și tematicile centrale, prin **Rewrite / Repair** (curățarea metadatelor și a H1-ului, înlocuirea textelor mecanice cu variante naturale).\n";
out += "2. Variantele de genul `/animatori-copii-bucuresti/` sau alte dubluri care canibalizează pagina principală trebuie soluționate prin **301 Redirect**.\n";

console.log(out);
