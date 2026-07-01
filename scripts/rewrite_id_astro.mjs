import fs from 'fs';

const content = `---
import AdminLayout from '../../../layouts/AdminLayout.astro';
import { supabaseAdmin as supabase } from '../../../lib/supabaseAdmin';

const { id } = Astro.params;
const currentTab = Astro.url.searchParams.get('tab') || 'seo';

let message = '';
let isError = false;

// 1. Fetch current data
let { data: page } = await supabase.from('kassia_pages').select('*').eq('id', id).single();
if (!page) {
  return new Response('Page not found', { status: 404 });
}

let { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', id).order('order_index');
let { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', id).order('order_index');
let { data: gallery } = await supabase.from('kassia_gallery_items').select('*').eq('page_id', id).order('order_index');
let { data: internalLinks } = await supabase.from('kassia_internal_links').select(\`
  anchor_text, target_page:kassia_pages!target_page_id(path, status)
\`).eq('source_page_id', id);

// Ensure sections content is an object
sections = sections?.map(s => ({...s, content: typeof s.content === 'string' ? JSON.parse(s.content) : (s.content || {}) })) || [];

function getPublishBlockers(p, s, f, g, il) {
  const activeSections = s.filter(sec => sec.content?.is_active);
  const hasEmptySection = activeSections.some(sec => !sec.content?.body || sec.content.body.trim() === '');
  const hasInvalidFaq = f.some(faq => !faq.question || !faq.answer || faq.question.startsWith('Draft FAQ') || faq.answer === 'Placeholder');
  const hasEmptyMedia = g.some(gal => !gal.url || gal.url.trim() === '');
  const isCommercial = ['service_pillar', 'service', 'event', 'location', 'satellite'].includes(p.page_type);

  let sectionCountRule = activeSections.length >= 5;
  if (p.page_type === 'support') {
    sectionCountRule = activeSections.length >= 3;
  } else if (p.page_type === 'guide' || p.page_type === 'blog') {
    const requiredKeys = ['hero', 'intro', 'main_answer', 'faq', 'final_cta'];
    const hasAllKeys = requiredKeys.every(k => activeSections.some(sec => sec.section_type === k));
    sectionCountRule = hasAllKeys;
  }

  const hasContactLink = il.some(l => l.target_page?.path === '/contact/');
  const hasInvalidCta = activeSections.some(sec => sec.content?.cta_text && (!sec.content?.cta_url || sec.content.cta_url.trim() === ''));
  const hasMissingTarget = il.some(l => !l.target_page);

  const checks = {
    h1: !!p.h1?.trim(),
    meta_title: !!p.meta_title?.trim(),
    meta_description: !!p.meta_description?.trim(),
    sections: sectionCountRule,
    valid_content: !hasEmptySection,
    valid_faq: !hasInvalidFaq && (!isCommercial || f.length > 0),
    valid_media: !hasEmptyMedia && (!isCommercial || g.length > 0),
    contact_link: !isCommercial || hasContactLink,
    valid_cta: !hasInvalidCta,
    valid_links: !hasMissingTarget
  };

  const blockers = [];
  if (!checks.h1) blockers.push('Lipsește H1');
  if (!checks.meta_title) blockers.push('Lipsește Meta Title');
  if (!checks.meta_description) blockers.push('Lipsește Meta Description');
  if (!checks.sections) blockers.push(\`Regulă secțiuni eșuată (\${p.page_type})\`);
  if (!checks.valid_content) blockers.push('Există secțiuni active cu body/content gol');
  if (!checks.valid_faq) blockers.push('FAQ conține Placeholder / Draft FAQ sau e gol');
  if (!checks.valid_media) blockers.push('Imagini goale sau lipsă imagini pentru pagină comercială');
  if (!checks.contact_link) blockers.push('Lipsă link intern către /contact/');
  if (!checks.valid_cta) blockers.push('Există CTA invalid (fără URL)');
  if (!checks.valid_links) blockers.push('Există linkuri interne către targeturi șterse');
  return blockers;
}

let blockers = getPublishBlockers(page, sections, faqs, gallery, internalLinks);
let canPublish = blockers.length === 0;

// Handle form submissions
if (Astro.request.method === 'POST') {
  try {
    const formData = await Astro.request.formData();
    const action = formData.get('action');

    if (action === 'save_seo') {
      const { error } = await supabase.from('kassia_pages').update({
        title: formData.get('title'),
        h1: formData.get('h1'),
        meta_title: formData.get('meta_title'),
        meta_description: formData.get('meta_description'),
        canonical_url: formData.get('canonical_url') || null,
        priority: parseFloat(formData.get('priority') as string || '0.5')
      }).eq('id', id);
      if (error) throw error;
      message = 'SEO settings saved successfully';
    } 
    else if (action === 'save_section') {
      const sectionId = formData.get('section_id');
      const { error } = await supabase.from('kassia_page_sections').update({
        heading: formData.get('heading') || null,
        content: {
          subheading: formData.get('subheading') || null,
          body: formData.get('body') || null,
          cta_text: formData.get('cta_text') || null,
          cta_url: formData.get('cta_url') || null,
          is_active: formData.get('is_active') === 'true'
        },
        order_index: parseInt(formData.get('order_index') as string || '0')
      }).eq('id', sectionId);
      if (error) throw error;
      message = 'Section saved successfully';
    }
    else if (action === 'add_faq' || action === 'edit_faq') {
      const faqId = formData.get('faq_id');
      const faqData = {
        page_id: id,
        question: formData.get('question'),
        answer: formData.get('answer'),
        order_index: parseInt(formData.get('order_index') as string || '0')
      };
      // Note: schema live for kassia_faqs may not have include_in_schema column, we'll keep it basic
      if (action === 'edit_faq') {
        const { error } = await supabase.from('kassia_faqs').update(faqData).eq('id', faqId);
        if (error) throw error;
      } else {
        const { error } = await supabase.from('kassia_faqs').insert(faqData);
        if (error) throw error;
      }
      message = 'FAQ saved successfully';
    }
    else if (action === 'delete_faq') {
      const { error } = await supabase.from('kassia_faqs').delete().eq('id', formData.get('faq_id'));
      if (error) throw error;
      message = 'FAQ deleted successfully';
    }
    else if (action === 'add_gallery' || action === 'edit_gallery') {
      const galleryId = formData.get('gallery_id');
      const altText = formData.get('alt_text');
      if (!altText) throw new Error('alt_text is required');
      
      const galleryData = {
        page_id: id,
        url: formData.get('url'),
        alt_text: altText,
        order_index: parseInt(formData.get('order_index') as string || '0')
      };
      
      if (action === 'edit_gallery') {
        const { error } = await supabase.from('kassia_gallery_items').update(galleryData).eq('id', galleryId);
        if (error) throw error;
      } else {
        const { error } = await supabase.from('kassia_gallery_items').insert(galleryData);
        if (error) throw error;
      }
      message = 'Gallery item saved successfully';
    }
    else if (action === 'delete_gallery') {
      const { error } = await supabase.from('kassia_gallery_items').delete().eq('id', formData.get('gallery_id'));
      if (error) throw error;
      message = 'Gallery item deleted successfully';
    }
    else if (action === 'publish_page') {
      if (!canPublish) throw new Error(\`Publish blocked: \${blockers.join(', ')}\`);
      const { error } = await supabase.from('kassia_pages').update({ 
        status: 'published', 
        index_status: 'index', 
        include_in_sitemap: true, 
        published_at: new Date().toISOString() 
      }).eq('id', id);
      if (error) throw error;
      message = 'Page published successfully!';
    }
    else if (action === 'unpublish_page') {
      const { error } = await supabase.from('kassia_pages').update({ 
        status: 'draft', 
        index_status: 'noindex', 
        include_in_sitemap: false 
      }).eq('id', id);
      if (error) throw error;
      message = 'Page unpublished successfully.';
    }

    // Refetch data after mutation
    const pRes = await supabase.from('kassia_pages').select('*').eq('id', id).single();
    page = pRes.data || page;
    const sRes = await supabase.from('kassia_page_sections').select('*').eq('page_id', id).order('order_index');
    sections = sRes.data?.map(s => ({...s, content: typeof s.content === 'string' ? JSON.parse(s.content) : (s.content || {}) })) || [];
    const fRes = await supabase.from('kassia_faqs').select('*').eq('page_id', id).order('order_index');
    faqs = fRes.data || [];
    const gRes = await supabase.from('kassia_gallery_items').select('*').eq('page_id', id).order('order_index');
    gallery = gRes.data || [];
    const ilRes = await supabase.from('kassia_internal_links').select(\`anchor_text, target_page:kassia_pages!target_page_id(path, status)\`).eq('source_page_id', id);
    internalLinks = ilRes.data || [];

    blockers = getPublishBlockers(page, sections, faqs, gallery, internalLinks);
    canPublish = blockers.length === 0;

  } catch (err: any) {
    message = err.message || 'An error occurred';
    isError = true;
  }
}

const tabs = [
  { id: 'seo', label: 'SEO' },
  { id: 'sections', label: 'Sections' },
  { id: 'faq', label: 'FAQ' },
  { id: 'gallery', label: 'Gallery' },
  { id: 'links', label: 'Internal Links' },
  { id: 'publish', label: 'Publish Guard' }
];

---

<AdminLayout title={\`Edit: \${page.path}\`}>
  
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <div>
      <h1 style="margin-bottom: 0.5rem;">Edit Page</h1>
      <p style="margin: 0; font-family: monospace; color: #64748b;">{page.path}</p>
    </div>
    
    <div style="display: flex; gap: 1rem; align-items: center;">
      <div>
        Status: <span class={\`badge \${page.status === 'published' ? 'published' : 'draft'}\`}>{page.status}</span>
        Index: <span class="badge">{page.index_status}</span>
        Sitemap: <span class="badge">{page.include_in_sitemap ? 'Yes' : 'No'}</span>
      </div>
      {page.status === 'published' ? (
        <a href={page.path} target="_blank" class="btn" style="background: #3b82f6;">Preview</a>
      ) : (
        <span style="font-family: monospace; font-size: 0.9em;">{page.path}</span>
      )}
    </div>
  </div>

  {message && (
    <div style={\`padding: 1rem; margin-bottom: 1rem; border-radius: 4px; \${isError ? 'background: #fef2f2; color: #991b1b; border: 1px solid #fecaca;' : 'background: #f0fdf4; color: #166534; border: 1px solid #bbf7d0;'}\`}>
      {message}
    </div>
  )}

  {page.status === 'draft' && (
    <div class="warning-box">
      <strong>Note:</strong> This page is in DRAFT status. Public preview returns 404.
    </div>
  )}

  <div class="tabs">
    {tabs.map(tab => (
      <a href={\`?tab=\${tab.id}\`} class={\`tab \${currentTab === tab.id ? 'active' : ''}\`}>{tab.label}</a>
    ))}
  </div>

  <div class="card">
    {currentTab === 'seo' && (
      <form method="POST">
        <input type="hidden" name="action" value="save_seo" />
        <div class="form-group">
          <label>Title</label>
          <input type="text" name="title" value={page.title} />
        </div>
        <div class="form-group">
          <label>H1</label>
          <input type="text" name="h1" value={page.h1 || ''} />
        </div>
        <div class="form-group">
          <label>Meta Title (max 100 chars)</label>
          <input type="text" name="meta_title" value={page.meta_title || ''} maxlength="100" />
        </div>
        <div class="form-group">
          <label>Meta Description (max 255 chars)</label>
          <textarea name="meta_description" maxlength="255">{page.meta_description || ''}</textarea>
        </div>
        <div class="form-group">
          <label>Canonical URL (Optional, leave blank for auto)</label>
          <input type="text" name="canonical_url" value={page.canonical_url || ''} />
        </div>
        <div class="form-group">
          <label>Priority (0.0 to 1.0)</label>
          <input type="number" step="0.1" name="priority" value={page.priority} />
        </div>
        <button type="submit" class="btn">Save SEO Settings</button>
      </form>
    )}

    {currentTab === 'sections' && (
      <div>
        {sections?.map(section => (
          <form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;">
            <input type="hidden" name="action" value="save_section" />
            <input type="hidden" name="section_id" value={section.id} />
            <div style="display: flex; justify-content: space-between; margin-bottom: 1rem;">
              <h3 style="margin: 0; text-transform: capitalize;">{section.section_type.replace('_', ' ')}</h3>
              <div style="display: flex; gap: 1rem; align-items: center;">
                <label style="display: flex; align-items: center; gap: 0.5rem; font-weight: normal; margin: 0;">
                  <input type="checkbox" name="is_active" value="true" checked={section.content?.is_active} />
                  Active
                </label>
                <input type="number" name="order_index" value={section.order_index} style="width: 60px; padding: 0.25rem;" />
              </div>
            </div>
            
            <div class="form-group">
              <label>Heading</label>
              <input type="text" name="heading" value={section.heading || ''} />
            </div>
            <div class="form-group">
              <label>Subheading</label>
              <input type="text" name="subheading" value={section.content?.subheading || ''} />
            </div>
            <div class="form-group">
              <label>Body (HTML allowed)</label>
              <textarea name="body">{section.content?.body || ''}</textarea>
            </div>
            <div style="display: flex; gap: 1rem;">
              <div class="form-group" style="flex: 1;">
                <label>CTA Text</label>
                <input type="text" name="cta_text" value={section.content?.cta_text || ''} />
              </div>
              <div class="form-group" style="flex: 1;">
                <label>CTA URL</label>
                <input type="text" name="cta_url" value={section.content?.cta_url || ''} />
              </div>
            </div>
            <button type="submit" class="btn">Save Section</button>
          </form>
        ))}
      </div>
    )}

    {currentTab === 'faq' && (
      <div>
        <form method="POST" style="margin-bottom: 2rem; padding-bottom: 2rem; border-bottom: 2px solid #e2e8f0;">
          <h3>Add New FAQ</h3>
          <input type="hidden" name="action" value="add_faq" />
          <div class="form-group">
            <label>Question</label>
            <input type="text" name="question" required />
          </div>
          <div class="form-group">
            <label>Answer</label>
            <textarea name="answer" required></textarea>
          </div>
          <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 1rem;">
             <div class="form-group" style="margin:0;">
              <label>Order Index</label>
              <input type="number" name="order_index" value="0" style="width: 80px;" />
            </div>
          </div>
          <button type="submit" class="btn">Add FAQ</button>
        </form>

        {faqs?.map(faq => (
          <form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;">
            <input type="hidden" name="action" value="edit_faq" />
            <input type="hidden" name="faq_id" value={faq.id} />
            
            <div class="form-group">
              <label>Question</label>
              <input type="text" name="question" value={faq.question} required />
            </div>
            <div class="form-group">
              <label>Answer</label>
              <textarea name="answer" required>{faq.answer}</textarea>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <div style="display: flex; gap: 1rem; align-items: center;">
                 <input type="number" name="order_index" value={faq.order_index} style="width: 80px;" />
                <button type="submit" class="btn">Update</button>
              </div>
              <button form={\`delete-faq-\${faq.id}\`} class="btn" style="background: #ef4444;">Delete</button>
            </div>
          </form>
        ))}
        {faqs?.map(faq => (
          <form id={\`delete-faq-\${faq.id}\`} method="POST" style="display:none;">
            <input type="hidden" name="action" value="delete_faq" />
            <input type="hidden" name="faq_id" value={faq.id} />
          </form>
        ))}
      </div>
    )}

    {currentTab === 'gallery' && (
      <div>
        <form method="POST" style="margin-bottom: 2rem; padding-bottom: 2rem; border-bottom: 2px solid #e2e8f0;">
          <h3>Add Image</h3>
          <input type="hidden" name="action" value="add_gallery" />
          <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="url" required />
          </div>
          <div class="form-group">
            <label>Alt Text</label>
            <input type="text" name="alt_text" required />
          </div>
          <div style="display: flex; gap: 1rem; align-items: center; margin-bottom: 1rem;">
             <div class="form-group" style="margin:0;">
              <label>Order Index</label>
              <input type="number" name="order_index" value="0" style="width: 80px;" />
            </div>
          </div>
          <button type="submit" class="btn">Add Image</button>
        </form>

        {gallery?.map(g => (
          <form method="POST" style="border: 1px solid #e2e8f0; padding: 1rem; margin-bottom: 1rem; border-radius: 8px;">
            <input type="hidden" name="action" value="edit_gallery" />
            <input type="hidden" name="gallery_id" value={g.id} />
            
            <div style="display: flex; gap: 1rem;">
               <img src={g.url} style="width: 100px; height: 100px; object-fit: cover; border-radius: 4px;" alt="preview"/>
               <div style="flex: 1;">
                 <div class="form-group">
                    <label>Image URL</label>
                    <input type="text" name="url" value={g.url} required />
                  </div>
                  <div class="form-group">
                    <label>Alt Text</label>
                    <input type="text" name="alt_text" value={g.alt_text} required />
                  </div>
               </div>
            </div>
           
            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1rem;">
              <div style="display: flex; gap: 1rem; align-items: center;">
                 <input type="number" name="order_index" value={g.order_index} style="width: 80px;" />
                <button type="submit" class="btn">Update</button>
              </div>
              <button form={\`delete-gallery-\${g.id}\`} type="submit" class="btn" style="background: #ef4444;">Delete</button>
            </div>
          </form>
        ))}
         {gallery?.map(g => (
          <form id={\`delete-gallery-\${g.id}\`} method="POST" style="display:none;">
            <input type="hidden" name="action" value="delete_gallery" />
            <input type="hidden" name="gallery_id" value={g.id} />
          </form>
        ))}
      </div>
    )}

    {currentTab === 'links' && (
      <div>
        <h3>Outbound Internal Links</h3>
        <table>
          <thead>
            <tr>
              <th>Target Path</th>
              <th>Anchor Text</th>
              <th>Target Status</th>
            </tr>
          </thead>
          <tbody>
            {internalLinks?.map(link => (
               <tr>
                <td style="font-family: monospace;">{link.target_page?.path}</td>
                <td>{link.anchor_text}</td>
                <td>
                   <span class={\`badge \${link.target_page?.status === 'published' ? 'published' : 'draft'}\`}>
                    {link.target_page?.status}
                  </span>
                </td>
              </tr>
            ))}
            {(!internalLinks || internalLinks.length === 0) && (
              <tr><td colspan="3">No internal links defined.</td></tr>
            )}
          </tbody>
        </table>
      </div>
    )}

    {currentTab === 'publish' && (
      <div>
        <h3>Publish Readiness</h3>
        <p>Current Status: <strong>{page.status}</strong> | Index: <strong>{page.index_status}</strong> | Sitemap: <strong>{page.include_in_sitemap ? 'Yes' : 'No'}</strong></p>
        {blockers.length === 0 ? (
          <div style="background: #f0fdf4; color: #166534; padding: 1rem; border-radius: 8px; border: 1px solid #bbf7d0; margin-bottom: 1rem;">
            ✅ Pagina este complet validă și gata de publicare!
          </div>
        ) : (
          <div style="background: #fef2f2; color: #991b1b; padding: 1rem; border-radius: 8px; border: 1px solid #fecaca; margin-bottom: 1rem;">
            <strong style="display: block; margin-bottom: 0.5rem;">❌ Publicare blocată. Rezolvă următoarele erori:</strong>
            <ul style="margin: 0; padding-left: 1.5rem;">
              {blockers.map(b => <li>{b}</li>)}
            </ul>
          </div>
        )}

        <div style="margin-top: 2rem;">
          <form method="POST" style="display: inline;">
            <input type="hidden" name="action" value="publish_page" />
            <button class="btn" style="background: #16a34a;" disabled={!canPublish}>
              {page.status === 'published' ? 'Re-run Publish Validation' : 'Publish Page'}
            </button>
          </form>

          <form method="POST" style="display: inline; margin-left: 1rem;">
            <input type="hidden" name="action" value="unpublish_page" />
            <button class="btn" style="background: #fbbf24; color: black;">Unpublish / Noindex</button>
          </form>
        </div>
      </div>
    )}
  </div>
</AdminLayout>

<style>
  .tabs {
    display: flex;
    border-bottom: 1px solid var(--color-border);
    margin-bottom: 1.5rem;
  }
  .tab {
    padding: 0.75rem 1.5rem;
    text-decoration: none;
    color: var(--color-text);
    border-bottom: 2px solid transparent;
  }
  .tab:hover {
    background: #f1f5f9;
  }
  .tab.active {
    border-bottom-color: var(--color-primary);
    color: var(--color-primary);
    font-weight: 600;
  }
</style>
`;

fs.writeFileSync('src/pages/admin/pages/[id].astro', content);
