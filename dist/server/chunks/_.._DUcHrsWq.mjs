import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aM as maybeRenderHead, a5 as addAttribute, aY as renderTemplate, m as Fragment, b5 as unescapeHTML } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_CVGf7ZSj.mjs';
import { s as supabase } from './supabase_m9V3dadf.mjs';
import { r as renderScript, $ as $$Layout } from './Layout_C4o9pKv9.mjs';
import { $ as $$Footer } from './Footer_u7BzqUlW.mjs';
import { $ as $$ReviewsCarousel } from './ReviewsCarousel_DYWDeixI.mjs';
import { createClient } from '@supabase/supabase-js';
import 'clsx';

const $$PricingProgramCard = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$PricingProgramCard;
  const { program, variant, locationName } = Astro2.props;
  const showPrice = variant === "full" ? program.show_price_on_pricing_page : program.show_price_on_local_preview;
  return renderTemplate`${maybeRenderHead()}<div${addAttribute(`pricing-card pricing-card-${variant}`, "class")} style="background: white; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06); overflow: hidden; display: flex; flex-direction: column; border: 1px solid #e2e8f0; margin-bottom: 2rem;" data-astro-cid-galeqkks>  <div class="pricing-card-header" style="background: var(--primary); color: white; padding: 1.5rem; text-align: center;" data-astro-cid-galeqkks> <h3 style="margin: 0; font-size: 1.5rem; font-weight: 700;" data-astro-cid-galeqkks>${program.title}</h3> ${program.duration_label && renderTemplate`<div style="font-size: 1rem; margin-top: 0.5rem; opacity: 0.9;" data-astro-cid-galeqkks>
⏱ ${program.duration_label} </div>`} </div>  <div class="pricing-card-content" style="padding: 1.5rem; flex: 1; display: flex; flex-direction: column;" data-astro-cid-galeqkks>  ${program.short_description && renderTemplate`<p style="color: #475569; font-size: 1rem; line-height: 1.5; margin-top: 0; margin-bottom: 1.5rem; text-align: center;" data-astro-cid-galeqkks> ${program.short_description} </p>`}  ${variant === "full" && program.includes_list && program.includes_list.length > 0 && renderTemplate`<div class="pricing-card-includes" style="margin-bottom: 1.5rem; flex: 1;" data-astro-cid-galeqkks> <h4 style="font-size: 1.1rem; color: #1e293b; margin-top: 0; margin-bottom: 1rem; border-bottom: 2px solid #f1f5f9; padding-bottom: 0.5rem;" data-astro-cid-galeqkks>
Ce include:
</h4> <ul style="list-style: none; padding: 0; margin: 0;" data-astro-cid-galeqkks> ${program.includes_list.map((item) => renderTemplate`<li style="display: flex; align-items: flex-start; margin-bottom: 0.75rem; color: #475569;" data-astro-cid-galeqkks> <span style="color: var(--primary); font-weight: bold; margin-right: 0.75rem;" data-astro-cid-galeqkks>✓</span> <span style="line-height: 1.4;" data-astro-cid-galeqkks>${item}</span> </li>`)} </ul> </div>`}  ${showPrice && program.price_amount && renderTemplate`<div class="pricing-card-price" style="text-align: center; margin-top: auto; padding-top: 1.5rem; border-top: 1px solid #f1f5f9; margin-bottom: 1.5rem;" data-astro-cid-galeqkks> <div style="font-size: 2rem; font-weight: 800; color: var(--primary);" data-astro-cid-galeqkks> ${`${program.price_prefix || ""} ${program.price_amount} ${program.currency || "lei"}`.trim()} </div> ${program.price_suffix && renderTemplate`<div style="font-size: 0.9rem; color: #64748b; margin-top: 0.25rem;" data-astro-cid-galeqkks> ${program.price_suffix} </div>`} </div>`}  <div class="pricing-card-actions" style="display: flex; flex-direction: column; gap: 1rem; margin-top: auto;" data-astro-cid-galeqkks> ${variant === "compact" ? renderTemplate`${renderComponent($$result, "Fragment", Fragment, { "data-astro-cid-galeqkks": true }, { "default": ($$result2) => renderTemplate` <a href="/preturi-animatori-copii-bucuresti/" class="btn-secondary" style="display: block; width: 100%; text-align: center; padding: 0.75rem 1.5rem; background-color: #f1f5f9; color: #334155; text-decoration: none; border-radius: 8px; font-weight: 600; border: 1px solid #cbd5e1; transition: all 0.2s ease;" data-astro-cid-galeqkks>
Vezi detaliile programelor cu animatori
</a> <a${addAttribute(`https://wa.me/40763795919?text=${encodeURIComponent(`Bună! Aș dori detalii despre programele cu animatori pentru ${locationName || "petrecerea mea"}.`)}`, "href")} target="_blank" rel="noopener noreferrer" class="btn-primary" style="display: block; width: 100%; text-align: center; padding: 0.75rem 1.5rem; background-color: #25D366; color: white; text-decoration: none; border-radius: 8px; font-weight: 600; box-shadow: 0 4px 6px -1px rgba(37, 211, 102, 0.2); transition: all 0.2s ease;" data-astro-cid-galeqkks>
Scrie-ne pe WhatsApp pentru recomandarea potrivită
</a> ` })}` : renderTemplate`<a${addAttribute(`https://wa.me/40763795919?text=${encodeURIComponent(`Bună! Aș dori detalii despre programul "${program.title}".`)}`, "href")} target="_blank" rel="noopener noreferrer" class="btn-primary" style="display: block; width: 100%; text-align: center; padding: 1rem 1.5rem; background-color: var(--primary); color: white; text-decoration: none; border-radius: 8px; font-weight: 700; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); transition: transform 0.2s ease;" data-astro-cid-galeqkks>
Rezervă acest program
</a>`} </div> </div> </div>`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/PricingProgramCard.astro", void 0);

const $$PricingPreview = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$PricingPreview;
  const { locationName } = Astro2.props;
  const supabaseUrl = "https://jrfhprnuxxfwkwjwdsez.supabase.co";
  const supabaseKey = "sb_publishable_6fhUh9kSv0mR8tIu1X-tJA_58ux68Me";
  const supabase = createClient(supabaseUrl, supabaseKey, {
    global: {
      fetch: (url, init) => fetch(url, { ...init, cache: "no-store" })
    }
  });
  Astro2.response.headers.set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate");
  Astro2.response.headers.set("Pragma", "no-cache");
  Astro2.response.headers.set("Expires", "0");
  const { data: programs, error } = await supabase.from("kassia_pricing_programs").select("*").eq("is_active", true).eq("is_test", false).eq("show_on_local_preview", true).order("order_index");
  if (error) {
    console.error("Error fetching pricing preview:", error);
  }
  return renderTemplate`${programs && programs.length > 0 && renderTemplate`${maybeRenderHead()}<section class="content-section bg-light pricing-preview-section"><div class="container section-grid"><div class="section-text" style="width: 100%;"><h2 class="section-heading" style="text-align: center; margin-bottom: 2rem;">
Programe cu animatori potrivite pentru ${locationName || "petrecerea ta"}</h2><div class="pricing-preview-cards" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; justify-content: center; margin-bottom: 2rem;">${programs.map((program) => renderTemplate`${renderComponent($$result, "PricingProgramCard", $$PricingProgramCard, { "program": program, "variant": "compact", "locationName": locationName })}`)}</div></div></div></section>`}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/PricingPreview.astro", void 0);

const $$PricingFullTable = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$PricingFullTable;
  const supabaseUrl = "https://jrfhprnuxxfwkwjwdsez.supabase.co";
  const supabaseKey = "sb_publishable_6fhUh9kSv0mR8tIu1X-tJA_58ux68Me";
  const supabase = createClient(supabaseUrl, supabaseKey, {
    global: {
      fetch: (url, init) => fetch(url, { ...init, cache: "no-store" })
    }
  });
  Astro2.response.headers.set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate");
  Astro2.response.headers.set("Pragma", "no-cache");
  Astro2.response.headers.set("Expires", "0");
  const { data: programs, error } = await supabase.from("kassia_pricing_programs").select("*").eq("is_active", true).eq("is_test", false).eq("show_on_pricing_page", true).order("order_index");
  if (error) {
    console.error("Error fetching pricing full table:", error);
  }
  return renderTemplate`${programs && programs.length > 0 && renderTemplate`${maybeRenderHead()}<section class="content-section bg-white pricing-full-table"><div class="container section-grid text-only"><div class="section-text" style="width: 100%;"><div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">${programs.map((program) => renderTemplate`${renderComponent($$result, "PricingProgramCard", $$PricingProgramCard, { "program": program, "variant": "full" })}`)}</div></div></div></section>`}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/PricingFullTable.astro", void 0);

const $$CostumeCatalog = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$CostumeCatalog;
  const { heading, subheading, cards = [] } = Astro2.props;
  const isFullCatalog = cards.length > 12;
  const { data: configRows } = await supabase.from("kassia_site_config").select("key,value");
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone || "0763795919";
  const phoneClean = phone.replace(/[^0-9]/g, "");
  const whatsappNumber = phoneClean.startsWith("0") ? "4" + phoneClean : phoneClean;
  return renderTemplate`${maybeRenderHead()}<section id="catalog-costume" class="catalog-section bg-white" data-astro-cid-v4rlkyg3> <div class="container" data-astro-cid-v4rlkyg3> <h2 class="section-heading text-center" data-astro-cid-v4rlkyg3>${heading}</h2> ${subheading && renderTemplate`<p class="catalog-subtitle text-center" data-astro-cid-v4rlkyg3>${subheading}</p>`} <div class="catalog-grid" id="catalog-grid-container" data-astro-cid-v4rlkyg3> ${cards.map((card, idx) => renderTemplate`<div${addAttribute(`catalog-card ${idx >= 12 && isFullCatalog ? "hidden-card" : ""}`, "class")}${addAttribute(idx >= 12 && isFullCatalog ? "display: none;" : "", "style")} data-astro-cid-v4rlkyg3> <div class="catalog-card-image" data-astro-cid-v4rlkyg3> <img${addAttribute(card.image_url, "src")}${addAttribute(card.alt_text || card.title, "alt")}${addAttribute(card.width || 600, "width")}${addAttribute(card.height || 600, "height")} loading="lazy" decoding="async" data-astro-cid-v4rlkyg3> </div> <div class="catalog-card-content" data-astro-cid-v4rlkyg3> <h3 class="catalog-card-title" data-astro-cid-v4rlkyg3>${card.title}</h3> <p class="catalog-card-desc" data-astro-cid-v4rlkyg3>${card.short_description}</p> <a${addAttribute(`https://wa.me/${whatsappNumber}?text=${encodeURIComponent("Bună! M-ar interesa costumul/personajul " + card.title + " din catalogul Kassia. Îmi puteți spune dacă este disponibil pentru data evenimentului?")}`, "href")} target="_blank" rel="noopener" class="catalog-card-cta"${addAttribute(`Verifică disponibilitatea pentru ${card.title} pe WhatsApp`, "aria-label")} data-astro-cid-v4rlkyg3>Verifică disponibilitatea &rarr;</a> </div> </div>`)} </div> <div class="text-center mt-4 pt-4" data-astro-cid-v4rlkyg3> ${isFullCatalog ? renderTemplate`<button id="load-more-btn" class="btn-primary" style="display: inline-block; padding: 1rem 2rem; border-radius: 99px; font-weight: 700; background: var(--primary); color: white; border: none; cursor: pointer; transition: transform 0.2s;" data-astro-cid-v4rlkyg3>
Încarcă mai multe costume
</button>` : renderTemplate`<a href="/catalog-costume/" class="btn-primary" style="display: inline-block; padding: 1rem 2rem; border-radius: 99px; font-weight: 700; background: var(--primary); color: white; text-decoration: none; transition: transform 0.2s;" data-astro-cid-v4rlkyg3>
Vezi catalogul complet de costume
</a>`} </div> </div> </section> ${isFullCatalog && renderTemplate`${renderScript($$result, "/Users/universparty/wa-web-launcher/kassia-site/src/components/CostumeCatalog.astro?astro&type=script&index=0&lang.ts")}`}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/components/CostumeCatalog.astro", void 0);

const $$ = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$;
  const rawSlug = Astro2.params.slug || "";
  const path = rawSlug === "" ? "/" : `/${rawSlug}/`;
  const redirectMap = /* @__PURE__ */ new Map([
    ["/blog/petrecere-copii-in-ilfov-ghid/", "/animatori-petreceri-copii/"],
    ["/blog/petrecere-copii-in-ilfov-ghid", "/animatori-petreceri-copii/"],
    ["/animatori-copii-berceni-ilfov/", "/animatori-petreceri-copii-berceni/"],
    ["/animatori-copii-berceni-ilfov", "/animatori-petreceri-copii-berceni/"],
    ["/animatori-copii-pipera-bucuresti/", "/animatori-petreceri-copii-voluntari/"],
    ["/animatori-copii-pipera-bucuresti", "/animatori-petreceri-copii-voluntari/"]
  ]);
  const currentPath = Astro2.url.pathname;
  const redirectTarget = redirectMap.get(currentPath);
  if (redirectTarget) {
    return Astro2.redirect(redirectTarget, 301);
  }
  if (rawSlug && !Astro2.url.pathname.endsWith("/")) {
    return Astro2.redirect(`${Astro2.url.pathname}/`, 301);
  }
  const { data: page, error } = await supabase.from("kassia_pages").select("id,path,slug,page_type,title,h1,meta_title,meta_description,canonical_url,status,index_status,include_in_sitemap,priority,updated_at,show_pricing_preview").eq("path", path).single();
  if (error || !page) {
    return new Response(null, {
      status: 404,
      statusText: "Not found"
    });
  }
  if (page.status !== "published" && true) {
    return new Response(null, {
      status: 404,
      statusText: "Not found"
    });
  }
  const [
    { data: rawSections },
    { data: internalLinks },
    { data: configRows },
    { data: faqs },
    { data: gallery }
  ] = await Promise.all([
    supabase.from("kassia_page_sections").select("id,section_type,heading,content,order_index").eq("page_id", page.id).order("order_index", { ascending: true }),
    supabase.from("kassia_internal_links").select("id,source_page_id,target_page_id,anchor_text,target_page:kassia_pages!target_page_id(path,status)").eq("source_page_id", page.id),
    supabase.from("kassia_site_config").select("key,value"),
    supabase.from("kassia_faqs").select("id,question,answer,order_index").eq("page_id", page.id).order("order_index", { ascending: true }),
    supabase.from("kassia_gallery_items").select("id,url,alt_text,order_index").eq("page_id", page.id).order("order_index", { ascending: true })
  ]);
  const sections = rawSections?.map((s) => ({ ...s, content: typeof s.content === "string" ? JSON.parse(s.content) : s.content || {} }))?.filter((s) => s.content?.is_active !== false);
  console.log("SECTIONS IN SLUG ASTRO:", sections?.map((s) => s.section_type));
  const publishedLinks = internalLinks ? internalLinks.filter((link) => link.target_page && link.target_page.status === "published") : [];
  const robots = page.index_status === "index" ? "index, follow" : "noindex, follow";
  const siteUrl = "https://www.kassia.ro";
  const canonical = page.canonical_url || `${siteUrl}${path}`;
  const animatoriSlugs = [
    "animatori-petreceri-copii",
    "animatori-petreceri-copii-bucuresti",
    "preturi-animatori-copii-bucuresti",
    "pachete-animatori-copii-bucuresti",
    "oferta-animatori-petreceri-copii-bucuresti",
    "personaje-petreceri-copii-bucuresti",
    "animatori-tematici-petreceri-copii-bucuresti",
    "mascote-petreceri-copii-bucuresti",
    "pictura-pe-fata-copii-bucuresti",
    "modelaj-baloane-copii-bucuresti",
    "jocuri-interactive-copii-bucuresti",
    "mini-disco-copii-bucuresti",
    "animatori-cu-mascote-petreceri-copii-bucuresti"
  ];
  const isAnimatoriPage = animatoriSlugs.includes(page?.slug);
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone;
  const validFaqs = faqs?.filter((f) => f.question && f.answer && !f.question.startsWith("Draft FAQ") && f.answer !== "Placeholder") || [];
  const validImages = gallery?.filter((g) => g.url && g.url.trim() !== "") || [];
  const schemas = [];
  const localBusinessSchema = {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "@id": `${siteUrl}/#organization`,
    "name": "Kassia Events",
    "url": siteUrl,
    "logo": `${siteUrl}/logo.png`,
    "image": validImages.length > 0 ? validImages[0].url : void 0
  };
  if (phone) {
    localBusinessSchema.telephone = phone;
  }
  if (config && Object.keys(config).length > 0) {
    localBusinessSchema.address = {
      "@type": "PostalAddress",
      "addressRegion": "București & Ilfov",
      "addressCountry": "RO"
    };
  }
  schemas.push(localBusinessSchema);
  if (["service", "service_pillar", "event", "location", "satellite"].includes(page.page_type)) {
    const serviceSchema = {
      "@context": "https://schema.org",
      "@type": "Service",
      "name": page.h1 || page.title,
      "provider": {
        "@id": `${siteUrl}/#organization`
      },
      "areaServed": "Ilfov, București"
    };
    if (page.slug === "animatori-petreceri-copii") {
      serviceSchema.aggregateRating = {
        "@type": "AggregateRating",
        "ratingValue": "4.9",
        "reviewCount": "970"
      };
      serviceSchema.review = [
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Andreea M." },
          "datePublished": "2024-05-12",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Animatoarea Elsa a fost minunată, copiii au fost captivați de jocuri și dansuri pe tot parcursul petrecerii."
        },
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Mihai C." },
          "datePublished": "2024-06-18",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Spiderman a ținut toți băieții în priză cu concursuri și activități interactive super amuzante."
        },
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Raluca I." },
          "datePublished": "2024-07-02",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Pictura pe față a fost realizată cu mult talent și vopsele sigure pentru piele. Copiii au fost încântați!"
        }
      ];
      serviceSchema.hasOfferCatalog = {
        "@type": "OfferCatalog",
        "name": "Pachete Animatori Petreceri Copii",
        "itemListElement": [
          {
            "@type": "Offer",
            "itemOffered": { "@type": "Service", "name": "Pachet 1 personaj / 1 oră" },
            "price": "280",
            "priceCurrency": "RON"
          },
          {
            "@type": "Offer",
            "itemOffered": { "@type": "Service", "name": "Pachet 1 personaj / 2 ore" },
            "price": "490",
            "priceCurrency": "RON"
          },
          {
            "@type": "Offer",
            "itemOffered": { "@type": "Service", "name": "Pachet 2 personaje / 1 oră" },
            "price": "490",
            "priceCurrency": "RON"
          },
          {
            "@type": "Offer",
            "itemOffered": { "@type": "Service", "name": "Pachet 2 personaje / 2 ore" },
            "price": "830",
            "priceCurrency": "RON"
          }
        ]
      };
    }
    schemas.push(serviceSchema);
  }
  if (validFaqs.length > 0) {
    schemas.push({
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": validFaqs.map((faq) => ({
        "@type": "Question",
        "name": faq.question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": faq.answer
        }
      }))
    });
  }
  const pathSegments = path.split("/").filter(Boolean);
  if (pathSegments.length > 0) {
    const itemListElement = pathSegments.map((segment, index) => ({
      "@type": "ListItem",
      "position": index + 1,
      "name": index === pathSegments.length - 1 ? page.h1 || page.title || segment.replace(/-/g, " ") : segment.replace(/-/g, " "),
      "item": `${siteUrl}/${pathSegments.slice(0, index + 1).join("/")}/`
    }));
    schemas.push({
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": itemListElement
    });
  }
  const ogImage = validImages.length > 0 ? validImages[0].url : void 0;
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": page.meta_title, "description": page.meta_description, "canonical": canonical, "robots": robots, "schemas": schemas, "ogImage": ogImage, "data-astro-cid-fzx4jmue": true }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="kassia-premium-page" data-astro-cid-fzx4jmue>  ${(() => {
    const heroSec = sections?.find((s) => s.section_type === "hero");
    const hasBody = heroSec?.content?.body && heroSec.content.body.trim() !== "";
    return renderTemplate`<header${addAttribute(`hero-section ${heroSec?.content?.image_url ? "has-image" : ""}`, "class")} data-astro-cid-fzx4jmue> <div class="hero-overlay" data-astro-cid-fzx4jmue></div> <div class="container hero-content-wrapper" data-astro-cid-fzx4jmue> <div class="hero-text-content" data-astro-cid-fzx4jmue> <h1 class="page-title" data-astro-cid-fzx4jmue>${page.h1}</h1> ${hasBody ? renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate` <div class="hero-subtitle" data-astro-cid-fzx4jmue>${unescapeHTML(heroSec.content.body)}</div> ${heroSec.content?.cta_text && heroSec.content?.cta_url && renderTemplate`<a${addAttribute(heroSec.content.cta_url, "href")} class="btn-primary" style="margin-top:2rem; display:inline-block;" data-astro-cid-fzx4jmue> ${heroSec.content.cta_text} </a>`}` })}` : renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate`${page.meta_description && renderTemplate`<p class="hero-subtitle" data-astro-cid-fzx4jmue>${page.meta_description}</p>`}` })}`} </div> ${heroSec?.content?.image_url && renderTemplate`<div class="hero-image-wrapper" data-astro-cid-fzx4jmue> <img${addAttribute(heroSec.content.image_url, "src")}${addAttribute(page.h1, "alt")} class="hero-image" width="1200" height="800" loading="eager" fetchpriority="high" decoding="sync" data-astro-cid-fzx4jmue> </div>`} </div> </header>`;
  })()}  ${sections && sections.filter((s) => s.section_type === "service_card").length > 0 && renderTemplate`<section class="service-cards-section bg-white" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>Alege Serviciul Dorit</h2> <div class="service-cards-grid" data-astro-cid-fzx4jmue> ${sections.filter((s) => s.section_type === "service_card").map((card) => renderTemplate`<a${addAttribute(card.content?.cta_url || "#", "href")} class="service-card-link" data-astro-cid-fzx4jmue> <div class="service-card" data-astro-cid-fzx4jmue> <div class="service-card-image" data-astro-cid-fzx4jmue> ${card.content?.image_url && card.content.image_url.trim() !== "" && renderTemplate`<img${addAttribute(card.content.image_url, "src")}${addAttribute(card.content?.image_alt || "Activitate pentru petreceri de copii", "alt")} width="800" height="800" loading="lazy" decoding="async" data-astro-cid-fzx4jmue>`} <div class="service-card-overlay" data-astro-cid-fzx4jmue></div> </div> <div class="service-card-content" data-astro-cid-fzx4jmue> <h3 class="service-card-title" data-astro-cid-fzx4jmue>${card.heading}</h3> ${card.content?.subheading && renderTemplate`<p class="service-card-subtitle" data-astro-cid-fzx4jmue>${card.content.subheading}</p>`} <span class="service-card-cta" data-astro-cid-fzx4jmue>${card.content?.cta_text || "Vezi Detalii"} &rarr;</span> </div> </div> </a>`)} </div> </div> </section>`}  ${page.slug === "preturi-decoratiuni-baloane" ? renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate`${sections && sections.filter((s) => s.heading === "Cum se calculează prețul unui decor cu baloane?").map((section) => renderTemplate`<section class="content-section bg-light" id="cum-se-calculeaza" data-astro-cid-fzx4jmue> <div class="container section-grid" style="grid-template-columns: 1fr; max-width: 800px; text-align: center;" data-astro-cid-fzx4jmue> <div class="section-text" data-astro-cid-fzx4jmue> <h2 class="section-heading" data-astro-cid-fzx4jmue>${section.heading}</h2> ${section.content?.body && renderTemplate`<div class="section-body prose" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} </div> </div> </section>`)}<div id="content" class="container" style="padding: 4rem 1rem;" data-astro-cid-fzx4jmue> <div class="pricing-details-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 2rem;" data-astro-cid-fzx4jmue> ${sections && sections.filter((s) => !["hero", "gallery", "faq", "service_card"].includes(s.section_type) && s.heading !== "Cum se calculează prețul unui decor cu baloane?").map((section) => renderTemplate`<div class="pricing-detail-card"${addAttribute(section.heading ? "preturi-" + section.heading.replace("Prețuri ", "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "") : void 0, "id")} style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); border: 1px solid #e2e8f0; display: flex; flex-direction: column;" data-astro-cid-fzx4jmue> <h3 class="pricing-card-title" style="font-size: 1.5rem; margin-bottom: 1rem; color: var(--primary-dark);" data-astro-cid-fzx4jmue>${section.heading}</h3> ${section.content?.body && renderTemplate`<div class="pricing-card-body prose" style="flex-grow: 1; margin-bottom: 1.5rem;" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} ${section.content?.cta_url && section.content?.cta_text && renderTemplate`<a${addAttribute(section.content.cta_url, "href")} class="btn-primary" style="align-self: flex-start; margin-top: auto;" data-astro-cid-fzx4jmue>${section.content.cta_text}</a>`} </div>`)} </div> </div> ` })}` : renderTemplate`<div id="content" class="sections-wrapper" data-astro-cid-fzx4jmue> ${page.show_pricing_preview && renderTemplate`${renderComponent($$result2, "PricingPreview", $$PricingPreview, { "locationName": page.slug.includes("voluntari") ? "Voluntari și Pipera" : "petrecerea ta", "data-astro-cid-fzx4jmue": true })}`} ${sections && sections.filter((s) => !["hero", "gallery", "faq", "service_card", "testimonials_section", "process_steps", "feature_card"].includes(s.section_type)).map((section, index) => {
    if (section.section_type === "costume_catalog") {
      return renderTemplate`${renderComponent($$result2, "CostumeCatalog", $$CostumeCatalog, { "heading": section.heading, "subheading": section.content?.body, "cards": section.content?.cards || [], "data-astro-cid-fzx4jmue": true })}`;
    }
    const isTextOnly = !section.content?.image_url || section.content.image_url.trim() === "";
    return renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate` <section${addAttribute(section.heading ? "preturi-" + section.heading.replace("Prețuri ", "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "") : void 0, "id")}${addAttribute(`content-section ${index % 2 === 0 ? "bg-light" : "bg-white"}`, "class")} data-astro-cid-fzx4jmue> <div${addAttribute(`container section-grid ${isTextOnly ? "text-only" : ""}`, "class")} data-astro-cid-fzx4jmue> <div class="section-text" data-astro-cid-fzx4jmue> ${section.heading && renderTemplate`<h2 class="section-heading" data-astro-cid-fzx4jmue>${section.heading}</h2>`} ${section.content?.subheading && renderTemplate`<h3 class="section-subheading" data-astro-cid-fzx4jmue>${section.content.subheading}</h3>`} ${section.content?.body && renderTemplate`<div class="section-body" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} ${section.content?.cta_text && section.content?.cta_url && renderTemplate`<a${addAttribute(section.content.cta_url, "href")} class="btn-primary" data-astro-cid-fzx4jmue>${section.content.cta_text}</a>`} </div>  ${section.content?.image_url && section.content.image_url.trim() !== "" && renderTemplate`<div class="section-image-placeholder" data-astro-cid-fzx4jmue> <img${addAttribute(section.content.image_url, "src")}${addAttribute(section.content?.image_alt || "Activitate pentru petreceri de copii", "alt")} width="800" height="600" loading="lazy" decoding="async" data-astro-cid-fzx4jmue> </div>`} </div> </section> ${index === 0 && sections.some((s) => s.section_type === "feature_card") && renderTemplate`<section class="feature-cards-section bg-light" style="padding: 4rem 0;" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <div class="service-cards-grid" style="margin-top: 0;" data-astro-cid-fzx4jmue> ${sections.filter((s) => s.section_type === "feature_card").map((card) => renderTemplate`<div class="service-card" data-astro-cid-fzx4jmue> <div class="service-card-image" data-astro-cid-fzx4jmue> ${card.content?.image_url && card.content.image_url.trim() !== "" && renderTemplate`<img${addAttribute(card.content.image_url, "src")}${addAttribute(card.content?.image_alt || "Card vizual Kassia", "alt")} width="800" height="800" loading="lazy" decoding="async" data-astro-cid-fzx4jmue>`} <div class="service-card-overlay" data-astro-cid-fzx4jmue></div> </div> <div class="service-card-content" data-astro-cid-fzx4jmue> <h3 class="service-card-title" data-astro-cid-fzx4jmue>${card.heading}</h3> ${card.content?.body && renderTemplate`<div class="service-card-subtitle prose" style="font-size:0.95rem; line-height:1.5;" data-astro-cid-fzx4jmue>${unescapeHTML(card.content.body)}</div>`} ${card.content?.cta_url && card.content?.cta_text && renderTemplate`<a${addAttribute(card.content.cta_url, "href")} class="service-card-cta" style="margin-top: auto; display:inline-block; padding-top:1rem;" data-astro-cid-fzx4jmue>${card.content.cta_text} &rarr;</a>`} </div> </div>`)} </div> </div> </section>`}${index === 0 && page.slug === "preturi-animatori-copii-bucuresti" && renderTemplate`${renderComponent($$result3, "PricingFullTable", $$PricingFullTable, { "data-astro-cid-fzx4jmue": true })}`}` })}`;
  })} </div>`}  ${sections && sections.some((s) => s.section_type === "gallery") && gallery && gallery.some((img) => img.url && img.url.trim() !== "") && renderTemplate`<section class="gallery-section bg-light" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>${sections.find((s) => s.section_type === "gallery")?.heading || "Galerie Foto"}</h2> <div class="gallery-grid" data-astro-cid-fzx4jmue> ${gallery.filter((img) => img.url && img.url.trim() !== "").map((img) => renderTemplate`<figure class="gallery-item" data-astro-cid-fzx4jmue> <img${addAttribute(img.url, "src")}${addAttribute(img.alt_text || "Galerie", "alt")} width="800" height="800" loading="lazy" decoding="async" data-astro-cid-fzx4jmue> </figure>`)} </div> </div> </section>`}  ${validFaqs.length > 0 && renderTemplate`<section class="faq-section bg-white" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>Întrebări Frecvente</h2> <div class="faq-accordion" data-astro-cid-fzx4jmue> ${validFaqs.map((faq) => renderTemplate`<details class="faq-details" data-astro-cid-fzx4jmue> <summary class="faq-summary" data-astro-cid-fzx4jmue>${faq.question}</summary> <div class="faq-answer" data-astro-cid-fzx4jmue>${faq.answer}</div> </details>`)} </div> </div> </section>`} ${renderComponent($$result2, "ReviewsCarousel", $$ReviewsCarousel, { "data-astro-cid-fzx4jmue": true })} ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": publishedLinks, "isAnimatori": isAnimatoriPage, "data-astro-cid-fzx4jmue": true })} </div> ` })}`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/pages/[...slug].astro", void 0);
const $$file = "/Users/universparty/wa-web-launcher/kassia-site/src/pages/[...slug].astro";
const $$url = "/[...slug]";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
