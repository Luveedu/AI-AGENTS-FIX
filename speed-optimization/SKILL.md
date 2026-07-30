---
name: speed-optimization
description: 'Elite web performance optimization for PHP-based sites. Use when analyzing PageSpeed reports, fixing render-blocking resources, optimizing CSS/JS/font delivery, reducing CLS, improving TTFB/LCP/FCP, or implementing caching strategies.'
argument-hint: 'Performance optimization task'
---

# Speed & Performance Optimization Guide

## 1. Core Philosophy

The goal is **maximum Lighthouse scores while maintaining zero regression** in design (no FOUC, no CLS, no broken layouts). Every optimization must be validated against actual PageSpeed/Web Vitals after deployment.

### Priority Order (highest impact first)
1. **Eliminate render-blocking CSS/JS** — biggest single score factor
2. **Self-host all third-party resources** — fonts, icons, libraries
3. **Serve modern formats** — woff2 over ttf, minified over raw
4. **Cache aggressively** — immutable for assets, must-revalidate for HTML
5. **Minimize requests** — combine files, remove unused code
6. **Optimize font loading** — subset to only used weights, use font-display: swap

---

## 2. Render-Blocking Resources

### CSS Strategy

**Rules:**
- **Layout-critical CSS** (`tailwind.css`, `style.css`) → render-blocking (`<link rel="stylesheet">`). These define the page layout. Making them async causes FOUC and CLS.
- **Non-layout CSS** (fonts only) → preload with `onload` swap. Fonts use `font-display: swap` and don't cause layout shifts when applied late.

**Pattern for font CSS:**
```html
<link rel="preload" href="css/fonts.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link href="css/fonts.css" rel="stylesheet"></noscript>
```

**Never use `media="print" onload="this.media='all'"` for layout CSS** — this causes visible FOUC and CLS. Only use it for non-critical CSS.

### JS Strategy

- **Move all `<script>` tags to just before `</body>`** — never in `<head>` unless critical
- **Add `defer` to non-critical scripts** (main.js) but NOT to feather icons (needs to run before DOM renders)
- **Add `data-cfasync="false"`** to all script tags to prevent Cloudflare Rocket Loader from breaking them
- **Avoid inline `<script>` blocks** in page body — consolidate into main.js

---

## 3. Font Optimization

### The Proper Font Pipeline

**Step 1:** Determine which weights are actually used by scanning the codebase:
```bash
grep -rn 'font-weight\|font-medium\|font-semibold\|font-bold' *.php css/*.css
```

**Step 2:** Get font CSS from Google Fonts API with ONLY the needed weights, using a modern browser User-Agent to get woff2 URLs:
```bash
curl -sL -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36" \
  "https://fonts.googleapis.com/css2?family=DM+Sans:wght@500;600&family=Rubik:wght@600;700&display=swap" \
  -o css/fonts.css
```

**Step 3:** Extract woff2 URLs and download them locally:
```bash
grep -oP 'url\(\K[^)]+' css/fonts.css | sort -u > /tmp/font_urls.txt
mkdir -p fonts
cd fonts && while read url; do wget -q "$url"; done < /tmp/font_urls.txt
```

**Step 4:** Rewrite fonts.css to point to local files:
```bash
sed -i 's|https://fonts.gstatic.com/s/[^/]*/[^/]*/|/fonts/|g' css/fonts.css
```

**Step 5:** Remove external preconnect/dns-prefetch for font hosts.

### Key Rules
- **Never use upset.dev or any font proxy** — they serve TTF (3-5× larger than woff2)
- **Only request weights that are actually used** — don't download 100-900 when only 500+600 are used
- **Always include `&display=swap`** in the Google Fonts URL
- **Woff2 is non-negotiable** — do not use TTF or OTF on production sites

---

## 4. Tailwind CSS Compilation

### CDN → Local Build

**Setup:**
```bash
# Create config
cat > tailwind.config.js << 'CONFIG'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./**/*.{php,html,js}'],
  theme: {
    extend: {
      fontFamily: { heading: ['Rubik', 'sans-serif'], body: ['DM Sans', 'sans-serif'] },
      colors: { navy: { 900: '#0F172A' }, electric: { 600: '#2563EB' }, ... },
      boxShadow: { '3d': '...', ... },
    },
  },
}
CONFIG

# Create input
echo '@tailwind base; @tailwind components; @tailwind utilities;' > css/input.css

# Install & build
npm init -y
npm install tailwindcss@3.4.17
npx tailwindcss -i css/input.css -o css/tailwind.css --minify
```

**After build:**
- Remove the CDN script + inline config from `head.php`
- Add `<link href="css/tailwind.css" rel="stylesheet">`
- Clean up: `rm css/input.css tailwind.config.js node_modules -rf`
- **Do NOT remove tailwind.config.js** — needed for future re-builds if classes change

### Sharing Across Domains
Build once scanning all brands' files:
```bash
npx tailwindcss -i css/input.css -o css/tailwind.css --minify \
  --content ./../virusolutionprovider.com/**/*.php \
  ./../virusolutionprovider.in/**/*.php \
  ./../datarecovercompany.com/**/*.php \
  ./../datarecoverservices.com/**/*.php
```

---

## 5. Feather Icons

### Local Download
```bash
curl -sL "https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js" \
  -o "js/feather.min.js"
```

### Loading Strategy
- **Load in footer** (not head) — icons are not needed for initial paint
- **Do NOT add `defer`** — feather.replace() must run synchronously after feather.min.js loads
- **Remove CDN reference** from head.php after downloading

---

## 6. Caching Strategy (.htaccess)

### Cache Headers Pattern
```apache
# Images, fonts (rarely change)
<FilesMatch "\.(jpg|jpeg|png|webp|gif|svg|ico|avif|woff|woff2|ttf|eot)$">
    Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

# CSS, JS (change with deployments)
<FilesMatch "\.(css|js)$">
    Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

# HTML, PHP (content pages, change frequently)
<FilesMatch "\.(html|php)$">
    Header set Cache-Control "public, max-age=10800, must-revalidate"
</FilesMatch>
```

### Key Rules
- **Immutable** flag tells the browser the file will never change — skip revalidation
- **must-revalidate** for HTML/PHP ensures fresh content after 180 minutes
- **Cloudflare edge cache** may override these — you may need to purge Cloudflare cache after changes

---

## 7. External Resources & Preconnects

### What Needs Preconnect
Only external origins that are actually used on the page. Check with:
```bash
curl -sL "https://example.com" | grep -oP 'https?://[^/"]+' | sort -u
```

### Pattern
```html
<link rel="dns-prefetch" href="https://example.com">
<link rel="preconnect" href="https://example.com" crossorigin="">
```

### Rules
- **Remove preconnects** for any resource that's been self-hosted
- **Font preconnect** must have `crossorigin` attribute (fonts are fetched via CORS)
- **Max 4 preconnect hints** — more than that is counterproductive
- **Never preconnect to something you don't use** — wastes connection slots

---

## 8. Form Handling

### SMTP / Email
- Use PHPMailer with SMTP (not `mail()` function)
- Always wrap in try-catch with `\Throwable` for fatal error safety
- **Always redirect to thank-you page regardless of email success/failure**
- Return JSON `{success: true}` for AJAX requests, redirect for regular POST

### Redirect Logic
```php
function respond($errors = [], $success = false) {
    global $isAjax;
    if ($isAjax) {
        header('Content-Type: application/json');
        echo json_encode(['success' => $success, 'errors' => $errors]);
        exit;
    }
    if ($success) {
        header('Location: thank-you.php');
    } else {
        header('Location: ' . $_SERVER['HTTP_REFERER'] ?? 'index.php');
    }
    exit;
}
```

### HTACCESS for POST
Always add `RewriteCond %{REQUEST_METHOD} !POST` to any .php extension removal rule — otherwise POST data is lost:
```apache
RewriteCond %{REQUEST_METHOD} !POST
RewriteCond %{THE_REQUEST} \s/+(.+?)\.php[\s?] [NC]
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ /%1 [R=301,L]
```

---

## 9. Cloudflare Considerations

### Rocket Loader
- Breaks scripts by adding random `type` attributes
- **Fix:** Add `data-cfasync="false"` to every `<script>` tag

### Prefetch URLs
- Requires `Link` header pointing to a `manifest.txt` + Cloudflare dashboard toggle
- Manifest must be `text/plain`

### Cache
- Cloudflare edge cache may serve stale headers after htaccess changes
- Purge Cloudflare cache after any cache-header change

---

## 10. Housekeeping

### Cleanup Checklist After Optimizations
1. ✅ Tailwind compiled locally (CDN removed)
2. ✅ Feather icons local (CDN removed)
3. ✅ Fonts self-hosted (woff2, only used weights)
4. ✅ AOS library removed
5. ✅ Vanilla-tilt library removed
6. ✅ Version query strings removed (`?v=3`)
7. ✅ All JS moved to footer
8. ✅ `data-cfasync="false"` on all script tags
9. ✅ Empty/invalid `<script>` blocks removed from all pages
10. ✅ CSS/JS 1-year immutable cache
11. ✅ HTML/PHP 180-minute cache with must-revalidate
12. ✅ Render-blocking minimized (fonts async, layout CSS blocking)
13. ✅ Form AJAX/redirect logic bulletproof
14. ✅ Preconnects only for actual external origins
15. ✅ Broke CLS by keeping layout CSS render-blocking

### Common Pitfalls
- **`respond()` function must be used** for both AJAX and regular form responses — don't replace with hard redirect
- **Fonts don't cause CLS** with `font-display: swap` — but main CSS does if loaded async
- **`media="print"` pattern causes FOUC** — use `rel="preload"` instead for non-critical CSS
- **Cloudflare caches old page versions** — always use `?nocache=$(date +%s)` when testing changes
