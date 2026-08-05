import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_DwvUK002.mjs';
import { $ as $$Layout } from './Layout_BVpaCx1Q.mjs';
import { $ as $$Footer } from './Footer_CfVdOOWe.mjs';

const $$404 = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$404;
  Astro2.response.status = 404;
  Astro2.response.statusText = "Not Found";
  Astro2.response.headers.set("Cache-Control", "no-store, max-age=0");
  Astro2.response.headers.set("X-Robots-Tag", "noindex, follow");
  const title = "Pagina nu a fost găsită | Kassia";
  const description = "Adresa solicitată nu există. Continuă către serviciile Kassia pentru petreceri și evenimente.";
  const staticLinks = [
    { anchor_text: "Animatori petreceri copii", target_page: { path: "/animatori-petreceri-copii/", status: "published" } },
    { anchor_text: "Prețuri animatori copii", target_page: { path: "/preturi-animatori-copii-bucuresti/", status: "published" } },
    { anchor_text: "Ursitoare botez București", target_page: { path: "/ursitoare-botez-bucuresti/", status: "published" } },
    { anchor_text: "Decoruri cu baloane", target_page: { path: "/decoruri-baloane-bucuresti/", status: "published" } }
  ];
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": title, "description": description, "robots": "noindex, follow", "data-astro-cid-zetdm5md": true }, { "default": ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="kassia-premium-page" data-astro-cid-zetdm5md> <section class="not-found-section" data-astro-cid-zetdm5md> <p class="status-code" aria-hidden="true" data-astro-cid-zetdm5md>404</p> <h1 data-astro-cid-zetdm5md>Pagina pe care o cauți nu există</h1> <p data-astro-cid-zetdm5md>Verifică adresa sau continuă către una dintre paginile principale Kassia.</p> <div class="not-found-actions" data-astro-cid-zetdm5md> <a href="/" class="btn-primary" data-astro-cid-zetdm5md>Pagina principală</a> <a href="/animatori-petreceri-copii/" class="btn-secondary" data-astro-cid-zetdm5md>Vezi animatorii</a> </div> <nav aria-label="Pagini utile" class="not-found-links" data-astro-cid-zetdm5md> <a href="/preturi-animatori-copii-bucuresti/" data-astro-cid-zetdm5md>Prețuri animatori</a> <a href="/ursitoare-botez-bucuresti/" data-astro-cid-zetdm5md>Ursitoare botez</a> <a href="/decoruri-baloane-bucuresti/" data-astro-cid-zetdm5md>Decoruri cu baloane</a> </nav> </section> ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": staticLinks, "data-astro-cid-zetdm5md": true })} </div> ` })}`;
}, "/opt/kassia-site/src/pages/404.astro", void 0);

const $$file = "/opt/kassia-site/src/pages/404.astro";
const $$url = "/404";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$404,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
