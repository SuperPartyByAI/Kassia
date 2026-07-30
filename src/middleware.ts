import { defineMiddleware } from 'astro:middleware';

export const onRequest = defineMiddleware(async ({ request, url }, next) => {
  if (url.pathname.startsWith('/admin')) {
    const adminUser = import.meta.env.ADMIN_USER;
    const adminPass = import.meta.env.ADMIN_PASSWORD;

    if (!adminUser || !adminPass) {
      if (import.meta.env.DEV) {
        return next();
      }
      return new Response('Admin credentials not configured. Please set ADMIN_USER and ADMIN_PASSWORD in environment variables.', { status: 500 });
    }

    const basicAuth = request.headers.get('authorization');
    if (basicAuth) {
      const authValue = basicAuth.split(' ')[1];
      const [user, pwd] = atob(authValue).split(':');
      if (user === adminUser && pwd === adminPass) {
        return next();
      }
    }

    return new Response('Unauthorized', {
      status: 401,
      headers: {
        'WWW-Authenticate': 'Basic realm="Admin Panel"',
      }
    });
  }

  // Redirects
  if (url.pathname === '/personaje-petreceri-copii-bucuresti' || url.pathname === '/personaje-petreceri-copii-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/personaje-animatori-copii-bucuresti/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-sector-1' || url.pathname === '/animatori-copii-sector-1/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-1/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-bucuresti' || url.pathname === '/animatori-copii-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii/'
      }
    });
  }


  if (url.pathname === '/animatori-copii-sector-2' || url.pathname === '/animatori-copii-sector-2/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-2/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-sector-3' || url.pathname === '/animatori-copii-sector-3/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-3/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-sector-4' || url.pathname === '/animatori-copii-sector-4/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-4/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-sector-5' || url.pathname === '/animatori-copii-sector-5/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-5/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-la-evenimente-private-bucuresti' || url.pathname === '/animatori-copii-la-evenimente-private-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii/'
      }
    });
  }

  if (url.pathname === '/animatori-pentru-copii-mici-bucuresti' || url.pathname === '/animatori-pentru-copii-mici-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii/'
      }
    });
  }

  if (url.pathname === '/animatori-copii-sector-6' || url.pathname === '/animatori-copii-sector-6/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii-sector-6/'
      }
    });
  }

  if (url.pathname === '/oferta-animatori-petreceri-copii-bucuresti' || url.pathname === '/oferta-animatori-petreceri-copii-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/pachete-animatori-copii-bucuresti/'
      }
    });
  }

  if (url.pathname === '/animatori-tematici-petreceri-copii-bucuresti' || url.pathname === '/animatori-tematici-petreceri-copii-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/animatori-petreceri-copii/'
      }
    });
  }

  if (url.pathname === '/animatori-cu-mascote-petreceri-copii-bucuresti' || url.pathname === '/animatori-cu-mascote-petreceri-copii-bucuresti/') {
    return new Response(null, {
      status: 301,
      headers: {
        Location: '/mascote-petreceri-copii-bucuresti/'
      }
    });
  }

  return next();
});
