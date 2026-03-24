# Bobcat

A personal web directory in the spirit of late-90s link directories like Yahoo! and DMOZ.
Built with Hugo, deployed via GitHub Pages. No database, no CMS, no algorithmic curation —
just a hand-maintained collection of links you actually want to find again.

## Why

Browser bookmark folders are a mess. Awesome-lists on GitHub are single-column walls of
text. Bobcat is dense, scannable, and searchable — closer to what the early web used for
navigation before search engines took over.

## Features

- Multi-column layout organized by category
- Client-side fuzzy search via Fuse.js
- Dead link detection via lychee with skull indicator
- All links stored as TOML data files — no HTML editing required
- Pinned category for personal/meta links
- Recently added sidebar section
- Footer with link count and last built date

## Adding Links

Each category is a TOML file in `data/links/`. Create a new file or add to an existing one:
```toml
category = "Category Name"

[[link]]
title = "Site Title"
url = "https://example.com"
desc = "Why you saved this — in your own words"
added = "2026-03-23"
tags = ["tag1", "tag2"]
```

To pin a category to the top of the sidebar add `pinned = true` after the category name.
All other categories sort alphabetically.

### Subcategories

For large categories that aren't ready to split into separate files yet, add an optional
`subcategory` field to group links within a section:
```toml
[[link]]
title = "Rust Ownership"
url = "https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html"
desc = "Chapter 4 of the book"
added = "2026-03-23"
subcategory = "Rust"
tags = ["rust"]
```

When a category gets too big, split it into multiple files:
```
data/links/programming.toml        # before
data/links/programming-c.toml      # after
data/links/programming-rust.toml
```

## Checking for Dead Links

Requires [lychee](https://lychee.cli.rs). Install via snap:
```bash
snap install lychee
```

Run the full check and rebuild:
```bash
make check
```

This builds the site, runs lychee against the output, writes dead URLs to
`static/dead_links.json`, then rebuilds so skulls appear next to flagged links.
Run this occasionally — there's no automation, just a manual audit when you care.

## Local Development
```bash
make serve    # start local dev server
make build    # build to public/
make check    # audit links and rebuild
```

## Deployment

GitHub Actions deploys to GitHub Pages on push to main. See `.github/workflows/deploy.yml`.

## Stack

- [Hugo](https://gohugo.io) — static site generator
- [Fuse.js](https://fusejs.io) — client-side fuzzy search
- [lychee](https://lychee.cli.rs) — link checker
- GitHub Pages — hosting
