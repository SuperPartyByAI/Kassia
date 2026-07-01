import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { af as createRenderInstruction, aM as maybeRenderHead, aY as renderTemplate, a5 as addAttribute, b5 as unescapeHTML, aU as renderHead, aV as renderSlot } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_C8nG7ATN.mjs';
import 'clsx';
import { s as supabase } from './supabase_m9V3dadf.mjs';

async function renderScript(result, id) {
  const inlined = result.inlinedScripts.get(id);
  let content = "";
  if (inlined != null) {
    if (inlined) {
      content = `<script type="module">${inlined}</script>`;
    }
  } else {
    const resolved = await result.resolve(id);
    content = `<script type="module" src="${result.userAssetsBase ? (result.base === "/" ? "" : result.base) + result.userAssetsBase : ""}${resolved}"></script>`;
  }
  return createRenderInstruction({ type: "script", id, content });
}

const $$Header = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$Header;
  const { data: configRows } = await supabase.from("kassia_site_config").select("*");
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone || "0768098268";
  const whatsappText = config.whatsapp_text || "Buna! As dori mai multe detalii despre decoratiunile cu baloane.";
  const phoneClean = phone.replace(/[^0-9]/g, "");
  const whatsappNumber = phoneClean.startsWith("0") ? "4" + phoneClean : phoneClean;
  const whatsappLink = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(whatsappText)}`;
  const { data: menus } = await supabase.from("kassia_menus").select(`
  location,
  title,
  kassia_menu_items (label, url, order_index)
`);
  menus?.forEach((m) => {
    m.kassia_menu_items?.sort((a, b) => (a.order_index || 0) - (b.order_index || 0));
  });
  const headerServicesMenu = menus?.find((m) => m.location === "header_services");
  const headerEventsMenu = menus?.find((m) => m.location === "header_events");
  const headerAnimatoriMenu = menus?.find((m) => m.location === "header_animatori");
  const currentPath = Astro2.url.pathname.replace(/\/$/, "");
  const animatoriSlugs = [
    "/animatori-petreceri-copii-bucuresti",
    "/pachete-animatori-copii-bucuresti",
    "/oferta-animatori-petreceri-copii-bucuresti",
    "/personaje-petreceri-copii-bucuresti",
    "/animatori-tematici-petreceri-copii-bucuresti",
    "/mascote-petreceri-copii-bucuresti",
    "/pictura-pe-fata-copii-bucuresti",
    "/modelaj-baloane-copii-bucuresti",
    "/jocuri-interactive-copii-bucuresti",
    "/mini-disco-copii-bucuresti",
    "/animatori-cu-mascote-petreceri-copii-bucuresti"
  ];
  const isAnimatoriPage = animatoriSlugs.includes(currentPath);
  return renderTemplate`${maybeRenderHead()}<header class="site-header" data-astro-cid-3ef6ksr2> <div class="header-container" data-astro-cid-3ef6ksr2> <div style="display: flex; align-items: center; gap: 12px;" data-astro-cid-3ef6ksr2> <a href="/" class="logo" style="text-decoration: none; color:var(--primary); font-weight:800; font-size:1.5rem;" data-astro-cid-3ef6ksr2>
Kassia Events
</a> <a href="/galerie/" style="background: var(--primary); color: white; padding: 6px 12px; border-radius: 6px; font-weight: 600; font-size: 0.85rem; text-decoration: none; display: inline-flex; align-items: center; gap: 6px; box-shadow: 0 2px 4px rgba(168, 85, 247, 0.2);" data-astro-cid-3ef6ksr2> <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><rect x="3" y="3" width="18" height="18" rx="2" ry="2" data-astro-cid-3ef6ksr2></rect><circle cx="8.5" cy="8.5" r="1.5" data-astro-cid-3ef6ksr2></circle><polyline points="21 15 16 10 5 21" data-astro-cid-3ef6ksr2></polyline></svg>
Galerie Foto
</a> ${isAnimatoriPage ? renderTemplate`<a href="/preturi-animatori-copii-bucuresti/" style="background: white; color: var(--primary); border: 1.5px solid var(--primary); padding: 5px 11px; border-radius: 6px; font-weight: 600; font-size: 0.85rem; text-decoration: none; display: inline-flex; align-items: center; gap: 4px;" data-astro-cid-3ef6ksr2>
Detalii programe animatori
</a>` : renderTemplate`<a href="/preturi-decoratiuni-baloane/" style="background: white; color: var(--primary); border: 1.5px solid var(--primary); padding: 5px 11px; border-radius: 6px; font-weight: 600; font-size: 0.85rem; text-decoration: none; display: inline-flex; align-items: center; gap: 4px;" data-astro-cid-3ef6ksr2>
Prețuri Baloane
</a>`} </div> <nav class="desktop-nav" data-astro-cid-3ef6ksr2> <div class="dropdown" data-astro-cid-3ef6ksr2> <button class="nav-link dropdown-toggle" data-astro-cid-3ef6ksr2> ${headerServicesMenu?.title || "Servicii Baloane"} <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><polyline points="6 9 12 15 18 9" data-astro-cid-3ef6ksr2></polyline></svg> </button> <div class="dropdown-menu" data-astro-cid-3ef6ksr2> ${headerServicesMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} class="dropdown-item" data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> </div> <div class="dropdown" data-astro-cid-3ef6ksr2> <button class="nav-link dropdown-toggle" data-astro-cid-3ef6ksr2> ${headerEventsMenu?.title || "Evenimente"} <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><polyline points="6 9 12 15 18 9" data-astro-cid-3ef6ksr2></polyline></svg> </button> <div class="dropdown-menu" data-astro-cid-3ef6ksr2> ${headerEventsMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} class="dropdown-item" data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> </div> <div class="dropdown" data-astro-cid-3ef6ksr2> <button class="nav-link dropdown-toggle" data-astro-cid-3ef6ksr2> ${headerAnimatoriMenu?.title || "Animatori copii"} <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><polyline points="6 9 12 15 18 9" data-astro-cid-3ef6ksr2></polyline></svg> </button> <div class="dropdown-menu" data-astro-cid-3ef6ksr2> ${headerAnimatoriMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} class="dropdown-item" data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> </div> </nav> <div class="header-actions" data-astro-cid-3ef6ksr2> <a${addAttribute(whatsappLink, "href")} target="_blank" rel="noopener noreferrer" class="btn-whatsapp" data-astro-cid-3ef6ksr2> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor" data-astro-cid-3ef6ksr2><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.888-.788-1.489-1.761-1.663-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" data-astro-cid-3ef6ksr2></path></svg> <span data-astro-cid-3ef6ksr2>WhatsApp</span> </a> <a${addAttribute(`tel:${phone}`, "href")} class="btn-phone" data-astro-cid-3ef6ksr2> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" data-astro-cid-3ef6ksr2></path></svg> <span data-astro-cid-3ef6ksr2>Sună</span> </a> </div> <button class="hamburger-menu" aria-label="Deschide Meniu" data-astro-cid-3ef6ksr2> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><line x1="3" y1="12" x2="21" y2="12" data-astro-cid-3ef6ksr2></line><line x1="3" y1="6" x2="21" y2="6" data-astro-cid-3ef6ksr2></line><line x1="3" y1="18" x2="21" y2="18" data-astro-cid-3ef6ksr2></line></svg> </button> </div> </header> <div class="mobile-menu-overlay" data-astro-cid-3ef6ksr2></div> <div class="mobile-menu-drawer" data-astro-cid-3ef6ksr2> <div class="mobile-menu-header" data-astro-cid-3ef6ksr2> <span style="font-size: 1.25rem; font-weight: 800; color: var(--primary);" data-astro-cid-3ef6ksr2>Kassia</span> <button class="close-menu" aria-label="Închide" data-astro-cid-3ef6ksr2> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" data-astro-cid-3ef6ksr2><line x1="18" y1="6" x2="6" y2="18" data-astro-cid-3ef6ksr2></line><line x1="6" y1="6" x2="18" y2="18" data-astro-cid-3ef6ksr2></line></svg> </button> </div> <div class="mobile-menu-content" data-astro-cid-3ef6ksr2> <h3 class="mobile-menu-title" data-astro-cid-3ef6ksr2>${headerServicesMenu?.title || "Servicii Baloane"}</h3> <div class="mobile-menu-links" data-astro-cid-3ef6ksr2> ${headerServicesMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> <h3 class="mobile-menu-title" data-astro-cid-3ef6ksr2>${headerEventsMenu?.title || "Evenimente"}</h3> <div class="mobile-menu-links" data-astro-cid-3ef6ksr2> ${headerEventsMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> <h3 class="mobile-menu-title" data-astro-cid-3ef6ksr2>${headerAnimatoriMenu?.title || "Animatori copii"}</h3> <div class="mobile-menu-links" data-astro-cid-3ef6ksr2> ${headerAnimatoriMenu?.kassia_menu_items?.map((item) => renderTemplate`<a${addAttribute(item.url, "href")} data-astro-cid-3ef6ksr2>${item.label}</a>`)} </div> </div> </div> <div class="mobile-actions" data-astro-cid-3ef6ksr2> <div class="mobile-actions-inner" data-astro-cid-3ef6ksr2> <a${addAttribute(whatsappLink, "href")} class="btn-whatsapp" data-astro-cid-3ef6ksr2>WhatsApp</a> <a${addAttribute(`tel:${phone}`, "href")} class="btn-phone" data-astro-cid-3ef6ksr2>Sună</a> </div> </div>  ${renderScript($$result, "/Users/universparty/wa-web-launcher/kassia-site/src/components/Header.astro?astro&type=script&index=0&lang.ts")}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/Header.astro", void 0);

var __freeze = Object.freeze;
var __defProp = Object.defineProperty;
var __template = (cooked, raw) => __freeze(__defProp(cooked, "raw", { value: __freeze(cooked.slice()) }));
var _a;
const $$Layout = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$Layout;
  const { title, description, canonical, robots, schemas = [], ogImage } = Astro2.props;
  return renderTemplate`<html lang="ro"> <head><meta charset="UTF-8"><meta name="google-site-verification" content="tYYr4DkXrfYAVYO5EDy1Kyq0282U7AQTPyBBM9ecaPA"><meta name="viewport" content="width=device-width"><link rel="icon" type="image/svg+xml" href="/favicon.svg"><title>${title}</title><meta name="description"${addAttribute(description, "content")}><meta name="robots"${addAttribute(robots, "content")}><link rel="canonical"${addAttribute(canonical, "href")}><meta property="og:title"${addAttribute(title, "content")}><meta property="og:description"${addAttribute(description, "content")}><meta property="og:url"${addAttribute(canonical, "content")}><meta property="og:type" content="website">${ogImage && renderTemplate`<meta property="og:image"${addAttribute(ogImage, "content")}>`}<meta name="twitter:card" content="summary_large_image"><meta name="twitter:title"${addAttribute(title, "content")}><meta name="twitter:description"${addAttribute(description, "content")}>${ogImage && renderTemplate`<meta name="twitter:image"${addAttribute(ogImage, "content")}>`}<meta name="generator"${addAttribute(Astro2.generator, "content")}>${schemas && schemas.length > 0 && renderTemplate(_a || (_a = __template(['<script type="application/ld+json">', "<\/script>"])), unescapeHTML(JSON.stringify({
    "@context": "https://schema.org",
    "@graph": schemas.map((s) => {
      const { "@context": _, ...rest } = s;
      return rest;
    })
  })))}${renderHead()}</head> <body> ${renderComponent($$result, "Header", $$Header, {})} <main> ${renderSlot($$result, $$slots["default"])} </main></body></html>`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/layouts/Layout.astro", void 0);

export { $$Layout as $, renderScript as r };
