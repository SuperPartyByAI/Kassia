import fs from 'fs';
const file = 'src/components/GlobalServiceSearch.astro';

const code = `---
const services = [
    { title: 'Animatori pe Picioroange', img: 'picioroange.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Personaje pe catalige (picioroange), atracția supremă pentru spații deschise.' },
    { title: 'Spectacole de Magie', img: 'magie.png', url: '/animatori-petreceri-copii/', desc: 'Trucuri captivante cu un magician profesionist care îi vor lăsa uimiți.' },
    { title: 'Gheață Carbonică', img: 'gheata.png', url: '/animatori-petreceri-copii/', desc: 'Experimente educative și spectaculoase cu gheață carbonică.' },
    { title: 'Statui Vivante', img: 'statui.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Apariții memorabile, elegante, perfecte pentru evenimente premium.' },
    { title: 'Ursitoare Botez & Moț', img: 'ursitoare.png', url: '/animatori-petreceri-copii/', desc: 'Spectacol emoționant cu ursitoare și text dedicat.' },
    { title: 'Vată de Zahăr', img: 'vata.png', url: '/animatori-petreceri-copii/', desc: 'Atracția dulce nelipsită, preparată proaspăt pe loc.' },
    { title: 'Aparat de Popcorn', img: 'popcorn.png', url: '/animatori-petreceri-copii/', desc: 'Gustarea crocantă adorată de absolut toți copiii.' },
    { title: 'Torturi din Dulciuri', img: 'tort.png', url: '/animatori-petreceri-copii/', desc: 'Torturi masive construite din ciocolățele Kinder și Barni.' },
    { title: 'Castele Gonflabile', img: 'gonflabile.png', url: '/animatori-petreceri-copii/', desc: 'Spații uriașe de sărit pentru energie maximă în siguranță.' },
    { title: 'Joc Piñata', img: 'pinata.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Momentul de bucurie explozivă și dulciuri garantate.' },
    { title: 'Treasure Hunt', img: 'treasure.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Aventură captivantă și căutare de comori în aer liber.' },
    { title: 'Ateliere de Creație', img: 'ateliere.png', url: '/animatori-petreceri-copii/', desc: 'Activități educative liniștite (slime, desen, pictură).' },
    { title: 'Petreceri Tematice', img: 'tematice.png', url: '/pachete-animatori-copii-bucuresti/', desc: 'Scenariu de petrecere 100% adaptat pasiunilor copiilor tăi.' },
    { title: 'Decoruri Baloane', img: 'decor.png', url: '/arcada-baloane-bucuresti/', desc: 'Arcade organice, panouri foto și buchete premium.' },
    { title: 'Închiriere Mese & Scaune', img: 'mese.png', url: '/animatori-petreceri-copii/', desc: 'Mobilier colorat (Kids Corner) la scară pentru cei mici.' },
    { title: 'Baloane de Săpun', img: 'sapun.png', url: '/animatori-petreceri-copii/', desc: 'Momente magice cu baloane gigantice de săpun.' },
    { title: 'Moș Crăciun', img: 'mos.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Distribuim magia pură a sărbătorilor cu Moș Crăciun și elfii săi.' },
    { title: 'Iepurașul de Paște', img: 'iepuras.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Însoțit de sesiuni vesele de căutare a ouălor de ciocolată.' },
    { title: 'Personaje Halloween', img: 'halloween.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Costume simpatice pentru cele mai cool petreceri de toamnă.' },
    { title: 'Cabină Foto 360', img: 'cabina.png', url: '/animatori-petreceri-copii/', desc: 'Video-uri dinamice de senzație, gata de repostat pe social media.' },
    { title: 'Foto & Video', img: 'foto.png', url: '/animatori-petreceri-copii/', desc: 'Fotografii noștri nu ratează nicio secundă din emoția petrecerii.' },

    { title: 'Animatori Petreceri Copii', img: 'decor.png', url: '/animatori-petreceri-copii/', desc: 'Profesioniști pregătiți să creeze zâmbete la orice petrecere.' },
    { title: 'Personaje & Mascote', img: 'tematice.png', url: '/personaje-petreceri-copii-bucuresti/', desc: 'Eroii și prințesele preferate aduse la viață.' },
    { title: 'Pictură pe față', img: 'ateliere.png', url: '/pictura-pe-fata-copii-bucuresti/', desc: 'Transformăm copiii în eroii lor preferați folosind culori sigure.' },
    { title: 'Modelaj Baloane', img: 'decor.png', url: '/modelaj-baloane-copii-bucuresti/', desc: 'Săbii, căței și flori din baloane modelabile colorate.' },
    { title: 'Mini-disco', img: 'cabina.png', url: '/mini-disco-copii-bucuresti/', desc: 'Atmosferă incendiară cu muzică, lumini și coregrafii.' },
    { title: 'Jocuri interactive', img: 'treasure.png', url: '/jocuri-interactive-copii-bucuresti/', desc: 'Activități energice care implică toți copiii prezenți.' },
    { title: 'Pachete Animatori', img: 'tematice.png', url: '/pachete-animatori-copii-bucuresti/', desc: 'Pachete complete cu cele mai atractive servicii incluse.' },
    
    { title: 'Arcade Baloane', img: 'decor.png', url: '/arcada-baloane-bucuresti/', desc: 'Decor spectaculos de intrare cu baloane.' },
    { title: 'Baloane cu Heliu', img: 'decor.png', url: '/baloane-heliu-bucuresti/', desc: 'Baloane plutitoare pentru un decor aerian minunat.' },
    { title: 'Panouri Foto', img: 'decor.png', url: '/panou-foto-baloane-bucuresti/', desc: 'Colțul perfect (Photo Corner) pentru amintiri instagramabile.' },
    { title: 'Perete din Baloane', img: 'decor.png', url: '/perete-baloane-bucuresti/', desc: 'Fundal masiv și impresionant realizat exclusiv din baloane.' },
    { title: 'Ghirlande Baloane', img: 'decor.png', url: '/ghirlande-baloane-bucuresti/', desc: 'Șiraguri organice și fluide pentru decor.' },
    { title: 'Stâlpi Baloane', img: 'decor.png', url: '/stalpi-baloane-bucuresti/', desc: 'Coloane din baloane pentru delimitarea spațiului.' },
    { title: 'Aranjamente Baloane', img: 'decor.png', url: '/aranjamente-baloane-bucuresti/', desc: 'Decor central pentru mese sau zone cheie.' },
    { title: 'Buchete din Baloane', img: 'decor.png', url: '/buchete-baloane-bucuresti/', desc: 'Buchete voluminoase, o surpriză perfectă.' },
    { title: 'Baloane Cifre & Litere', img: 'decor.png', url: '/baloane-cifre-litere-bucuresti/', desc: 'Personalizează petrecerea cu mesaje și vârsta.' },
    { title: 'Livrare Baloane', img: 'decor.png', url: '/livrare-baloane-bucuresti/', desc: 'Aducem bucuria direct la ușa ta.' },

    { title: 'Botez & Tăiere Moț', img: 'decor.png', url: '/decoratiuni-baloane-botez-bucuresti/', desc: 'Decoruri delicate pentru cel mai important eveniment.' },
    { title: 'Nuntă & Cununie', img: 'decor.png', url: '/decoratiuni-baloane-nunta-bucuresti/', desc: 'Aranjamente elegante pentru a celebra iubirea.' },
    { title: 'Corporate & Deschideri', img: 'decor.png', url: '/decoratiuni-baloane-corporate-bucuresti/', desc: 'Decoruri impunătoare pentru un impact maxim.' },
    { title: 'Gender Reveal', img: 'decor.png', url: '/decoratiuni-baloane-gender-reveal-bucuresti/', desc: 'Descoperă surpriza într-un decor memorabil.' },
    { title: 'Baby Shower', img: 'decor.png', url: '/decoratiuni-baloane-baby-shower-bucuresti/', desc: 'Sărbătorește apropierea venirii pe lume a bebelușului.' },
    { title: 'Aniversări Copii', img: 'decor.png', url: '/decoratiuni-baloane-aniversare-copii-bucuresti/', desc: 'Decoruri tematice pentru petreceri de neuitat.' },
    { title: 'Majorat (18 ani)', img: 'decor.png', url: '/decoratiuni-baloane-majorat-bucuresti/', desc: 'Set-up vibrant pentru petrecerea maturității.' },
    { title: 'Absolvire & Școală', img: 'decor.png', url: '/decoratiuni-baloane-absolvire-bucuresti/', desc: 'Decor festiv pentru finalul anilor de studiu.' }
];

const supabaseBaseUrl = "https://wzpsnhwrtnghndmjsqex.supabase.co/storage/v1/object/public/storefront_media/kassia/ai/";
---

<div id="global-service-search-overlay" class="gss-overlay">
  <div class="gss-modal">
    <div class="gss-header">
      <div class="gss-search-container">
        <svg class="gss-search-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
        <input type="text" id="gss-search-input" placeholder="Caută serviciul (ex: vata, magic, baloane...)" autocomplete="off" autofocus />
      </div>
      <button id="gss-close-btn" class="gss-close-btn" aria-label="Închide Căutarea">
        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
      </button>
    </div>
    
    <div class="gss-body">
      <div class="gss-grid" id="gss-grid">
        {services.map(svc => (
          <a href={svc.url} class="gss-card" data-search={svc.title.toLowerCase() + " " + svc.desc.toLowerCase()}>
            <div class="gss-img-container">
              <img src={\`\${supabaseBaseUrl}\${svc.img}\`} alt={svc.title} loading="lazy" />
            </div>
            <div class="gss-card-content">
              <h3>{svc.title}</h3>
              <p>{svc.desc}</p>
            </div>
          </a>
        ))}
      </div>
      <div id="gss-no-results" class="gss-no-results" style="display: none;">
        Nu am găsit niciun serviciu cu acest nume. Încearcă alt cuvânt!
      </div>
    </div>
  </div>
</div>

<style>
  .gss-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(15, 23, 42, 0.85);
    backdrop-filter: blur(8px);
    z-index: 100000;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 2rem 1rem;
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease, visibility 0.3s ease;
  }
  
  .gss-overlay.open {
    opacity: 1;
    visibility: visible;
  }

  .gss-modal {
    background: #f8fafc;
    width: 100%;
    max-width: 1200px;
    height: 90vh;
    border-radius: 24px;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    transform: translateY(-20px) scale(0.98);
    transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  }
  
  .gss-overlay.open .gss-modal {
    transform: translateY(0) scale(1);
  }

  .gss-header {
    background: white;
    padding: 1.5rem;
    border-bottom: 1px solid #e2e8f0;
    display: flex;
    align-items: center;
    gap: 1.5rem;
  }

  .gss-search-container {
    flex: 1;
    position: relative;
    display: flex;
    align-items: center;
  }

  .gss-search-icon {
    position: absolute;
    left: 1.25rem;
    color: #64748b;
  }

  #gss-search-input {
    width: 100%;
    background: #f1f5f9;
    border: 2px solid transparent;
    padding: 1.25rem 1.25rem 1.25rem 3.5rem;
    border-radius: 16px;
    font-size: 1.25rem;
    font-weight: 600;
    color: #0f172a;
    transition: all 0.2s;
  }
  
  #gss-search-input:focus {
    outline: none;
    background: white;
    border-color: var(--primary, #a855f7);
    box-shadow: 0 0 0 4px rgba(168, 85, 247, 0.1);
  }
  
  #gss-search-input::placeholder {
    color: #94a3b8;
    font-weight: 500;
  }

  .gss-close-btn {
    background: #f1f5f9;
    border: none;
    color: #64748b;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all 0.2s;
  }
  
  .gss-close-btn:hover {
    background: #e2e8f0;
    color: #0f172a;
    transform: rotate(90deg);
  }

  .gss-body {
    padding: 2rem;
    overflow-y: auto;
    flex: 1;
    -webkit-overflow-scrolling: touch;
  }

  .gss-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 1.5rem;
  }

  .gss-card {
    background: white;
    border-radius: 16px;
    overflow: hidden;
    border: 1px solid #e2e8f0;
    text-decoration: none;
    color: inherit;
    transition: transform 0.2s, box-shadow 0.2s;
    display: flex;
    flex-direction: column;
  }
  
  .gss-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
    border-color: #cbd5e1;
  }

  .gss-img-container {
    width: 100%;
    aspect-ratio: 1 / 1;
    background: #e2e8f0;
    overflow: hidden;
  }
  
  .gss-img-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
  }
  
  .gss-card:hover .gss-img-container img {
    transform: scale(1.05);
  }

  .gss-card-content {
    padding: 1.25rem;
    flex: 1;
    display: flex;
    flex-direction: column;
  }
  
  .gss-card-content h3 {
    margin: 0 0 0.5rem 0;
    font-size: 1.15rem;
    font-weight: 800;
    color: #0f172a;
  }
  
  .gss-card-content p {
    margin: 0;
    color: #475569;
    font-size: 0.9rem;
    line-height: 1.5;
  }

  .gss-no-results {
    text-align: center;
    padding: 4rem 1rem;
    color: #64748b;
    font-size: 1.25rem;
    font-weight: 600;
  }

  @media (max-width: 768px) {
    .gss-overlay {
      padding: 0;
    }
    .gss-modal {
      height: 100dvh;
      border-radius: 0;
    }
    .gss-header {
      padding: 1rem;
      gap: 1rem;
    }
    #gss-search-input {
      font-size: 1rem;
      padding: 1rem 1rem 1rem 3rem;
    }
    .gss-search-icon {
      left: 1rem;
      width: 20px;
      height: 20px;
    }
    .gss-close-btn {
      width: 44px;
      height: 44px;
    }
    .gss-body {
      padding: 1rem;
    }
    .gss-grid {
      grid-template-columns: 1fr;
      gap: 1rem;
    }
  }
</style>

<script>
  function initGSS() {
    const triggers = document.querySelectorAll('.gss-trigger');
    const overlay = document.getElementById('global-service-search-overlay');
    const closeBtn = document.getElementById('gss-close-btn');
    const input = document.getElementById('gss-search-input');
    const cards = document.querySelectorAll('.gss-card');
    const noResults = document.getElementById('gss-no-results');

    if (!overlay || !input) return;

    function openGSS() {
      overlay.classList.add('open');
      document.body.style.overflow = 'hidden';
      setTimeout(() => input.focus(), 100);
    }

    function closeGSS() {
      overlay.classList.remove('open');
      document.body.style.overflow = '';
      input.value = '';
      filterCards('');
    }

    function filterCards(query) {
      const q = query.toLowerCase().trim();
      let visibleCount = 0;
      
      cards.forEach((card) => {
        const searchText = card.getAttribute('data-search') || '';
        if (searchText.includes(q)) {
          card.style.display = 'flex';
          visibleCount++;
        } else {
          card.style.display = 'none';
        }
      });
      
      if (noResults) {
        noResults.style.display = visibleCount === 0 ? 'block' : 'none';
      }
    }

    triggers.forEach(t => t.addEventListener('click', (e) => {
      e.preventDefault();
      openGSS();
    }));
    
    if(closeBtn) closeBtn.addEventListener('click', closeGSS);
    
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && overlay.classList.contains('open')) {
        closeGSS();
      }
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
</script>
`;
fs.writeFileSync(file, code);
