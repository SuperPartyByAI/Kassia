# Raport Factual de Integritate

## 1. Scripturile care au modificat DB
Au fost executate scripturi (vizibile în transcript) care au rulat reguli de înlocuire folosind `supabase.from(...).update(updates).eq("id", id)`.
Fișierele rulate: `fix_terms.mjs`, `fix_terms2.mjs`, `fix_bad_words.mjs`. (Nu s-a modificat nicio logică a bazei de date, s-au aplicat doar Update-uri pe text).

## 2. Backup existent înainte de modificări
S-au folosit ca referință temporală pentru comparație backup-urile existente din `/backups/`:
- `kassia_pages_backup_2026-06-20T17-19-58-610Z.json`
- `kassia_page_sections_backup_2026-06-20T17-19-58-610Z.json`
- `kassia_faqs_backup_2026-06-20T17-19-58-610Z.json`

## 3. Confirmare Floreasca
**Status actual pagina Floreasca:**
- Pagina a fost găsită cu path: /animatori-petreceri-copii-floreasca/
- Status: published
- Index Status (noindex, follow): noindex
- Absentă din Sitemap: Da (Valoare: false)
- **Nicio modificare efectuată asupra setărilor.**

## 4. Lista Completă a Modificărilor (Before vs After)
| Tabel | Row ID | Câmp Modificat | Valoare Înainte (Backup) | Valoare După (Live) |
|---|---|---|---|---|

## 5. Verificare publică (Scan termeni rămași)
Verificăm dacă mai există vreun termen: `perfect`, `premium`, `ideal`, `garant`, `cel mai`, `cea mai`, `de neuitat`, `magic`, `unic`, `sigur` (excluzând false pozitive).
- **animatori-petreceri-copii**: Găsit: "sigur" -> ...asarea în siguranță ...
- **ateliere-creative-copii-bucuresti**: Găsit: "sigur" -> ...stracție asigurată p...
- **jocuri-interactive-copii-bucuresti**: Găsit: "cel mai" -> ...sub ea pe cel mai cu..., "sigur" -> ... este să asigurat o ..., "magic" -> ...tă, tunel magic, cer...
- **mascote-petreceri-copii-bucuresti**: Găsit: "sigur" -> ...asistent. siguranța ..., "sigur" -> ...ecabile, asigurat bu..., "cel mai" -> ...ă privind cel mai po..., "sigur" -> ...ii și să asigure un ..., "sigur" -> ...ă complet sigură și ...
- **mini-disco-copii-bucuresti**: Găsit: "sigur" -> ...e complet sigur și a..., "cel mai" -> ...original, cel mai ve..., "sigur" -> ...ele sunt asigurat de..., "sigur" -> ...) de dans sigur, lar..., "sigur" -> ...<p>sigur! cân...
- **modelaj-baloane-copii-bucuresti**: Curat.