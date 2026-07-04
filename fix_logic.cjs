const fs = require('fs');
const path = require('path');

const gssPath = path.join(__dirname, 'src/components/GlobalServiceSearch.astro');
let content = fs.readFileSync(gssPath, 'utf8');

const newFilterCards = `    function filterCards(rawQuery) {
      const q = normalizeText(rawQuery);
      const stopwords = ["si", "de", "cu", "la", "pentru", "vreau", "as", "vrea", "doresc", "imi", "trebuie", "un", "o", "niste", "din", "in", "pe", "ca", "sa", "sunt", "este", "au"];
      const queryWords = q.split(' ').filter(w => w.length > 0 && !stopwords.includes(w));
      
      let scoredCards = [];
      const MIN_SCORE_TO_SHOW_RESULTS = 20;

      cards.forEach((card) => {
        const rawTitle = card.getAttribute('data-title') || '';
        const rawDesc = card.getAttribute('data-desc') || '';
        const rawKw = card.getAttribute('data-kw') || '';
        
        const nTitle = normalizeText(rawTitle);
        const nDesc = normalizeText(rawDesc);
        const nKw = normalizeText(rawKw);

        let score = 0;
        let isMatch = false;

        if (queryWords.length === 0 && q.length === 0) {
           isMatch = true;
           score = 100;
        } else if (queryWords.length === 0 && q.length > 0) {
           isMatch = false;
           score = 0;
        } else {
           const cardWords = [...nTitle.split(' '), ...nDesc.split(' '), ...nKw.split(' ')].filter(w=>w.length > 0);

           queryWords.forEach(qw => {
               let bestWordScore = 0;

               if (qw.length >= 3) {
                   if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
                   else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
                   else if (nKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 25);
               } else {
                   // Exact match only for short queries
                   if (cardWords.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
               }

               if (bestWordScore > 0) {
                   score += bestWordScore;
               } else {
                   for(let i=0; i<cardWords.length; i++) {
                       let cw = cardWords[i];
                       
                       if (cw === qw || (qw.length >= 3 && cw.includes(qw)) || (cw.length >= 4 && qw.includes(cw))) {
                           score += 20;
                           break;
                       }
                       
                       if (qw.length >= 4 && cw.length >= 4) {
                           let dist = levenshteinDistance(qw, cw);
                           let maxLen = Math.max(qw.length, cw.length);
                           let ratio = dist / maxLen;
                           
                           if ( (dist <= 1 || (qw.length >= 6 && dist <= 2 && ratio <= 0.25)) && (qw[0] === cw[0] || dist <= 1) ) {
                               score += 20;
                               break;
                           }
                       }
                   }
               }
           });

           isMatch = score >= MIN_SCORE_TO_SHOW_RESULTS;
        }

        if (isMatch) {
            scoredCards.push({ card, score });
        } else {
            card.style.display = 'none';
        }
      });

      scoredCards.sort((a, b) => b.score - a.score);
      
      if (scoredCards.length === 0 && queryWords.length > 0) {
          if (noResults) {
             noResults.style.display = 'block';
             noResults.innerHTML = \`Nu am găsit exact acest termen.<p class="fallback-msg">🪄 Dar iată cele mai populare servicii de care sigur te vei îndrăgosti:</p>\`;
          }
          let fallbackShown = 0;
          cards.forEach(card => {
             const t = card.getAttribute('data-title');
             if (fallbackShown < 4 && (t.includes('Animatori') || t.includes('Personaje') || t.includes('Ursitoare') || t.includes('Baloane') || t.includes('Arcade'))) {
                 card.style.display = 'flex';
                 grid.appendChild(card);
                 fallbackShown++;
             } else {
                 card.style.display = 'none';
             }
          });
      } else {
          if (noResults) noResults.style.display = 'none';
          scoredCards.forEach(sc => {
              sc.card.style.display = 'flex';
              grid.appendChild(sc.card);
          });
      }
    }`;

content = content.replace(/function filterCards\(rawQuery\) \{[\s\S]*?\}\s*triggers\.forEach/m, newFilterCards + '\n\n    triggers.forEach');
fs.writeFileSync(gssPath, content, 'utf8');
