import fs from 'fs';
import sharp from 'sharp';
import path from 'path';

const brainDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/';
const publicDir = '/Users/universparty/wa-web-launcher/kassia-site/public/images/animatori/';

const imageMap = [
    { prefix: 'regen_hero_', dest: 'animator-petrecere-copii-bucuresti-hero.webp' },
    { prefix: 'regen_rol_', dest: 'rol-animator-petrecere-copii.webp' },
    { prefix: 'regen_varsta_', dest: 'personaje-animatori-copii-varste.webp' },
    { prefix: 'regen_evenimente_', dest: 'animatori-evenimente-private-copii.webp' },
    { prefix: 'regen_desfasurare_v2_', dest: 'desfasurare-program-animatie-copii.webp' },
    { prefix: 'regen_conexe_', dest: 'servicii-conexe-pictura-fata-baloane.webp' },
    { prefix: 'regen_echipa_', dest: 'echipa-animatori-kassia-events.webp' },
    { prefix: 'regen_2_personaje_', dest: 'pret-program-2-animatori-copii.webp' },
    { prefix: 'regen_picioroange_', dest: 'pret-animatori-picioroange-evenimente.webp' }
];

async function run() {
    const files = fs.readdirSync(brainDir);
    
    for (const mapping of imageMap) {
        // Find the latest generated image with the prefix
        const matchingFiles = files.filter(f => f.startsWith(mapping.prefix) && f.endsWith('.png'));
        if (matchingFiles.length === 0) {
            console.error('Missing generated image for prefix: ' + mapping.prefix);
            continue;
        }
        // sort descending to get the newest
        matchingFiles.sort((a,b) => fs.statSync(path.join(brainDir, b)).mtimeMs - fs.statSync(path.join(brainDir, a)).mtimeMs);
        const sourceFile = matchingFiles[0];
        
        const srcPath = path.join(brainDir, sourceFile);
        const destPath = path.join(publicDir, mapping.dest);
        
        // Convert to WebP and optimize
        await sharp(srcPath)
            .resize({ width: 1200, withoutEnlargement: true }) // max width
            .webp({ quality: 85 })
            .toFile(destPath);
        
        console.log(`Saved ${destPath}`);
    }
}

run();
