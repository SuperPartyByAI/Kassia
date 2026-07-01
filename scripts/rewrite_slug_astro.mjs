import fs from 'fs';

const content = `---
import { supabase } from '../lib/supabase';
import Layout from '../layouts/Layout.astro';

// This is an SSR page
const rawSlug = Astro.params.slug || '';
const path = rawSlug === '' ? '/' : \`/\${rawSlug}/\`;

if (rawSlug && !Astro.url.pathname.endsWith('/')) {
  return Astro.redirect(\`\${Astro.url.pathname}/\`, 301);
}

// Fetch page data from Supabase
const { data: page, error } = await supabase
  .from('kassia_pages')
  .select('*')
  .eq('path', path)
  .single();

if (error || !page) {
  return new Response(null, {
    status: 404,
    statusText: 'Not found'
  });
}

// 404 for draft pages
if (page.status !== 'published') {
  return new Response(null, {
    status: 404,
    statusText: 'Not found'
  });
}

// Fetch active sections
const { data: rawSections } = await supabase
  .from('kassia_page_sections')
  .select('*')
  .eq('page_id', page.id)
  .order('order_index', { ascending: true });

const sections = rawSections
  ?.map(s => ({ ...s, content: typeof s.content === 'string' ? JSON.parse(s.content) : (s.content || {}) }))
  ?.filter(s => s.content?.is_active);

// Robots meta
const robots = page.index_status === 'index' ? 'index, follow' : 'noindex, follow';

// Fetch published internal links
const { data: internalLinks } = await supabase
  .from('kassia_internal_links')
  .select(\`
    anchor_text,
    target_page:kassia_pages!target_page_id(path, status)
  \`)
  .eq('source_page_id', page.id);

const publishedLinks = internalLinks 
  ? internalLinks.filter(link => link.target_page && link.target_page.status === 'published')
  : [];

// Canonical
const siteUrl = import.meta.env.PUBLIC_SITE_URL || 'https://www.kassia.ro';
const canonical = page.canonical_url || \`\${siteUrl}\${path}\`;

// Fetch FAQs for Schema
const { data: faqs } = await supabase
  .from('kassia_faqs')
  .select('*')
  .eq('page_id', page.id)
  .order('order_index', { ascending: true });

const validFaqs = faqs?.filter(f => f.question && f.answer && !f.question.startsWith('Draft FAQ') && f.answer !== 'Placeholder') || [];

// Fetch Gallery for Schema/Images
const { data: gallery } = await supabase
  .from('kassia_gallery_items')
  .select('*')
  .eq('page_id', page.id)
  .order('order_index', { ascending: true });

const validImages = gallery?.filter(g => g.url && g.url.trim() !== '') || [];

// Generate Schema.org
const schemas = [];

// 1. Organization / LocalBusiness
schemas.push({
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Kassia",
  "url": siteUrl,
  "logo": \`\${siteUrl}/logo.png\`,
  "image": validImages.length > 0 ? validImages[0].url : undefined
});

// 2. Service Schema
if (['service', 'service_pillar', 'event', 'location', 'satellite'].includes(page.page_type)) {
  schemas.push({
    "@context": "https://schema.org",
    "@type": "Service",
    "name": page.h1 || page.title,
    "provider": {
      "@type": "LocalBusiness",
      "name": "Kassia"
    },
    "areaServed": "Ilfov, București"
  });
}

// 3. FAQPage Schema
if (validFaqs.length > 0) {
  schemas.push({
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": validFaqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  });
}

// 4. BreadcrumbList
const pathSegments = path.split('/').filter(Boolean);
if (pathSegments.length > 0) {
  const itemListElement = pathSegments.map((segment, index) => ({
    "@type": "ListItem",
    "position": index + 1,
    "name": segment.replace(/-/g, ' '),
    "item": \`\${siteUrl}/\${pathSegments.slice(0, index + 1).join('/')}/\`
  }));
  
  schemas.push({
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": itemListElement
  });
}


---

<Layout title={page.meta_title} description={page.meta_description} canonical={canonical} robots={robots} schemas={schemas}>
  <div class="cms-page">
    <div class="container">
      {/* Page specific H1 */}
      <h1 class="page-title">{page.h1}</h1>
    </div>
    
    {sections && sections.map((section) => (
      <section class={\`section-\${section.section_type}\`}>
        <div class="container">
          {section.heading && <h2>{section.heading}</h2>}
          {section.content?.subheading && <h3>{section.content.subheading}</h3>}
          {section.content?.body && <div set:html={section.content.body} />}
          {section.content?.cta_text && section.content?.cta_url && (
            <a href={section.content.cta_url} class="btn-primary">{section.content.cta_text}</a>
          )}
        </div>
      </section>
    ))}

    {publishedLinks.length > 0 && (
      <section class="section-related-links">
        <div class="container">
          <h2>Pagini utile</h2>
          <ul class="internal-links-list">
            {publishedLinks.map(link => (
              <li><a href={link.target_page.path}>{link.anchor_text}</a></li>
            ))}
          </ul>
        </div>
      </section>
    )}
  </div>
</Layout>

<style>
  .page-title {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 2rem;
    text-align: center;
    background: linear-gradient(to right, #a855f7, #ec4899);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem;
  }
  section:nth-child(even) {
    background-color: #f1f5f9;
  }
  section:nth-child(odd) {
    background-color: #ffffff;
  }
  .btn-primary {
    display: inline-block;
    padding: 1rem 2rem;
    background-color: #a855f7;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
    margin-top: 1rem;
  }
  .internal-links-list {
    list-style: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
  }
  .internal-links-list a {
    color: #a855f7;
    text-decoration: underline;
  }
</style>
`;

fs.writeFileSync('src/pages/[...slug].astro', content);
