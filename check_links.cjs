const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'src/components/GlobalServiceSearch.astro');
const content = fs.readFileSync(filePath, 'utf8');

const match = content.match(/const services = (\[[\s\S]*?\]);/);
if (match) {
    const services = eval(match[1]);
    const checkLinks = async () => {
        for (let svc of services) {
            let url = svc.url;
            if (!url.startsWith('http')) url = 'https://www.kassia.ro' + url;
            try {
                const resp = await fetch(url, { method: 'HEAD' });
                if (resp.status >= 400) {
                    console.log('BROKEN URL:', svc.title, url, resp.status);
                }
            } catch (e) {
                console.log('ERROR URL:', svc.title, url, e.message);
            }
        }
        console.log('DONE CHECKING LINKS');
    };
    checkLinks();
}
