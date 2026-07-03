const sleep = ms => new Promise(r => setTimeout(r, ms));

async function run() {
    const desc = "Kassia Events organizează petreceri pentru copii și evenimente private în Sector 1 și București: animatori, mascote, personaje tematice, pictură pe față, modelaj baloane, mini-disco, jocuri interactive, decoruri cu baloane, arcade, panouri foto, stand popcorn, vată de zahăr, ursitoare, Moș Crăciun și Iepuraș de Paște. Programele se adaptează după vârsta copiilor, locație, numărul de invitați și tematica dorită. Lucrăm pe bază de programare și confirmăm disponibilitatea pentru data evenimentului telefonic sau pe WhatsApp.";
    
    const textarea = document.querySelector("textarea");
    if (textarea) {
        textarea.focus();
        textarea.value = desc;
        textarea.dispatchEvent(new Event("input", { bubbles: true }));
        textarea.dispatchEvent(new Event("change", { bubbles: true }));
        textarea.dispatchEvent(new KeyboardEvent("keydown", { key: "a", bubbles: true }));
        textarea.dispatchEvent(new KeyboardEvent("keyup", { key: "a", bubbles: true }));
        textarea.blur();
    }
    
    await sleep(1000);

    const btn = Array.from(document.querySelectorAll("button")).find(b => b.innerText.includes("Înainte") && !b.disabled);
    if(btn) btn.click();
    
    return "DONE";
}

run().then(res => document.title = res);
