import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead, a5 as addAttribute } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_DU6zC1rc.mjs';
import { $ as $$Layout } from './Layout_BDaaW0cB.mjs';
import { $ as $$Footer } from './Footer_CBoCsgv-.mjs';
import { s as supabase } from './supabase_m9V3dadf.mjs';
import { a as appendSearch, j as normalizeRequestPath, f as isSitemapEligiblePath, g as getLegacyRedirect, S as SITE_ORIGIN } from './kassia-routing_C02FXj94.mjs';

const $$Index = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$Index;
  if (!Astro2.url.pathname.endsWith("/")) {
    return Astro2.redirect(appendSearch("/blog/", Astro2.url.search), 301);
  }
  const { data: rawArticles, error } = await supabase.from("kassia_pages").select("path,title,h1,meta_description,updated_at").eq("status", "published").eq("index_status", "index").eq("include_in_sitemap", true).like("path", "/blog/%").order("updated_at", { ascending: false });
  if (error) {
    console.error("KASSIA_BLOG_INDEX_QUERY_FAILED", { code: error.code || "UNKNOWN" });
    return Astro2.rewrite("/503");
  }
  const articlesByPath = /* @__PURE__ */ new Map();
  for (const article of rawArticles || []) {
    const path = normalizeRequestPath(article.path);
    if (!path || path === "/blog/" || !isSitemapEligiblePath(path) || getLegacyRedirect(path)) continue;
    if (!articlesByPath.has(path)) articlesByPath.set(path, { ...article, path });
  }
  const articles = [...articlesByPath.values()];
  const title = "Ghiduri pentru petreceri și evenimente | Kassia";
  const description = "Idei și ghiduri practice pentru petreceri de copii, botezuri și evenimente în București și Ilfov.";
  const canonical = `${SITE_ORIGIN}/blog/`;
  const schemas = [
    {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      name: title,
      description,
      url: canonical
    },
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      itemListElement: [
        { "@type": "ListItem", position: 1, name: "Kassia", item: `${SITE_ORIGIN}/` },
        { "@type": "ListItem", position: 2, name: "Ghiduri", item: canonical }
      ]
    }
  ];
  const staticLinks = [
    { anchor_text: "Animatori petreceri copii", target_page: { path: "/animatori-petreceri-copii/", status: "published" } },
    { anchor_text: "Prețuri animatori copii", target_page: { path: "/preturi-animatori-copii-bucuresti/", status: "published" } },
    { anchor_text: "Ursitoare botez București", target_page: { path: "/ursitoare-botez-bucuresti/", status: "published" } },
    { anchor_text: "Decoruri cu baloane", target_page: { path: "/decoruri-baloane-bucuresti/", status: "published" } }
  ];
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": title, "description": description, "canonical": canonical, "robots": "index, follow", "schemas": schemas, "data-astro-cid-5tznm7mj": true }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="blog-index-page" data-astro-cid-5tznm7mj> <header class="blog-hero" data-astro-cid-5tznm7mj> <p class="eyebrow" data-astro-cid-5tznm7mj>Resurse Kassia</p> <h1 data-astro-cid-5tznm7mj>Ghiduri pentru petreceri și evenimente</h1> <p data-astro-cid-5tznm7mj>Răspunsuri practice despre alegerea programului, organizare, activități și servicii pentru copii.</p> </header> <main class="blog-content" data-astro-cid-5tznm7mj> ${articles.length > 0 ? renderTemplate`<section aria-labelledby="latest-guides" data-astro-cid-5tznm7mj> <h2 id="latest-guides" data-astro-cid-5tznm7mj>Cele mai noi ghiduri</h2> <div class="article-grid" data-astro-cid-5tznm7mj> ${articles.map((article) => renderTemplate`<article class="article-card" data-astro-cid-5tznm7mj> <h3 data-astro-cid-5tznm7mj><a${addAttribute(article.path, "href")} data-astro-cid-5tznm7mj>${article.h1 || article.title || "Ghid Kassia"}</a></h3> ${article.meta_description && renderTemplate`<p data-astro-cid-5tznm7mj>${article.meta_description}</p>`} <a class="read-more"${addAttribute(article.path, "href")} data-astro-cid-5tznm7mj>Citește ghidul</a> </article>`)} </div> </section>` : renderTemplate`<section class="empty-guides" aria-labelledby="start-here" data-astro-cid-5tznm7mj> <h2 id="start-here" data-astro-cid-5tznm7mj>Începe cu serviciile principale</h2> <p data-astro-cid-5tznm7mj>Pregătim ghiduri noi. Până atunci, găsești informațiile esențiale în paginile de servicii și prețuri.</p> <div class="service-links" data-astro-cid-5tznm7mj> <a href="/animatori-petreceri-copii/" data-astro-cid-5tznm7mj>Animatori pentru petreceri</a> <a href="/preturi-animatori-copii-bucuresti/" data-astro-cid-5tznm7mj>Prețuri animatori</a> <a href="/decoruri-baloane-bucuresti/" data-astro-cid-5tznm7mj>Decoruri cu baloane</a> </div> </section>`} </main> ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": staticLinks, "data-astro-cid-5tznm7mj": true })} </div> ` })}`;
}, "/opt/kassia-site/src/pages/blog/index.astro", void 0);

const $$file = "/opt/kassia-site/src/pages/blog/index.astro";
const $$url = "/blog";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Index,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
