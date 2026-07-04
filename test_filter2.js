  function normalizeText(text) {
    if(!text) return "";
    return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\s+/g, " ").trim();
  }

function run(q, rawTitle, rawDesc, rawKw) {
      const stopwords = ["si", "de", "cu", "la", "pentru", "vreau", "as", "vrea", "doresc", "imi", "trebuie", "un", "o", "niste", "din", "in", "pe", "ca", "sa", "sunt", "este", "au"];
      const queryWords = q.split(' ').filter(w => w.length > 0 && !stopwords.includes(w));
      
        const nTitle = normalizeText(rawTitle);
        const nDesc = normalizeText(rawDesc);
        const nKw = normalizeText(rawKw);

        let score = 0;
           const cardWords = [...nTitle.split(' '), ...nDesc.split(' '), ...nKw.split(' ')].filter(w=>w.length > 0);

           queryWords.forEach(qw => {
               let bestWordScore = 0;

               if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
               else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
               else if (nKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 25);

               if (bestWordScore > 0) {
                   score += bestWordScore;
               } else {
                   for(let i=0; i<cardWords.length; i++) {
                       let cw = cardWords[i];
                       if (cw.includes(qw) || qw.includes(cw)) {
                           if (score === 0) console.log("MATCHED SUBSTRING:", "qw=", qw, "cw=", cw);
                           score += 20;
                           break;
                       }
                   }
               }
           });
      return score;
}

run("reparatii", "Moș Crăciun", "Distribuim magia pură a sărbătorilor cu Moș Crăciun și elfii săi.", "mos craciun mosu craciunita elf elfi spiridus spiridusi iarna serbare brad cadouri decembrie kreciun");
