import fs from 'fs';
import path from 'path';

const outDir = path.join(process.cwd(), 'audit_animatori_rank1_v1');
if (!fs.existsSync(outDir)) {
    fs.mkdirSync(outDir);
}

// 1. current_structure_order.json
const currentStructure = {
  "sections_in_order": [
    "hero",
    "pachete",
    "ce evităm",
    "pas cu pas",
    "un personaj sau două",
    "activități",
    "personaje",
    "zone",
    "CTA",
    "exemple programe",
    "catalog",
    "galerie",
    "FAQ",
    "recenzii"
  ]
};
fs.writeFileSync(path.join(outDir, 'current_structure_order.json'), JSON.stringify(currentStructure, null, 2));

// 2. proposed_structure_order.md
const proposedStructure = `# Proposed Sales-First Structure

A. Hero scurt comercial
- H1: Animatori petreceri copii București și Ilfov
- preț de la 280 lei
- CTA WhatsApp / Sună
- buton „Vezi pachete”
- buton „Vezi personajele”

B. Pachete/prețuri
- 280 lei / 1 oră / 1 personaj
- 490 lei / 2 ore / 1 personaj
- 490 lei / 1 oră / 2 personaje
- 830 lei / 2 ore / 2 personaje

C. Personaje/costume preview
- 8–12 carduri cu imagini reale
- link spre /catalog-costume/

D. Ce include programul
- jocuri interactive
- mini-disco
- modelaj baloane
- pictură pe față
- moment tort
- fotografii

E. Recenzii / trust
- rating 4.9
- 3–6 recenzii scurte reale vizibile sus
- restul recenziilor mutate mai jos dacă e nevoie

F. Zone București & Ilfov
- Sector 1–6
- Ilfov / Voluntari / Berceni / Popești-Leordeni
- format simplu, fără aglomerare text

G. Ghiduri utile jos
- ce evităm
- pas cu pas
- un personaj sau două
- cum alegi programul

H. FAQ final
- Întrebări frecvente și răspunsuri clare, implementate în acordion
`;
fs.writeFileSync(path.join(outDir, 'proposed_structure_order.md'), proposedStructure);

// 3. content_keep_move_remove.json
const contentAction = {
  "hero": "keep_high",
  "pachete": "keep_high",
  "ce evităm": "move_lower",
  "pas cu pas": "move_lower",
  "un personaj sau două": "move_lower",
  "activități": "condense",
  "personaje": "keep_high",
  "zone": "keep_as_is",
  "CTA": "keep_high",
  "exemple programe": "move_lower",
  "catalog": "keep_high",
  "galerie": "keep_as_is",
  "FAQ": "keep_as_is",
  "recenzii": "keep_high"
};
fs.writeFileSync(path.join(outDir, 'content_keep_move_remove.json'), JSON.stringify(contentAction, null, 2));

// 4. pricing_source_verification.json
const pricingVerif = {
  "verified_prices_from_live": [
    "280 lei / 1 oră / 1 personaj",
    "490 lei / 2 ore / 1 personaj",
    "490 lei / 1 oră / 2 personaje",
    "830 lei / 2 ore / 2 personaje"
  ],
  "fake_discounts_used": false,
  "fake_prices_invented": false,
  "source": "Kassia live DB / current page content"
};
fs.writeFileSync(path.join(outDir, 'pricing_source_verification.json'), JSON.stringify(pricingVerif, null, 2));

// 5. schema_plan.md
const schemaPlan = `# Schema.org Plan

Vom folosi DOAR entități legitime, respectând strict politicile Google:

1. **Service:** Pentru descrierea serviciului principal (animatori petreceri copii).
2. **Offer:** Legat strict de pachetele reale, verificate (280, 490, 830 lei), care sunt fizic afișate pe pagină.
3. **FAQPage:** Legat exclusiv de secțiunea FAQ vizibilă.
4. **BreadcrumbList:** Pentru ierarhia corectă de navigare.
5. **Organization / LocalBusiness:** Doar dacă structura deja există și este curată.

INTERDICȚII RESPECTATE:
- FĂRĂ AggregateRating fals.
- FĂRĂ review schema inventată.
- FĂRĂ prețuri ascunse sau care nu corespund cu afișajul vizual.
`;
fs.writeFileSync(path.join(outDir, 'schema_plan.md'), schemaPlan);

// 6. internal_linking_plan.md
const linkPlan = `# Internal Linking Plan

Direcții de linking intern pentru consolidarea autorității:

1. **Din pagina pilon (Outbound intern):**
   - Către \`/catalog-costume/\` (ancoră: "Vezi catalogul complet").
   - Către pagina de prețuri detaliate animatori (ancoră: "Vezi toate prețurile").
   - Către paginile de sectoare (curat, listă neabuzivă).
   - Către servicii complementare (face painting, baloane, mascote).

2. **Din paginile locale (Inbound spre pilon):**
   - Linkuri naturale înapoi spre pilon folosind ancore de tip "programe animatori", "animatori petreceri copii", "animatori București".
`;
fs.writeFileSync(path.join(outDir, 'internal_linking_plan.md'), linkPlan);

// 7. risk_report.md
const riskReport = `# Risk Report & Mitigations

1. **Canibalizare cu pagina București:**
   - *Risc:* /animatori-petreceri-copii/ și /animatori-petreceri-copii-bucuresti/ se pot bate în SERP pentru aceeași intenție.
   - *Atenuare:* Trebuie stabilit clar în GSC care pagină primește impresiile și canonicizarea. Posibil rel="canonical" sau diferențiere semantică clară (National vs Local strict).

2. **Text ascuns în acordeon (FAQ / Ghiduri):**
   - *Risc:* Ascunderea excesivă a textului poate diminua greutatea semantică, deși Google spune că indexează textul din tab-uri/acordeoane, este considerat "mai puțin important" uneori.
   - *Atenuare:* Păstrăm informațiile esențiale vizibile, băgăm în acordeon doar "ce evităm" și "FAQ".

3. **Pagină prea grea (Mobile Performance):**
   - *Risc:* Adăugarea de multe imagini mari de personaje + galerie scade Core Web Vitals (LCP).
   - *Atenuare:* Lazy loading strict pe imaginile de sub fold, conversie Next-Gen (WebP), limitare preview la max 8-12 carduri.

4. **Schema incorectă / Spam:**
   - *Risc:* Penalizare manuală pentru spam structurat.
   - *Atenuare:* Aplicare pură doar pentru entități verificabile vizual (fără fake reviews).

5. **Pierdere conținut semantic:**
   - *Risc:* Tăierea masivă din textul de 4000 de cuvinte poate arunca pagina în jos temporar, până se re-evaluează intenția.
   - *Atenuare:* NU ștergem textul, îl coborâm la final (move_lower).
`;
fs.writeFileSync(path.join(outDir, 'risk_report.md'), riskReport);

console.log("Detailed Rank 1 Plan Generated successfully.");
