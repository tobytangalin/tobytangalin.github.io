# Writing a new post

The site is built with [Hugo](https://gohugo.io/) and the PaperMod theme. Each
article is a single Markdown file. The blog list, RSS feeds, sitemap, pagination
and category archive all update automatically when you add one.

## 1. Create the file

A post lives at `content/blog/<slug>.md`, and **the filename becomes the URL**
(`content/blog/my-post.md` → `https://sitegrammar.com/my-post/`).

With Hugo installed:

```bash
hugo new content blog/my-post.md
```

Or just create `content/blog/my-post.md` by hand and copy the front matter below.

## 2. Front matter

```yaml
---
title: "My Post Title"
date: 2026-09-15
lastmod: 2026-09-15
description: "One sentence shown in search results and social cards."
categories: ["uncategorized"]
comments: true          # shows any archived comments + the "Comments are closed" block
draft: true             # remove this line (or set false) to publish
# tags: ["TFT"]
# images: ["https://sitegrammar.com/wp-content/uploads/2026/09/cover.png"]
# cover:
#   image: "/wp-content/uploads/2026/09/cover.png"
#   alt: "short description of the image"
---

Your article in normal Markdown. **Bold**, [links](https://example.com),
lists, `code`, and tables all work.
```

Note: `draft: true` keeps the post out of the published site. Remove it (or set
`draft: false`) when the post is ready.

## 3. Images

Put images under `static/` and reference them with a leading slash:

```markdown
![alt text](/images/my-picture.png)
```

The old WordPress images live at `/wp-content/uploads/YYYY/MM/...` and still
work — reuse that path if you like.

## 4. Preview locally

```bash
git submodule update --init --recursive   # first time only
hugo server -D
```

Then open <http://localhost:1313/>. `-D` includes drafts so you can see the new
post while writing.

## 5. Publish

Commit the new file (and any images) and push to `main`. GitHub Actions builds
the site and deploys it automatically.

## Comments

Commenting is closed — there is no comment backend. Old WordPress comment
threads are archived under `data/comments/<slug>.json` and rendered read-only
below a post when its front matter has `comments: true`. Every post ends with a
"Comments are closed" block linking to LinkedIn.

## Don't edit by hand

The following are generated from your Markdown and must not be edited directly:
`public/`, `resources/`, feeds, `sitemap.xml`, and the blog/archive listing
pages.
