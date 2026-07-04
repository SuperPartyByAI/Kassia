  function normalizeText(text) {
    if(!text) return "";
    return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\s+/g, " ").trim();
  }

  function levenshteinDistance(a, b) {
    if (a.length === 0) return b.length;
    if (b.length === 0) return a.length;
    var matrix = [];
    for (var i = 0; i <= b.length; i++) { matrix[i] = [i]; }
    for (var j = 0; j <= a.length; j++) { matrix[0][j] = j; }
    for (var i = 1; i <= b.length; i++) {
      for (var j = 1; j <= a.length; j++) {
        if (b.charAt(i - 1) == a.charAt(j - 1)) {
          matrix[i][j] = matrix[i - 1][j - 1];
        } else {
          matrix[i][j] = Math.min(matrix[i - 1][j - 1] + 1, Math.min(matrix[i][j - 1] + 1, matrix[i - 1][j] + 1));
        }
      }
    }
    return matrix[b.length][a.length];
  }

function run(q, rawTitle, rawDesc, rawKw) {
      const stopwords = ["si", "de", "cu", "la", "pentru", "vreau", "as", "vrea", "doresc", "imi", "trebuie", "un", "o", "niste", "din", "in", "pe", "ca", "sa", "sunt", "este", "au"];
      const queryWords = q.split(' ').filter(w => w.length > 0 && !stopwords.includes(w));
      
        const nTitle = normalizeText(rawTitle);
        const nDesc = normalizeText(rawDesc);
        const nKw = normalizeText(rawKw);

        let score = 0;
        let isMatch = false;

           const cardWords = [...nTitle.split(' '), ...nDesc.split(' '), ...nKw.split(' ')].filter(w=>w.length > 0);

           queryWords.forEach(qw => {
               let bestWordScore = 0;

               if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
               else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
               else if (nKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 20);

               if (bestWordScore > 0) {
                   score += bestWordScore;
               } else {
                   for(let i=0; i<cardWords.length; i++) {
                       let cw = cardWords[i];
                       if (cw.includes(qw) || qw.includes(cw)) {
                           score += 15;
                           break;
                       }
                       if (qw.length >= 4 && cw.length >= 4) {
                           let dist = levenshteinDistance(qw, cw);
                           if (dist <= 1 || (qw.length > 6 && dist <= 2)) {
                               score += 10;
                               break;
                           }
                       }
                   }
               }
           });

           isMatch = score > 0;
      return { score, isMatch };
}

console.log("Animatori: ", run("balooane", "Animatori Petreceri Copii", "Profesioniști pregătiți să creeze zâmbete la orice petrecere.", "animator clovn clown pirat magician entertaineri petrecere acasa kids party fete baieti copii joaca animatorii animatoare"));
console.log("Arcade: ", run("balooane", "Arcade Baloane", "Decor spectaculos de intrare cu baloane.", "arcada arc decor intrare poarta usa baloane organic exterior magazin deschidere amenajare decoruri decoratiuni arcadebaloane"));

