# Documentație CMS SEO Kassia

Acest document explică arhitectura bazei de date și a regulilor SEO pentru Kassia CMS.

## Concepte de Bază: Slug vs Path

Sistemul face distincție între identificatorul paginii și URL-ul final:

1. **`slug`**
   - Identificator SEO curat.
   - Restricții: doar litere mici, cifre, cratime. Fără slash-uri! Fără spații!
   - Exemplu: `decoratiuni-baloane-bucuresti`
   - Excepție: Pentru homepage, slug-ul este `home`.

2. **`path`**
   - URL-ul public complet. Acesta trebuie să aibă mereu slash la început și la final.
   - Exemplu: `/decoratiuni-baloane-bucuresti/`
   - Excepție: Pentru homepage, path-ul este `/`.
   - **Important:** Funcțiile de sitemap și canonical folosesc `path`, nu `slug`.

## Concepte de Bază: Status vs Index Status

Sistemul folosește doi indicatori separați pentru a oferi flexibilitate completă:

1. **`status` (`draft` | `published` | `archived`)**
   - Controlează vizibilitatea paginii pe frontend.
   - `draft`: Pagina poate fi văzută doar din interiorul adminului (Preview) sau de către echipa de content. Pe site-ul public, returnează `404 Not Found`.
   - `published`: Pagina este accesibilă public (răspunde cu `200 OK`).

2. **`index_status` (`noindex` | `index`)**
   - Controlează comunicarea cu motoarele de căutare (Googlebot).
   - `noindex`: Adaugă `<meta name="robots" content="noindex, follow">`. Google nu o va pune în rezultate.
   - `index`: Adaugă `<meta name="robots" content="index, follow">`.

3. **`include_in_sitemap` (`true` | `false`)**
   - Dacă e `true`, URL-ul apare în `sitemap.xml`.
   - **Regula de aur:** O pagină ajunge în sitemap **doar dacă** este `status = 'published'` ȘI `index_status = 'index'`.

## Concepte de Bază: Internal Links

Sistemul folosește tabela `internal_links` pentru a crea o arhitectură SEO (Harta Site-ului) logică.

**Reguli Internal Links:**
1. **Existența legăturilor:** Legăturile în baza de date pot (și e bine să) existe chiar și între pagini `draft`. Acesta reprezintă un "plan SEO". Ele nu dublează (datorită constrângerii UNIQUE).
2. **Afișarea pe frontend (Public):** Frontend-ul Astro randează sub secțiunile paginii legăturile interne **DOAR CĂTRE** pagini care au `status = 'published'`. Orice target page în stadiu `draft` este filtrat, astfel încât vizitatorii/Googlebot să nu dea de pagini cu 404.
3. **Admin:** Din admin (`03_admin_queries.sql`), un query simplu îți va arăta toate legăturile (draft sau published) ca să poți planifica și testa rutele de autoritate.

## Cum se Publică o Pagină

Pentru a publica o pagină care este gata de indexare, rulează funcția SQL de mai jos. Această funcție conține validări stricte (SEO Guard) și nu te va lăsa să publici pagini incomplete!

```sql
SELECT publish_page('uuid-ul-paginii-aici');
```

**Ce face funcția:**
1. Verifică dacă pagina are `h1`, `meta_title`, `meta_description`.
2. Verifică dacă există minim 5 secțiuni active.
3. Verifică dacă există o secțiune de tip `CTA` activă.
4. Verifică dacă există minim un rând în `faqs` pentru paginile de servicii, evenimente, locații sau satelit.
5. Setează `status = 'published'`, `index_status = 'index'`, `include_in_sitemap = true`.

## Cum trebuie completată o pagină înainte de indexare

O pagină proaspătă din `seed` are doar slug-ul/path-ul și titlurile auto-generate. Înainte de a rula `publish_page`, trebuie:
1. Să intri în Visual Editor.
2. Să adaugi conținut real în secțiunile pre-create (Hero, Intro, Pricing, Galerie, etc.).
3. Să marchezi cel puțin 5 secțiuni ca `is_active = true`.
4. Să adaugi o întrebare frecventă în secțiunea FAQ.
5. Să te asiguri că ai un Call to Action.

## Cum se Scoate o Pagină din Index

Dacă ai publicat o pagină din greșeală, sau nu mai vrei să fie indexată (ex: pagină perimată):

```sql
SELECT unpublish_page('uuid-ul-paginii-aici');
```

**Ce face funcția:**
Schimbă statusul SEO la `noindex` și o scoate din `sitemap.xml`. Pagina va continua să poată fi accesată de vizitatorii care au link-ul direct (dacă rămâne `published`), dar va dispărea din Google. Dacă vrei să o ascunzi de tot, îi schimbi manual `status = 'draft'`.

## Ordinea Recomandată de Publicare (Sitemap Rollout)

Pentru a oferi lui Google o structură logică, publică paginile în valuri:

1. **Valul 1 (Fundația):** Homepage, `/contact/`, `/despre-noi/`, `/preturi-decoratiuni-baloane/`, `/galerie/`.
2. **Valul 2 (Categoriile Părinte):** `/decoratiuni-baloane-bucuresti/` (baza ierarhiei).
3. **Valul 3 (Servicii de bază):** `/arcada-baloane-bucuresti/`, `/baloane-heliu-bucuresti/`, `/panou-foto-baloane-bucuresti/`, `/buchete-baloane-bucuresti/`.
4. **Valul 4 (Evenimente Mari):** botez, nuntă, moț, majorat, corporate.
5. **Valul 5 (Sectoare București):** `/decoratiuni-baloane-sector-1/` până la `6`.
6. **Valul 6 (Ilfov și Cartiere):** Voluntari, Pipera, Titan, etc.
7. **Valul 7 (Pagini Satelit/Long Tail):** combinații hiper-specifice gen `/arcada-baloane-botez-bucuresti/`.

*Nu publica toate paginile deodată! Construiește autoritatea încet. Google trebuie să găsească internal links între paginile de bază înainte să dea de cele mici.*
