import fetch from 'node-fetch';

const baseUrl = 'https://www.kassia.ro';
const paths = [
    '/catalog-costume/',
    '/preturi-animatori-copii-bucuresti/',
    '/animatori-copii-sector-1/',
    '/animatori-copii-sector-2/',
    '/animatori-copii-sector-3/',
    '/animatori-copii-sector-4/',
    '/animatori-copii-sector-5/',
    '/animatori-copii-sector-6/',
    '/animatori-petreceri-copii-floreasca/',
    '/animatori-copii-voluntari/',
    '/animatori-petreceri-copii-berceni/',
    '/animatori-petreceri-copii-popesti-leordeni/',
    // alternative paths from DB previously seen:
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/animatori-petreceri-copii-sector-3/',
    '/animatori-petreceri-copii-sector-4/',
    '/animatori-petreceri-copii-sector-5/',
    '/animatori-petreceri-copii-sector-6/',
    '/animatori-petreceri-copii-voluntari/'
];

async function check() {
    console.log("Checking URLs for 200 OK...");
    const valid = [];
    for (const path of paths) {
        try {
            const res = await fetch(baseUrl + path);
            if (res.status === 200) {
                valid.push(path);
                console.log(`✅ 200 OK: ${path}`);
            } else {
                console.log(`❌ ${res.status}: ${path}`);
            }
        } catch(e) {
            console.log(`❌ Error: ${path}`);
        }
    }
    console.log("\nVALID PATHS:");
    console.log(JSON.stringify(valid, null, 2));
}

check();
