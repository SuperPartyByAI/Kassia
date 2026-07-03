const sleep = ms => new Promise(r => setTimeout(r, ms));

async function run() {
    // There are 7 days, they might need to be toggled to "Deschis" if not already.
    // However, the text output showed "Deschis", so we just need to set the inputs.
    
    // Find all "Deschide la" and "Închide la" inputs
    const inputs = Array.from(document.querySelectorAll("input"));
    
    const opens = inputs.filter(i => i.getAttribute("aria-label") === "Deschide la" || i.value === "24 de ore");
    const closes = inputs.filter(i => i.getAttribute("aria-label") === "Închide la" || (i.placeholder && i.placeholder.includes("Închide la")));

    for(let i=0; i<opens.length; i++) {
        if (opens[i]) {
            opens[i].value = "09:00";
            opens[i].dispatchEvent(new Event("input", { bubbles: true }));
            opens[i].dispatchEvent(new Event("change", { bubbles: true }));
        }
        if (closes[i]) {
            closes[i].value = "20:00";
            closes[i].dispatchEvent(new Event("input", { bubbles: true }));
            closes[i].dispatchEvent(new Event("change", { bubbles: true }));
        }
    }
    
    await sleep(500);

    const btn = Array.from(document.querySelectorAll("button")).find(b => b.innerText.includes("Înainte"));
    if(btn) btn.click();
    
    return "DONE";
}

run().then(res => document.title = res);
