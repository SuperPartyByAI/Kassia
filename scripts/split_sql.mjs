import fs from 'fs';

const content = fs.readFileSync('db/04_seed_kassia_skeleton_preview_v6_0.sql', 'utf8');

const createTableRegex = /CREATE TABLE IF NOT EXISTS [^;]+;/s;
const createTableMatch = content.match(createTableRegex);
const ddl = createTableMatch ? createTableMatch[0] : '';

const doBodyMatch = content.match(/BEGIN(.*)END \$\$;/s);
const body = doBodyMatch[1];

// Split by page and link blocks
const parts = body.split(/\n\s*(?=-- PAGE:|SELECT id INTO v_src)/);

const chunks = [];
let currentChunk = '';
const CHUNK_SIZE = 150000; // ~150KB

for (const part of parts) {
    if (currentChunk.length + part.length > CHUNK_SIZE && currentChunk.length > 0) {
        chunks.push(currentChunk);
        currentChunk = '';
    }
    currentChunk += part + '\n';
}
if (currentChunk) {
    chunks.push(currentChunk);
}

console.log(`Split into ${chunks.length} chunks.`);

for (let i = 0; i < chunks.length; i++) {
    let sql = `BEGIN;\n`;
    if (i === 0 && ddl) {
        sql += ddl + '\n\n';
    }
    sql += `DO $$\nDECLARE\n    v_page_id UUID;\n    v_hub_id UUID;\n    v_src UUID;\n    v_tgt UUID;\nBEGIN\n`;
    sql += chunks[i];
    sql += `\nEND $$;\nCOMMIT;\n`;
    fs.writeFileSync(`db/chunk_${i+1}.sql`, sql);
    console.log(`Chunk ${i+1}: ${sql.length} bytes`);
}
