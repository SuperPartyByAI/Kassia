# Plan de Lucru Content Entry - Kassia Site

Acest document reprezintă planul de lucru pentru faza de introducere a conținutului, pagină cu pagină.
**Important:** Scheletul SEO a fost validat. Structura nu trebuie alterată.

## Reguli Absolute
1. **NU publica nicio pagină.** Nu se va publica nimic după Save.
2. **NU seta `status='published'`.** Rămâne `draft`.
3. **NU seta `index_status='index'`.** Rămâne `noindex`.
4. **NU seta `include_in_sitemap=true`.** Rămâne `false`.
5. **NU modifica link graph-ul intern.**
6. **NU modifica URL-uri, sluguri, parent_page_id, page_type sau kassia_seo_map.**
7. **NU șterge secțiuni.** Păstrează structura curentă.
8. **NU atinge tabele non-kassia.**

## Statusuri de Lucru
Pentru o urmărire corectă, folosim următoarele stadii:
- `needs_content` — pagina are schelet, dar nu are conținut real.
- `in_progress` — Ownerul lucrează la ea.
- `ready_for_review` — Ownerul a completat text/FAQ/poze.
- `needs_revision` — trebuie corecturi pe baza auditului.
- `approved_for_publish` — a trecut auditul final, dar încă NU se publică automat.
- `published` — se folosește doar după decizie manuală explicită, pagină cu pagină (în faza de publicare efectivă).

## Criterii Generale (Checklist per Pagină)
O pagină este considerată "ready_for_review" doar dacă bifează:
- [ ] H1 real, cu diacritice
- [ ] Meta title real
- [ ] Meta description real
- [ ] Conținut principal complet
- [ ] Fără `Adauga continut aici`
- [ ] Fără `Draft FAQ`
- [ ] Fără `Placeholder`
- [ ] FAQ complet, unde este prevăzut
- [ ] Imagini reale, unde există galerie
- [ ] Alt text complet pentru fiecare imagine
- [ ] CTA text real
- [ ] CTA URL valid, de preferat `/contact/`
- [ ] Linkuri interne nealterate de Owner
- [ ] Status rămâne `draft`
- [ ] Index status rămâne `noindex`
- [ ] Sitemap rămâne `false`

## Specificații pe Tip de Pagină (page_type)

### 1. `support` (ex. Contact, Despre, Legal, Prețuri, FAQ)
- H1
- Meta title și Meta description
- Body principal clar și concis
- CTA (dacă există)
- Poze doar unde are sens
- Fără umflare SEO inutilă

### 2. `service_pillar` (ex. Hub Decorațiuni)
- H1, Meta title, Meta description
- Intro real (explicație de ansamblu)
- Lista de servicii incluse / categorii
- Galerie generală
- FAQ relevant pentru categoria respectivă
- CTA spre contact
- Păstrarea linkurilor interne strategice

### 3. `service` (Pagini de Servicii)
- Descriere specifică a serviciului
- Beneficii
- Cum se comandă procesul
- Preț orientativ (sau preț "de la")
- Galerie specifică serviciului
- FAQ specific
- CTA către contact

### 4. `event` (Pagini de Evenimente)
- Contextul evenimentului (descriere)
- Idei de decor tematice
- Servicii recomandate pentru acest eveniment
- Galerie specifică evenimentului
- FAQ
- CTA către contact

### 5. `gallery` / Galerie
- Imagini reale
- Alt text descriptiv la toate imaginile
- Categorii clare
- Fără imagini neclare sau fără drept de utilizare (doar portofoliu real Kassia)

### 6. `FAQ` (Întrebări Frecvente)
- Întrebări reale ale clienților
- Răspunsuri clare
- 0 apariții ale sintagmei `Draft FAQ` sau `Placeholder`

---

## Faza 1: Batch 1 (Core Content Entry)

Aceasta este prioritatea numărul 1. Paginile fundamentale comerciale și de încredere.

| Order | URL | Type | Status | Ce trebuie completat | Poze? | FAQ? | CTA? | Owner Notes | Review Notes |
|---|---|---|---|---|---|---|---|---|---|
| 1 | `/contact/` | support | needs_content | Date contact, formular (dacă e cazul) | Nu | Nu | Nu |  |  |
| 2 | `/preturi-decoratiuni-baloane/` | support | needs_content | Listă prețuri orientative, pachete | Da | Da | Da |  |  |
| 3 | `/decoratiuni-baloane-bucuresti/` | service_pillar | needs_content | Pilon principal. Intro general, legături. | Da | Da | Da |  |  |
| 4 | `/arcada-baloane-bucuresti/` | service | needs_content | Descriere arcadă, prețuri per m liniar. | Da | Da | Da |  |  |
| 5 | `/baloane-heliu-bucuresti/` | service | needs_content | Oferta heliu, pachete, detalii transport. | Da | Da | Da |  |  |
| 6 | `/panou-foto-baloane-bucuresti/` | service | needs_content | Tipuri panouri (rotund, pătrat, organic). | Da | Da | Da |  |  |
| 7 | `/decoratiuni-baloane-botez-bucuresti/` | event | needs_content | Context botez, idei ursuleți, etc. | Da | Da | Da |  |  |
| 8 | `/decoratiuni-baloane-nunta-bucuresti/` | event | needs_content | Context nuntă, foto corner, intrare. | Da | Da | Da |  |  |
| 9 | `/galerie/` | support | needs_content | Hub vizual principal. Poze top. | Da | Nu | Da |  |  |
| 10 | `/intrebari-frecvente/` | support | needs_content | Hub FAQ general (livrare, comenzi). | Nu | Da | Da |  |  |

---

## Faza 2: Batch 2, 3, 4, 5 (Planificare)

Nu completa conținutul pentru ele acum, doar organizează-le logic pentru publicarea în valuri (pentru a simula o creștere naturală pentru Google).

### Batch 2: Servicii și Evenimente Secundare
- **Pagini:** Restul de pagini de servicii și evenimente comerciale cu intenție mare.
- **Prioritate:** Intenție comercială ridicată, legături cu Batch 1, nevoia imperioasă de a arăta portofoliu specific.

### Batch 3: Locații / Geotargeting
- **Pagini:** sectoare, zone Ilfov, sateliți principali geolocați.
- **Prioritate:** Volum local, relevanță de proximitate. Paginile trebuie să citeze zone reale din București/Ilfov.

### Batch 4: Blog & Articole Ghid
- **Pagini:** Blog guides, articole informaționale (ex. cum se montează, câte baloane, diferența latex/folie).
- **Prioritate:** Răspuns la întrebări de research, volum estimat informativ. Împing autoritate spre Batch 1 & 2.

### Batch 5: Long-Tail și Consolidare
- **Pagini:** Long-tail suplimentar foarte nișat, sateliți secundari, revizii post-indexare pentru paginile deja publicate.
- **Prioritate:** Acoperirea tuturor căutărilor granulare.

---

## Regula de Publicare (Publish Guard)
- **NU** există publish global (bulk).
- Publicarea este un act manual, **pagină cu pagină**.
- O pagină se trece în `published` **DOAR** dacă trece validarea:
  1. Are conținut real complet.
  2. Nu are niciun placeholder (text sau imagini lipsă).
  3. Are FAQ real (dacă page_type o cere).
  4. Are poze reale cu alt text.
  5. CTA-urile funcționează (verificare validitate /contact/).
  6. Linkurile interne funcționează și nu au anchor spam.
  7. Preview frontend pe desktop/mobile arată corect.
  8. **Auditul post-content trece verde.**
  9. Primesc acord explicit de la tine.
