import { s as supabase } from './supabase_m9V3dadf.mjs';
import { j as normalizeRequestPath, f as isSitemapEligiblePath, h as normalizePriority, n as normalizeLastmod, x as xmlEscape, S as SITE_ORIGIN } from './kassia-routing_C02FXj94.mjs';

const STATIC_PAGES = [
  { path: "/", priority: 1 },
  { path: "/blog/", priority: 0.6 },
  { path: "/ursitoare-botez-bucuresti/", priority: 0.8 },
  { path: "/mascote-petreceri-copii-bucuresti/", priority: 0.8 },
  { path: "/decoruri-baloane-bucuresti/", priority: 0.8 }
];
async function GET() {
  const { data: pages, error } = await supabase.from("kassia_pages").select("path,updated_at,priority").eq("status", "published").eq("index_status", "index").eq("include_in_sitemap", true);
  if (error || !pages) {
    console.error("KASSIA_SITEMAP_QUERY_FAILED", { code: error?.code || "NO_DATA" });
    return new Response("Sitemap temporarily unavailable", {
      status: 503,
      headers: {
        "Content-Type": "text/plain; charset=utf-8",
        "Cache-Control": "no-store, max-age=0",
        "Retry-After": "60"
      }
    });
  }
  const entries = /* @__PURE__ */ new Map();
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
  const urls = [...entries.values()].sort((a, b) => a.path.localeCompare(b.path, "ro")).map((entry) => {
    const lastmod = entry.lastmod ? `
    <lastmod>${xmlEscape(entry.lastmod)}</lastmod>` : "";
    return `  <url>
    <loc>${xmlEscape(`${SITE_ORIGIN}${entry.path}`)}</loc>${lastmod}
    <priority>${entry.priority}</priority>
  </url>`;
  }).join("\n");
  const sitemapXml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls}
</urlset>
`;
  return new Response(sitemapXml, {
    headers: {
      "Content-Type": "application/xml; charset=utf-8",
      "Cache-Control": "public, max-age=300, s-maxage=300, stale-while-revalidate=600"
    }
  });
}

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  GET
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
