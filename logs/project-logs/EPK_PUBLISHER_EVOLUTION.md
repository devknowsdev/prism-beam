# EPK Publisher Evolution

This log captures recent EPK publisher lessons as reusable Beam memory.

## What Changed

- Public/admin separation was established.
- Public admin, editor, and mode toolbar controls were removed from the public
  surface.
- The hosted `/publisher/` portal was restored.
- The publisher control centre was expanded.
- Media, contact, site-template, poster-template, and poster-generation tooling
  were added or clarified.

## UX Corrections

- Media previews attach to their source cards:
  - videos on video cards
  - audio on release cards
  - images on gallery cards
- Gallery cards visibly show images.
- Page Builder replaces vague audience-page concepts and owns route, layout, and
  template controls.
- Site templates are separate from poster templates.
- Poster Studio can use gallery images.

## Current Cautions

- A hosted publisher is not private unless protected by real platform auth such
  as Cloudflare Access.
- Static contact UI cannot silently send email; keep contact as `mailto:` until
  a real backend or form service is approved.
