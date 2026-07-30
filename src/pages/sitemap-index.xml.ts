export async function GET() {
  return new Response('Sitemap index retired. Use /sitemap.xml.', {
    status: 410,
    statusText: 'Gone',
    headers: {
      'Content-Type': 'text/plain; charset=utf-8',
      'Cache-Control': 'public, max-age=3600',
      'X-Robots-Tag': 'noindex, follow'
    }
  });
}
