import fs from 'fs';

const files = [
  '/Users/universparty/wa-web-launcher/kassia-site/src/components/CustomAnimatoriPage.astro',
  '/Users/universparty/wa-web-launcher/kassia-site/src/components/Footer.astro',
  '/Users/universparty/wa-web-launcher/kassia-site/src/components/Header.astro',
  '/Users/universparty/wa-web-launcher/kassia-site/src/components/PricingProgramCard.astro'
];

files.forEach(f => {
  let content = fs.readFileSync(f, 'utf-8');
  content = content.replace(/0768098268/g, '0763795919');
  fs.writeFileSync(f, content);
});

console.log("Replaced phone number.");
