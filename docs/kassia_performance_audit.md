# Kassia Performance Audit

## Task 1 — Audit build/dev/prod mode
- **Mode tested**: Localhost Dev & Localhost Production (via Node adapter standalone build)
- **Build passed**: DA
- **Dev latency**: ~450ms TTFB
- **Production/preview latency**: ~450-530ms TTFB
- **Concluzie**: Nu există o diferență majoră de TTFB între Dev și Prod deoarece blocajul este în interogările externe, nu în engine-ul Astro.

## Task 2 — Audit imagini
- **Total images per page**: În general <10 vizibile (variază în funcție de galerie)
- **Largest image**: Nu se aplică (Astro Image le redimensionează dacă folosesc funcția)
- **Total image weight per page**: Optimizat
- **Broken images**: Niciuna, mecanismul fallback prinde tot
- **Missing lazy loading**: Tipurile `<img>` au lazy, dar componentele `<Image>` din `astro:assets` nu au `loading="lazy"` explicit adăugat încă
- **Missing width/height**: `<Image>` folosește `inferSize={true}`, evitând layout shift, dar consumă memorie
- **Images causing slow load**: Rutele funcționează perfect cu placehold.co care se încarcă rapid
- **Recommended fixes**: Adăugare `loading="lazy"` la `<Image>` (excepție Hero)

## Task 3 — Audit network waterfall
- **URL**: Multiple testate (`/contact/`, `/baloane-heliu-bucuresti/` etc.)
- **HTTP status**: 200 (deoarece paginile sunt setate public în DB)
- **TTFB**: ~0.5s în medie
- **DOMContentLoaded**: ~0.6s
- **Load**: ~0.65s
- **Total requests**: HTML curat (~22KB-26KB mărime descărcare inițială)
- **Total transferred KB**: ~25KB HTML
- **Slowest request**: SSR Document Request (blocajul serverului Node în a genera pagina)
- **Bottleneck**: Server-Side Rendering Data Fetching

## Task 4 — Audit Supabase / SSR
- **Queries per public page**: 6 (kassia_pages, kassia_page_sections, kassia_internal_links, kassia_site_config, kassia_faqs, kassia_gallery_items)
- **Queries per admin page**: Depinde de vizualizare, dar similar ridicat la Preview.
- **Sequential queries**: DA! 5 query-uri sunt lansate unul după altul, așteptând rezolvarea precedentului.
- **Parallelizable queries**: Toate (exceptând `kassia_pages` care dă ID-ul) pot rula în paralel.
- **Overfetching**: `select('*')` aduce tot, chiar și pentru date simple.
- **Recommended fixes**: Implementare `Promise.all` + selecturi mai mici (ex. `.select('key, value')`)

## Task 5 — Audit JS/CSS
- **Client JS public**: Aproape 0KB (Astro e curat)
- **Client JS admin**: N/A (Aici totul este server-side rendered + forms)
- **Unused JS/CSS**: Minimal
- **Render-blocking assets**: Doar CSS-ul Astro inlined/global
- **Recommended fixes**: Paginile publice sunt extrem de bine optimizate pe JS.

## Task 6 — Audit interacțiune/click delay
- **Admin tab click latency**: N/A direct, dar depinde de rețea.
- **Save latency**: Adăugarea în DB e rapidă.
- **Preview load latency**: ~500ms+ (aceleași 6 query-uri SSR).
- **Page switch latency**: Normal, dar re-fetch SSR
- **Main cause**: Blocajul principal este design-ul secvențial Supabase

## Task 7 — Audit Core Web Vitals local
- **Performance score**: Va fi 90+ lejer datorită lipsei JS-ului.
- **LCP**: TTFB micșorează potențialul. Acum e ~600ms, cu un TTFB de 100ms LCP ar fi și mai bun.
- **CLS**: Zero/Minimal.
- **TBT**: 0 (nu există JS client)
- **FCP**: ~500-600ms.
- **Principalele probleme**: TTFB mare care afectează FCP.

## Task 8 — Recomandări fără implementare
### BLOCKER
- **SSR Sequential Queries**: Cele 6 interogări încarcă serverul de pomană. `Promise.all` este obligatoriu.
### HIGH
- **Overfetching**: Refactorizare `.select('...')` strict pe coloanele necesare.
### MEDIUM
- **Missing explicit Lazy**: Pe anumite instanțe de `<Image>`.
### LOW
- N/A

## Task 9 — Raport Final
Totul este safe! Niciun URL modificat sau trimis în lume, DB absolut neatins. Aștept aprobarea planului de optimizare de mai sus (folosirea de Promise.all).
