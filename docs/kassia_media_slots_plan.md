# Kassia Media Slots Plan

Deoarece am decis folosirea framework-ului Astro, media slots nu sunt limitate la un model JSON rigid, ci sunt direct atașate tabelei `gallery_items`.

Fiecare element din `gallery_items` are:
- `image_url`
- `alt_text` (foarte important pentru SEO)
- `is_featured` (folosit pentru slotul "Hero" sau imaginea principală a paginii)
- `sort_order`

### Gestiunea Slot-urilor în Admin

1. **Slotul Hero / Principal:**
   - Imaginea care are `is_featured = true` (prima în ordinea de sortare cu acest flag) va fi randată sus, în header-ul sau secțiunea Hero a paginii.
2. **Gallery Grid:**
   - Restul imaginilor vor fi randate sub formă de grid foto, util pentru portofoliu.
   
## Recomandări per Template

**Service (ex: `/arcada-baloane-bucuresti/`)**
- 1 x Imagine Featured (O arcadă spectaculoasă, clară, pusă în locație premium)
- 4-6 x Imagini în galerie (diverse forme și culori de arcade realizate)

**Event (ex: `/decoratiuni-baloane-botez-bucuresti/`)**
- 1 x Imagine Featured (Decor complet botez cu ursuleț/panou/arcadă/heliu integrat)
- 4-6 x Imagini în galerie (detalii specifice, masă candy bar cu baloane)

**Pilon & Homepage**
- 1 x Imagine Featured (Colaj sau decorul cel mai impunător din portofoliu)
- 6-9 x Imagini în galerie, amestecate din toate serviciile pentru a arăta diversitatea portofoliului Kassia.

*Sistemul de editare din `/admin/pages/[id]` permite reordonarea ușoară și bifarea flagului de "Featured" fără alte complicații JSON.*
