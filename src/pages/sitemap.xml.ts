import { supabase } from '../lib/supabase';
import {
  SITE_ORIGIN,
  isSitemapEligiblePath,
  normalizeLastmod,
  normalizePriority,
  normalizeRequestPath,
  xmlEscape
} from '../lib/kassia-routing.mjs';

const STATIC_PAGES = [
  { path: '/', priority: 1.0 },
  { path: '/blog/', priority: 0.6 },
  { path: '/ursitoare-botez-bucuresti/', priority: 0.8 },
  { path: '/mascote-petreceri-copii-bucuresti/', priority: 0.8 },
  { path: '/decoruri-baloane-bucuresti/', priority: 0.8 }
];

export async function GET() {
  const { data: pages, error } = await supabase
    .from('kassia_pages')
    .select('path,updated_at,priority')
    .eq('status', 'published')
    .eq('index_status', 'index')
    .eq('include_in_sitemap', true);

  if (error || !pages) {
    console.error('KASSIA_SITEMAP_QUERY_FAILED', { code: error?.code || 'NO_DATA' });
    return new Response('Sitemap temporarily unavailable', {
      status: 503,
      headers: {
        'Content-Type': 'text/plain; charset=utf-8',
        'Cache-Control': 'no-store, max-age=0',
        'Retry-After': '60'
      }
    });
  }

  const entries = new Map();

  for (const entry of pages) {
    const path = normalizeRequestPath(entry.path);
    if (!path || !isSitemapEligiblePath(path)) continue;

    entries.set(path, {
      path,
      lastmod: normalizeLastmod(entry.updated_at),
      priority: normalizePriority(entry.priority)
    });
  }

  for (const entry of STATIC_PAGES) {
    const path = normalizeRequestPath(entry.path);
    if (!path || entries.has(path)) continue;
    entries.set(path, {
      path,
      lastmod: null,
      priority: normalizePriority(entry.priority)
    });
  }

  const urls = [...entries.values()]
    .sort((a, b) => a.path.localeCompare(b.path, 'ro'))
    .map((entry) => {
      const lastmod = entry.lastmod ? `\n    <lastmod>${xmlEscape(entry.lastmod)}</lastmod>` : '';
      return `  <url>\n    <loc>${xmlEscape(`${SITE_ORIGIN}${entry.path}`)}</loc>${lastmod}\n    <priority>${entry.priority}</priority>\n  </url>`;
    })
    .join('\n');

  const sitemapXml = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls}\n</urlset>\n`;

  return new Response(sitemapXml, {
    headers: {
      'Content-Type': 'application/xml; charset=utf-8',
      'Cache-Control': 'public, max-age=300, s-maxage=300, stale-while-revalidate=600'
    }
  });
}
