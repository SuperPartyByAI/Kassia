import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aM as maybeRenderHead, aY as renderTemplate, a5 as addAttribute } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_C8nG7ATN.mjs';
import { s as supabase } from './supabase_m9V3dadf.mjs';
import 'clsx';

const $$GoogleBadge = createComponent(($$result, $$props, $$slots) => {
  return renderTemplate`${maybeRenderHead()}<div class="google-trust-badge" data-astro-cid-7kq2hzbx> <div class="gtb-logo" data-astro-cid-7kq2hzbx> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="24px" height="24px" data-astro-cid-7kq2hzbx> <path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z" data-astro-cid-7kq2hzbx></path> <path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z" data-astro-cid-7kq2hzbx></path> <path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z" data-astro-cid-7kq2hzbx></path> <path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z" data-astro-cid-7kq2hzbx></path> </svg> </div> <div class="gtb-content" data-astro-cid-7kq2hzbx> <div class="gtb-stars" data-astro-cid-7kq2hzbx> ${"★★★★★".split("").map((star) => renderTemplate`<span class="gtb-star" data-astro-cid-7kq2hzbx>${star}</span>`)} <span class="gtb-rating" data-astro-cid-7kq2hzbx>4.9</span> </div> <div class="gtb-text" data-astro-cid-7kq2hzbx> <strong data-astro-cid-7kq2hzbx>Serviciu excelent</strong><br data-astro-cid-7kq2hzbx>
certificat de Google
</div> </div> </div>`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/GoogleBadge.astro", void 0);

const $$Footer = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$Footer;
  const { internalLinks = [], isAnimatori: isAnimatoriProp = false } = Astro2.props;
  const animatoriSlugs = [
    "/animatori-petreceri-copii",
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
  const normalizedPath = Astro2.url.pathname.replace(/\/$/, "");
  const isAnimatori = isAnimatoriProp || animatoriSlugs.includes(normalizedPath);
  const { data: configRows } = await supabase.from("kassia_site_config").select("*");
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone || "0768098268";
  config.email || "contact@kassia.ro";
  let footerDesc = config.footer_desc || "Kassia îți transformă evenimentele în amintiri de neuitat prin decorațiuni spectaculoase din baloane. Calitate premium pentru botezuri, nunți și petreceri corporate.";
  if (isAnimatori) {
    footerDesc = "Echipa Kassia organizează programe de animație, mascote, pictură pe față și activități interactive pentru petreceri de copii reușite în București și Ilfov.";
  }
  const whatsappText = config.whatsapp_text || "Buna! As dori mai multe detalii";
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
  const footerServicesMenu = menus?.find((m) => m.location === "footer_services");
  const animatoriMenuItems = [
    { label: "Programe animatori copii", url: "/animatori-petreceri-copii/" },
    { label: "Activități pentru petrecere", url: "/pachete-animatori-copii-bucuresti/" },
    { label: "Mascote pentru petreceri", url: "/mascote-petreceri-copii-bucuresti/" },
    { label: "Pictură pe față copii", url: "/pictura-pe-fata-copii-bucuresti/" },
    { label: "Mini-disco copii", url: "/mini-disco-copii-bucuresti/" },
    { label: "Modelaj baloane copii", url: "/modelaj-baloane-copii-bucuresti/" }
  ];
  return renderTemplate`${maybeRenderHead()}<footer class="site-footer" data-astro-cid-sz7xmlte> <div class="container footer-main" data-astro-cid-sz7xmlte> <div class="footer-brand" data-astro-cid-sz7xmlte> <div style="margin-bottom: 1rem; transform: scale(0.9); transform-origin: left center;" data-astro-cid-sz7xmlte> ${renderComponent($$result, "GoogleBadge", $$GoogleBadge, { "data-astro-cid-sz7xmlte": true })} </div> <a href="/" class="footer-logo" style="text-decoration: none; color:white; font-weight:800; font-size:1.5rem; display:block; margin-bottom:1.5rem;" data-astro-cid-sz7xmlte>
Kassia Events
</a> <p class="brand-desc" data-astro-cid-sz7xmlte>${footerDesc}</p> </div> <div class="footer-links" data-astro-cid-sz7xmlte> <h3 class="footer-heading" data-astro-cid-sz7xmlte>${isAnimatori ? "Servicii Animatori" : footerServicesMenu?.title || "Servicii Principale"}</h3> <ul data-astro-cid-sz7xmlte> ${isAnimatori ? animatoriMenuItems.map((item) => renderTemplate`<li data-astro-cid-sz7xmlte><a${addAttribute(item.url, "href")} data-astro-cid-sz7xmlte>${item.label}</a></li>`) : footerServicesMenu?.kassia_menu_items?.map((item) => renderTemplate`<li data-astro-cid-sz7xmlte><a${addAttribute(item.url, "href")} data-astro-cid-sz7xmlte>${item.label}</a></li>`)} </ul> </div> <div class="footer-contact" data-astro-cid-sz7xmlte> <h3 class="footer-heading" data-astro-cid-sz7xmlte>Contact</h3> <ul data-astro-cid-sz7xmlte> <li data-astro-cid-sz7xmlte> <strong data-astro-cid-sz7xmlte>Telefon:</strong> <a${addAttribute(`tel:${phone}`, "href")} data-astro-cid-sz7xmlte>${phone}</a> </li> <li data-astro-cid-sz7xmlte> <strong data-astro-cid-sz7xmlte>WhatsApp:</strong> <a${addAttribute(whatsappLink, "href")} target="_blank" data-astro-cid-sz7xmlte>Scrie-ne acum</a> </li> <li data-astro-cid-sz7xmlte> <strong data-astro-cid-sz7xmlte>Locație:</strong> București & Ilfov
</li> <li data-astro-cid-sz7xmlte> <strong data-astro-cid-sz7xmlte>Disponibilitate evenimente:</strong> Luni – Duminică, pe bază de programare
</li> </ul> </div> </div>  ${internalLinks.length > 0 && renderTemplate`<div class="footer-seo-links" data-astro-cid-sz7xmlte> <div class="container" data-astro-cid-sz7xmlte> <h4 class="seo-heading" data-astro-cid-sz7xmlte>Alte căutări populare:</h4> <div class="seo-links-grid" data-astro-cid-sz7xmlte> ${internalLinks.map((link) => renderTemplate`<a${addAttribute(link.target_page.path, "href")} data-astro-cid-sz7xmlte>${link.anchor_text}</a>`)} </div> </div> </div>`} <div class="footer-bottom" data-astro-cid-sz7xmlte> <div class="container" data-astro-cid-sz7xmlte> <p data-astro-cid-sz7xmlte>© ${(/* @__PURE__ */ new Date()).getFullYear()} Kassia. Toate drepturile rezervate.</p> </div> </div> </footer>`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/Footer.astro", void 0);

export { $$Footer as $ };
