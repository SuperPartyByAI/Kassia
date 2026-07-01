import { search } from 'duck-duck-scrape';
async function run() {
    const results = await search('animatori petreceri copii Sector 1');
    console.log(`Found ${results.results.length} results`);
    console.log(results.results[0]);
}
run();
