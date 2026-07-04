const fs = require('fs');
const https = require('https');

https.get('https://www.kassia.ro/sitemap.xml', (res) => {
    let data = '';
    res.on('data', chunk => data += chunk);
    res.on('end', async () => {
        const matches = data.match(/<loc>(.*?)<\/loc>/g);
        if (!matches) {
            console.log('No URLs found in sitemap');
            return;
        }
        const urls = matches.map(m => m.replace(/<\/?loc>/g, ''));
        console.log(`Found ${urls.length} URLs in sitemap. Checking...`);
        
        const fetchCheck = (url) => {
            return new Promise((resolve) => {
                https.request(url, { method: 'HEAD' }, (r) => {
                    resolve({ url, status: r.statusCode });
                }).on('error', () => resolve({ url, status: 0 })).end();
            });
        };

        for (let url of urls) {
            const result = await fetchCheck(url);
            if (result.status >= 400 || result.status === 0) {
                console.log(`BROKEN URL IN SITEMAP: ${result.url} - Status ${result.status}`);
            }
        }
        console.log('Done checking sitemap URLs.');
    });
});
