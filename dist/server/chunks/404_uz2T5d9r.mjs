import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_Ok-ozV4l.mjs';
import { $ as $$Layout } from './Layout_BOzfuNKI.mjs';
import { $ as $$Footer } from './Footer_Bn7mrv4w.mjs';
import { s as supabase } from './supabase_m9V3dadf.mjs';

const $$404 = createComponent(async ($$result, $$props, $$slots) => {
  const title = "Ups! Pagina a zburat ca un balon | Kassia";
  const description = "Pagina pe care o cauți nu a putut fi găsită. Întoarce-te pe pagina principală pentru a descoperi serviciile Kassia.";
  const canonical = `${"https://www.kassia.ro"}/404/` ;
  const { data: internalLinks } = await supabase.from("kassia_internal_links").select(`
    anchor_text,
    target_page:kassia_pages!target_page_id(path, status)
  `).limit(10);
  const publishedLinks = internalLinks ? internalLinks.filter((link) => link.target_page && link.target_page.status === "published") : [];
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": title, "description": description, "canonical": canonical, "robots": "noindex, follow", "data-astro-cid-zetdm5md": true }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="kassia-premium-page" data-astro-cid-zetdm5md> <section class="hero-section text-center" style="padding: 10rem 2rem 6rem; min-height: 70vh; display: flex; flex-direction: column; justify-content: center; align-items: center;" data-astro-cid-zetdm5md> <h1 class="page-title" style="font-size: clamp(4rem, 10vw, 8rem); margin-bottom: 0;" data-astro-cid-zetdm5md>404</h1> <h2 class="section-heading" style="margin-bottom: 1.5rem;" data-astro-cid-zetdm5md>Ups! Pagina a zburat...</h2> <p class="hero-subtitle" style="margin-bottom: 2.5rem;" data-astro-cid-zetdm5md>Ne pare rău, dar pagina pe care o cauți nu există sau a fost mutată.</p> <div style="display: flex; gap: 1rem; flex-wrap: wrap; justify-content: center; margin-bottom: 4rem;" data-astro-cid-zetdm5md> <a href="/" class="btn-primary" data-astro-cid-zetdm5md>Înapoi la Prima Pagină</a> <a href="/contact/" class="btn-primary" style="background: white; color: var(--primary); border: 2px solid var(--primary); box-shadow: none;" data-astro-cid-zetdm5md>Contactează-ne</a> </div> <div class="service-links" style="max-width: 600px; width: 100%;" data-astro-cid-zetdm5md> <h3 class="section-subheading" data-astro-cid-zetdm5md>Câteva servicii populare:</h3> <ul style="list-style: none; padding: 0; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem;" data-astro-cid-zetdm5md> <li data-astro-cid-zetdm5md><a href="/decoratiuni-baloane-bucuresti/" style="color: var(--primary); text-decoration: none; font-weight: 600;" data-astro-cid-zetdm5md>Decorațiuni Baloane</a></li> <li data-astro-cid-zetdm5md><a href="/arcada-baloane-bucuresti/" style="color: var(--primary); text-decoration: none; font-weight: 600;" data-astro-cid-zetdm5md>Arcadă Baloane</a></li> <li data-astro-cid-zetdm5md><a href="/baloane-heliu-bucuresti/" style="color: var(--primary); text-decoration: none; font-weight: 600;" data-astro-cid-zetdm5md>Baloane cu Heliu</a></li> <li data-astro-cid-zetdm5md><a href="/panou-foto-baloane-bucuresti/" style="color: var(--primary); text-decoration: none; font-weight: 600;" data-astro-cid-zetdm5md>Panouri Foto</a></li> </ul> </div> </section> ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": publishedLinks, "data-astro-cid-zetdm5md": true })} </div> ` })}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/pages/404.astro", void 0);
const $$file = "/Users/universparty/wa-web-launcher/kassia-site/src/pages/404.astro";
const $$url = "/404";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$404,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
