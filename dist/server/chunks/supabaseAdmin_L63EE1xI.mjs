import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aU as renderHead, aV as renderSlot, aY as renderTemplate } from './params-and-props_COoDNZnO.mjs';
import 'clsx';
import { createClient } from '@supabase/supabase-js';

const $$AdminLayout = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$AdminLayout;
  const { title } = Astro2.props;
  return renderTemplate`<html lang="en"> <head><meta charset="UTF-8"><meta name="viewport" content="width=device-width"><title>${title} - Kassia Admin</title>${renderHead()}</head> <body> <aside class="admin-sidebar"> <h2 style="margin-top: 0; color: var(--color-primary);">Kassia Admin</h2> <nav> <a href="/admin">Dashboard</a> <a href="/admin/pages">Pages</a> </nav> <div style="margin-top: auto; padding-top: 2rem;"> <p style="font-size: 0.8rem; color: #64748b;">TODO: Secure this panel with authentication before production.</p> </div> </aside> <main class="admin-main"> ${renderSlot($$result, $$slots["default"])} </main> </body></html>`;
}, "/Users/universparty/wa-web-launcher/kassia-site/src/layouts/AdminLayout.astro", void 0);

const supabaseUrl = "https://jrfhprnuxxfwkwjwdsez.supabase.co";
const supabaseServiceKey = "sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx";
const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey);

export { $$AdminLayout as $, supabaseAdmin as s };
