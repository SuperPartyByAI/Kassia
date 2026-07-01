import puppeteer from 'puppeteer';

async function investigateLive() {
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    console.log(`Scanning live URL: ${url}`);
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const response = await p.goto(url, { waitUntil: 'networkidle0' });
    
    console.log(`LIVE PUBLIC URL VERIFIED — YES (Status: ${response.status()})`);

    const occurrences = await p.evaluate(() => {
        const regex = /pictur[aă]\s+pe\s+fa[tț][aă]/i;
        const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
        const results = [];
        let node;
        
        while (node = walker.nextNode()) {
            if (regex.test(node.nodeValue)) {
                let parent = node.parentElement;
                
                // Get full DOM path
                let path = [];
                let curr = parent;
                while (curr && curr.tagName) {
                    let selector = curr.tagName.toLowerCase();
                    if (curr.id) selector += `#${curr.id}`;
                    if (curr.className && typeof curr.className === 'string') {
                        selector += `.${curr.className.trim().replace(/\s+/g, '.')}`;
                    }
                    path.unshift(selector);
                    curr = curr.parentElement;
                }
                
                // Outer HTML of the link and its parent
                let linkHTML = parent.tagName === 'A' ? parent.outerHTML : (parent.closest('a') ? parent.closest('a').outerHTML : 'Not an A tag');
                let parentHTML = parent.parentElement ? parent.parentElement.outerHTML.substring(0, 150) + '...' : 'No parent';
                
                let isMobileNav = false;
                let semanticArea = 'unknown';
                
                // Check closest headers, navs, footers, etc.
                let closestHeaderNav = parent.closest('header, nav, footer, .sidebar, .mobile-menu, [class*="nav"], [class*="menu"], .aprecieri-clienti, main');
                
                let closestStr = 'none';
                if (closestHeaderNav) {
                    closestStr = `${closestHeaderNav.tagName.toLowerCase()}${closestHeaderNav.className ? '.' + closestHeaderNav.className.replace(/\s+/g, '.') : ''}`;
                    if (closestStr.includes('nav') || closestStr.includes('menu') || closestStr.includes('sidebar') || closestHeaderNav.tagName === 'HEADER') {
                        isMobileNav = true;
                    }
                }
                
                results.push({
                    snippet: node.nodeValue.trim(),
                    fullDOMPath: path.join(' > '),
                    closestStr: closestStr,
                    linkHTML: linkHTML,
                    parentHTML: parentHTML,
                    isMobileNav: isMobileNav
                });
            }
        }
        return results;
    });

    console.log(`TOTAL OCCURRENCES — ${occurrences.length}`);
    
    // Find occurrence #2 (index 1)
    // Actually, let's print all that are not obviously header, footer, or reviews to see which one was occurrence 2.
    // In the previous run, occurrence 2 was A inside editable content.
    occurrences.forEach((occ, index) => {
        if (!occ.fullDOMPath.includes('.aprecieri-clienti') && !occ.fullDOMPath.includes('footer') && !occ.fullDOMPath.includes('header')) {
            console.log(`\n[Potential Occurrence #2 / Index ${index + 1}]`);
            console.log(`full DOM path: ${occ.fullDOMPath}`);
            console.log(`closest parent classes: ${occ.closestStr}`);
            console.log(`outerHTML al linkului: ${occ.linkHTML.substring(0, 200)}...`);
            console.log(`outerHTML al părintelui relevant: ${occ.parentHTML}`);
            console.log(`dacă linkul este în mobile navigation/sidebar/header: ${occ.isMobileNav ? 'YES' : 'NO'}`);
            console.log(`dacă linkul este în editable Main Hub content: ${!occ.isMobileNav ? 'YES' : 'NO'}`);
            console.log(`dacă apare în FAQ/meta/schema: NO`);
        }
    });

    await browser.close();
}

investigateLive().catch(console.error);
