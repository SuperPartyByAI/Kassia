// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import node from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
  output: 'server',
  adapter: node({
    mode: 'standalone'
  }),
  server: {
    port: 3005,
    host: true
  },
  vite: {
    plugins: [tailwindcss()]
  },
  redirects: {
    '/pachete-animatori-copii-bucuresti/': '/preturi-animatori-copii-bucuresti/',
    '/animatori-copii-berceni-ilfov': '/animatori-petreceri-copii-berceni/',
    '/animatori-copii-pipera-bucuresti': '/animatori-petreceri-copii-voluntari/',
    '/animatori-copii-pipera-bucuresti/': '/animatori-petreceri-copii-voluntari/'
  }
});
