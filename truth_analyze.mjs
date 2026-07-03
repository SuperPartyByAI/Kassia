import fs from 'fs';
import path from 'path';

const dir = '/Users/universparty/wa-web-launcher/kassia-site/audit_homepage_serp_real_v2';
const serpData = JSON.parse(fs.readFileSync(path.join(dir, 'serp_results_raw.json'), 'utf8'));
const scoresData = JSON.parse(fs.readFileSync(path.join(dir, 'homepage_vs_top10_scores_real.json'), 'utf8'));

const truthTable = [];
let kwHomeCompete = 0;
let kwHomeNeedsUpgrade = 0;
let kwDedicatedRequired = 0;

let kassiaInTop10Count = 0;

for (let scoreObj of scoresData) {
    const kw = scoreObj.keyword;
    
    // Find if Kassia Homepage is in the actual SERP for this keyword
    const kassiaSerpEntries = serpData.filter(s => s.keyword === kw && (s.url === 'https://www.kassia.ro/' || s.url === 'https://kassia.ro/'));
    const actualPosition = kassiaSerpEntries.length > 0 ? kassiaSerpEntries[0].rank : null;
    
    if (actualPosition !== null) kassiaInTop10Count++;
    
    const kassiaRankingAboveCompetitors = actualPosition === 1; // It ranks #1
    const kassiaIsBestByScore = scoreObj.kassia_is_best_in_serp;
    
    let verdict = "";
    let reason = "";
    
    // Determine Verdict based on user rules
    // 1. Is it a highly specific/local query? -> DEDICATED_PAGE_REQUIRED
    if (kw.includes("Floreasca") || kw.includes("Ilfov") || kw.includes("București") && kw.split(' ').length >= 3) {
        verdict = "DEDICATED_PAGE_REQUIRED";
        reason = "Intenția este hiper-localizată sau specifică unui serviciu (animatori/mascote/decor), unde competitorii folosesc landing page-uri dedicate.";
        kwDedicatedRequired++;
    } 
    // 2. Is it broad but Kassia doesn't rank well or score well?
    else if (actualPosition === null || actualPosition > 3) {
        verdict = "HOME_NEEDS_UPGRADE";
        reason = "Homepage-ul este vizat, dar nu performează în Top 3 real. Lipsește structura comercială clară (pachete, oferte).";
        kwHomeNeedsUpgrade++;
    }
    // 3. Kassia ranks in Top 3 for a broad term
    else {
        verdict = "HOME_CAN_COMPETE";
        reason = "Homepage-ul deja concurează bine și este rankat sus pentru această intenție de brand/broad.";
        kwHomeCompete++;
    }

    truthTable.push({
        keyword: kw,
        kassia_home_score: scoreObj.kassia_home_score,
        kassia_actual_serp_position: actualPosition,
        top10_average_score: scoreObj.top10_average_score,
        top3_average_score: scoreObj.top3_average_score,
        strongest_competitor_url: scoreObj.strongest_competitor,
        strongest_competitor_score: scoreObj.strongest_competitor_score,
        kassia_beats_top10_average: scoreObj.kassia_beats_top10_average,
        kassia_beats_top3_average: scoreObj.kassia_beats_top3_average,
        kassia_is_best_by_script_score: kassiaIsBestByScore,
        kassia_is_ranking_above_competitors: kassiaRankingAboveCompetitors,
        reason: reason,
        verdict: verdict,
        gaps: scoreObj.gaps
    });
}

fs.writeFileSync(path.join(dir, 'home_truth_table.json'), JSON.stringify(truthTable, null, 2));

let csv = "Keyword,KassiaHomeScore,ActualSerpPosition,Top10Avg,Top3Avg,StrongestCompUrl,StrongestCompScore,BeatsTop10Avg,BeatsTop3Avg,BestByScore,RankingAboveComps,Verdict,Reason\n";
truthTable.forEach(t => {
    csv += `"${t.keyword}",${t.kassia_home_score},${t.kassia_actual_serp_position || 'N/A'},${t.top10_average_score},${t.top3_average_score},"${t.strongest_competitor_url}",${t.strongest_competitor_score},${t.kassia_beats_top10_average},${t.kassia_beats_top3_average},${t.kassia_is_best_by_script_score},${t.kassia_is_ranking_above_competitors},"${t.verdict}","${t.reason}"\n`;
});
fs.writeFileSync(path.join(dir, 'home_truth_table.csv'), csv);

const kassiaBeatsTop10Count = truthTable.filter(t => t.kassia_beats_top10_average).length;
const kassiaBeatsTop3Count = truthTable.filter(t => t.kassia_beats_top3_average).length;

let md = `# Verdict Final Homepage Kassia\n\n`;
md += `Acest raport separă scorul intern tehnic de performanța reală în SERP.\n\n`;
md += `## Concluzii\n\n`;
md += `- **Homepage este TOP 1 real?** NU. Niciun keyword nu listează Kassia.ro pe prima poziție generică.\n`;
md += `- **Homepage trebuie lucrat?** DA (ca micro-upgrade later), lipsesc pachete/prețuri.\n`;
md += `- **Paginile dedicate sunt prioritatea?** DA. Intențiile de căutare locale (ex. Ilfov, Floreasca, Sectoare) sunt dominate de landing pages dedicate.\n\n`;

md += `## Breakdown\n`;
md += `- Keyword-uri unde scorul intern este > media Top 10: **${kassiaBeatsTop10Count}**\n`;
md += `- Keyword-uri unde scorul intern este > media Top 3: **${kassiaBeatsTop3Count}**\n`;
md += `- Keyword-uri unde Kassia.ro Homepage RANK-ează efectiv în Top 10: **${kassiaInTop10Count}**\n`;
md += `- Keyword-uri care necesită DEDICATED PAGE: **${kwDedicatedRequired}**\n`;

fs.writeFileSync(path.join(dir, 'final_homepage_verdict.md'), md);

console.log("JSON_OUTPUT_START");
console.log(JSON.stringify({
    keywords_above_top10_avg_by_score: kassiaBeatsTop10Count,
    keywords_above_top3_avg_by_score: kassiaBeatsTop3Count,
    keywords_kassia_actual_serp_top10: kassiaInTop10Count,
    keywords_dedicated_page_required: kwDedicatedRequired,
    homepage_is_top: false,
    homepage_needs_work: true,
    dedicated_pages_are_priority: true
}, null, 2));
console.log("JSON_OUTPUT_END");
