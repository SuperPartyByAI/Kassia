import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.resolve(__dirname, '../.env.local') });
dotenv.config({ path: path.resolve(__dirname, '../.env') });

import fs from 'fs';
const token = 'process.env.SUPABASE_ACCESS_TOKEN';
const ref = 'jrfhprnuxxfwkwjwdsez';
const query = fs.readFileSync('db/04_seed_kassia_skeleton_preview_v5_3.sql', 'utf8');

async function run() {
    console.log("Sending query to Supabase...");
    try {
        const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/query`, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ query })
        });
        
        if (!res.ok) {
            console.log(`Failed: ${res.status}`);
            console.log(await res.text());
        } else {
            console.log("Success! Seed executed.");
        }
    } catch(e) {
        console.error(e);
    }
}
run();
