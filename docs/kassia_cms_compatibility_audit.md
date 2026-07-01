# Kassia CMS Compatibility Audit

Acest document verifică dacă arhitectura complexă Zouka (Next.js, PageRenderer, blocks JSON, multi-tenant `site_id`) este compatibilă/necesară pentru Kassia.

## Rezultat: NU este recomandată unificarea în același CMS.

**De ce?**
1. **Tehnologie diferită:** Kassia folosește **Astro**, în timp ce CMS-ul Zouka este construit probabil în Next.js/React.
2. **Kassia are deja CMS-ul propriu:** Noi tocmai am construit în baza de date Supabase schema completă pentru Kassia (`pages`, `page_sections`, `internal_links` etc.) și am creat un Admin Panel în Astro (`/admin/`).
3. **Complexitate Inutilă:** Multi-tenant-ul adaugă un layer de complexitate uriașă (filtrare constantă RLS după `site_id`, rute virtuale). Kassia are nevoi de publicare simplă de conținut static.
4. **Performanța SEO:** Astro livrează zero JS pe frontend. React/Next livrează JS. Pentru un site de servicii de decorațiuni care se luptă la sânge pentru PageSpeed și rank local, abordarea Astro curentă este net superioară.

### Răspunsuri punctuale:
- *Page Library poate separa site-urile?* Da, prin tenant ID, dar Kassia nu folosește acest sistem.
- *Visual Editor poate funcționa?* Kassia are editorul ei integrat (tab-urile din /admin).
- *Preview/public guard funcționează?* Da, am implementat deja `publish_page(id)` care face fix acest lucru, iar draft-urile returnează 404 pe front-end.
- *Link graph separat?* Link graph-ul este curat pe baza de date dedicată.

**Concluzie:** Construirea unei aplicații Astro independente (ceea ce s-a și făcut) este calea corectă. Arhitectura logică este inspirată din Zouka (page library, SEO guard), dar execuția tehnică este decuplată.
