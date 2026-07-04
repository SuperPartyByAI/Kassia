import fs from 'fs';
const astroFile = '/Users/universparty/wa-web-launcher/kassia-site/src/pages/[...slug].astro';
let astroContent = fs.readFileSync(astroFile, 'utf8');

if (!astroContent.includes('name": index === pathSegments.length - 1')) {
  astroContent = astroContent.replace(
    /"name": segment\.replace\(\/-\/g, ' '\)/g,
    `"name": index === pathSegments.length - 1 ? (page.h1 || page.title || segment.replace(/-/g, ' ')) : segment.replace(/-/g, ' ')`
  );
  fs.writeFileSync(astroFile, astroContent);
  console.log('Fixed BreadcrumbList in [...slug].astro');
} else {
  console.log('Already fixed BreadcrumbList');
}
