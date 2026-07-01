import https from 'https';

const urls = [
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFD6Btr7hZ1oqebV1uSuU28hGpZLnC3YOr9UlW5QVQjb8Jzt2MxDOKAoybZ4cA8gf-FHWsAq7cJyh3Vk8Z6zAEedxkI56QG_Jqx3he79xSDHxpu1rymLgA-NEiOpa1B2qFoSgQ8BwwddTTbmzowVLI=",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF3iNZ1tAyZUjpVIoOphKJIQtWLsvWis-Jq_v_HJQyk_4bfcxGVFAY1MrPu77QBBIYp9xyb6rrSZabc69Fbn-B2URmLVcV6UtrwK2rKphuOSwwXPloRD8TKbjSYmBERDW0JX9zaL5Ffg7ERxA==",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQGgEF2NyhtWxvR018o8HocNCJD_ZAJOGs9-y8Y32S7zOwCvTEpfYLMBFFTcGSUi7qj48cg8Y_oVHoIsMJjaJylmv3cbwBKC2Jes8TQI",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQE3e-IZVa9TqCv_vlinOPRYsgYVhFqUmqmXW4-JotA0FxuaA6n1BOypx0U97_ca2pR09z6GX-y-Dzvt0kOIqU_wp-JdKe7bCHuZt8_4bAikUE1X",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHwfRQTH5GJeN-pGsSWz7RPNnnTDJ13xYjVun4rzTW-zMU1K4eYO-liU0OX1MxyGC-BS6xLRdw4CPymg0MxTZfFG7TwdNFkqCY7WXVf",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHFa-6n8QrYOs5x0w9aaE0G08xPqpeTdXktHIXLbOUwEvH3Y3N5seJk7KGYkf-NJCcT1hJpXS2kaacjPZ84QDI0P6rJNnpK6XyspcyrsuBca3iN-Zo08u6z-DtbiyqEF4vl_y1QnAJcqtw=",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQHJ7ciANCFB-tK946PYiC3Ursw4k1jXPrgbGRtF97rJpPWRhxAhxw-b5X58VKBc5xtCTIpvzGwsP7uegX1XXXnARKzIkC2ssky3QEQ=",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQF1twMdnpgRC74jc9NY3Nluy61nW89t0W_r15Y1VcQVCDM7yv63v6pl6n6zf2MAYXwGm40AotYbTpUeRGr-0DtFQAzH7HHRR7spBYzbXhgcSORHWg==",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFm1MSgdGQCx3oXW4txo2ukqgTNAoo6bRP8fDjm1p_z-wKvXB-p0Jtw0gYtYCxzVVbbSkuEYjpUnefaqR-5B5R6JvzatEXfe_dnT2SbyPpT",
    "https://vertexaisearch.cloud.google.com/grounding-api-redirect/AUZIYQFAZ5eaTEM7Q87t_zNH-CrDSPgwAs7Eetabip0UifKthPl3Nfsl6dnR4OImhjEi2y1H6JsaeB9IzfYjVCAlovXe8FyqJrEJTPIfELLbi831b5Os5rWMOTirN0xlymHgBavMr4ND"
];

async function getFinalUrl(url) {
    return new Promise((resolve) => {
        https.get(url, (res) => {
            if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
                resolve(res.headers.location);
            } else {
                resolve(url);
            }
        }).on('error', () => resolve(null));
    });
}

async function run() {
    console.log("Extracting exact URLs from AI Grounding...");
    let unique = new Set();
    let top10 = [];
    
    for (let i = 0; i < urls.length; i++) {
        let final = await getFinalUrl(urls[i]);
        if (final) {
            // Vertex AI grounding URLs actually redirect. 
            // If they just redirect to another vertex AI or don't redirect properly, let's parse it if possible.
            // Some redirect directly to the target URL.
            if (!unique.has(final)) {
                unique.add(final);
                top10.push({ pos: unique.size, url: final });
            }
        }
    }
    
    console.log(JSON.stringify(top10, null, 2));
}

run();
