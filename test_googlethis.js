import google from 'googlethis';
async function run() {
    const options = {
        page: 0,
        safe: false,
        additional_params: { hl: 'ro' }
    };
    const response = await google.search('animatori petreceri copii Sector 1', options);
    console.log(`Found ${response.results.length} results`);
    console.log(response.results[0]);
}
run();
