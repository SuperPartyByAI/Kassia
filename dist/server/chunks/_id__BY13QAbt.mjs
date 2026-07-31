import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aY as renderTemplate, aM as maybeRenderHead, a5 as addAttribute } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_DU6zC1rc.mjs';
import { s as supabaseAdmin, $ as $$AdminLayout } from './supabaseAdmin_BbxJ75dC.mjs';

const $$id = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$id;
  const { id } = Astro2.params;
  const currentTab = Astro2.url.searchParams.get("tab") || "seo";
  let message = "";
  let isError = false;
  let { data: page } = await supabaseAdmin.from("kassia_pages").select("*").eq("id", id).single();
  if (!page) {
    return new Response("Page not found", { status: 404 });
  }
  let { data: sections } = await supabaseAdmin.from("kassia_page_sections").select("*").eq("page_id", id).order("order_index");
  let { data: faqs } = await supabaseAdmin.from("kassia_faqs").select("*").eq("page_id", id).order("order_index");
  let { data: gallery } = await supabaseAdmin.from("kassia_gallery_items").select("*").eq("page_id", id).order("order_index");
  let { data: internalLinksRaw } = await supabaseAdmin.from("kassia_internal_links").select("*").eq("source_page_id", id);
  let internalLinks = [];
  if (internalLinksRaw && internalLinksRaw.length > 0) {
    const targetIds = internalLinksRaw.map((l) => l.target_page_id);
    const { data: targetPages } = await supabaseAdmin.from("kassia_pages").select("id, path, status").in("id", targetIds);
    internalLinks = internalLinksRaw.map((l) => ({
      ...l,
      target_page: targetPages?.find((p) => p.id === l.target_page_id) || null
    }));
  }
  sections = sections?.map((s) => ({ ...s, content: typeof s.content === "string" ? JSON.parse(s.content) : s.content || {} })) || [];
  function getPublishBlockers(p, s, f, g, il) {
    const activeSections = s.filter((sec) => sec.content?.is_active);
    const invalidSections = activeSections.filter((sec) => {
      if (sec.section_type === "service_card") {
        if (!sec.heading?.trim()) return true;
        if (sec.content?.subheading === void 0 || sec.content.subheading.trim() === "") return true;
        if (!sec.content?.cta_text?.trim()) return true;
        if (!sec.content?.cta_url?.trim()) return true;
        if (sec.content?.image_url !== void 0 && sec.content.image_url.trim() === "") return true;
        return false;
      }
      return !sec.content?.body || sec.content.body.trim() === "";
    });
    const hasInvalidSection = invalidSections.length > 0;
    const hasInvalidFaq = f.some((faq) => !faq.question || !faq.answer || faq.question.startsWith("Draft FAQ") || faq.answer === "Placeholder");
    const hasEmptyMedia = g.some((gal) => !gal.url || gal.url.trim() === "");
    const isCommercial = ["service_pillar", "service", "event", "location", "satellite"].includes(p.page_type);
    let sectionCountRule = activeSections.length >= 5;
    if (p.page_type === "support") {
      sectionCountRule = activeSections.length >= 3;
    } else if (p.page_type === "guide" || p.page_type === "blog") {
      const requiredKeys = ["hero", "intro", "main_answer", "faq", "final_cta"];
      const hasAllKeys = requiredKeys.every((k) => activeSections.some((sec) => sec.section_type === k));
      sectionCountRule = hasAllKeys;
    }
    const hasContactLink = il.some((l) => l.target_page?.path === "/contact/");
    const hasInvalidCta = activeSections.some((sec) => sec.content?.cta_text && (!sec.content?.cta_url || sec.content.cta_url.trim() === ""));
    const hasMissingTarget = il.some((l) => !l.target_page);
    const checks = {
      h1: !!p.h1?.trim(),
      meta_title: !!p.meta_title?.trim(),
      meta_description: !!p.meta_description?.trim(),
      sections: sectionCountRule,
      valid_content: !hasInvalidSection,
      valid_faq: !hasInvalidFaq && (!isCommercial || f.length > 0),
      valid_media: !hasEmptyMedia && (!isCommercial || g.length > 0),
      contact_link: !isCommercial || hasContactLink,
      valid_cta: !hasInvalidCta,
      valid_links: !hasMissingTarget
    };
    const blockers2 = [];
    if (!checks.h1) blockers2.push("Lipsește H1");
    if (!checks.meta_title) blockers2.push("Lipsește Meta Title");
    if (!checks.meta_description) blockers2.push("Lipsește Meta Description");
    if (!checks.sections) blockers2.push(`Regulă secțiuni eșuată (${p.page_type})`);
    if (!checks.valid_content) blockers2.push("Există secțiuni active invalide (body gol pt conținut, sau card incomplet pt service_card)");
    if (!checks.valid_faq) blockers2.push("FAQ conține Placeholder / Draft FAQ sau e gol");
    if (!checks.valid_media) blockers2.push("Imagini goale sau lipsă imagini pentru pagină comercială");
    if (!checks.contact_link) blockers2.push("Lipsă link intern către /contact/");
    if (!checks.valid_cta) blockers2.push("Există CTA invalid (fără URL)");
    if (!checks.valid_links) blockers2.push("Există linkuri interne către targeturi șterse");
    return blockers2;
  }
  let blockers = getPublishBlockers(page, sections, faqs, gallery, internalLinks);
  let canPublish = blockers.length === 0;
  if (Astro2.request.method === "POST") {
    try {
      const formData = await Astro2.request.formData();
      const action = formData.get("action");
      if (action === "save_seo") {
        const { error } = await supabaseAdmin.from("kassia_pages").update({
          title: formData.get("title"),
          h1: formData.get("h1"),
          meta_title: formData.get("meta_title"),
          meta_description: formData.get("meta_description"),
          canonical_url: formData.get("canonical_url") || null,
          priority: parseFloat(formData.get("priority") || "0.5")
        }).eq("id", id);
        if (error) throw error;
        message = "SEO settings saved successfully";
      } else if (action === "save_section") {
        const sectionId = formData.get("section_id");
        const { error } = await supabaseAdmin.from("kassia_page_sections").update({
          heading: formData.get("heading") || null,
          content: {
            subheading: formData.get("subheading") || null,
            body: formData.get("body") || null,
            cta_text: formData.get("cta_text") || null,
            cta_url: formData.get("cta_url") || null,
            is_active: formData.get("is_active") === "true"
          },
          order_index: parseInt(formData.get("order_index") || "0")
        }).eq("id", sectionId);
        if (error) throw error;
        message = "Section saved successfully";
      } else if (action === "add_faq" || action === "edit_faq") {
        const faqId = formData.get("faq_id");
        const faqData = {
          page_id: id,
          question: formData.get("question"),
          answer: formData.get("answer"),
          order_index: parseInt(formData.get("order_index") || "0")
        };
        if (action === "edit_faq") {
          const { error } = await supabaseAdmin.from("kassia_faqs").update(faqData).eq("id", faqId);
          if (error) throw error;
        } else {
          const { error } = await supabaseAdmin.from("kassia_faqs").insert(faqData);
          if (error) throw error;
        }
        message = "FAQ saved successfully";
      } else if (action === "delete_faq") {
        const { error } = await supabaseAdmin.from("kassia_faqs").delete().eq("id", formData.get("faq_id"));
        if (error) throw error;
        message = "FAQ deleted successfully";
      } else if (action === "add_gallery" || action === "edit_gallery") {
        const galleryId = formData.get("gallery_id");
        const altText = formData.get("alt_text");
        if (!altText) throw new Error("alt_text is required");
        const galleryData = {
          page_id: id,
          url: formData.get("url"),
          alt_text: altText,
          order_index: parseInt(formData.get("order_index") || "0")
        };
        if (action === "edit_gallery") {
          const { error } = await supabaseAdmin.from("kassia_gallery_items").update(galleryData).eq("id", galleryId);
          if (error) throw error;
        } else {
          const { error } = await supabaseAdmin.from("kassia_gallery_items").insert(galleryData);
          if (error) throw error;
        }
        message = "Gallery item saved successfully";
      } else if (action === "delete_gallery") {
        const { error } = await supabaseAdmin.from("kassia_gallery_items").delete().eq("id", formData.get("gallery_id"));
        if (error) throw error;
        message = "Gallery item deleted successfully";
      } else if (action === "publish_page") {
        if (!canPublish) throw new Error(`Publish blocked: ${blockers.join(", ")}`);
        const { error } = await supabaseAdmin.from("kassia_pages").update({
          status: "published",
          index_status: "index",
          include_in_sitemap: true,
          published_at: (/* @__PURE__ */ new Date()).toISOString()
        }).eq("id", id);
        if (error) throw error;
        message = "Page published successfully!";
      } else if (action === "unpublish_page") {
        const { error } = await supabaseAdmin.from("kassia_pages").update({
          status: "draft",
          index_status: "noindex",
          include_in_sitemap: false
        }).eq("id", id);
        if (error) throw error;
        message = "Page unpublished successfully.";
      }
      const pRes = await supabaseAdmin.from("kassia_pages").select("*").eq("id", id).single();
      page = pRes.data || page;
      const sRes = await supabaseAdmin.from("kassia_page_sections").select("*").eq("page_id", id).order("order_index");
      sections = sRes.data?.map((s) => ({ ...s, content: typeof s.content === "string" ? JSON.parse(s.content) : s.content || {} })) || [];
      const fRes = await supabaseAdmin.from("kassia_faqs").select("*").eq("page_id", id).order("order_index");
      faqs = fRes.data || [];
      const gRes = await supabaseAdmin.from("kassia_gallery_items").select("*").eq("page_id", id).order("order_index");
      gallery = gRes.data || [];
      const ilRes = await supabaseAdmin.from("kassia_internal_links").select("*").eq("source_page_id", id);
      internalLinks = [];
      if (ilRes.data && ilRes.data.length > 0) {
        const targetIds = ilRes.data.map((l) => l.target_page_id);
        const targetPagesRes = await supabaseAdmin.from("kassia_pages").select("id, path, status").in("id", targetIds);
        internalLinks = ilRes.data.map((l) => ({
          ...l,
          target_page: targetPagesRes.data?.find((p) => p.id === l.target_page_id) || null
        }));
      }
      blockers = getPublishBlockers(page, sections, faqs, gallery, internalLinks);
      canPublish = blockers.length === 0;
    } catch (err) {
      message = err.message || "An error occurred";
      isError = true;
    }
  }
  const tabs = [
    { id: "seo", label: "SEO" },
    { id: "sections", label: "Sections" },
    { id: "faq", label: "FAQ" },
    { id: "gallery", label: "Gallery" },
    { id: "links", label: "Internal Links" },
    { id: "publish", label: "Publish Guard" }
  ];
  return renderTemplate`${renderComponent($$result, "AdminLayout", $$AdminLayout, { "title": `Edit: ${page.path}`, "data-astro-cid-fmmaxvi5": true }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;" data-astro-cid-fmmaxvi5> <div data-astro-cid-fmmaxvi5> <h1 style="margin-bottom: 0.5rem;" data-astro-cid-fmmaxvi5>Edit Page</h1> <p style="margin: 0; font-family: monospace; color: #64748b;" data-astro-cid-fmmaxvi5>${page.path}</p> </div> <div style="display: flex; gap: 1rem; align-items: center;" data-astro-cid-fmmaxvi5> <div data-astro-cid-fmmaxvi5>
Status: <span${addAttribute(`badge ${page.status === "published" ? "published" : "draft"}`, "class")} data-astro-cid-fmmaxvi5>${page.status}</span>
Index: <span class="badge" data-astro-cid-fmmaxvi5>${page.index_status}</span>
Sitemap: <span class="badge" data-astro-cid-fmmaxvi5>${page.include_in_sitemap ? "Yes" : "No"}</span> </div> ${page.status === "published" ? renderTemplate`<a${addAttribute(page.path, "href")} target="_blank" class="btn" style="background: #3b82f6;" data-astro-cid-fmmaxvi5>Preview</a>` : renderTemplate`<span style="font-family: monospace; font-size: 0.9em;" data-astro-cid-fmmaxvi5>${page.path}</span>`} </div> </div> ${message && renderTemplate`<div${addAttribute(`padding: 1rem; margin-bottom: 1rem; border-radius: 4px; ${isError ? "background: #fef2f2; color: #991b1b; border: 1px solid #fecaca;" : "background: #f0fdf4; color: #166534; border: 1px solid #bbf7d0;"}`, "style")} data-astro-cid-fmmaxvi5> ${message} </div>`}${page.status === "draft" && renderTemplate`<div class="warning-box" data-astro-cid-fmmaxvi5> <strong data-astro-cid-fmmaxvi5>Note:</strong> This page is in DRAFT status. Public preview returns 404.
</div>`}<div class="tabs" data-astro-cid-fmmaxvi5> ${tabs.map((tab) => renderTemplate`<a${addAttribute(`?tab=${tab.id}`, "href")}${addAttribute(`tab ${currentTab === tab.id ? "active" : ""}`, "class")} data-astro-cid-fmmaxvi5>${tab.label}</a>`)} </div> <div class="card" data-astro-cid-fmmaxvi5> ${currentTab === "seo" && renderTemplate`<form method="POST" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="save_seo" data-astro-cid-fmmaxvi5> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Title</label> <input type="text" name="title"${addAttribute(page.title, "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>H1</label> <input type="text" name="h1"${addAttribute(page.h1 || "", "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Meta Title (max 100 chars)</label> <input type="text" name="meta_title"${addAttribute(page.meta_title || "", "value")} maxlength="100" data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Meta Description (max 255 chars)</label> <textarea name="meta_description" maxlength="255" data-astro-cid-fmmaxvi5>${page.meta_description || ""}</textarea> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Canonical URL (Optional, leave blank for auto)</label> <input type="text" name="canonical_url"${addAttribute(page.canonical_url || "", "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Priority (0.0 to 1.0)</label> <input type="number" step="0.1" name="priority"${addAttribute(page.priority, "value")} data-astro-cid-fmmaxvi5> </div> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Save SEO Settings</button> </form>`} ${currentTab === "sections" && renderTemplate`<div data-astro-cid-fmmaxvi5> ${sections?.map((section) => renderTemplate`<form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="save_section" data-astro-cid-fmmaxvi5> <input type="hidden" name="section_id"${addAttribute(section.id, "value")} data-astro-cid-fmmaxvi5> <div style="display: flex; justify-content: space-between; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5> <h3 style="margin: 0; text-transform: capitalize;" data-astro-cid-fmmaxvi5>${section.section_type.replace("_", " ")}</h3> <div style="display: flex; gap: 1rem; align-items: center;" data-astro-cid-fmmaxvi5> <label style="display: flex; align-items: center; gap: 0.5rem; font-weight: normal; margin: 0;" data-astro-cid-fmmaxvi5> <input type="checkbox" name="is_active" value="true"${addAttribute(section.content?.is_active, "checked")} data-astro-cid-fmmaxvi5>
Active
</label> <input type="number" name="order_index"${addAttribute(section.order_index, "value")} style="width: 60px; padding: 0.25rem;" data-astro-cid-fmmaxvi5> </div> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Heading</label> <input type="text" name="heading"${addAttribute(section.heading || "", "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Subheading</label> <input type="text" name="subheading"${addAttribute(section.content?.subheading || "", "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Body (HTML allowed)</label> <textarea name="body" data-astro-cid-fmmaxvi5>${section.content?.body || ""}</textarea> </div> <div style="display: flex; gap: 1rem;" data-astro-cid-fmmaxvi5> <div class="form-group" style="flex: 1;" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>CTA Text</label> <input type="text" name="cta_text"${addAttribute(section.content?.cta_text || "", "value")} data-astro-cid-fmmaxvi5> </div> <div class="form-group" style="flex: 1;" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>CTA URL</label> <input type="text" name="cta_url"${addAttribute(section.content?.cta_url || "", "value")} data-astro-cid-fmmaxvi5> </div> </div> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Save Section</button> </form>`)} </div>`} ${currentTab === "faq" && renderTemplate`<div data-astro-cid-fmmaxvi5> <form method="POST" style="margin-bottom: 2rem; padding-bottom: 2rem; border-bottom: 2px solid #e2e8f0;" data-astro-cid-fmmaxvi5> <h3 data-astro-cid-fmmaxvi5>Add New FAQ</h3> <input type="hidden" name="action" value="add_faq" data-astro-cid-fmmaxvi5> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Question</label> <input type="text" name="question" required data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Answer</label> <textarea name="answer" required data-astro-cid-fmmaxvi5></textarea> </div> <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5> <div class="form-group" style="margin:0;" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Order Index</label> <input type="number" name="order_index" value="0" style="width: 80px;" data-astro-cid-fmmaxvi5> </div> </div> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Add FAQ</button> </form> ${faqs?.map((faq) => renderTemplate`<form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="edit_faq" data-astro-cid-fmmaxvi5> <input type="hidden" name="faq_id"${addAttribute(faq.id, "value")} data-astro-cid-fmmaxvi5> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Question</label> <input type="text" name="question"${addAttribute(faq.question, "value")} required data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Answer</label> <textarea name="answer" required data-astro-cid-fmmaxvi5>${faq.answer}</textarea> </div> <div style="display: flex; justify-content: space-between; align-items: center;" data-astro-cid-fmmaxvi5> <div style="display: flex; gap: 1rem; align-items: center;" data-astro-cid-fmmaxvi5> <input type="number" name="order_index"${addAttribute(faq.order_index, "value")} style="width: 80px;" data-astro-cid-fmmaxvi5> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Update</button> </div> <button${addAttribute(`delete-faq-${faq.id}`, "form")} class="btn" style="background: #ef4444;" data-astro-cid-fmmaxvi5>Delete</button> </div> </form>`)} ${faqs?.map((faq) => renderTemplate`<form${addAttribute(`delete-faq-${faq.id}`, "id")} method="POST" style="display:none;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="delete_faq" data-astro-cid-fmmaxvi5> <input type="hidden" name="faq_id"${addAttribute(faq.id, "value")} data-astro-cid-fmmaxvi5> </form>`)} </div>`} ${currentTab === "gallery" && renderTemplate`<div data-astro-cid-fmmaxvi5> <form method="POST" style="margin-bottom: 2rem; padding-bottom: 2rem; border-bottom: 2px solid #e2e8f0;" data-astro-cid-fmmaxvi5> <h3 data-astro-cid-fmmaxvi5>Add Image</h3> <input type="hidden" name="action" value="add_gallery" data-astro-cid-fmmaxvi5> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Image URL</label> <input type="text" name="url" required data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Alt Text</label> <input type="text" name="alt_text" required data-astro-cid-fmmaxvi5> </div> <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5> <div class="form-group" style="margin:0;" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Order Index</label> <input type="number" name="order_index" value="0" style="width: 80px;" data-astro-cid-fmmaxvi5> </div> </div> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Add Image</button> </form> ${gallery?.map((g) => renderTemplate`<form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="edit_gallery" data-astro-cid-fmmaxvi5> <input type="hidden" name="gallery_id"${addAttribute(g.id, "value")} data-astro-cid-fmmaxvi5> <div style="display: flex; gap: 1rem;" data-astro-cid-fmmaxvi5> <img${addAttribute(g.url, "src")} style="width: 100px; height: 100px; object-fit: cover; border-radius: 4px;" alt="preview" data-astro-cid-fmmaxvi5> <div style="flex: 1;" data-astro-cid-fmmaxvi5> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Image URL</label> <input type="text" name="url"${addAttribute(g.url, "value")} required data-astro-cid-fmmaxvi5> </div> <div class="form-group" data-astro-cid-fmmaxvi5> <label data-astro-cid-fmmaxvi5>Alt Text</label> <input type="text" name="alt_text"${addAttribute(g.alt_text, "value")} required data-astro-cid-fmmaxvi5> </div> </div> </div> <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1rem;" data-astro-cid-fmmaxvi5> <div style="display: flex; gap: 1rem; align-items: center;" data-astro-cid-fmmaxvi5> <input type="number" name="order_index"${addAttribute(g.order_index, "value")} style="width: 80px;" data-astro-cid-fmmaxvi5> <button type="submit" class="btn" data-astro-cid-fmmaxvi5>Update</button> </div> <button${addAttribute(`delete-gallery-${g.id}`, "form")} type="submit" class="btn" style="background: #ef4444;" data-astro-cid-fmmaxvi5>Delete</button> </div> </form>`)} ${gallery?.map((g) => renderTemplate`<form${addAttribute(`delete-gallery-${g.id}`, "id")} method="POST" style="display:none;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="delete_gallery" data-astro-cid-fmmaxvi5> <input type="hidden" name="gallery_id"${addAttribute(g.id, "value")} data-astro-cid-fmmaxvi5> </form>`)} </div>`} ${currentTab === "links" && renderTemplate`<div data-astro-cid-fmmaxvi5> <h3 data-astro-cid-fmmaxvi5>Outbound Internal Links</h3> <table data-astro-cid-fmmaxvi5> <thead data-astro-cid-fmmaxvi5> <tr data-astro-cid-fmmaxvi5> <th data-astro-cid-fmmaxvi5>Target Path</th> <th data-astro-cid-fmmaxvi5>Anchor Text</th> <th data-astro-cid-fmmaxvi5>Target Status</th> </tr> </thead> <tbody data-astro-cid-fmmaxvi5> ${internalLinks?.map((link) => renderTemplate`<tr data-astro-cid-fmmaxvi5> <td style="font-family: monospace;" data-astro-cid-fmmaxvi5>${link.target_page?.path}</td> <td data-astro-cid-fmmaxvi5>${link.anchor_text}</td> <td data-astro-cid-fmmaxvi5> <span${addAttribute(`badge ${link.target_page?.status === "published" ? "published" : "draft"}`, "class")} data-astro-cid-fmmaxvi5> ${link.target_page?.status} </span> </td> </tr>`)} ${(!internalLinks || internalLinks.length === 0) && renderTemplate`<tr data-astro-cid-fmmaxvi5><td colspan="3" data-astro-cid-fmmaxvi5>No internal links defined.</td></tr>`} </tbody> </table> </div>`} ${currentTab === "publish" && renderTemplate`<div data-astro-cid-fmmaxvi5> <h3 data-astro-cid-fmmaxvi5>Publish Readiness</h3> <p data-astro-cid-fmmaxvi5>Current Status: <strong data-astro-cid-fmmaxvi5>${page.status}</strong> | Index: <strong data-astro-cid-fmmaxvi5>${page.index_status}</strong> | Sitemap: <strong data-astro-cid-fmmaxvi5>${page.include_in_sitemap ? "Yes" : "No"}</strong></p> ${blockers.length === 0 ? renderTemplate`<div style="background: #f0fdf4; color: #166534; padding: 1rem; border-radius: 8px; border: 1px solid #bbf7d0; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5>
✅ Pagina este complet validă și gata de publicare!
</div>` : renderTemplate`<div style="background: #fef2f2; color: #991b1b; padding: 1rem; border-radius: 8px; border: 1px solid #fecaca; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5> <strong style="display: block; margin-bottom: 0.5rem;" data-astro-cid-fmmaxvi5>❌ Publicare blocată. Rezolvă următoarele erori:</strong> <ul style="margin: 0; padding-left: 1.5rem;" data-astro-cid-fmmaxvi5> ${blockers.map((b) => renderTemplate`<li data-astro-cid-fmmaxvi5>${b}</li>`)} </ul> </div>`} <div style="margin-top: 2rem; padding: 1.5rem; background: #fffbeb; border: 1px solid #fde68a; border-radius: 8px;" data-astro-cid-fmmaxvi5> <h4 style="margin-top: 0; color: #b45309; margin-bottom: 1rem;" data-astro-cid-fmmaxvi5>⚠️ Reguli Operaționale Content Entry</h4> <p style="margin-top: 0; margin-bottom: 1.5rem; font-weight: 500; color: #92400e;" data-astro-cid-fmmaxvi5>
Nu publicați. Doar salvați.<br data-astro-cid-fmmaxvi5> <span style="font-weight: normal; font-size: 0.9em; color: #b45309;" data-astro-cid-fmmaxvi5>Sistemul de publicare este dezactivat pentru protecție în faza "Batch 1".</span> </p> <form method="POST" style="display: inline;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="publish_page" data-astro-cid-fmmaxvi5> <button class="btn" style="background: #9ca3af; cursor: not-allowed; opacity: 0.7;" disabled title="Publish is disabled for Owner during content entry" data-astro-cid-fmmaxvi5> ${page.status === "published" ? "Re-run Publish Validation" : "Publish Page (Disabled)"} </button> </form> <form method="POST" style="display: none; margin-left: 1rem;" data-astro-cid-fmmaxvi5> <input type="hidden" name="action" value="unpublish_page" data-astro-cid-fmmaxvi5> <button class="btn" style="background: #fbbf24; color: black;" data-astro-cid-fmmaxvi5>Unpublish / Noindex</button> </form> </div> </div>`} </div> ` })}`;
}, "/opt/kassia-site/src/pages/admin/pages/[id].astro", void 0);

const $$file = "/opt/kassia-site/src/pages/admin/pages/[id].astro";
const $$url = "/admin/pages/[id]";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$id,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
