const SITE_ORIGIN = 'https://www.kassia.ro';

const RESERVED_FILE_ROUTES = new Set([
  '/robots.txt',
  '/sitemap.xml',
  '/sitemap-index.xml'
]);

// All aliases are normalized before lookup, so slash and no-slash requests
// resolve to the same permanent redirect without duplicate configuration.
const LEGACY_REDIRECTS = new Map([
  ['/blog/petrecere-copii-in-ilfov-ghid/', '/animatori-petreceri-copii/'],
  ['/animatori-copii-berceni-ilfov/', '/animatori-petreceri-copii-berceni/'],
  ['/pachete-animatori-copii-bucuresti/', '/preturi-animatori-copii-bucuresti/'],
  ['/animatori-copii-floreasca/', '/animatori-petreceri-copii-floreasca/'],
  ['/animatori-copii-bucuresti/', '/animatori-petreceri-copii-bucuresti/'],
  ['/animatori-copii-sector-1/', '/animatori-petreceri-copii-sector-1/'],
  ['/animatori-copii-sector-2/', '/animatori-petreceri-copii-sector-2/'],
  ['/animatori-copii-sector-3/', '/animatori-petreceri-copii-sector-3/'],
  ['/animatori-copii-sector-4/', '/animatori-petreceri-copii-sector-4/'],
  ['/animatori-copii-sector-5/', '/animatori-petreceri-copii-sector-5/'],
  ['/animatori-copii-sector-6/', '/animatori-petreceri-copii-sector-6/'],
  ['/personaje-petreceri-copii-bucuresti/', '/personaje-animatori-copii-bucuresti/'],
  ['/animatori-cu-mascote-petreceri-copii-bucuresti/', '/mascote-petreceri-copii-bucuresti/'],
  ['/pachet-animator-si-mascota-bucuresti/', '/preturi-animatori-copii-bucuresti/'],
  ['/animatori-copii-la-evenimente-private-bucuresti/', '/animatori-petreceri-copii/'],
  ['/animatori-pentru-copii-mici-bucuresti/', '/animatori-petreceri-copii/']
]);

const KNOWN_GONE_PATHS = new Set([
  '/sitemap-index.xml',
  '/sitemap-index.xml/',
  '/sitemap_index.xml',
  '/sitemap_index.xml/'
]);

const GONE_PAGE_STATUSES = new Set([
  'archived',
  'deleted',
  'gone',
  'removed',
  'retired'
]);

const FILE_LIKE_PATH = /\/[^/]+\.[a-z0-9]{1,12}\/?$/i;
const FORBIDDEN_ENCODED_BYTES = /%(?:00|2f|5c)/i;

function stripQueryAndHash(value) {
  const stringValue = String(value || '/');
  const boundary = stringValue.search(/[?#]/);
  return boundary === -1 ? stringValue : stringValue.slice(0, boundary);
}

function normalizeRequestPath(value) {
  let pathname = stripQueryAndHash(value).trim() || '/';

  if (pathname.includes('\\') || pathname.includes('\0') || FORBIDDEN_ENCODED_BYTES.test(pathname)) {
    return null;
  }

  if (!pathname.startsWith('/')) pathname = `/${pathname}`;
  pathname = pathname.replace(/\/{2,}/g, '/');

  let decoded;
  try {
    decoded = decodeURI(pathname);
  } catch {
    return null;
  }

  const decodedSegments = decoded.split('/').filter(Boolean);
  if (
    decodedSegments.some((segment) =>
      segment === '.' ||
      segment === '..' ||
      segment.includes('\0') ||
      segment.includes('\\')
    )
  ) {
    return null;
  }

  if (pathname === '/') return '/';

  const withoutTrailingSlash = pathname.endsWith('/') ? pathname.slice(0, -1) : pathname;
  if (RESERVED_FILE_ROUTES.has(withoutTrailingSlash)) return withoutTrailingSlash;

  if (FILE_LIKE_PATH.test(pathname)) {
    return pathname.endsWith('/') ? pathname.slice(0, -1) : pathname;
  }

  return pathname.endsWith('/') ? pathname : `${pathname}/`;
}

function appendSearch(target, search = '') {
  if (!search) return target;
  return `${target}${String(search).startsWith('?') ? search : `?${search}`}`;
}

function getLegacyRedirect(value) {
  const normalized = normalizeRequestPath(value);
  return normalized ? LEGACY_REDIRECTS.get(normalized) || null : null;
}

function isKnownGonePath(value) {
  const raw = stripQueryAndHash(value);
  const normalized = normalizeRequestPath(value);
  return KNOWN_GONE_PATHS.has(raw) || Boolean(normalized && KNOWN_GONE_PATHS.has(normalized));
}

function isGonePageStatus(value) {
  return GONE_PAGE_STATUSES.has(String(value || '').trim().toLowerCase());
}

function isFileLikePath(value) {
  const normalized = normalizeRequestPath(value);
  return Boolean(normalized && FILE_LIKE_PATH.test(normalized));
}

function isReservedFileRoute(value) {
  const normalized = normalizeRequestPath(value);
  return Boolean(normalized && RESERVED_FILE_ROUTES.has(normalized));
}

function buildSelfCanonical(value) {
  const normalized = normalizeRequestPath(value);
  if (!normalized || isFileLikePath(normalized)) return null;
  return `${SITE_ORIGIN}${normalized}`;
}

function isSitemapEligiblePath(value) {
  const normalized = normalizeRequestPath(value);
  if (!normalized || isFileLikePath(normalized)) return false;
  if (normalized === '/404/' || normalized === '/410/' || normalized === '/503/') return false;
  if (LEGACY_REDIRECTS.has(normalized) || isKnownGonePath(normalized)) return false;
  if (normalized.startsWith('/admin/') || normalized.startsWith('/api/') || normalized.startsWith('/_')) return false;
  return true;
}

function normalizePriority(value) {
  if (value === null || value === undefined || value === '') return '0.5';
  const parsed = Number(value);
  if (!Number.isFinite(parsed)) return '0.5';
  return Math.min(1, Math.max(0, parsed)).toFixed(1);
}

function normalizeLastmod(value) {
  if (!value) return null;
  const parsed = new Date(value);
  return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString();
}

function xmlEscape(value) {
  return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

export { SITE_ORIGIN as S, appendSearch as a, buildSelfCanonical as b, isGonePageStatus as c, isKnownGonePath as d, isReservedFileRoute as e, isSitemapEligiblePath as f, getLegacyRedirect as g, normalizePriority as h, isFileLikePath as i, normalizeRequestPath as j, normalizeLastmod as n, xmlEscape as x };
