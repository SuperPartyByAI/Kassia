# Kassia Admin & Visual Editor Audit

Acest raport detaliază capabilitățile actuale ale interfeței de administrare (`/admin/pages/[id]`) și evidențiază ajustările necesare pentru a susține faza de Content Entry și QA, protejând totodată SEO-ul.

## 1. Ce se poate edita în prezent (Verificat)

- ✅ **SEO (Title, H1, Meta Title, Meta Description, Canonical, Priority):** Complet funcțional prin tab-ul "SEO". Editările sunt salvate direct pe `kassia_pages`.
- ✅ **Sections Content:** Funcțional prin tab-ul "Sections". Permite editarea pentru `heading`, `subheading`, `body` (JSON/HTML), `cta_text`, `cta_url` și bifarea de `is_active`.
- ✅ **FAQ:** Funcțional prin tab-ul "FAQ". Oferă opțiuni complete de adăugare, editare, ștergere, sortare și bifare pentru a include întrebarea în schema org (JSON-LD).
- ✅ **Gallery:** Funcțional. Oferă input pentru `image_url` și `alt_text`, previzualizare imagine și status de "Featured".
- ✅ **Pricing:** Funcțional. Posibilitate adăugare pachete, features prin JSON array, preț, sortare.

## 2. Starea componentelor avansate

- ⚠️ **Internal Links:** Momentan sunt disponibile doar ca un view **Read-Only** în tab-ul "Internal Links" (afișează Target Path, Anchor Text, Link Type și Statusul țintei). Pentru a adăuga / edita / șterge un link, acțiunea nu este expusă vizual în UI în acest moment.

## 3. Sistemul de protecție la Publicare (Publish Blockers)

Aplicația are o logică de blocare a publicării (`canPublish`), dar audit-ul arată că aceasta **nu este aliniată perfect cu rigorile noului Batch**:

### Cum funcționează acum:
Butonul de "Publish Page" este blocat dacă:
- Lipsește H1, Meta Title sau Meta Description.
- Nu există minim 5 secțiuni active.
- Lipsește o secțiune de tip CTA.
- Nu există cel puțin un link intern outbound.
- Paginile comerciale nu au FAQ.

### Găuri de securitate identificate (Needs Fixes înainte de Go Live individual):
1. **Verificarea "Placeholder" lipsește:** Nu există nicio validare care să blocheze publicarea dacă un FAQ conține cuvântul "Placeholder" la răspuns.
2. **Empty Content:** Nu blochează dacă `content` este literalmente `{}` sau gol pe secțiunile active.
3. **Empty Gallery URLs:** Nu blochează publicarea dacă URL-ul imaginii este `''`.
4. **Condiția "Minim 5 secțiuni":** Hardcodarea `sections >= 5` poate bloca intenționat publicarea paginilor de Support (ex. `/contact/`) care au fost generate structural cu doar 3 secțiuni (`hero`, `content`, `final_cta`).

---

## CONCLUZIE AUDIT ADMIN:
**safe_for_owner_content_entry: DA** (Ownerul poate introduce conținutul perfect valid în tab-urile existente).
**safe_for_publish: NU** (Nu trebuie publicat direct din UI până nu rafinăm `Publish Readiness Checks` ca să verifice existența placeholder-elor și până nu revizuim regula cu 5 secțiuni pentru paginile suport).
