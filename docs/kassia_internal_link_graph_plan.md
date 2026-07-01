# Kassia Internal Link Graph Plan

Planul a fost deja implementat via scriptul `generate_internal_links_seed.js`.

### Principii SEO Aplicate
1. **Pilonul Principal (`/decoratiuni-baloane-bucuresti/`)**
   - Trimite către principalele servicii și ocazii. Este nodul central de autoritate.
2. **Servicii (ex. `/arcada-baloane-bucuresti/`)**
   - Trimit mereu ÎNAPOI spre Pilon.
   - Trimit către Pagini Suport: Contact, Prețuri.
3. **Ocazii/Evenimente (ex. `/decoratiuni-baloane-botez-bucuresti/`)**
   - Trimit către Pilon.
   - Trimit către Serviciile relevante (Arcade, Heliu, etc.)
4. **Locații Geo**
   - Trimit către Pilon și către câteva servicii de bază (Arcade, Heliu).
5. **Sateliți**
   - Trimit înapoi spre părintele direct (Serviciu + Ocazie) și spre Pilon.

Această structură circulară ("Silo") a fost încărcată fizic în tabela `internal_links` și previne rutele orfane. Pagini orfane nu există, deoarece scriptul a parcurs absolut toate cele 120 de URL-uri planificate.
