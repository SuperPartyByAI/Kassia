import fs from 'fs';

const verifyResults = JSON.parse(fs.readFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/verify_headings.json', 'utf8'));

let csvContent = 'URL,HTTP_Status,Old_Found,New_Found,H1,Canonical,Meta_Robots\n';

for (const res of verifyResults) {
  csvContent += `"${res.url}","${res.httpStatus}","${res.oldFound}","${res.newFound}","${res.h1}","${res.canonical}","${res.metaRobots}"\n`;
}

fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_verificare_live.csv', csvContent);
console.log('CSV created.');
