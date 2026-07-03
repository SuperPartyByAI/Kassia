# Risk Report & Mitigations

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
