import fs from 'fs';
import path from 'path';

// Quick script to read image dimensions if possible, or just file sizes
const imgDir = path.join(process.cwd(), 'public', 'images', 'animatori');
const images = [
    "animatori-copii-bucuresti-desfasurare-petrecere.webp",
    "animatori-copii-bucuresti-jocuri-interactive.webp",
    "animatori-copii-bucuresti-mini-disco.webp",
    "animatori-copii-bucuresti-modelaj-baloane.webp",
    "animatori-copii-bucuresti-mascota-generica.webp",
    "animatori-copii-bucuresti-atelier-creativ.webp",
    "animatori-copii-bucuresti-program-animatie.webp",
    "animatori-copii-bucuresti-evenimente.webp"
];

images.forEach(img => {
    const fullPath = path.join(imgDir, img);
    if(fs.existsSync(fullPath)) {
        const stats = fs.statSync(fullPath);
        console.log(`- ${img} | Size: ${Math.round(stats.size/1024)}KB`);
    } else {
        console.log(`- ${img} | NOT FOUND`);
    }
});
