import { ak as defineMiddleware, b1 as sequence } from './chunks/params-and-props_COoDNZnO.mjs';
import '@astrojs/internal-helpers/path';
import 'piccolore';
import 'clsx';
import '@astrojs/internal-helpers/object';

const onRequest$1 = defineMiddleware(async ({ request, url }, next) => {
  if (url.pathname.startsWith("/admin")) {
    {
      return new Response("Admin credentials not configured. Please set ADMIN_USER and ADMIN_PASSWORD in environment variables.", { status: 500 });
    }
  }
  if (url.pathname === "/personaje-petreceri-copii-bucuresti" || url.pathname === "/personaje-petreceri-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/personaje-animatori-copii-bucuresti/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-1" || url.pathname === "/animatori-copii-sector-1/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-1/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-bucuresti" || url.pathname === "/animatori-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii/"
      }
    });
  }
  if (url.pathname === "/animatori-petreceri-copii-bucuresti" || url.pathname === "/animatori-petreceri-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-2" || url.pathname === "/animatori-copii-sector-2/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-2/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-3" || url.pathname === "/animatori-copii-sector-3/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-3/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-4" || url.pathname === "/animatori-copii-sector-4/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-4/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-5" || url.pathname === "/animatori-copii-sector-5/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-5/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-la-evenimente-private-bucuresti" || url.pathname === "/animatori-copii-la-evenimente-private-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii/"
      }
    });
  }
  if (url.pathname === "/animatori-pentru-copii-mici-bucuresti" || url.pathname === "/animatori-pentru-copii-mici-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii/"
      }
    });
  }
  if (url.pathname === "/animatori-copii-sector-6" || url.pathname === "/animatori-copii-sector-6/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii-sector-6/"
      }
    });
  }
  if (url.pathname === "/oferta-animatori-petreceri-copii-bucuresti" || url.pathname === "/oferta-animatori-petreceri-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/pachete-animatori-copii-bucuresti/"
      }
    });
  }
  if (url.pathname === "/animatori-tematici-petreceri-copii-bucuresti" || url.pathname === "/animatori-tematici-petreceri-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/animatori-petreceri-copii/"
      }
    });
  }
  if (url.pathname === "/animatori-cu-mascote-petreceri-copii-bucuresti" || url.pathname === "/animatori-cu-mascote-petreceri-copii-bucuresti/") {
    return new Response(null, {
      status: 301,
      headers: {
        Location: "/mascote-petreceri-copii-bucuresti/"
      }
    });
  }
  return next();
});

const onRequest = sequence(
	
	onRequest$1
	
);

export { onRequest };
