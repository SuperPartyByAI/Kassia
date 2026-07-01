const { execSync } = require('child_process');

function runAppleScript(script) {
    return execSync(`osascript << 'EOF'
${script}
EOF`, { encoding: 'utf-8' });
}

async function requestIndexing(url) {
    console.log(`\nNavigating to GSC home for: ${url}`);
    runAppleScript(`tell application "Google Chrome" to execute front window's active tab javascript "window.location.href = \\"https://search.google.com/search-console?resource_id=https%3A%2F%2Fwww.kassia.ro%2F\\";"`);
    
    // Wait for page load
    await new Promise(r => setTimeout(r, 6000));
    
    console.log(`Typing URL into inspection bar...`);
    const injectJs = `
        const input = Array.from(document.querySelectorAll("input")).find(i => (i.placeholder || i.getAttribute("aria-label") || "").includes("Inspect"));
        if (input) {
            input.focus();
            const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "value").set;
            nativeInputValueSetter.call(input, "${url}");
            input.dispatchEvent(new Event("input", { bubbles: true }));
            input.dispatchEvent(new KeyboardEvent("keydown", { key: "Enter", code: "Enter", keyCode: 13, which: 13, bubbles: true }));
            "SUCCESS_INPUT"
        } else {
            "NOT_FOUND"
        }
    `;
    const res = runAppleScript(`tell application "Google Chrome" to execute front window's active tab javascript \`${injectJs}\``).trim();
    console.log(`Input result: ${res}`);
    
    console.log(`Waiting for Request Indexing button...`);
    let clicked = false;
    for (let i = 0; i < 40; i++) {
        await new Promise(r => setTimeout(r, 1000));
        const clickJs = `
            const buttons = Array.from(document.querySelectorAll("div[role=button], span[role=button], button"));
            const requestBtn = buttons.find(b => b.innerText && (
                b.innerText.toUpperCase().includes("REQUEST INDEXING") || 
                b.innerText.toUpperCase().includes("SOLICITĂ INDEXAREA") ||
                b.innerText.toUpperCase().includes("SOLICITAȚI INDEXAREA")
            ));
            if (requestBtn && !requestBtn.disabled && requestBtn.offsetParent !== null) {
                requestBtn.click();
                "CLICKED"
            } else {
                "WAITING"
            }
        `;
        const clickRes = runAppleScript(`tell application "Google Chrome" to execute front window's active tab javascript \`${clickJs}\``).trim();
        if (clickRes === '"CLICKED"') {
            console.log(`Clicked Request Indexing! Waiting for queue confirmation...`);
            clicked = true;
            break;
        }
    }
    
    if (clicked) {
        // Wait for the modal "Indexing Requested" to close or finish
        await new Promise(r => setTimeout(r, 18000));
        console.log(`Finished processing ${url}`);
        // Take a screenshot
        execSync(`screencapture -x screenshot_voluntari_gsc.png`);
        console.log("Screenshot saved as screenshot_voluntari_gsc.png");
    } else {
        console.log(`Timeout: Could not find Request Indexing button for ${url}`);
    }
}

async function main() {
    await requestIndexing('https://www.kassia.ro/animatori-petreceri-copii-voluntari/');
}

main();
