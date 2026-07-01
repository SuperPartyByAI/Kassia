const sharp = require('sharp');
async function convert() {
  await sharp('hero.png').resize({width: 1200}).webp().toFile('blog-heliu-majorat-hero.webp');
  await sharp('cifre.png').resize({width: 800}).webp().toFile('blog-heliu-majorat-cifre-18.webp');
  await sharp('buchete.png').resize({width: 800}).webp().toFile('blog-heliu-majorat-buchete.webp');
  await sharp('panou.png').resize({width: 800}).webp().toFile('blog-heliu-majorat-panou-foto.webp');
  await sharp('culori.png').resize({width: 800}).webp().toFile('blog-heliu-majorat-culori.webp');
  console.log('Images converted!');
}
convert().catch(console.error);
