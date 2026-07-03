const sleep = ms => new Promise(r => setTimeout(r, ms));

async function run() {
    const nativeSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "value").set;
    const inputs = Array.from(document.querySelectorAll("input[type=text]"));
    
    const opens = inputs.filter(el => el.getAttribute("aria-label") === "Deschide la");
    const closes = inputs.filter(el => el.getAttribute("aria-label") === "Închide la");
    
    for(let i=0; i<7; i++) {
        if(opens[i]) {
            opens[i].focus();
            nativeSetter.call(opens[i], "09:00");
            opens[i].dispatchEvent(new Event("input", { bubbles: true }));
            opens[i].dispatchEvent(new Event("change", { bubbles: true }));
            opens[i].blur();
        }
        if(closes[i]) {
            closes[i].focus();
            nativeSetter.call(closes[i], "20:00");
            closes[i].dispatchEvent(new Event("input", { bubbles: true }));
            closes[i].dispatchEvent(new Event("change", { bubbles: true }));
            closes[i].blur();
        }
    }
    
    await sleep(500);

    const btn = Array.from(document.querySelectorAll("button")).find(b => b.innerText.includes("Înainte"));
    if(btn) btn.click();
    
    return "DONE";
}

run().then(res => document.title = res);
