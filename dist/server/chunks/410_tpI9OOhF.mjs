import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_KVogxJwq.mjs';
import { $ as $$Layout } from './Layout_nXdveVCy.mjs';
import { $ as $$Footer } from './Footer_hXl4F4Is.mjs';

const $$410 = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$410;
  Astro2.response.status = 410;
  Astro2.response.statusText = "Gone";
  Astro2.response.headers.set("Cache-Control", "public, max-age=3600");
  Astro2.response.headers.set("X-Robots-Tag", "noindex, follow");
  const title = "Pagina nu mai este disponibilă | Kassia";
  const description = "Adresa solicitată a fost retrasă definitiv. Continuă către serviciile actuale Kassia.";
  const staticLinks = [
    { anchor_text: "Animatori petreceri copii", target_page: { path: "/animatori-petreceri-copii/", status: "published" } },
    { anchor_text: "Prețuri animatori copii", target_page: { path: "/preturi-animatori-copii-bucuresti/", status: "published" } },
    { anchor_text: "Ursitoare botez București", target_page: { path: "/ursitoare-botez-bucuresti/", status: "published" } },
    { anchor_text: "Decoruri cu baloane", target_page: { path: "/decoruri-baloane-bucuresti/", status: "published" } }
  ];
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": title, "description": description, "robots": "noindex, follow", "data-astro-cid-aftrrtb5": true }, { "default": ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="kassia-premium-page" data-astro-cid-aftrrtb5> <section class="gone-section" data-astro-cid-aftrrtb5> <p class="status-code" aria-hidden="true" data-astro-cid-aftrrtb5>410</p> <h1 data-astro-cid-aftrrtb5>Această pagină a fost retrasă definitiv</h1> <p data-astro-cid-aftrrtb5>Conținutul vechi nu mai este disponibil. Alege una dintre paginile actuale Kassia.</p> <div class="gone-actions" data-astro-cid-aftrrtb5> <a href="/" class="btn-primary" data-astro-cid-aftrrtb5>Pagina principală</a> <a href="/animatori-petreceri-copii/" class="btn-secondary" data-astro-cid-aftrrtb5>Animatori copii</a> </div> </section> ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": staticLinks, "data-astro-cid-aftrrtb5": true })} </div> ` })}`;
}, "/opt/kassia-site/src/pages/410.astro", void 0);

const $$file = "/opt/kassia-site/src/pages/410.astro";
const $$url = "/410";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$410,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
