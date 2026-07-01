# Arhitectură Pagini SEO Kassia

Structura a fost deja fundamentată în faza de generare a Seed-ului, dar o readucem aminte aici pentru claritate strategică.

## Categorii și Ierarhie

### A. Pagini Pilon & Core (Batch 1)
- `/` (Homepage)
- `/decoratiuni-baloane-bucuresti/` (Pilonul Suprem)
- `/preturi-decoratiuni-baloane/`
- `/contact/`
- `/despre-noi/`
- `/galerie/`

### B. Pagini Servicii
- `/arcada-baloane-bucuresti/`
- `/baloane-heliu-bucuresti/`
- `/panou-foto-baloane-bucuresti/`
- `/buchete-baloane-bucuresti/`
- `/baloane-personalizate-bucuresti/`
- `/aranjamente-baloane-bucuresti/`

### C. Pagini Ocazii/Evenimente
- `/decoratiuni-baloane-botez-bucuresti/`
- `/decoratiuni-baloane-nunta-bucuresti/`
- `/decoratiuni-baloane-majorat-bucuresti/`
- `/decoratiuni-baloane-aniversare-copii-bucuresti/`
- `/decoratiuni-baloane-corporate-bucuresti/`
- `/decoratiuni-baloane-deschidere-restaurant-bucuresti/`
- `/decoratiuni-baloane-baby-shower-bucuresti/`
- `/decoratiuni-baloane-gender-reveal-bucuresti/`

### D. Pagini Zone (Geo)
- `/decoratiuni-baloane-sector-1/` ... `/decoratiuni-baloane-sector-6/`
- `/decoratiuni-baloane-ilfov/`
- Cartiere (Pipera, Otopeni, Titan, Berceni etc.)

### E. Pagini Satelit (Long Tail)
Acestea combină un Serviciu cu o Ocazie pentru interogări foarte precise (rata de conversie mare).
- `/arcada-baloane-botez-bucuresti/`
- `/panou-foto-baloane-majorat-bucuresti/`

---

## Detalii pe Template (Pagina Pilon)
**Slug:** `/decoratiuni-baloane-bucuresti/`
**Title:** Decorațiuni Baloane București – Arcade, Heliu & Decor Evenimente
**Main Keyword:** decorațiuni baloane bucurești
**Search Intent:** Comercial/Tranzacțional (vizitatorul caută pe cineva să îi decoreze locația)
**Template Type:** service_pillar (rutele standard din `[...slug].astro`)
**Required Internal Links:** Către TOATE serviciile și ocaziile majore (vezi `04_seed_internal_links.sql`).
**FAQ minime:** 6 (Prețuri, Montaj, Ilfov, Personalizare etc.)
**Risc de duplicate content:** Scăzut (este pagina care absoarbe cea mai mare autoritate și trimite semnale unice mai departe).
**Prioritate:** BATCH 1.
