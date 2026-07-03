# Plan de Remediere Pagina Pilon (GAP V3)

## Analiză și Concluzii (Loss Map)

În urma analizei competitorilor care au bătut Kassia, s-au evidențiat următoarele gap-uri comerciale majore pe care le putem remedia on-page fără să inventăm prețuri:

1. **Deficit masiv de H2-uri comerciale/semantice:** Competitorul principal (`paradisulpersonajelor.ro`) folosește 35 de H2-uri pentru a acoperi absolut toate micro-intențiile. Kassia are momentan doar 14.
2. **Lipsa structurii clare de pachete/programe:** Chiar dacă nu punem prețuri fixe, trebuie să simulăm o ofertă ierarhică (Pachet Scurt, Standard, Extins) pentru a prinde intenția "pachete animatori".
3. **Detalii limitate despre Mascote și Recuzită:** Mulți clienți caută combinarea serviciilor, iar competitorii evidențiază acest lucru mult mai bine.
4. **Acoperire geografică locală (Internal Linking):** Trebuie să linkuim mult mai agresiv paginile de sector (inclusiv restul sectoarelor/București/Ilfov dacă sunt active).

## Schimbări Propuse pe `kassia_page_sections`

Vom insera/suplimenta secțiunile în Supabase (via `update_pillar_remediation.mjs`):

### [NEW] Secțiune: Variante de Programe și Pachete (H2)
- **H3:** Pachet Scurt (Mini-party)
  - Text: Ideal pentru evenimente restrânse (grădinițe, acasă). Jocuri rapide și modelaj baloane.
  - CTA: "Cere ofertă personalizată"
- **H3:** Pachet Standard (Recomandat)
  - Text: Cel mai popular program. Include jocuri, muzică, mini-disco și pictură pe față.
  - CTA: "Cere ofertă personalizată"
- **H3:** Pachet Extins (Full Party)
  - Text: Program prelungit ce include și prezența mascotelor Disney și decoruri complexe de baloane.
  - CTA: "Cere ofertă personalizată"

### [NEW] Secțiune: Detalii despre Recuzită, Mascote și Adaptare Vârstă (H2)
- Vom detalia tipurile de recuzită aduse de animatori (boxă, baloane modelaj, culori profesionale pt face painting).
- Vom sublinia capacitatea de a aduce mascote suplimentare la cerere și cum programul este modificat live în funcție de vârsta copiilor (1-3 ani, 4-7 ani, 8-12 ani).

### [MODIFY] Internal Linking și Acoperire Geografică
- Verificăm existența paginilor pentru Sector 3, 4, 5, 6, București și Ilfov. 
- Vom insera noi link-uri interne **doar** spre cele care au `status='published'` și `index_status='index'`.

### [MODIFY] FAQ
- Adăugăm 2 întrebări adiționale pentru a atinge un volum total de 20 FAQ-uri vizibile (ex. "Cum ne asigurăm că animatorul ajunge la timp?" și "Ce se întâmplă dacă sunt prezenți și copii mai mari la petrecere?").
- FAQ Schema va fi sincronizată automat.

## Verificare Post-Implementare

1. Vom rula scriptul de `deploy_p0.sh`.
2. Vom re-rula **Proof Gate V3** pentru a demonstra că noile adăugiri au crescut scorul Kassia astfel încât să bată constant 8/10 competitori pe cuvintele principale.
3. Vom verifica Live QA cu Puppeteer să ne asigurăm că H2-urile apar corect și layout-ul este intact (niciun tag brut vizibil, social proof păstrat intact).
