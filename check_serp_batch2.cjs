require('dotenv').config({path: '.env.local'});

async function checkSERP() {
  const apiKey = process.env.SERPER_API_KEY;
  if (!apiKey) {
    console.log("SERPER_API_KEY lipsește");
    return;
  }

  const queries = [
    "animatori tematica dinozauri bucuresti",
    "animatori tematica unicorn bucuresti",
    "animatori tematica jungla bucuresti",
    "animatori tematica spatiu bucuresti"
  ];

  const results = {};

  for (const q of queries) {
    const res = await fetch("https://google.serper.dev/search", {
      method: "POST",
      headers: {
        "X-API-KEY": apiKey,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ q: q, gl: "ro", hl: "ro", num: 10 })
    });
    const data = await res.json();
    
    let kassiaPos = "Not in Top 10";
    let leader = data.organic && data.organic.length > 0 ? data.organic[0].link : "N/A";
    
    if (data.organic) {
      for (let i = 0; i < data.organic.length; i++) {
        if (data.organic[i].link.includes("kassia.ro")) {
          kassiaPos = i + 1;
          break;
        }
      }
    }
    
    results[q] = {
      date: new Date().toISOString(),
      kassiaPos: kassiaPos,
      leader: leader
    };
  }

  console.log(JSON.stringify(results, null, 2));
}

checkSERP();
