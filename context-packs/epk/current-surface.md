# EPK Current Surface

## Scope

Low-token current-state pack for EPK public and publisher surfaces.

## Last Verified

2026-06-24 against Beam EPK guide/log and local `EPK/EPK` README/public files.

## Evidence Used

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- Local `EPK/EPK/README.md`
- Local `EPK/EPK/public/index.html`, `app.js`, `public-clean.js`
- Local `EPK/EPK/public/publisher/index.html`, `publisher.js`
- Local `EPK/EPK/public/data/epk.json`

## Current Truths

- Public deploy root is `EPK/public`.
- Hosted publisher route is `EPK/public/publisher/`.
- Public pages must not show admin, editor, mode, or toolbar chrome.
- Audience selection is route-based; legacy query modes are compatibility only.
- Page Builder owns route, layout, and template controls.
- Site templates and poster templates are separate.
- Media previews belong on their source cards: videos on video cards, audio on
  release cards, images on gallery cards.
- Contact remains `mailto:` unless a real backend or form-service sprint is
  approved.
- Poster generation is browser-only unless explicitly changed.
- Publishing to GitHub or public data is an external write requiring explicit
  user action.
- Hosted publisher is not private until protected by platform auth such as
  Cloudflare Access.
- EPK-to-Focus and EPK-to-Spectra boundaries are documented under
  `integrations/`.

## Safe Assumptions

- `public/data/epk.json` remains the public content source of truth.
- Publisher and local/admin tooling are editing/export surfaces, not proof of
  private access by themselves.
- Published snapshots should stay editor-free.

## Do Not Infer

- Do not infer frontend password gates provide security.
- Do not infer static contact UI can silently send email.
- Do not infer Spectra should scrape the DOM when `window.EPKAdapter` exists.

## Known Stale Areas

- Older prompts may mention public/admin confusion, audience pages, workflow
  pages, or combined site/poster templates. Treat Beam-001 logs as newer.

## Useful Entry Points

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- `EPK/EPK/README.md`
- `EPK/EPK/public/data/epk.json`
- `EPK/EPK/public/app.js`
- `EPK/EPK/public/publisher/publisher.js`
- `integrations/epk-to-focus.event-packet.md`
- `integrations/epk-to-spectra.adapter-contract.md`

## Validation Hints

- Verify public pages do not expose admin/editor/mode toolbar controls.
- Check publisher actions are explicit exports or user-approved writes.
- Check contact behavior remains `mailto:` unless backend scope is approved.

## Future prompts can omit

Future prompts can omit the public deploy root, publisher route, public/private
chrome split, media preview hierarchy, contact limitation, poster boundary,
Cloudflare Access privacy caveat, and first contract entry points.

## Update Rules

Refresh this pack after any EPK publisher, Page Builder, publishing, auth,
contact, poster, or media-card sprint.
