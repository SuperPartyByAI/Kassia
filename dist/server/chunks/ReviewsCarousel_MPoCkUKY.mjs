import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aM as maybeRenderHead, a5 as addAttribute, aY as renderTemplate } from './params-and-props_COoDNZnO.mjs';
import 'clsx';

const $$ReviewsCarousel = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$ReviewsCarousel;
  const { sector = null } = Astro2.props;
  let reviews = [
    {
      id: "rev_001",
      name: "Andreea M.",
      date: "Acum 8 ani",
      service: "animatori",
      text: "Animatoarea Elsa a fost minunată, copiii au fost captivați de jocuri și dansuri pe tot parcursul petrecerii.",
      avatar: "/images/avatars/avatar_001.jpg"
    },
    {
      id: "rev_002",
      name: "Mihai C.",
      date: "Acum 8 ani",
      service: "animatori",
      text: "Spiderman a ținut toți băieții în priză cu concursuri și activități interactive super amuzante.",
      avatar: "/images/avatars/avatar_002.jpg"
    },
    {
      id: "rev_003",
      name: "Elena R.",
      date: "Acum 7 ani",
      service: "baloane",
      text: "Arcada de baloane organică a fost deosebită, culorile s-au potrivit perfect cu tema aleasă de noi.",
      avatar: "/images/avatars/avatar_003.jpg"
    },
    {
      id: "rev_004",
      name: "Raluca I.",
      date: "Acum 7 ani",
      service: "animatori",
      text: "Pictura pe față a fost realizată cu mult talent și vopsele sigure pentru piele. Copiii au fost încântați!",
      avatar: "/images/avatars/avatar_004.jpg"
    },
    {
      id: "rev_005",
      name: "Alexandru V.",
      date: "Acum 6 ani",
      service: "animatori",
      text: "Modelajul de baloane sub formă de săbii și animale a adus multă bucurie tuturor copiilor prezenți.",
      avatar: "/images/avatars/avatar_005.jpg"
    },
    {
      id: "rev_006",
      name: "Ioana S.",
      date: "Acum 6 ani",
      service: "animatori",
      text: "Mini-disco plin de energie, copiii au dansat și s-au distrat pe cinste cu animatoarea preferată.",
      avatar: "/images/avatars/avatar_006.jpg"
    },
    {
      id: "rev_007",
      name: "George R.",
      date: "Acum 5 ani",
      service: "animatori",
      text: "Animatorul a fost extrem de răbdător și a știut cum să implice chiar și copiii mai timizi în jocuri.",
      avatar: "/images/avatars/avatar_007.jpg"
    },
    {
      id: "rev_008",
      name: "Simona A.",
      date: "Acum 5 ani",
      service: "animatori",
      text: "Jocurile interactive de grup au fost adaptate perfect pentru vârsta celor mici. Mulțumim Kassia!",
      avatar: "/images/avatars/avatar_008.jpg"
    },
    {
      id: "rev_009",
      name: "Ștefan G.",
      date: "Acum 4 ani",
      service: "baloane",
      text: "Panoul foto decorat cu baloane pastelate a fost punctul de atracție la botezul fetiței noastre.",
      avatar: "/images/avatars/avatar_009.jpg"
    },
    {
      id: "rev_010",
      name: "Alina D.",
      date: "Acum 4 ani",
      service: "animatori",
      text: "Rapunzel a fost o prezență caldă și dulce, fetițele au fost fascinate de povestea ei.",
      avatar: "/images/avatars/avatar_010.jpg"
    },
    {
      id: "rev_011",
      name: "Andrei R.",
      date: "Acum 3 ani",
      service: "animatori",
      text: "Mascota Mickey Mouse a făcut o mare surpriză tuturor copiilor la momentul tortului. Superb!",
      avatar: "/images/avatars/avatar_011.jpg"
    },
    {
      id: "rev_012",
      name: "Diana M.",
      date: "Acum 3 ani",
      service: "animatori",
      text: "O petrecere foarte reușită, animatorii au venit pregătiți cu recuzită diversă și au făcut atmosferă.",
      avatar: "/images/avatars/avatar_012.jpg"
    },
    {
      id: "rev_013",
      name: "Cătălin D.",
      date: "Acum 2 ani",
      service: "animatori",
      text: "Am avut doi animatori energici care au organizat jocuri dinamice și concursuri foarte distractive.",
      avatar: "/images/avatars/avatar_013.jpg"
    },
    {
      id: "rev_014",
      name: "Mihaela L.",
      date: "Acum 2 ani",
      service: "animatori",
      text: "Dansurile și coregrafiile de la mini-disco au ridicat toți copiii în picioare. Recomand cu drag!",
      avatar: "/images/avatars/avatar_014.jpg"
    },
    {
      id: "rev_015",
      name: "Daniel P.",
      date: "Acum un an",
      service: "baloane",
      text: "Decorul de baloane pentru evenimentul nostru a fost executat impecabil și montat la timp.",
      avatar: "/images/avatars/avatar_015.jpg"
    },
    {
      id: "rev_016",
      name: "Laura O.",
      date: "Acum un an",
      service: "animatori",
      text: "Un program de animație excelent care a ținut copiii ocupați și fericiți timp de 3 ore în șir.",
      avatar: "/images/avatars/avatar_016.jpg"
    },
    {
      id: "rev_017",
      name: "Marius A.",
      date: "Acum o lună",
      service: "animatori",
      text: "Animatorul costumat în pirat a organizat o vânătoare de comori captivantă pentru copii.",
      avatar: "/images/avatars/avatar_017.jpg"
    },
    {
      id: "rev_018",
      name: "Adina B.",
      date: "Acum 3 săptămâni",
      service: "animatori",
      text: "Costumele animatorilor au fost curate, îngrijite și foarte fidele personajelor iubite de copii.",
      avatar: "/images/avatars/avatar_018.jpg"
    },
    {
      id: "rev_019",
      name: "Bogdan V.",
      date: "Acum 2 săptămâni",
      service: "baloane",
      text: "Ghirlandele din baloane organice au fost extrem de bine fixate și au rezistat perfect toată seara.",
      avatar: "/images/avatars/avatar_019.jpg"
    },
    {
      id: "rev_020",
      name: "Bianca C.",
      date: "Acum o săptămână",
      service: "animatori",
      text: "Recomand Kassia Events pentru punctualitate, energie pozitivă și animatori deosebiți!",
      avatar: "/images/avatars/avatar_020.jpg"
    }
  ];
  if (sector) {
    const localReviews = {
      "1": [
        { id: "rev_sec_1", name: "Ioana D.", date: "Acum o săptămână", text: "Am chemat-o pe Elsa la un restaurant din zona Floreasca, Sector 1, totul a fost excepțional, recomand cu drag!", avatar: "/images/avatars/avatar_010.jpg" },
        { id: "rev_sec_2", name: "Radu M.", date: "Acum 2 săptămâni", text: "Petrecerea din Băneasa a fost salvată de Spiderman, a știut cum să țină toți cei 15 copii super activi.", avatar: "/images/avatars/avatar_009.jpg" }
      ],
      "2": [
        { id: "rev_sec_1", name: "Cristina P.", date: "Acum 3 zile", text: "Au ajuns foarte rapid la locul de joacă de lângă Obor, Sector 2. Fără taxe ascunse și super profi!", avatar: "/images/avatars/avatar_016.jpg" },
        { id: "rev_sec_2", name: "Marian V.", date: "Acum o săptămână", text: "Mascota Mickey a fost surpriza perfectă la botezul băiețelului nostru de la restaurantul din Tei.", avatar: "/images/avatars/avatar_011.jpg" }
      ],
      "3": [
        { id: "rev_sec_1", name: "Alina B.", date: "Acum 5 zile", text: "Copiii s-au distrat maxim la petrecerea organizată acasă, în Titan. Mulțumim Kassia pentru punctualitate în Sectorul 3!", avatar: "/images/avatars/avatar_004.jpg" },
        { id: "rev_sec_2", name: "Victor S.", date: "Acum 2 săptămâni", text: "Batman a venit în Vitan direct la grădiniță și a făcut un show cu tot cu baloane modelate.", avatar: "/images/avatars/avatar_013.jpg" }
      ],
      "4": [
        { id: "rev_sec_1", name: "Diana I.", date: "Acum o săptămână", text: "Ne-am bucurat enorm că nu au perceput taxe de transport în Berceni, Sector 4. Servicii ireproșabile!", avatar: "/images/avatars/avatar_020.jpg" },
        { id: "rev_sec_2", name: "Sorin C.", date: "Acum 3 săptămâni", text: "Pictura pe față a rezistat la toți copiii invitați la petrecerea noastră din zona Tineretului.", avatar: "/images/avatars/avatar_007.jpg" }
      ],
      "5": [
        { id: "rev_sec_1", name: "Mirela O.", date: "Acum 2 zile", text: "Un mini-disco superb în Cotroceni, animatoarea a fost plină de viață și a animat instant toată trupa.", avatar: "/images/avatars/avatar_006.jpg" },
        { id: "rev_sec_2", name: "Adrian N.", date: "Acum o lună", text: "Foarte ok raportul calitate-preț pentru Sectorul 5 (Rahova), au venit exact cu ce au promis.", avatar: "/images/avatars/avatar_002.jpg" }
      ],
      "6": [
        { id: "rev_sec_1", name: "Elena F.", date: "Acum o săptămână", text: "Am organizat în Drumul Taberei la un loc de joacă. Au colaborat minunat cu personalul locației!", avatar: "/images/avatars/avatar_003.jpg" },
        { id: "rev_sec_2", name: "Vlad T.", date: "Acum 4 zile", text: "Pirații au cucerit toți copiii din Militari Residence, au venit la timp deși traficul din Sectorul 6 era infernal.", avatar: "/images/avatars/avatar_005.jpg" }
      ]
    };
    if (localReviews[sector]) {
      reviews[0] = { ...reviews[0], ...localReviews[sector][0] };
      reviews[1] = { ...reviews[1], ...localReviews[sector][1] };
    }
  }
  return renderTemplate`${maybeRenderHead()}<section class="aprecieri-clienti bg-white" data-astro-cid-rmfhop62> <div class="container" data-astro-cid-rmfhop62> <h3 class="section-heading text-center" data-astro-cid-rmfhop62>Ce spun clienții noștri</h3> </div> <div class="aprecieri-slider" style="margin-top: 2rem;" data-astro-cid-rmfhop62> <div class="aprecieri-track" data-astro-cid-rmfhop62> ${reviews.map((review) => renderTemplate`<div class="apreciere-item"${addAttribute(review.id, "data-review-id")} data-astro-cid-rmfhop62> <div class="apreciere-head" data-astro-cid-rmfhop62> <div class="apreciere-avatar" data-astro-cid-rmfhop62> <img${addAttribute(review.avatar, "src")}${addAttribute(review.name, "alt")} width="44" height="44" loading="lazy" style="width: 100%; height: 100%; object-fit: cover;" data-astro-cid-rmfhop62> </div> <div class="apreciere-info" data-astro-cid-rmfhop62> <h4 class="apreciere-nume" data-astro-cid-rmfhop62>${review.name}</h4> <span class="apreciere-data" data-astro-cid-rmfhop62>${review.date}</span> </div> <div class="apreciere-status" style="display: flex; align-items: center; gap: 4px; font-size: 0.75rem; color: #10b981; font-weight: 600; background: rgba(16, 185, 129, 0.08); padding: 4px 8px; border-radius: 12px; border: 1px solid rgba(16, 185, 129, 0.15);" data-astro-cid-rmfhop62> <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" width="12" height="12" stroke-width="2.5" data-astro-cid-rmfhop62> <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" data-astro-cid-rmfhop62></path> </svg> <span data-astro-cid-rmfhop62>Verificat</span> </div> </div> <div class="apreciere-stele" data-astro-cid-rmfhop62> ${"★★★★★".split("").map((star) => renderTemplate`<span class="r-star" data-astro-cid-rmfhop62>${star}</span>`)} </div> <p class="apreciere-text" data-astro-cid-rmfhop62>"${review.text}"</p> </div>`)} </div> </div> </section>`;
}, "/opt/kassia-site/src/components/ReviewsCarousel.astro", void 0);

export { $$ReviewsCarousel as $ };
