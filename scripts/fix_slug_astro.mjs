import fs from 'fs';
const file = '/opt/kassia-site/src/pages/[...slug].astro';
let content = fs.readFileSync(file, 'utf8');

// 1. Admin routing fix
if (!content.includes('path.startsWith(\'/admin\')')) {
  content = content.replace(
    'const path = normalizeRequestPath(currentPath);\nif (!path) {',
    'const path = normalizeRequestPath(currentPath);\nif (path && (path.startsWith(\'/admin\') || path.startsWith(\'/administrator\'))) {\n  Astro.response.status = 404;\n  return Astro.rewrite(\'/404\');\n}\nif (!path) {'
  );
}

// 2. Logo fix
content = content.replace(
  '"logo": `${siteUrl}/logo.png`,',
  '"logo": `${siteUrl}/favicon.svg`,'
);

// 3. Breadcrumb fix
if (!content.includes('"name": "Acasă"')) {
  const oldBreadcrumb = `  const itemListElement = pathSegments.map((segment, index) => ({
    "@type": "ListItem",
    "position": index + 1,
    "name": index === pathSegments.length - 1 ? (page.h1 || page.title || segment.replace(/-/g, ' ')) : segment.replace(/-/g, ' '),
    "item": \`\${siteUrl}/\${pathSegments.slice(0, index + 1).join('/')}/\`
  }));`;

  const newBreadcrumb = `  const itemListElement = [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Acasă",
      "item": \`\${siteUrl}/\`
    },
    ...pathSegments.map((segment, index) => ({
      "@type": "ListItem",
      "position": index + 2,
      "name": index === pathSegments.length - 1 ? (page.h1 || page.title || segment.replace(/-/g, ' ')) : segment.replace(/-/g, ' '),
      "item": \`\${siteUrl}/\${pathSegments.slice(0, index + 1).join('/')}/\`
    }))
  ];`;
  
  content = content.replace(oldBreadcrumb, newBreadcrumb);
}

// 4. Visible review count
// In the hero section subtitle, we will inject a small review badge.
if (!content.includes('970 recenzii')) {
  content = content.replace(
    '<div class="hero-subtitle" set:html={heroSec.content.body} />',
    '<div class="hero-subtitle" set:html={heroSec.content.body} />\n                  <div class="hero-reviews" style="margin-top: 1rem; color: #ffca28; font-weight: 500;">\n                    ★ 4.9/5 din 970 recenzii\n                  </div>'
  );
  content = content.replace(
    '{page.meta_description && <p class="hero-subtitle">{page.meta_description}</p>}',
    '{page.meta_description && <p class="hero-subtitle">{page.meta_description}</p>}\n                  <div class="hero-reviews" style="margin-top: 1rem; color: #ffca28; font-weight: 500;">\n                    ★ 4.9/5 din 970 recenzii\n                  </div>'
  );
}

fs.writeFileSync(file, content);
console.log('Fixed [...slug].astro');
