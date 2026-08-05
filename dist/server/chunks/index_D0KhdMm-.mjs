import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_DwvUK002.mjs';
import { s as supabaseAdmin, $ as $$AdminLayout } from './supabaseAdmin_BbxJ75dC.mjs';

const $$Index = createComponent(async ($$result, $$props, $$slots) => {
  const { count: totalPages } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true });
  const { count: draftPages } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).eq("status", "draft");
  const { count: publishedPages } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).eq("status", "published");
  const { count: noindexPages } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).eq("index_status", "noindex");
  const { count: sitemapPages } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).eq("include_in_sitemap", true);
  const { data: pagesWithFaq } = await supabaseAdmin.from("kassia_faqs").select("page_id");
  const pageIdsWithFaq = pagesWithFaq?.map((f) => f.page_id) || [];
  let missingFaqCount = 0;
  if (pageIdsWithFaq.length > 0) {
    const { count } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).in("page_type", ["service", "event", "location", "satellite"]).not("id", "in", `(${pageIdsWithFaq.join(",")})`);
    missingFaqCount = count || 0;
  } else {
    const { count } = await supabaseAdmin.from("kassia_pages").select("*", { count: "exact", head: true }).in("page_type", ["service", "event", "location", "satellite"]);
    missingFaqCount = count || 0;
  }
  return renderTemplate`${renderComponent($$result, "AdminLayout", $$AdminLayout, { "title": "Dashboard" }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<h1>Dashboard</h1> <div class="warning-box"> <strong>Security Notice:</strong> This admin panel is currently accessible to anyone. Ensure you add authentication before deploying to production.
</div> <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 2rem;"> <div class="card"> <h3>Total Pages</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0;">${totalPages}</p> </div> <div class="card"> <h3>Draft</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0; color: #854d0e;">${draftPages}</p> </div> <div class="card"> <h3>Published</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0; color: #166534;">${publishedPages}</p> </div> <div class="card"> <h3>Noindex</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0;">${noindexPages}</p> </div> <div class="card"> <h3>In Sitemap</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0;">${sitemapPages}</p> </div> <div class="card"> <h3>Missing FAQ</h3> <p style="font-size: 2rem; font-weight: bold; margin: 0; color: #991b1b;">${missingFaqCount}</p> <small>(Service, Event, Location, Satellite)</small> </div> </div> ` })}`;
}, "/opt/kassia-site/src/pages/admin/index.astro", void 0);

const $$file = "/opt/kassia-site/src/pages/admin/index.astro";
const $$url = "/admin";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$Index,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
