require('dotenv').config();
module.exports = {
  apps: [
    {
      name: 'kassia-site',
      script: './dist/server/entry.mjs',
      env: {
        NODE_ENV: 'production',
        PORT: 3050,
        HOST: '127.0.0.1',
        PUBLIC_SITE_ENV: 'production',
        PUBLIC_SITE_URL: 'https://www.kassia.ro',
        SUPABASE_SERVICE_ROLE_KEY: process.env.SUPABASE_SERVICE_ROLE_KEY
      }
    }
  ]
};
