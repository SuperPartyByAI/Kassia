import crypto from 'crypto';

function getHash(text) {
  return crypto.createHash('sha256').update(text).digest('hex');
}

async function verify() {
  const url = 'http://localhost:3050/animatori-petreceri-copii/';
  const r1 = await fetch(url);
  const t1 = await r1.text();
  const h1 = getHash(t1);

  const r2 = await fetch(url, { headers: { 'Cache-Control': 'no-cache' } });
  const t2 = await r2.text();
  const h2 = getHash(t2);

  const r3 = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' } });
  const t3 = await r3.text();
  const h3 = getHash(t3);

  console.log(`Normal: ${r1.status} - ${h1.substring(0,8)}...${h1.substring(h1.length-5)}`);
  console.log(`No-cache: ${r2.status} - ${h2.substring(0,8)}...${h2.substring(h2.length-5)}`);
  console.log(`Googlebot: ${r3.status} - ${h3.substring(0,8)}...${h3.substring(h3.length-5)}`);

  if (h1 === h2 && h2 === h3) {
    console.log("PASS: SSR Hashes match perfectly");
  } else {
    console.log("FAIL: Hashes differ");
  }
  
  // Test /admin
  const rAdmin = await fetch('http://localhost:3050/admin/login/');
  console.log(`/admin/login/ status: ${rAdmin.status}`);
  
  // Test Breadcrumb "Acasă"
  const hasAcasa = t1.includes('"name":"Acasă"');
  console.log('Breadcrumb has Acasă:', hasAcasa);

  // Test 970 recenzii
  const hasRecenzii = t1.includes('970 recenzii');
  console.log('Visible review text exists:', hasRecenzii);
  
  // Test LocalBusiness logo
  const hasLogo = t1.includes('favicon.svg');
  console.log('LocalBusiness logo uses favicon.svg:', hasLogo);
}
verify();
