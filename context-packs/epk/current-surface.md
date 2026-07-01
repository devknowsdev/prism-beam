# EPK / Music-Career Current Surface

## Scope

Current-state pack for EPK public and publisher surfaces, now interpreted as the current implementation seed for Dave's broader Prism Music/Career domain.

## Last Verified

2026-07-01 against Beam EPK guide/log, prior local `EPK/EPK` README/public files, and the Beam Music/Career boundary update branch.

## Evidence Used

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- Local `EPK/EPK/README.md`
- Local `EPK/EPK/public/index.html`, `app.js`, `public-clean.js`
- Local `EPK/EPK/public/publisher/index.html`, `publisher.js`
- Local `EPK/EPK/public/data/epk.json`
- `docs/REPO_BOUNDARIES.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`

## Current Truths

- `EPK` remains the current repo name and implementation surface.
- The product domain is broader than an online EPK: future work may treat this repo as the seed of `Prism Music` or `Prism Career`.
- The public EPK page is one generated/public output, not the canonical internal career interface.
- Public deploy root is `EPK/public`.
- Hosted publisher route is `EPK/public/publisher/`.
- Public pages must not show admin, editor, mode, or toolbar chrome.
- Audience selection is route-based; legacy query modes are compatibility only.
- Page Builder owns route, layout, and template controls.
- Site templates and poster templates are separate.
- Media previews belong on their source cards: videos on video cards, audio on release cards, images on gallery cards.
- Contact behavior depends on the current app implementation; older static assumptions may be stale because later Beam packs record a server-side `/api/contact` endpoint.
- Poster generation is browser-only unless explicitly changed.
- Publishing to GitHub or public data is an external write requiring explicit user action.
- Hosted publisher is not private until protected by platform auth such as Cloudflare Access.
- EPK-to-Focus and EPK-to-Spectra boundaries are documented under `integrations/`.

## Music/Career Domain Direction

Future Music/Career work may need internal visibility across:

- Dave's distinct public/project identities and EPK modes;
- social profile/status visibility and draft queues;
- mailing-list/supporter awareness;
- back-catalogue reuse and content-batch planning;
- press, venue, presenter, and collaborator contacts;
- public EPK, booking, one-sheet, show-specific promo, PDF, and snapshot exports.

Do not force this whole domain into a static public EPK page. Build/review internal career visibility separately from public/export surfaces.

## Safe Assumptions

- `public/data/epk.json` remains the public content source of truth for current EPK output until app source says otherwise.
- Publisher and local/admin tooling are editing/export surfaces, not proof of private access by themselves.
- Published snapshots should stay editor-free.
- Current EPK repo can be used as the implementation seed for Music/Career public/professional surfaces until Beam records a rename/new-repo decision.

## Do Not Infer

- Do not infer frontend password gates provide security.
- Do not infer static contact UI can silently send email.
- Do not infer Spectra should scrape the DOM when `window.EPKAdapter` exists.
- Do not infer that social/supporter/platform visibility may be exposed publicly.
- Do not infer a new `prism-career` repo has been approved.
- Do not infer Music/Career implementation exists app-side just because Beam now stores the boundary direction.

## Known Stale Areas

- Older prompts may mention public/admin confusion, audience pages, workflow pages, or combined site/poster templates. Treat Beam-001 logs as newer.
- Older prompts may treat `EPK` as the whole product. Treat the 2026-07-01 Music/Career boundary update as newer product direction.

## Useful Entry Points

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- `EPK/EPK/README.md`
- `EPK/EPK/public/data/epk.json`
- `EPK/EPK/public/app.js`
- `EPK/EPK/public/publisher/publisher.js`
- `integrations/epk-to-focus.event-packet.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/research/music-career/README.md`

## Validation Hints

- Verify public pages do not expose admin/editor/mode toolbar controls.
- Check publisher actions are explicit exports or user-approved writes.
- Check contact behavior against current app source before changing assumptions.
- Check any future Music/Career social/supporter/contact visibility remains internal until explicitly exported/published.
- Check any app-side Music/Career implementation against Beam's approval posture before write/publish flows.

## Future prompts can omit

Future prompts can omit the public deploy root, publisher route, public/private chrome split, media preview hierarchy, poster boundary, Cloudflare Access privacy caveat, first contract entry points, and the decision that EPK is now a public/export output inside a broader Music/Career direction rather than the whole app concept.

## Update Rules

Refresh this pack after any EPK publisher, Page Builder, publishing, auth, contact, poster, media-card, Music/Career cockpit, social visibility, supporter visibility, or repo-boundary sprint.
