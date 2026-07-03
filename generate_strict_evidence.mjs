import fs from 'fs';
const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const cards = rawData.cards;
const specificEvidence = JSON.parse(fs.readFileSync('specific_evidence.json', 'utf8'));

const strictEvidence = {};
let missing = false;

cards.forEach((c, index) => {
    let title = c.title;
    // Map titles to evidence, but if title includes " la momentul tortului" or " pentru", strip it
    let baseTitle = title;
    if (!specificEvidence[baseTitle]) {
        // Try to find the closest match
        const keys = Object.keys(specificEvidence);
        for(let k of keys) {
            if (baseTitle.includes(k) || k.includes(baseTitle)) {
                baseTitle = k;
                break;
            }
        }
    }
    
    if (specificEvidence[baseTitle]) {
        strictEvidence[String(index)] = specificEvidence[baseTitle];
    } else {
        console.error("No visual evidence found for index", index, title);
        missing = true;
    }
});

if (missing) {
    console.error("Missing evidence for some cards! Fix manually.");
    process.exit(1);
}

fs.writeFileSync('strict_evidence_by_index.json', JSON.stringify(strictEvidence, null, 2));
console.log("Successfully generated strict_evidence_by_index.json");
