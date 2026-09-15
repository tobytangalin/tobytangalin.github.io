# AGENTS.md

## What this is
- Hugo site (PaperMod theme) published from `github.com/tobytangalin/tobytangalin.github.io`, branch `main`, custom domain `sitegrammar.com` (`static/CNAME`). Push to `main` deploys via GitHub Actions (`.github/workflows/deploy.yml`).
- Migrated from a static WordPress export; the old generated HTML was removed in the rebuild (recoverable at tag `rollback-pre-hugo`). `static/` holds the frozen copies we intentionally keep — don't recreate the retired root export.

## Build & preview
- Hugo **extended** required; CI pins `0.166.0`. If `hugo` isn't on PATH, download the extended binary matching `.github/workflows/deploy.yml`.
- After cloning: `git submodule update --init --recursive`, or Hugo can't find the theme.
- Preview: `hugo server -D` (then open `http://localhost:1313/`). `-D` includes drafts.
- Production build **must** include the feed step:
  ```bash
  hugo --minify --gc && bash scripts/relocate-feeds.sh public
  ```
  Hugo's output-format `path` is global, so the relocator copies `index.xml` to the legacy `/feed/index.xml` paths. Without it, old feed URLs 404.

## Content model
- Posts: `content/blog/<slug>.md`. The section `blog` uses `[permalinks] blog = "/:slug/"`, so URLs are root-level: `/my-post/`.
- **`slug:` front matter is required on every post.** Hugo derives `.Slug` from the *title* otherwise, which silently changes URLs (e.g. `10.19` instead of `10-19`). Preserve the WordPress slug exactly.
- `categories: ["uncategorized"]` produces `/category/uncategorized/` (taxonomy permalink).
- `robotsNoIndex: true` + `sitemap: {disable: true}` for noindex pages. The wedding itinerary is additionally unlisted: `build: {list: never}` + `outputs: ["HTML"]` keep its URL working for guests while removing it from all listings, feeds and pagination.
- New posts: `hugo new content blog/my-post.md` (uses `archetypes/blog.md`; ships `draft: true`). See `AUTHORING.md`.

## Preserve these (SEO/migration invariants)
- Legacy image URLs: `static/wp-content/uploads/**` must keep exact paths (post bodies reference them, incl. `srcset` variants).
- `static/wp-json/**` is a frozen copy of the dead REST API — byte-identical, do not regenerate. Exception: `wp/v2/posts/670/` (the wedding itinerary) was deleted as a privacy measure.
- `static/comments/feed/`, `static/*-sitemap.xml`, `static/sitemap_index.xml`, `static/main-sitemap.xsl` are frozen legacy files.
- `static/author/christophertangalingmail-com/**` are meta-refresh stubs to `/blog/`; the author archive was intentionally dropped (GitHub Pages can't issue 301s).
- `data/comments/<slug>.json` is the archived WordPress comment threads (59 across 4 posts), rendered read-only by `layouts/_partials/comments.html` + `comment.html`. The `#comment-N` anchors are referenced by the frozen `static/comments/feed/`; don't delete or regenerate.
- Post bodies migrated from WordPress keep `<figure>`/`<table>` as raw HTML (Goldmark `unsafe = true`), styled by `assets/css/extended/custom.css`.

## Don't edit
- `public/`, `resources/` (build output, gitignored).
- `themes/PaperMod` (git submodule pinned at master `d376885`; the `v8.0` tag is **incompatible with Hugo 0.166** — missing `get-page-images` partial. Don't "upgrade" it to `v8.0`. Check out a commit, never edit in place).
- Generated feeds, `sitemap.xml`, and listing pages — derive from `content/`.

## Conventions
- `.gitattributes` enforces LF; don't commit CRLF.
- Comments are closed (no backend). `comments: true` on a post renders any archived thread from `data/comments/` plus a "Comments are closed" LinkedIn contact block (`layouts/_partials/comments.html`). Don't reintroduce `wp-comments-post.php` forms.
- Analytics is GA4 `G-DS881CXGTX` via Hugo's `googleAnalytics` config (no MonsterInsights). GA4, OpenGraph, Twitter and JSON-LD only render when `hugo.IsProduction` (`hugo`/CI builds), not `hugo server` — don't set `params.env = "production"`, which would leak local preview hits to the live GA property. `privacy.googleAnalytics.respectDoNotTrack = true` is set.

## Privacy
- The repo is **public**. Unlisting a page (`build.list: never`, no RSS/sitemap) hides it from the rendered site only — the content stays in the repo and git history. Treat everything committed as public.
