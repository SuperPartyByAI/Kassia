import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_KVogxJwq.mjs';
import { $ as $$Layout } from './Layout_nXdveVCy.mjs';

const $$503 = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$503;
  Astro2.response.status = 503;
  Astro2.response.statusText = "Service Unavailable";
  Astro2.response.headers.set("Cache-Control", "no-store, max-age=0");
  Astro2.response.headers.set("X-Robots-Tag", "noindex, nofollow");
  Astro2.response.headers.set("Retry-After", "60");
  const title = "Kassia este temporar indisponibil";
  const description = "Pagina nu poate fi încărcată momentan. Reîncearcă în câteva momente.";
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": title, "description": description, "robots": "noindex, nofollow", "data-astro-cid-j3egjmiv": true }, { "default": ($$result2) => renderTemplate` ${maybeRenderHead()}<section class="service-unavailable" data-astro-cid-j3egjmiv> <p class="status-code" aria-hidden="true" data-astro-cid-j3egjmiv>503</p> <h1 data-astro-cid-j3egjmiv>Revenim imediat</h1> <p data-astro-cid-j3egjmiv>Serviciul este temporar indisponibil. Reîncearcă în câteva momente.</p> <a href="/" data-astro-cid-j3egjmiv>Reîncarcă pagina principală</a> </section> ` })}`;
}, "/opt/kassia-site/src/pages/503.astro", void 0);

const $$file = "/opt/kassia-site/src/pages/503.astro";
const $$url = "/503";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$503,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
