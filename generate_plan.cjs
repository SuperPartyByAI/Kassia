const fs = require('fs');
const data = require('/tmp/audit_p0.json');

// Helper to remove mechanical prefix
function clean(str) {
  if (!str) return '';
  return str.replace(/Animatori Petreceri Copii /ig, '').trim();
}

function generateMeta(slug) {
  const parts = slug.split('-');
  const name = parts.join(' ');
  return `Descoperă ofertele Kassia Events pentru ${name}. Alege din cele mai populare pachete cu personaje, pictură pe față și baloane modelate pentru evenimentul tău.`;
}

let out = `# Plan Remediere P0: Pagini Mecanice Indexabile

Acest plan adresează vulnerabilitatea majoră detectată: pagini indexabile care conțin texte generate mecanic (title, H1, meta, text intro), ce riscă să atragă penalizări de tip spam/doorway.

## User Review Required

> [!WARNING]
> Acest plan va modifica **doar baza de date Supabase** (meta-date și H1) prin instrucțiuni SQL sigure. Nu necesită deploy, cod sau downtime, modificările aplicându-se imediat în front-end-ul Astro existent (care citește din Supabase).
>
> Vă rog să validați Batch 1 înainte de execuție.

## Open Questions

> [!IMPORTANT]
> 1. Paginile /animatori-petreceri-copii-berceni/ și /animatori-petreceri-copii-voluntari/ au fost raportate ca având "H1 mecanic" doar din cauza prezenței cuvintelor "Animatori petreceri copii". Ele nu conțin text mecanic în body. Vor fi excluse din acest update, fiind deja confirmate PASS? (Le-am exclus din Batch-uri).
> 2. Paginile de tip \`/animatori-copii-bucuresti/\` canibalizează pagina principală de animatori. Sunteți de acord cu 301 Redirect către \`/animatori-petreceri-copii/\`?

---

## Tabel Complet 32 Pagini Mecanice

| ID | URL | H1 Live | Motiv Detectare | Index Status | Recomandare |
|---|---|---|---|---|---|
`;

// Build Table
const suspects = data.suspects.filter(s => 
  s.db.slug !== 'animatori-petreceri-copii-berceni' && 
  s.db.slug !== 'animatori-petreceri-copii-voluntari' &&
  s.db.slug !== 'animatori-petreceri-copii-popesti-leordeni'
);

suspects.forEach(s => {
  let rec = 'A. REWRITE';
  if (s.db.slug.match(/^animatori-(copii|petreceri)-bucuresti$/)) rec = 'B. 301 REDIRECT';
  if (s.db.slug === 'animatori-copii-crangasi' || s.db.slug === 'animatori-tematica-unicorn-bucuresti') rec = 'A. REWRITE';
  out += `| ${s.db.id.substring(0,6)}... | /${s.db.slug}/ | ${s.live.h1} | ${s.db.suspect_reasons.join(', ')} | ${s.db.index_status} | ${rec} |\n`;
});

out += `

## Propunere BEFORE / AFTER (Pagini A. REWRITE)

Pentru paginile marcate cu A, vom executa un update în tabelul \`kassia_pages\` pentru a curăța stringurile "Animatori Petreceri Copii [slug]" și "cauti animatori pentru petreceri copii in...".

`;

suspects.forEach(s => {
  let rec = 'A. REWRITE';
  if (s.db.slug.match(/^animatori-(copii|petreceri)-bucuresti$/)) rec = 'B. 301 REDIRECT';
  
  if (rec === 'A. REWRITE') {
    const newTitle = clean(s.db.title) + " | Kassia Events";
    const newH1 = clean(s.db.h1).charAt(0).toUpperCase() + clean(s.db.h1).slice(1);
    const newMeta = generateMeta(s.db.slug);
    
    out += `### /${s.db.slug}/
- **Title BEFORE:** ${s.db.title}
- **Title AFTER:** ${newTitle}
- **H1 BEFORE:** ${s.db.h1}
- **H1 AFTER:** ${newH1}
- **Meta BEFORE:** ${s.db.meta_description}
- **Meta AFTER:** ${newMeta}
- **Body Intro BEFORE:** Cauți animatori pentru petreceri copii în ${s.db.slug.replace(/-/g, ' ')}?
- **Body Intro AFTER:** (Textul mecanic din intro va fi eliminat din câmpul content/intro)

`;
  }
});

out += `
## Plan Redirect (Pagini B. 301 REDIRECT)

Aceste variații generice canibalizează direct pagina principală de hub.

- **/animatori-copii-bucuresti/** -> 301 către **/animatori-petreceri-copii/**
- **/animatori-petreceri-bucuresti/** -> 301 către **/animatori-petreceri-copii/** (dacă există)

*Redirect-urile trebuie adăugate în middleware-ul Astro sau redirects din astro.config.mjs.*

## Prioritizare Batch-uri

### Batch 1 - Risc Major (Spam vizibil + Canibalizare)
**Pagini incluse:**
- \`/animatori-copii-crangasi/\`
- \`/animatori-botez-bucuresti/\`
- \`/animatori-gradinita-bucuresti/\`
- Variațiile 301 (ex: \`/animatori-copii-bucuresti/\`)

**Motiv:** Acestea au texte absurde live ("cauti animatori in animatori copii crangasi") și pot atrage penalizări rapide sau pot dezorienta utilizatorii care ajung pe ele.
**Risc:** Extrem de mic, valoarea actuală e negativă.
**Implementare:** Update direct în Supabase (fără cod necesar pentru A, doar modificarea astro.config.mjs pentru B).

### Batch 2 - Tematici Rankate, dar Mecanice
**Pagini incluse:**
- \`/animatori-tematica-unicorn-bucuresti/\` (Locul 1)
- \`/animatori-tematica-dinozauri-bucuresti/\` (Locul 1)
- \`/animatori-tematica-jungla-bucuresti/\` (Locul 1)
- \`/animatori-tematica-spatiu-bucuresti/\` (Locul 1)
- Toate celelalte tematici care au rank 1-3.

**Motiv:** Rankează deja, dar titlurile lor arată nenatural (\`Animatori Petreceri Copii animatori tematica dinozauri...\`).
**Risc:** Intervenția trebuie să păstreze keyword-ul. De aceea H1 AFTER devine doar "Animatori tematica dinozauri bucuresti".

### Batch 3 - Invizibile dar Valoroase
**Pagini incluse:**
- \`/mascote-petreceri-copii-bucuresti/\`
- \`/pictura-pe-fata-copii-bucuresti/\`
- \`/personaje-animatori-copii-bucuresti/\`

**Motiv:** Necesită ulterior dezvoltare de conținut util/pricing grid pentru a ranka. Pentru moment, curățăm metadata.
`;

fs.writeFileSync('/tmp/p0_plan_raw.md', out);
