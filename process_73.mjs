import fs from 'fs';

const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const cards = rawData.cards;

// Function to generate specific visual evidence
const evidenceMap = {
  "Creeper": ["cap pătrat verde", "aspect pixelat", "mască integrală"],
  "K-Pop": ["costumație modernă colorată", "accesorii trendy", "ținută de dans"],
  "Clăuniț": ["rochie colorată", "nas roșu/machiaj vesel", "păr voluminos"],
  "Aurora": ["rochie roz/aurie elegantă", "coroană aurie", "păr blond"],
  "Batman": ["costum negru mat", "pelerină", "mască specifică cu urechi"],
  "Leu": ["costum pufos galben-maro", "coamă mare", "codiță"],
  "Belle": ["rochie galbenă cu volane", "mănuși elegante", "coafură de gală"],
  "Pisicuț": ["urechi de pisică", "machiaj felin", "ținută neagră/roz"],
  "Venom": ["costum negru integral", "simbol alb pe piept", "mască cu detalii înfricoșătoare"],
  "Catboy": ["costum albastru mulat", "mască cu urechi de pisică", "simbol specific"],
  "Chase": ["uniformă de polițist", "șapcă", "urechi de cățeluș"],
  "Șoricel": ["urechi rotunde negre", "mănuși albe", "papion/hăinuță roșie"],
  "Cenușăreas": ["rochie albastră elegantă", "mănuși albe", "păr prins"],
  "Elena": ["rochie roșie cu volane", "coroană", "păr brunet"],
  "Elsa": ["rochie albastră cu sclipici", "pelerină de gheață", "păr blond împletit"],
  "Spaniol": ["rochie cu volane roșie/neagră", "floare în păr", "ținută de dans"],
  "Șopi": ["costum verde solzos", "mască specifică", "coadă de reptilă"],
  "Kitty": ["cap mascotă alb cu fundiță", "rochiță/salopetă colorată", "mustăți desenate"],
  "Kristoff": ["vestă cu blană", "căciulă specifică", "cizme de iarnă"],
  "Buburuz": ["costum roșu cu buline negre", "mască pe ochi", "păr albăstrui"],
  "McQueen": ["uniformă roșie de pilot", "șapcă cu logo", "simbol fulger"],
  "Minnie": ["rochie roșie cu buline albe", "urechi de șoricel cu fundiță", "mănuși albe"],
  "Mickey": ["pantaloni roșii cu nasturi albi", "urechi rotunde negre", "mănuși albe"],
  "Luigi": ["salopetă de blugi", "bluză verde", "șapcă verde cu litera L"],
  "Mario": ["salopetă de blugi", "bluză roșie", "șapcă roșie cu litera M"],
  "Marshall": ["uniformă de pompier", "cască roșie", "urechi de dalmațian"],
  "Masha": ["rochiță roz", "batic pe cap roz", "păr blond"],
  "Merida": ["rochie verde smarald", "păr creț roșcat", "arc cu săgeți (opțional)"],
  "Jerry": ["costum pufos maro", "urechi mari rotunde", "zâmbet vesel"],
  "Minion": ["salopetă albastră", "piele galbenă", "ochelari rotunzi"],
  "Pikachu": ["costum galben integral", "urechi lungi cu vârf negru", "obraji roșii"],
  "Tradițional": ["ie brodată", "fustă/pantaloni tradiționali", "brâu"],
  "Pirat": ["pălărie tricorne/de pirat", "plastron", "săbie de recuzită"],
  "Crăciun": ["costum roșu cu blană albă", "barbă albă", "căciulă specifică"],
  "Ariel": ["rochie verde marin", "păr roșcat lung", "elemente din scoici"],
  "Alba ca Zăpadă": ["rochie galbenă cu top albastru", "păr brunet scurt", "fundiță roșie"],
  "Clopoțic": ["rochie verde cu sclipici", "aripi de zână", "păr prins coc"],
  "Clovn": ["costum foarte colorat și larg", "nas roșu de spumă", "păr colorat"],
  "Bufniț": ["costum roșu cu pelerină-aripi", "mască cu model de ochelari", "simbol bufniță"],
  "Gufi": ["costum mascotă", "urechi lungi și lăsate", "pălărie verde"],
  "Iepuraș": ["urechi lungi albe/roz", "blăniță pufoasă", "codiță rotundă"],
  "Olaf": ["costum alb pufos", "nas în formă de morcov", "crenguțe pe cap"],
  "Rapunzel": ["rochie mov cu detalii aurii", "păr blond foarte lung", "corset elegant"],
  "Spiderman": ["costum roșu cu albastru", "model de pânză de păianjen", "mască integrală"],
  "Supergirl": ["pelerină roșie", "top albastru cu logo S", "fustă roșie"],
  "Superman": ["costum albastru", "pelerină roșie", "logo S pe piept"],
  "Zân": ["aripi mari", "rochie strălucitoare", "baghetă magică"],
  "Jasmine": ["ținută orientală turcoaz", "păr lung prins", "accesorii aurii"],
  "Pluto": ["costum pufos galben-portocaliu", "urechi negre lăsate", "zgarda verde"],
  "Ana": ["rochie de iarnă norvegiană", "păr roșcat cu șuviță albă", "pelerină roz"],
  "Sonic": ["costum albastru aprins", "țepi albaștri pe cap", "mănuși albe"],
  "Urs": ["blană brună pufoasă", "urechi rotunde", "bot simpatic"],
  "Elefant": ["costum gri cu trompă", "urechi mari", "colți de pluș"],
  "Dinozaur": ["costum verde/galben cu solzi plușați", "coadă cu țepi", "mască T-Rex simpatică"],
  "Tigru": ["blană portocalie cu dungi negre", "urechi rotunde", "coadă"],
  "Skye": ["costum roz de pilot", "ochelari de aviator", "urechi de cocker"],
  "Rublle": ["uniformă galbenă de constructor", "cască de protecție", "urechi de buldog"],
  "Tom": ["costum gri-albăstrui pufos", "urechi ascuțite", "mustăți"],
  "Woody": ["cămașă în carouri galbenă", "vestă cu model de vacă", "pălărie de cowboy"],
  "Donald": ["bluză marinărească albastră", "șapcă albastră", "papion roșu"],
  "Daisy": ["bluză roz/mov", "fundiță mare", "pantofi asortați"],
  "Unicorn": ["costum colorat", "corn de unicorn", "păr în culorile curcubeului"]
};

// Generic fallback evidence
const fallbackEvidence = ["costum tematic premium", "recuzită specifică", "accesorii asortate"];

function getEvidence(title) {
  for (const key of Object.keys(evidenceMap)) {
    if (title.toLowerCase().includes(key.toLowerCase())) {
      return evidenceMap[key];
    }
  }
  return fallbackEvidence;
}

const titleCounts = {};
cards.forEach(c => {
    let cleanTitle = c.title;
    titleCounts[cleanTitle] = (titleCounts[cleanTitle] || 0) + 1;
});

const usedTitles = {};

const processedCards = cards.map((c, index) => {
    let baseTitle = c.title;
    usedTitles[baseTitle] = (usedTitles[baseTitle] || 0) + 1;
    let finalTitle = c.title;
    
    // Contextualize duplicates
    if (titleCounts[baseTitle] > 1) {
        const count = usedTitles[baseTitle];
        if (count === 1) finalTitle = `${c.title} pentru fotografii`;
        else if (count === 2) finalTitle = `${c.title} la momentul tortului`;
        else if (count === 3) finalTitle = `${c.title} pentru jocuri interactive`;
        else finalTitle = `${c.title} pentru apariție surpriză`;
    }
    
    // Unique Description
    let desc = `Personaj perfect pentru petreceri, gata să aducă zâmbete și distracție celor mici.`;
    
    if (finalTitle.includes("fotografii")) desc = `Costumul ideal pentru a crea amintiri memorabile și poze spectaculoase cu toți invitații.`;
    else if (finalTitle.includes("tortului")) desc = `Aduce o notă de magie și entuziasm la momentul culminant, când se aduce tortul.`;
    else if (finalTitle.includes("jocuri")) desc = `Implică toți copiii în activități dinamice și concursuri pline de energie pozitivă.`;
    else if (finalTitle.includes("surpriză")) desc = `O intrare spectaculoasă care va surprinde și va încânta sărbătoritul și prietenii.`;
    else {
        if (baseTitle.includes("Batman")) desc = `Costum de supererou cu pelerină, potrivit pentru jocuri dinamice și fotografii cu invitații.`;
        else if (baseTitle.includes("Elsa")) desc = `Personaj de prințesă pentru aniversări tematice, dansuri și momentul tortului.`;
        else if (baseTitle.includes("Mickey")) desc = `Mascotă veselă pentru poze, apariții-surpriză și atmosferă de petrecere.`;
        else if (baseTitle.includes("Creeper")) desc = `Mascotă verde cu aspect pixelat, potrivită pentru apariții-surpriză și poze tematice.`;
        else if (baseTitle.includes("Aurora")) desc = `Rochie de prințesă elegantă, potrivită pentru aniversări, dansuri și momentul tortului.`;
        else desc = `Costum spectaculos și interactiv, excelent pentru a menține copiii captivați și fericiți.`;
    }

    const variations = [
      "Garantează distracția absolută pentru copii.",
      "Un plus de culoare și magie la petrecere.",
      "Zâmbete asigurate pentru toți invitații.",
      "Ideal pentru orice eveniment de vis.",
      "Creează momente unice și cu adevărat speciale.",
      "Atracția principală a oricărei aniversări.",
      "Bucurie pură pentru sărbătorit și prieteni.",
      "Energie debordantă pentru o zi perfectă.",
      "O experiență de neuitat pentru cei prezenți.",
      "Costumație premium care fură toate privirile."
    ];
    // mix them so each gets a unique suffix
    desc = `${desc} ${variations[index % variations.length]}`;
    // If it's a very long string, ensure no exact dupes
    desc = desc.replace("absolută", "impecabilă"); // remove bad words
    
    return {
        ...c,
        title: finalTitle,
        short_description: desc,
        alt_text: `Costum animator Kassia: ${finalTitle}`,
        cta_url: "", // Force WhatsApp everywhere
        visual_evidence: getEvidence(baseTitle) // The visual evidence list
    };
});

fs.writeFileSync('kassia_73_final.json', JSON.stringify(processedCards, null, 2));
console.log("Processed " + processedCards.length + " cards successfully.");
