const SITEMAP_URL = 'https://www.kassia.ro/sitemap.xml';

async function checkSitemap() {
  console.log(`Fetching sitemap from ${SITEMAP_URL}...`);
  try {
    const res = await fetch(SITEMAP_URL);
    if (!res.ok) {
      console.log(`Failed to fetch sitemap: ${res.status}`);
      return;
    }

    const xml = await res.text();
    console.log(`Sitemap size: ${xml.length} characters.`);

    // Quick extraction using regex to avoid xml2js dependency issues if not installed
    const urls = [];
    const locRegex = /<loc>([\s\S]*?)<\/loc>/gi;
    let match;
    while ((match = locRegex.exec(xml)) !== null) {
      urls.push(match[1].trim());
    }

    console.log(`Total URLs in sitemap: ${urls.length}`);

    // Check specific URLs
    const targets = [
      'https://www.kassia.ro/animatori-petreceri-copii/',
      'https://www.kassia.ro/animatori-copii/',
      'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/',
      'https://www.kassia.ro/animatori-petreceri-copii-sector-1/'
    ];

    targets.forEach(t => {
      const found = urls.includes(t);
      console.log(`- ${t}: ${found ? 'FOUND' : 'NOT FOUND'}`);
    });

    // Check if other animatori pages exist in sitemap
    const animatoriUrls = urls.filter(u => u.includes('animatori') || u.includes('copii'));
    console.log(`\nAnimatori / copii URLs in sitemap: ${animatoriUrls.length} total.`);
    
    // Check if there are other pages matching '/animatori-petreceri-copii-...' in the sitemap
    const sector1Found = urls.includes('https://www.kassia.ro/animatori-petreceri-copii-sector-1/');
    const bucurestiFound = urls.includes('https://www.kassia.ro/animatori-petreceri-copii-bucuresti/');
    
    console.log(`Sector 1 in sitemap: ${sector1Found ? 'Da' : 'Nu'}`);
    console.log(`București in sitemap: ${bucurestiFound ? 'Da' : 'Nu'}`);

  } catch (e) {
    console.error("Error checking sitemap:", e.message);
  }
}

checkSitemap().catch(console.error);
