# Audit Structură Kassia Existentă

Acest audit a fost generat pentru a verifica stadiul proiectului Kassia în raport cu CMS-ul Zouka.

## Rezultat Audit: Kassia este DEJA o platformă independentă

1. **Kassia există deja în DB:** **DA**. 
   - S-a construit deja o schemă dedicată (`01_schema.sql`) în baza de date Supabase curentă.
   - S-a rulat un seed script care a generat ~120 de pagini (Piloni, Servicii, Evenimente, Zone). Toate sunt în stadiu `draft`.
   - S-au generat deja zeci de legături interne prin `04_seed_internal_links.sql`.

2. **Kassia are site/tenant config:** **NU** (și nu are nevoie). 
   - Kassia NU este construit ca un modul multi-tenant în interiorul `zoukasplay-site`.
   - Kassia este un repo separat (`kassia-site`) construit pe tehnologia Astro, super optimizat pentru performanță SEO extremă (urmează principiul "zero JS pe client" by default).

3. **Kassia are business_profile:** **NU**.
   - Setările de domeniu și contact sunt gestionate prin variabile de mediu (`.env`) în Astro (ex: `PUBLIC_SITE_URL`).

4. **Kassia are pagini existente:** **DA**.
   - Toată structura (Pilon, Servicii, Ocazii, Zone, Sateliți) este deja generată. Paginile există fizic în baza de date, sunt setate ca `draft` și au linkurile interne configurate.

5. **Kassia poate folosi același CMS ca Zouka:** **NU** (și e un avantaj).
   - Nu dorim să amestecăm un CMS bazat pe React/Next.js (Zouka) cu unul bazat pe Astro (Kassia).
   - Mai mult, Kassia are **deja** un Admin Panel custom v1 integrat la adresa `/admin/` (construit în runda anterioară de dezvoltare), care oferă tab-uri SEO, secțiuni, FAQ, Prețuri și linkuri interne.

6. **Riscuri de coliziune cu Zouka:** **0**.
   - Sunt repo-uri separate (`wa-web-launcher/zoukasplay-site` vs `wa-web-launcher/kassia-site`). Ele comunică cu tabele diferite (Zouka folosește `seo_registry_*`, Kassia folosește tabele standard `pages`, `page_sections` etc. care tocmai au fost create special pentru ea).

7. **Ce trebuie creat înainte de seed:** 
   - Nimic din punct de vedere arhitectural (seed-ul a fost deja rulat în etapele anterioare, iar tabelele sunt populate).
   - Trebuie doar începută *completarea* manuală de conținut via `/admin/`.
