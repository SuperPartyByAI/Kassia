# Floreasca Cannibalization Decision

## Decizia Finală: VARIANTA B - păstrăm /animatori-petreceri-copii-floreasca ca URL principal

- **URL principal recomandat**: https://www.kassia.ro/animatori-petreceri-copii-floreasca
- **URL secundar**: https://www.kassia.ro/animatori-copii-floreasca
- **Motivul alegerii**: URL-ul principal are un scor mai bun (Indexabil: false, In Sitemap: false, Linkuri: 0, Word Count: 958 vs 720).
- **Ce conținut se păstrează**: Conținutul de bază al paginii principale.
- **Ce conținut se mută/îmbină**: Dacă pagina secundară are H2-uri sau texte utile/unice, vor fi mutate în cea principală.
- **Ce URL se pune în sitemap**: https://www.kassia.ro/animatori-petreceri-copii-floreasca
- **Ce URL primește internal links**: https://www.kassia.ro/animatori-petreceri-copii-floreasca
- **Ce URL se redirectează/canonicalizează**: https://www.kassia.ro/animatori-copii-floreasca va avea redirect 301 către https://www.kassia.ro/animatori-petreceri-copii-floreasca și va fi șters din sitemap/index.
- **Riscuri SEO**: Foarte mici. Vom consolida semnalele către o singură pagină cu autoritate.

## Plan exact de implementare (Fără execuție)
1. **Backup**: Salvăm conținutul vechi din ambele rute.
2. **Merge Content**: Adăugăm (dacă există) bucăți de text valoroase din `animatori-copii-floreasca` în `animatori-petreceri-copii-floreasca` (DB update).
3. **Set Inactive/301**: Marcăm `animatori-copii-floreasca` cu `is_active = false` și configurăm un Redirect 301 permanent către URL-ul principal.
4. **Optimize Primary**: Setăm `is_active = true` pentru `animatori-petreceri-copii-floreasca`, asigurăm că meta robots este index, follow și o adăugăm în sitemap.
5. **Internal Links**: Căutăm orice link intern existent către secundar și îl actualizăm către cel principal.
