export async function GET() {
  const siteUrl = import.meta.env.PUBLIC_SITE_URL || 'https://www.kassia.ro';

  const robotsTxt = `User-agent: *
Allow: /
Sitemap: ${siteUrl}/sitemap.xml
`;

  return new Response(robotsTxt, {
    headers: {
      'Content-Type': 'text/plain',
      'Cache-Control': 'public, max-age=3600'
    }
  });
}
