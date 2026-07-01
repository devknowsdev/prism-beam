# EPK / Music-Career Current Surface

## Scope

Current-state pack for EPK public and publisher surfaces, now interpreted as the current implementation seed for Dave's broader Prism Music/Career domain.

## Last Verified

2026-07-01 against Beam EPK guide/log, prior local `EPK/EPK` README/public files, Beam Music/Career boundary updates, `devknowsdev/EPK` PR #23 (Biography refinement), EPK PR #24 (offering/credit description refinement), and EPK PR #25 (read-only copy consistency checker).

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
- `integrations/epk-to-spectra.adapter-contract.md`
- EPK PR #23: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-refine.js`, `EPK/public/publisher/publisher.css`, `EPK/scripts/test-career-refine-epk-copy.mjs`
- EPK PR #24: `EPK/public/publisher/publisher-ai-refine.js`, `EPK/scripts/test-career-refine-epk-copy.mjs`
- EPK PR #25: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-consistency.js`, `EPK/public/publisher/publisher.css`, `EPK/scripts/test-career-copy-consistency.mjs`

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
- Three app-side Music/Career slices are implemented through Spectra read-only AI requests: `career.refine_epk_copy` for publisher Biography fields, `career.refine_epk_copy` for offering and credit description fields, and `career.check_epk_copy_consistency` for read-only findings across Biography, offerings, and credits.

## Implemented Music/Career AI Slices

EPK PR #23 added a narrow, review-first Biography copy refinement flow. EPK PR #24 extended that existing flow to offering and credit descriptions:

- Surface: publisher Biography, offering description, and credit description fields only.
- Fields: `bio.short`, `bio.acoustic`, `bio.full`, `offerings[n].description`, `credits[n].description`.
- Source files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-refine.js`, `EPK/public/publisher/publisher.css`.
- Test file: `EPK/scripts/test-career-refine-epk-copy.mjs`.
- Spectra endpoint: existing `/api/v1/ai/request`.
- Payload: `sourceApp: "EPK"`, `intent: "career.refine_epk_copy"`, `riskClass: "read-only"`, `preferredMode: "local-first"`.
- UI behavior: suggestion appears separately in a read-only draft area, can be discarded, and only applies to the editor after explicit user click.
- Dynamic behavior: event delegation and rerender decoration preserve offering/credit controls after add, duplicate, reorder, and delete operations.
- Apply behavior: uses the existing input/local editor path; it does not publish or export.
- Security posture: no hardcoded fallback token; missing token fails closed before `fetch`.

EPK PR #25 added a separate, findings-only consistency checker:

- Surface: publisher copy consistency panel under Biography.
- Fields reviewed: Biography, offering titles/descriptions/tags, and credit titles/roles/years/descriptions/tags.
- Source files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-consistency.js`, `EPK/public/publisher/publisher.css`.
- Test file: `EPK/scripts/test-career-copy-consistency.mjs`.
- Spectra endpoint: existing `/api/v1/ai/request`.
- Payload: `sourceApp: "EPK"`, `intent: "career.check_epk_copy_consistency"`, `riskClass: "read-only"`, `preferredMode: "local-first"`.
- Data minimization: sends only relevant public copy fields, not publisher settings, tokens, private notes, links, or raw full editor JSON.
- UI behavior: findings render in a separate visible panel and can be cleared.
- Mutation posture: no rewriting, no automatic apply, no input dispatch, no publish/export, no downloads, and no external writes.
- Security posture: no hardcoded fallback token; missing token fails closed before `fetch`.

Shared boundary posture: no EPK-local provider/model wiring, no social/supporter/platform adapters, no Focus cadence automation, no new schema, no new repo, and no broader Music/Career cockpit.

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
- `career.refine_epk_copy` is an implemented local draft-suggestion path, not a publish path.
- `career.check_epk_copy_consistency` is an implemented findings-only review path, not a rewrite/apply/publish path.

## Do Not Infer

- Do not infer frontend password gates provide security.
- Do not infer static contact UI can silently send email.
- Do not infer Spectra should scrape the DOM when `window.EPKAdapter` exists.
- Do not infer that social/supporter/platform visibility may be exposed publicly.
- Do not infer a new `prism-career` repo has been approved.
- Do not infer a broader Music/Career cockpit exists app-side just because EPK now has three narrow AI helpers.
- Do not infer EPK can own AI provider/model routing.
- Do not infer AI suggestions or findings may mutate or publish public data without explicit user action.

## Known Stale Areas

- Older prompts may mention public/admin confusion, audience pages, workflow pages, or combined site/poster templates. Treat Beam-001 logs as newer.
- Older prompts may treat `EPK` as the whole product. Treat the 2026-07-01 Music/Career boundary update as newer product direction.
- Older prompts may say no Music/Career implementation exists. That is now stale only for the narrow publisher Biography refinement, offering/credit description refinement, and read-only copy consistency checker slices.

## Useful Entry Points

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- `EPK/EPK/README.md`
- `EPK/EPK/public/data/epk.json`
- `EPK/EPK/public/app.js`
- `EPK/EPK/public/publisher/index.html`
- `EPK/EPK/public/publisher/publisher.js`
- `EPK/EPK/public/publisher/publisher-ai-refine.js`
- `EPK/EPK/public/publisher/publisher-ai-consistency.js`
- `EPK/EPK/scripts/test-career-refine-epk-copy.mjs`
- `EPK/EPK/scripts/test-career-copy-consistency.mjs`
- `integrations/epk-to-focus.event-packet.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/research/music-career/README.md`

## Validation Hints

- Verify public pages do not expose admin/editor/mode toolbar controls.
- Check publisher actions are explicit exports or user-approved writes.
- Check contact behavior against current app source before changing assumptions.
- Check any future Music/Career social/supporter/contact visibility remains internal until explicitly exported/published.
- Check any app-side Music/Career implementation against Beam's approval posture before write/publish flows.
- For `career.refine_epk_copy`, confirm only `riskClass: "read-only"` is sent.
- For `career.check_epk_copy_consistency`, confirm output remains findings only and source fields are not changed.
- Confirm missing Spectra token fails closed and no hardcoded fallback token is present.
- Confirm AI suggestions remain visible/discardable and are not auto-applied.
- Confirm AI findings remain visible/clearable and are not auto-applied.

## Future prompts can omit

Future prompts can omit the public deploy root, publisher route, public/private chrome split, media preview hierarchy, poster boundary, Cloudflare Access privacy caveat, first contract entry points, the decision that EPK is now a public/export output inside a broader Music/Career direction rather than the whole app concept, and the fact that the implemented app-side Music/Career AI slices are `career.refine_epk_copy` for publisher Biography and offering/credit description fields plus `career.check_epk_copy_consistency` for findings-only review across Biography, offerings, and credits.

## Update Rules

Refresh this pack after any EPK publisher, Page Builder, publishing, auth, contact, poster, media-card, Music/Career cockpit, social visibility, supporter visibility, AI suggestion, AI findings, or repo-boundary sprint.
