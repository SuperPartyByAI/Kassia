import { supabase } from '../lib/supabase';

export async function GET() {
  const siteUrl = import.meta.env.PUBLIC_SITE_URL || 'https://www.kassia.ro';
  
  const { data: pages, error } = await supabase.from('kassia_pages')
    .select('path, updated_at, priority')
    .eq('status', 'published')
    .eq('index_status', 'index')
    .eq('include_in_sitemap', true);

  if (error || !pages) {
    return new Response('Error generating sitemap', { status: 500 });
  }

  const sitemapXml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  ${pages.map(entry => `
  <url>
    <loc>${siteUrl}${entry.path}</loc>
    <lastmod>${new Date(entry.updated_at || Date.now()).toISOString()}</lastmod>
    <priority>${entry.priority}</priority>
  </url>
  `).join('')}
</urlset>`;

  return new Response(sitemapXml, {
    headers: {
      'Content-Type': 'application/xml',
      'Cache-Control': 'public, max-age=3600'
    }
  });
}
