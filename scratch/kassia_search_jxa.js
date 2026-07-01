var chrome = Application('Google Chrome');
var win = chrome.windows[0];
var tab = win.activeTab;

var code = `
(function() {
    var results = {};
    
    var divs = Array.from(document.querySelectorAll('div.g'));
    var organic = [];
    divs.forEach(div => {
        var a = div.querySelector('a');
        var h3 = div.querySelector('h3');
        if (a && h3 && a.href && !a.href.includes('google.') && !a.href.includes('/search?')) {
            var h3Text = h3.innerText.trim();
            if (h3Text === "Hartă" || h3Text === "Locații" || h3Text === "Imagini" || h3Text === "") {
                return;
            }
            if (!organic.find(r => r.url === a.href)) {
                organic.push({
                    title: h3Text,
                    url: a.href
                });
            }
        }
    });
    
    results.organic = organic.slice(0, 10);
    
    var localPack = document.querySelector('.VkpGBb') || document.querySelector('.rllt__link');
    results.hasLocalPack = !!localPack;
    
    return JSON.stringify(results);
})()
`;

var str = tab.execute({ javascript: code });
var scrapeRes = JSON.parse(str);

var screenshotPath = "/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/serp_live_kassia.png";
var app = Application.currentApplication();
app.includeStandardAdditions = true;
app.doShellScript("screencapture " + screenshotPath);

var outData = {
    timestamp: new Date().toISOString(),
    query: "organizare petreceri copii bucurești",
    results: scrapeRes,
    screenshot: screenshotPath
};

var f = "/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/kassia_serp_live.json";
var fileId = app.openForAccess(Path(f), { writePermission: true });
app.setEof(fileId, { to: 0 });
app.write(JSON.stringify(outData, null, 2), { to: fileId });
app.closeAccess(fileId);
