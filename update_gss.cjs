const fs = require('fs');
const path = require('path');

const gssPath = path.join(__dirname, 'src/components/GlobalServiceSearch.astro');
let content = fs.readFileSync(gssPath, 'utf8');

const servicesReplacement = `const services = [
    { title: 'Animatori Petreceri Copii', img: 'animatori.png', url: '/animatori-petreceri-copii/', desc: 'Profesioniști pregătiți să creeze zâmbete la orice petrecere.', kw: 'animator clovn clown pirat magician entertaineri petrecere acasa kids party fete baieti copii joaca animatorii animatoare' },
    { title: 'Personaje & Mascote', img: 'mascote.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Eroii și prințesele preferate aduse la viață.', kw: 'spiderman batman superman elsa anna olaf mickey minnie mouse mascote mascota disney printesa printese erou eroi superhero costumate costum mascot alba ca zapada rapunzel ariel sonic chase skye ryder patrula catelusilor transformers buburuza motan noir spaidarman spaidar betmen michi maus maichi elza stici stitch peis patrol pepa pig pipa' },
    { title: 'Ursitoare Botez & Moț', img: 'ursitoare.png', url: '/animatori-petreceri-copii/', desc: 'Spectacol emoționant cu ursitoare și text dedicat.', kw: 'ursitori zane ursitoarele botez nasa bebelus ursit moartea destinu magie fum greu basm zana buna rea traditie ursitaore utsitoare' },
    { title: 'Pictură pe față', img: 'pictura.png', url: '/pictura-pe-fata-copii-bucuresti/', desc: 'Transformăm copiii în eroii lor preferați folosind culori sigure.', kw: 'picturi fata face painting culori machiaj masca desene fluturas spiderman pictat fata facepainting feispeinting fete' },
    { title: 'Modelaj Baloane', img: 'modelaj.png', url: '/modelaj-baloane-copii-bucuresti/', desc: 'Săbii, căței și flori din baloane modelabile colorate.', kw: 'modelat baloane sabii catei flori modelabile baloane lungi figurina figurine balonase' },
    { title: 'Moș Crăciun', img: 'mos.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Distribuim magia pură a sărbătorilor cu Moș Crăciun și elfii săi.', kw: 'mos craciun mosu craciunita elf elfi spiridus spiridusi iarna serbare brad cadouri decembrie kreciun' },
    { title: 'Iepurașul de Paște', img: 'iepuras.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Însoțit de sesiuni vesele de căutare a ouălor de ciocolată.', kw: 'iepuras paste oua ciocolata mascot iepure primavara vanatoare' },
    { title: 'Personaje Halloween', img: 'halloween.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Costume simpatice pentru cele mai cool petreceri de toamnă.', kw: 'halloween halouin vrajitoare dovleac schelet vampir costum toamna groaza dracula' },
    { title: 'Iluzionist & Magician', img: 'magie.png', url: '/animatori-petreceri-copii/', desc: 'Trucuri captivante cu un magician profesionist care îi vor lăsa uimiți.', kw: 'magie trucuri iluzii magician iluzionist spectacol iepure palarie magie alba show majician majie' },
    { title: 'Spectacole de Teatru', img: 'tematice.png', url: '/animatori-petreceri-copii/', desc: 'Piese de teatru interactive pentru cei mici.', kw: 'teatru papusi actori piesa spectacol poveste copii scena' },
    { title: 'Animatori pe Picioroange', img: 'picioroange.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Personaje pe catalige (picioroange), atracția supremă pentru spații deschise.', kw: 'picioroange catalige inalti gari festival giganti' },
    { title: 'Statui Vivante', img: 'statui.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Apariții memorabile, elegante, perfecte pentru evenimente premium.', kw: 'statui vivante mimi argintii aurii nemiscati' },
    { title: 'Baloane de Săpun', img: 'sapun.png', url: '/animatori-petreceri-copii/', desc: 'Momente magice cu baloane gigantice de săpun.', kw: 'baloane sapun uriaje gigantice soap bubbles masina baloane clabuci fum spectacol magie' },
    { title: 'Gheață Carbonică', img: 'gheata.png', url: '/animatori-petreceri-copii/', desc: 'Experimente educative și spectaculoase cu gheață carbonică.', kw: 'gheata carbonica fum greu pahare dansul mirilor experimente chimie' },
    { title: 'Jocuri interactive', img: 'jocuri.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Activități energice care implică toți copiii prezenți.', kw: 'jocuri concursuri stafete sport activitati intreceri saci sfoara distractie' },
    { title: 'Mini-disco', img: 'minidisco.png', url: '/mini-disco-copii-bucuresti/', desc: 'Atmosferă incendiară cu muzică, lumini și coregrafii.', kw: 'disco dans muzica coregrafii lumini laser party mini-disco boxa melodii ring minidisco club' },
    { title: 'Pachete Animatori', img: 'pachete.png', url: '/pachete-animatori-copii-bucuresti/', desc: 'Pachete complete cu cele mai atractive servicii incluse.', kw: 'pachete oferta combo promotie ieftin reduceri all inclusive complet' },
    { title: 'Petreceri Tematice', img: 'tematice.png', url: '/pachete-animatori-copii-bucuresti/', desc: 'Scenariu de petrecere 100% adaptat pasiunilor copiilor tăi.', kw: 'tematica tema hawaii pijama party safari jungle neon glow' },
    { title: 'Vată de Zahăr', img: 'vata.png', url: '/animatori-petreceri-copii/', desc: 'Atracția dulce nelipsită, preparată proaspăt pe loc.', kw: 'vata zahar pe bat dulce aparat vata roz ceva dulce de mancat' },
    { title: 'Aparat de Popcorn', img: 'popcorn.png', url: '/animatori-petreceri-copii/', desc: 'Gustarea crocantă adorată de absolut toți copiii.', kw: 'popcorn floricele porumb aparat cinema ceva sarat de mancat' },
    { title: 'Fântână Ciocolată', img: 'vata.png', url: '/animatori-petreceri-copii/', desc: 'Cascadă delicioasă de ciocolată belgiană caldă.', kw: 'fantana ciocolata fructe capsuni desert bufet candy bar dulce' },
    { title: 'Torturi din Dulciuri', img: 'tort.png', url: '/animatori-petreceri-copii/', desc: 'Torturi masive construite din ciocolățele Kinder și Barni.', kw: 'tort lumanari artificii desert figurina martipan etaje prajituri dulciuri kinder barni' },
    { title: 'Castele Gonflabile', img: 'gonflabile.png', url: '/animatori-petreceri-copii/', desc: 'Spații uriașe de sărit pentru energie maximă în siguranță.', kw: 'topogan tobogan gonflabila sarituri castel saltea exterior curte gonflabil trambulina' },
    { title: 'Joc Piñata', img: 'pinata.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Momentul de bucurie explozivă și dulciuri garantate.', kw: 'pinata piniata bomboane dulciuri loveste bata surpriza sparge' },
    { title: 'Treasure Hunt', img: 'treasure.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Aventură captivantă și căutare de comori în aer liber.', kw: 'treasure hunt vanatoare comori indicii harti harta' },
    { title: 'Ateliere de Creație', img: 'ateliere.png', url: '/animatori-petreceri-copii/', desc: 'Activități educative liniștite (slime, desen, pictură).', kw: 'ateliere creatie craft diy pictura slime bratari nisip colorat indemanare' },
    { title: 'Închiriere Mese & Scaune', img: 'mese.png', url: '/animatori-petreceri-copii/', desc: 'Mobilier colorat (Kids Corner) la scară pentru cei mici.', kw: 'mese scaune mobilier inchiriat scaunele masute setup cort kids corner' },
    { title: 'Cabină Foto 360', img: 'cabina.png', url: '/animatori-petreceri-copii/', desc: 'Video-uri dinamice de senzație, gata de repostat pe social media.', kw: 'cabina foto 360 video spinner poze amintiri platforma photobooth propsuri poze printate magneti cabinafoto' },
    { title: 'Foto & Video', img: 'foto.png', url: '/animatori-petreceri-copii/', desc: 'Fotografii noștri nu ratează nicio secundă din emoția petrecerii.', kw: 'fotograf cameraman poze filmare video editare album amintiri stick dslr fotografii fotovideo' },
    { title: 'Arcade Baloane', img: 'arcada.png', url: '/arcada-baloane-bucuresti/', desc: 'Decor spectaculos de intrare cu baloane.', kw: 'arcada arc decor intrare poarta usa baloane organic exterior magazin deschidere amenajare decoruri decoratiuni arcadebaloane' },
    { title: 'Baloane cu Heliu', img: 'heliu.png', url: '/baloane-heliu-bucuresti/', desc: 'Baloane plutitoare pentru un decor aerian minunat.', kw: 'heliu plutitoare tavan panglica butelie gaz zburatoare umflate zbor heliu baloaneheliu' },
    { title: 'Panouri Foto', img: 'panoufoto.png', url: '/panou-foto-baloane-bucuresti/', desc: 'Colțul perfect (Photo Corner) pentru amintiri instagramabile.', kw: 'panou foto photo corner perete poze rama cerc inel fundal instagram poze photocorner panoufoto' },
    { title: 'Perete din Baloane', img: 'perete.png', url: '/perete-baloane-bucuresti/', desc: 'Fundal masiv și impresionant realizat exclusiv din baloane.', kw: 'perete fundal masiv cortina zid photo wall peretebaloane' },
    { title: 'Ghirlande Baloane', img: 'ghirlande.png', url: '/ghirlande-baloane-bucuresti/', desc: 'Șiraguri organice și fluide pentru decor.', kw: 'ghirlanda sirag liana curgatoare scara tavan organic decor' },
    { title: 'Stâlpi Baloane', img: 'stalpi.png', url: '/stalpi-baloane-bucuresti/', desc: 'Coloane din baloane pentru delimitarea spațiului.', kw: 'stalpi coloane tuburi intrare piloni stalp' },
    { title: 'Aranjamente Baloane', img: 'aranjamente.png', url: '/aranjamente-baloane-bucuresti/', desc: 'Decorațiuni complexe, ideale pentru mese sau colturi.', kw: 'aranjamente centru masa masa prezidiu coltar aranjament' },
    { title: 'Buchete din Baloane', img: 'buchete.png', url: '/baloane-heliu-bucuresti/', desc: 'Grupaje elegante din baloane cu heliu, ideale pentru cadou.', kw: 'buchete grupaj cadou surpriza greutate buchet baloanecadou' },
    { title: 'Baloane Cifre & Litere', img: 'cifre.png', url: '/baloane-cifre-litere-bucuresti/', desc: 'Personalizează petrecerea cu mesaje și vârsta.', kw: 'cifre litere numere folie nume ani auriu argintiu 18 ani nume la multi ani' },
    { title: 'Livrare Baloane', img: 'livrare.png', url: '/livrare-baloane-bucuresti/', desc: 'Aducem bucuria direct la ușa ta.', kw: 'livrare curier surpriza acasa usa pachet cutie transport adus expediat' },
    { title: 'Botez & Tăiere Moț', img: 'botez.png', url: '/decoratiuni-baloane-botez-bucuresti/', desc: 'Decoruri delicate pentru cel mai important eveniment.', kw: 'botez mot turta bebe cristelnita restaurant botezul ursitoare 1 an petrecere taierea motului ruptul turtei petrecere bebe' },
    { title: 'Nuntă & Cununie', img: 'nunta.png', url: '/decoratiuni-baloane-nunta-bucuresti/', desc: 'Aranjamente elegante pentru a celebra iubirea.', kw: 'nunta cununie civila mire mireasa starea civila salon prezidiu maritis casatorie' },
    { title: 'Corporate & Deschideri', img: 'corporate.png', url: '/decoratiuni-baloane-corporate-bucuresti/', desc: 'Decoruri impunătoare pentru un impact maxim.', kw: 'corporate firme deschidere inaugurare magazin mall petrecere firma lansare eveniment business teambuilding' },
    { title: 'Gender Reveal', img: 'gender.png', url: '/decoratiuni-baloane-gender-reveal-bucuresti/', desc: 'Descoperă surpriza într-un decor memorabil.', kw: 'gender reveal sexul copilului baiat sau fata boy girl explozie fum balon negru intepat' },
    { title: 'Baby Shower', img: 'babyshower.png', url: '/decoratiuni-baloane-baby-shower-bucuresti/', desc: 'Sărbătorește apropierea venirii pe lume a bebelușului.', kw: 'baby shower sarcina gravida petrecere mamica bebe vine bebelus' },
    { title: 'Aniversări Copii', img: 'aniversari.png', url: '/decoratiuni-baloane-aniversare-copii-bucuresti/', desc: 'Decoruri tematice pentru petreceri de neuitat.', kw: 'aniversari zi de nastere onomastica copil ani gradinita scoala petrecere baietel fetita' },
    { title: 'Majorat (18 ani)', img: 'majorat.png', url: '/decoratiuni-baloane-majorat-bucuresti/', desc: 'Setup-uri senzaționale pentru o vârstă specială.', kw: 'majorat 18 ani club adult petrecere tineri adolescenti vip party' },
    { title: 'Absolvire & Școală', img: 'absolvire.png', url: '/decoratiuni-baloane-bucuresti/', desc: 'Cadrul perfect pentru o nouă etapă.', kw: 'absolvire scoala gradinita banchet clasa promotia serbare sfarsit de an festivitati clasa a 8 a' }
];`;

content = content.replace(/const services = \[[\s\S]*?\];/, servicesReplacement);

const scriptReplacement = `<script>
  function normalizeText(text) {
    if(!text) return "";
    return text.normalize("NFD").replace(/[\\u0300-\\u036f]/g, "").toLowerCase().replace(/[^a-z0-9\\s]/g, " ").replace(/\\s+/g, " ").trim();
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

  function initGSS() {
    const triggers = document.querySelectorAll('.gss-trigger');
    const overlay = document.getElementById('global-service-search-overlay');
    const closeBtn = document.getElementById('gss-close-btn');
    const input = document.getElementById('gss-search-input');
    const cards = Array.from(document.querySelectorAll('.gss-card'));
    const noResults = document.getElementById('gss-no-results');
    const grid = document.getElementById('gss-grid');
    const voiceBtn = document.getElementById('gss-voice-btn');
    const voiceStatus = document.getElementById('gss-voice-status');

    if (!overlay || !input) return;

    function openGSS() {
      overlay.classList.add('open');
      document.body.style.overflow = 'hidden';
      setTimeout(() => input.focus(), 100);
      filterCards('');
    }

    function closeGSS() {
      overlay.classList.remove('open');
      document.body.style.overflow = '';
      input.value = '';
      filterCards('');
      if(voiceStatus) voiceStatus.style.display = 'none';
    }

    if(voiceBtn && ('webkitSpeechRecognition' in window || 'SpeechRecognition' in window)) {
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        const recognition = new SpeechRecognition();
        recognition.lang = 'ro-RO';
        recognition.interimResults = false;
        recognition.maxAlternatives = 1;

        voiceBtn.addEventListener('click', () => {
            voiceStatus.style.display = 'block';
            voiceStatus.textContent = '🎤 Ascult... (spune ce cauți)';
            voiceBtn.classList.add('listening');
            try { recognition.start(); } catch(e) {}
        });

        recognition.onresult = (event) => {
            const transcript = event.results[0][0].transcript;
            input.value = transcript;
            voiceStatus.textContent = 'Am auzit: "' + transcript + '"';
            setTimeout(() => { voiceStatus.style.display = 'none'; }, 3000);
            filterCards(transcript);
        };
        recognition.onerror = (event) => {
            voiceStatus.textContent = 'Nu am putut auzi. Te rugăm să tastezi.';
            voiceBtn.classList.remove('listening');
            setTimeout(() => { voiceStatus.style.display = 'none'; }, 3000);
        };
        recognition.onend = () => {
            voiceBtn.classList.remove('listening');
        };
    } else if (voiceBtn) {
        voiceBtn.style.display = 'none';
    }

    function filterCards(rawQuery) {
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

               if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
               else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
               else if (nKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 25);

               if (bestWordScore > 0) {
                   score += bestWordScore;
               } else {
                   for(let i=0; i<cardWords.length; i++) {
                       let cw = cardWords[i];
                       if (cw.includes(qw) || qw.includes(cw)) {
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
    }

    triggers.forEach(t => t.addEventListener('click', (e) => {
      e.preventDefault();
      openGSS();
    }));
    if(closeBtn) closeBtn.addEventListener('click', closeGSS);
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && overlay.classList.contains('open')) closeGSS();
    });
    overlay.addEventListener('click', (e) => {
      if (e.target === overlay) closeGSS();
    });
    input.addEventListener('input', (e) => {
      filterCards(e.target.value);
    });
  }

  document.addEventListener('DOMContentLoaded', initGSS);
  document.addEventListener('astro:page-load', initGSS);
</script>`;

content = content.replace(/<script>[\s\S]*?<\/script>/, scriptReplacement);
content = content.replace(/Nu am găsit niciun serviciu cu acest nume\.\s*Încearcă alt cuvânt!/g, ''); // Ensure no old text remains

fs.writeFileSync(gssPath, content, 'utf8');
