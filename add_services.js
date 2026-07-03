const customServices = [
    "Animatori petreceri copii", "Animatori copii la domiciliu", "Animatori pentru aniversări copii",
    "Programe animatori copii", "Jocuri interactive pentru copii", "Mini-disco pentru copii",
    "Concursuri pentru petreceri copii", "Activități pentru petreceri copii", "Animatori pentru botez, moț și turtă",
    "Animatori pentru grădinițe", "Animatori pentru școli", "Animatori pentru restaurante",
    "Animatori pentru evenimente private", "Animatori pentru family day",
    "Mascote petreceri copii", "Personaje pentru petreceri copii", "Catalog costume pentru petreceri copii",
    "Prințese pentru petreceri copii", "Supereroi pentru petreceri copii", "Clovni pentru petreceri copii",
    "Pirați pentru petreceri copii", "Zâne pentru petreceri copii", "Mascote pentru momentul tortului",
    "Personaje tematice pentru aniversări copii",
    "Pictură pe față / Face painting", "Modelaj baloane pentru copii", "Dansuri și coregrafii copii",
    "Vânătoare de comori pentru copii", "Jocuri de echipă pentru copii",
    "Decor baloane", "Decoruri cu baloane pentru petreceri copii", "Arcade din baloane",
    "Ghirlande organice din baloane", "Panou foto cu baloane", "Photo corner cu baloane",
    "Baloane cu heliu", "Baloane botez", "Baloane nuntă", "Baloane aniversare",
    "Decor botez", "Decor aniversare copii", "Decor evenimente corporate",
    "Stand popcorn", "Aparat popcorn pentru evenimente", "Stand vată de zahăr",
    "Aparat vată de zahăr pentru evenimente", "Standuri pentru petreceri copii",
    "Moș Crăciun pentru evenimente", "Iepuraș de Paște pentru evenimente", "Personaje tematice de Halloween",
    "Ursitoare botez", "Animatori pentru serbări",
    "Organizare petreceri copii", "Organizare aniversări copii", "Organizare botez",
    "Organizare tăiere moț", "Organizare rupere turtă", "Organizare evenimente private",
    "Organizare evenimente corporate", "Petreceri tematice copii"
];

const suggestedToAdd = [
    "Evenimente corporate și conferințe",
    "Design decorațiuni pentru evenimente",
    "Evenimente corporatiste",
    "Evenimente la școală",
    "Coordonare evenimente de team building"
];

const sleep = ms => new Promise(r => setTimeout(r, ms));

async function run() {
    // Click "Afișează mai multe"
    const showMore = Array.from(document.querySelectorAll("span")).find(s => s.innerText === "Afișează mai multe" || s.innerText === "Afișează-le pe toate");
    if (showMore) showMore.click();
    await sleep(500);

    // Select suggested
    const chips = Array.from(document.querySelectorAll("div[role='button']"));
    for (let chip of chips) {
        const text = chip.innerText.trim().replace(/^\\+\\s*/, "");
        if (suggestedToAdd.includes(text)) {
            if (chip.getAttribute("aria-pressed") === "false" || !chip.querySelector("svg")) {
                chip.click();
                await sleep(100);
            }
        }
    }

    // Add custom services
    const addCustomBtn = Array.from(document.querySelectorAll("span")).find(s => s.innerText === "Adaugă un serviciu personalizat");
    for (let service of customServices) {
        if (addCustomBtn) {
            addCustomBtn.click();
            await sleep(100);
        }
        
        // Find input
        const inputs = Array.from(document.querySelectorAll("input[type='text']")).filter(i => {
            const p = i.placeholder || "";
            return p.includes("Adaugă un serviciu personalizat") || i.closest(".t19Rte") || i.id.startsWith("c");
        });
        
        // Usually the last empty input is the one we want
        const emptyInputs = inputs.filter(i => i.value === "");
        const input = emptyInputs[emptyInputs.length - 1] || inputs[inputs.length - 1];
        
        if (input) {
            input.value = service;
            input.dispatchEvent(new Event("input", { bubbles: true }));
            // Add it (press Enter or click add)
            input.dispatchEvent(new KeyboardEvent("keydown", { key: "Enter", code: "Enter", bubbles: true }));
            await sleep(100);
        }
    }

    // Click Next
    const btn = Array.from(document.querySelectorAll("button")).find(b => b.innerText.includes("Înainte"));
    if (btn) btn.click();
    
    return "DONE";
}

run().then(res => document.title = res);
