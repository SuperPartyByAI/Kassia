import fs from 'fs';
const specificDescriptions = JSON.parse(fs.readFileSync('specific_descriptions.json', 'utf8'));

const evidence = {};

const map = {
  "Mascotă Creeper (Minecraft)": ["cap pătrat verde", "aspect pixelat", "mască integrală Minecraft"],
  "Zoue (K-Pop Demon Hunters)": ["costumație modernă cu influențe K-Pop", "accesorii de dans", "ținută de scenă colorată"],
  "Clăuniță Veselă": ["rochie colorată", "nas roșu de clovn", "machiaj specific amuzant"],
  "Prințesa Aurora": ["rochie lungă elegantă", "coroană aurie", "păr blond coafat"],
  "Batman": ["costum negru cu detalii musculoase", "pelerină neagră lungă", "mască cu urechi ascuțite"],
  "Costum Leu": ["costum mascotă galben-maro", "coamă mare și pufoasă", "codiță de leu"],
  "Prințesa Belle": ["rochie galbenă cu volane", "mănuși elegante lungi", "trandafir roșu"],
  "Costum Pisicuță": ["costum negru/roz", "urechi de pisică", "machiaj cu mustăți felin"],
  "Venom": ["costum negru integral cu simbol alb pe piept", "mască înfricoșătoare cu detalii albe", "textură lucioasă de simbiot"],
  "Catboy (Eroi în Pijama)": ["costum albastru mulat", "mască cu urechi și detalii feline", "simbol cu cap de pisică pe piept"],
  "Chase (Patrula Cățelușilor)": ["uniformă albastră de polițist", "șapcă cu insignă", "urechi de cățeluș german"],
  "Mascotă Șoricel": ["costum mascotă cu urechi rotunde negre", "pantaloni cu nasturi", "mănuși mari albe"],
  "Prințesa Cenușăreasa": ["rochie albastră de bal", "mănuși lungi albe", "păr prins în coc elegant"],
  "Ahri (K-Pop)": ["ținută pop-star cu influențe asiatice", "accesorii scenice moderne", "machiaj vibrant"],
  "Prințesa Elena din Avalor": ["rochie roșie cu volane ample", "coroană cu pietre colorate", "păr șaten închis"],
  "Prințesa Elsa (Frozen)": ["rochie albastră cu sclipici", "capă de gheață transparentă", "păr blond împletit într-o coadă lungă"],
  "Dansatoare Spaniolă": ["rochie roșie cu volane specifice stilului flamenco", "floare în păr", "pantofi de dans"],
  "Șopi (Eroi în Pijama)": ["costum verde cu detalii solzoase", "mască cu creastă", "coadă de reptilă"],
  "Animator Hello Kitty": ["cap mascotă alb", "fundiță roșie mare pe ureche", "rochiță colorată"],
  "Kristoff (Frozen)": ["vestă gri cu detalii de blană", "căciulă specifică nordică", "cizme de iarnă"],
  "Supereroină Buburuză": ["costum roșu integral mulat", "buline negre pe tot costumul", "mască pe ochi roșie cu buline"],
  "Pilot Fulger McQueen": ["uniformă roșie de curse auto", "șapcă cu vizor", "simbolul fulger și numărul 95"],
  "Mascote Mickey și Minnie": ["costume mascotă cu urechi rotunde", "pantaloni roșii / rochie cu buline", "mănuși mari albe"],
  "Luigi": ["salopetă de blugi albastră", "bluză verde cu mâneci lungi", "șapcă verde cu litera L"],
  "Mascotă Luigi": ["mascotă cap mare", "salopetă de blugi", "șapcă verde cu litera L"],
  "Mira (K-Pop Demon Hunters)": ["ținuta pop-star urbană", "machiaj K-Pop", "accesorii trendy tineresc"],
  "Mascotă Mario": ["mascotă cap mare Mario", "salopetă de blugi", "șapcă roșie cu litera M"],
  "Marshall (Patrula Cățelușilor)": ["uniformă roșie de pompier", "cască de protecție roșie cu lanternă", "pete specifice de dalmațian"],
  "Mascotă Masha": ["rochiță tradițională roz fucsia", "batic pe cap asortat roz", "păr blond și zâmbet larg"],
  "Prințesa Merida": ["rochie verde-smarald lungă", "păr creț roșcat voluminios", "arc și săgeți specifice"],
  "Mascotă Șoricel Jerry": ["costum mascotă maro deschis", "urechi mari rotunjite", "codiță lungă de șoricel"],
  "Animator Minion": ["salopetă albastră", "piele/costum galben", "ochelari mari rotunzi argintii"],
  "Rochiță Minnie Mouse": ["rochie roșie cu buline albe mari", "urechi de șoricel cu fundiță", "mănuși albe"],
  "Mascotă Pikachu": ["costum galben integral de mascotă", "urechi lungi cu vârf negru", "obraji roșii evidențiați"],
  "Animator Tradițional Românesc": ["ie albă brodată tradițional", "brâu roșu / catrință", "pălărie/batic tradițional"],
  "Rumi (K-Pop Demon Hunters)": ["outfit urban street-dance", "accesorii k-pop", "frizură modernă"],
  "Prințesa Mulan": ["ținută orientală tradițională tip kimono", "păr lung negru", "rochie cu detalii roz și albastre"],
  "Scorpion (Mortal Kombat)": ["costum galben și negru tip ninja", "mască care acoperă jumătatea inferioară a feței", "capă/glugă specifică"],
  "Prințesa Peach (Super Mario)": ["rochie lungă roz cu volane", "mănuși albe lungi", "coroană aurie cu pietre prețioase"],
  "Spiderman": ["costum roșu cu albastru mulat", "model texturat de pânză de păianjen", "mască integrală cu lentile albe mari"],
  "Prințesa Elsa": ["rochie albastră lungă cu sclipici", "capă de gheață", "păr blond împletit într-o coadă"],
  "Bumblebee (Transformers)": ["costum de robot galben cu negru", "detalii mecanice și armură", "mască de autobot galbenă"],
  "Animator Mickey Mouse": ["pantaloni roșii cu doi nasturi mari", "urechi rotunde negre", "papion/sacou elegant"],
  "Mascotă Sonic": ["costum albastru aprins de mascotă", "țepi mari albaștri pe cap", "mănuși albe și pantofi roșii"],
  "Prințesa Aurora (rochie roz)": ["rochie roz lungă de bal", "coroană aurie elegantă", "păr blond lung desprins"],
  "Peter Pan": ["costum verde cu tunică", "pălărie verde cu o pană roșie", "colanți și pantofi specifici elf-like"],
  "Mascotă Pikachu la momentul tortului": ["costum galben mascotă Pikachu", "urechi ascuțite cu vârf negru", "obraji roșii"],
  "Animator Skye (Patrula Cățelușilor)": ["uniformă de zbor roz", "ochelari de aviator pe cap", "urechi lungi și pufoase de cocker"],
  "Animator Prințesă Modernă": ["rochie elegantă dar modernizată", "diademă sclipitoare", "accesorii asortate"],
  "Prințesa Aurora la momentul tortului": ["rochie lungă de gală", "coroană cu detalii rafinate", "păr coafat blond"],
  "Pirat": ["pălărie tricorne de pirat", "plastron / jachetă cu nasturi", "săbie de recuzită și bandană"],
  "Prințesa Jasmine (Aladdin)": ["ținută orientală din două piese turcoaz", "păr negru lung prins în secțiuni", "accesorii și bijuterii aurii masive"],
  "Prințesa Peach (Super Mario) la momentul tortului": ["rochie roz cu volane", "mănuși albe", "coroană aurie"],
  "Costum Dovleac (Halloween)": ["costum rotunjit portocaliu", "față zâmbitoare decupată", "detalii verzi specifice codiței"],
  "Rubble (Patrula Cățelușilor)": ["uniformă de constructor galbenă", "cască de protecție galbenă", "urechi de buldog englez"],
  "Mascotă Rocky (Patrula Cățelușilor)": ["uniformă verde de reciclare", "șapcă verde", "urechi de rasă mixtă"],
  "Mascotă Scooby-Doo": ["costum mascotă maro de dog german", "pete negre", "zgardă albastră cu medalion auriu SD"],
  "Albă ca Zăpada": ["rochie galbenă cu corset albastru", "mâneci bufante cu roșu", "păr negru scurt cu fundiță roșie"],
  "Prințesa Rapunzel": ["rochie mov elegantă cu detalii corset", "păr blond extrem de lung", "floricele presărate în păr"],
  "Țestoasa Ninja (Leonardo)": ["costum cu carapace verde", "banderolă albastră peste ochi", "săbii katana (recuzită)"],
  "Costum Catwoman / Pisica Neagră": ["costum negru mulat din piele sintetică", "mască cu urechi ascuțite de pisică", "curea cu accesorii"],
  "Mascotă Spiderman": ["costum mascotă supradimensionat", "culori roșu-albastru clasice", "mască cu pânză de păianjen"],
  "Mascotă Stitch": ["costum albastru de extraterestru", "urechi mari ascuțite", "dinți și zâmbet imens"],
  "Superman": ["costum albastru mulat cu logo-ul S mare pe piept", "pelerină lungă roșie", "curea galbenă și cizme roșii"],
  "Clopoțica (Tinkerbell)": ["rochiță scurtă verde", "aripi de zână cu sclipici", "păr blond prins în coc"],
  "Mascotă Tom (Tom și Jerry)": ["costum mascotă de pisică gri", "urechi ascuțite", "burtică albă pufoasă"],
  "Vampiriță": ["rochie gotică neagră și roșie", "capă cu guler înalt", "machiaj palid cu detalii specifice vampirilor"],
  "Animator Unicorn": ["costum vesel în culori pastelate/curcubeu", "corn auriu de unicorn", "coamă și coadă colorată"],
  "Animator Unicorn la momentul tortului": ["costum curcubeu", "corn de unicorn cu sclipici", "detalii colorate festive"],
  "Animator Unicorn în program de animație": ["ținută activă cu culori de unicorn", "corn pe headband", "păr colorat/curcubeu"],
  "Wednesday Addams": ["rochie neagră cu guler ascuțit alb", "păr prins în două codițe împletite", "machiaj și atitudine sobră"],
  "Mascotă Iepuraș Roz": ["costum pufos roz", "urechi lungi care atârnă", "burtică albă și coadă de vată"],
  "Animator Sonic Fată": ["costum albastru cu rochiță", "țepi albaștri și urechi", "mănuși albe specifice Sonic"]
};

// Check if any title is missing
const missing = Object.keys(specificDescriptions).filter(k => !map[k]);
if (missing.length > 0) {
    console.error("Missing evidence for: ", missing);
} else {
    fs.writeFileSync('specific_evidence.json', JSON.stringify(map, null, 2));
    console.log("specific_evidence.json generated perfectly for all 73 cards.");
}
