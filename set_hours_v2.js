const sleep = ms => new Promise(r => setTimeout(r, ms));

async function run() {
    const evt = new Event("input", { bubbles: true });
    const evt2 = new Event("change", { bubbles: true });
    
    const inputs = Array.from(document.querySelectorAll("input"));
    
    // Some are "Deschide la", some are "Închide la"
    for(let i of inputs) {
        let label = i.getAttribute("aria-label") || i.placeholder || "";
        if (label.includes("Deschide la") || i.value === "24 de ore") {
            i.focus();
            i.value = "09:00";
            i.dispatchEvent(evt);
            i.dispatchEvent(evt2);
            i.blur();
            await sleep(50);
        } else if (label.includes("Închide la")) {
            i.focus();
            i.value = "20:00";
            i.dispatchEvent(evt);
            i.dispatchEvent(evt2);
            i.blur();
            await sleep(50);
        }
    }
    
    await sleep(500);

    const btn = Array.from(document.querySelectorAll("button")).find(b => b.innerText.includes("Înainte"));
    if(btn) btn.click();
    
    return "DONE";
}

run().then(res => document.title = res);
