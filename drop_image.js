async function run() {
    try {
        const response = await fetch("http://localhost:8123/kassia_office_sector1_1783013392459.png");
        const blob = await response.blob();
        const file = new File([blob], "kassia_office_sector1.png", { type: "image/png" });

        const dt = new DataTransfer();
        dt.items.add(file);

        // Find the dropzone. Usually it has text "Trage imaginile aici" or "Selectează imagini"
        // Let's just dispatch the drop event on the file input itself or its parent
        const fileInput = document.querySelector("input[type=file]");
        if (!fileInput) return "No file input";

        // Often in React dropzones, the drop event goes to a wrapper div
        let dropzone = fileInput.closest("div");
        while (dropzone && dropzone.innerText.indexOf("Selectează imagini") === -1) {
            dropzone = dropzone.parentElement;
        }
        if (!dropzone) dropzone = fileInput.parentElement;

        const event = new DragEvent("drop", { bubbles: true, cancelable: true });
        Object.defineProperty(event, "dataTransfer", { value: dt });
        
        dropzone.dispatchEvent(event);
        
        // Also trigger change on file input just in case
        fileInput.files = dt.files;
        fileInput.dispatchEvent(new Event("change", { bubbles: true }));

        return "DROPPED";
    } catch(e) {
        return "ERR: " + e.toString();
    }
}

run().then(res => document.title = res);
