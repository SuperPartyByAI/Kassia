const fs = require('fs');
const glob = require('glob');
const files = glob.sync('src/**/*.astro');
for(const f of files) {
  let content = fs.readFileSync(f, 'utf8');
  const old = content;
  content = content.replace(/onerror="this\.style\.display='none'"/g, '');
  content = content.replace(/onerror="this\.parentElement\.style\.display='none'"/g, '');
  if (old !== content) {
     fs.writeFileSync(f, content);
     console.log('Fixed', f);
  }
}
