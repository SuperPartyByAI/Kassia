# Admin Panel Kassia

Admin Panel-ul Kassia este construit direct în Astro (`/admin/`) pentru a gestiona facil CMS-ul SEO. 

## Cum se folosește adminul
- Accesează `/admin/` pentru a vedea dashboard-ul cu statisticile paginilor.
- Din `/admin/pages/` poți sorta și filtra paginile. Recomandăm să folosești filtrele rapide (Draft, Service, Event etc.) pentru a găsi rapid pagina la care lucrezi.
- Dând click pe "Edit", intri în interfața detaliată a unei pagini unde poți naviga prin tab-uri (SEO, Sections, FAQ, Pricing, Gallery, Internal Links, Publish Check).
- Salvează pe rând informațiile din fiecare tab folosind butoanele corespunzătoare.

## Cum se publică o pagină
1. Completează toate datele esențiale în tab-urile (SEO, Sections, etc).
2. Mergi la tab-ul **Publish Check**.
3. Aici vei găsi un checklist cu cerințele SEO minime (H1, Meta descrieri, minimum 5 secțiuni active, Call to Action activ, FAQ completat și link-uri interne). 
4. Când tot checklist-ul are "✅", se va activa butonul verde **Publish Page**.
5. Apasă-l pentru a publica oficial pagina!

## Diferența dintre publicare și indexare
- **Publicare (Status):** O pagină devine vizibilă în frontend pentru oricine accesează URL-ul direct sau face click pe un link intern. Răspunde cu 200 OK.
- **Indexare (Index Status):** Pagina este inclusă în `sitemap.xml` și i se adaugă meta tag-ul `index, follow` pentru a fi luată în considerare de Google.
- Butonul **Publish** le face pe amândouă simultan.
- Butonul **Unpublish / Noindex** nu șterge pagina și nici nu o ascunde (rămâne `published`), ci o setează ca `noindex` și o scoate din sitemap. Este ideal dacă vrei ca pagina să funcționeze dacă cineva are link-ul, dar să nu mai apară în motoarele de căutare.

## De ce paginile Draft nu apar public
Orice pagină cu status `draft` returnează o eroare server `404 Not Found` în frontend, pentru a preveni accesarea și vizualizarea conținutului nefinisat de către Googlebot sau vizitatori oarecare. Însă în Admin Panel, linkurile interne către ele sunt încă afișate, permițându-ți să planifici structura site-ului în ansamblu, ca și cum paginile ar exista public.

## Securitate obligatorie (Înainte de producție)
**ATENȚIE:** Momentan panoul de administrare este PUBLIC. Înainte de lansarea în producție, ruta `/admin/` (și toate sub-rutele sale) TREBUIE protejată folosind un sistem de autentificare (ex. HTTP Basic Auth la nivel de Nginx/Vercel sau un sistem de login cu cookie-uri / JWT validat în Astro middleware). Nu lăsa acest modul expus la internet deschis!
