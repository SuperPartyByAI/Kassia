// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import node from '@astrojs/node';

export default defineConfig({
  output: 'server',
  adapter: node({
    mode: 'standalone'
  }),
  server: {
    port: 3005,
    host: true
  },
  site: 'https://www.kassia.ro',
  trailingSlash: 'ignore',
  vite: {
    plugins: [tailwindcss()]
  }
});
