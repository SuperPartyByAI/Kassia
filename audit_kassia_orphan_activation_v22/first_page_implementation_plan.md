# Implementation Plan: https://www.kassia.ro/animatori-petreceri-copii-floreasca

## 1. Ce pagină creștem
Ruta: `/animatori-petreceri-copii-floreasca`

## 2. Ce text/secțiuni adăugăm
- **Hero**: CTA clar pe Whatsapp și Telefon.
- **Pachete**: Tabel cu 3 pachete (Basic, Standard, Premium) pentru animatori.
- **Servicii Extra**: Pictură pe față, modelaj baloane.

## 3. Ce FAQ-uri adăugăm
- Cât costă un animator în floreasca?
- Ce activități fac animatorii Kassia?

## 4. Ce schema adăugăm/verificăm
- **FAQPage** Schema.
- **Product/Service** Schema.

## 5. Ce imagini folosim
- Imagini locale din repository (ex. `/src/assets/images/`) reprezentative pentru copii și animatori.

## 6. Ce internal links adăugăm către ea
- 3 link-uri in-text cu ancore relevante ("animatori petreceri copii floreasca").

## 7. Din ce pagini părinte linkăm către ea
- Din pagina principală de Servicii (dacă e serviciu) sau Locații (dacă e localitate nouă).
- Din Footer dacă este o locație P0.

## 8. Cum o adăugăm în sitemap
- Asigurându-ne că este publicată în DB (`is_active = true`) și că Astro/sitemap generator o preia la următorul build.

## 9. Ce verificări live facem după deploy
- `curl -I` pentru status 200.
- Verificare tag Canonical către ea însăși.
- Verificare prezență în `/sitemap.xml` și `/robots.txt` allow.

## 10. Cum evităm canibalizarea
- Asigurăm că title și H1 sunt unice pe acest cluster semantic (animatori pentru petreceri de copii in floreasca) față de celelalte 70 pagini indexate.
