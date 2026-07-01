import * as cheerio from 'cheerio';
import fs from 'fs';

async function run() {
    try {
        const url = `https://www.kassia.ro/animatori-petreceri-copii/?v=${Date.now()}`;
        const res = await fetch(url, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
        const html = await res.text();
        const $ = cheerio.load(html);

        // Remove non-main sections
        $('header').remove();
        $('footer').remove();
        $('.aprecieri-clienti').remove(); // reviews
        $('.site-footer').remove();
        $('.navbar').remove();

        const images = [];
        $('img').each((_, el) => {
            const src = $(el).attr('src') || $(el).attr('data-src');
            const alt = $(el).attr('alt') || '';
            const width = $(el).attr('width') || 'unknown';
            const height = $(el).attr('height') || 'unknown';
            const loading = $(el).attr('loading') || 'auto';
            const section = $(el).closest('section').attr('class') || 'unknown';
            
            // Try to filter out generic icons/logos if possible, but let's grab all
            images.push({ src, alt, width, height, loading, section });
        });

        const paragraphs = $('p').length;
        const textLength = $('body').text().length;

        console.log(JSON.stringify({ images, paragraphs, textLength }, null, 2));

    } catch (err) {
        console.error(err);
    }
}
run();
