# Plan Template Types Kassia

În CMS-ul construit curent pentru Kassia (Astro), nu avem o mecanică complexă bazată pe blocuri JSON cum are Zouka. Avem un model simplu și eficient definit prin `page_type` în tabelul `pages`.

## Tipurile curente de template-uri (page_type)

1. **`service`** (Ex: `/arcada-baloane-bucuresti/`)
   - Are secțiuni statice (Hero, Intro, Service Features, Gallery, Pricing, Process, FAQ, Final CTA).
   - Necesită focus pe tipul specific de produs și variantele lui de culori/forme.

2. **`event`** (Ex: `/decoratiuni-baloane-botez-bucuresti/`)
   - Structură similară cu service, dar focusată pe *emoția* și *scopul* evenimentului.

3. **`location`** (Ex: `/decoratiuni-baloane-sector-1/`)
   - Pagini de umplutură geo-localizată pentru a atrage trafic local.
   - Trimit către piloni și servicii principale.

4. **`satellite`** (Ex: `/arcada-baloane-botez-bucuresti/`)
   - Răspund la interogări de coadă lungă (long-tail). Au conținut foarte specific și evită canibalizarea.

5. **`support`** (Ex: `/contact/`, `/despre-noi/`)
   - Design mai curat, informațional. Fără Pricing Packages sau FAQ complexe de obicei.

Toate aceste tipuri folosesc, pentru moment, un singur render logic în Astro: `[...slug].astro`, care iterează automat prin secțiunile setate pe `is_active = true` (Hero, Intro etc). Nu avem nevoie de `PageRenderer` complex a la Zouka atâta timp cât secțiunile acoperă nevoile.
