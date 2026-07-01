# EPK / Music-Career Current Surface

## Scope

Current-state pack for EPK public and publisher surfaces, interpreted as the current implementation seed for Dave's broader Prism Music/Career domain.

## Last Verified

2026-07-01 against Beam EPK guide/log, prior local EPK files, Beam Music/Career boundary updates, and `devknowsdev/EPK` PR #23 through PR #27.

## Current Truths

- `EPK` remains the current repo name and implementation surface.
- The product domain is broader than an online EPK; future work may treat this repo as the seed of Prism Music/Career.
- The public EPK page is one generated/public output, not the canonical internal career interface.
- Public deploy root is `EPK/public`; hosted publisher route is `EPK/public/publisher/`.
- Public pages must not show admin/editor/mode/toolbar chrome.
- Audience selection is route-based; legacy query modes are compatibility only.
- Page Builder owns route, layout, and template controls.
- Publishing to GitHub or public data is an external write requiring explicit user action.
- Hosted publisher is not private until protected by platform auth such as Cloudflare Access.
- EPK-to-Focus and EPK-to-Spectra boundaries are documented under `integrations/`.
- Five app-side Music/Career slices are implemented through Spectra read-only AI requests.

## Implemented Music/Career AI Slices

All implemented helpers use Spectra's existing `/api/v1/ai/request`, `sourceApp: "EPK"`, `riskClass: "read-only"`, and `preferredMode: "local-first"`. EPK does not own AI provider/model routing.

1. **Biography copy refinement — EPK PR #23**
   - Intent: `career.refine_epk_copy`.
   - Fields: `bio.short`, `bio.acoustic`, `bio.full`.
   - Behavior: visible draft suggestion; discardable; manual Apply only through existing editor/input path.
   - Files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-refine.js`, `EPK/public/publisher/publisher.css`, `EPK/scripts/test-career-refine-epk-copy.mjs`.

2. **Offering and credit description refinement — EPK PR #24**
   - Intent: `career.refine_epk_copy`.
   - Fields: `offerings[n].description`, `credits[n].description`.
   - Behavior: visible draft suggestion; dynamic controls survive add/duplicate/reorder/delete; manual Apply only through existing editor/input path.
   - Files: `EPK/public/publisher/publisher-ai-refine.js`, `EPK/scripts/test-career-refine-epk-copy.mjs`.

3. **Copy consistency checker — EPK PR #25**
   - Intent: `career.check_epk_copy_consistency`.
   - Fields reviewed: Biography, offering titles/descriptions/tags, credit titles/roles/years/descriptions/tags.
   - Behavior: findings-only visible panel; clearable; no rewriting, Apply, input dispatch, publish/export, downloads, or external writes.
   - Files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-consistency.js`, `EPK/public/publisher/publisher.css`, `EPK/scripts/test-career-copy-consistency.mjs`.

4. **Promo Kit copy refinement — EPK PR #26**
   - Intent: `career.refine_epk_promo_copy`.
   - Source reviewed: generated Markdown promo brief in `#brief-text`.
   - Behavior: suggestion-only draft; discardable; no Apply button and no generated source brief mutation.
   - Files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-promo-refine.js`, `EPK/scripts/test-career-promo-refine.mjs`.

5. **Audience Page route-tag recommendations — EPK PR #27**
   - Intent: `career.suggest_epk_route_tags`.
   - Context reviewed: minimized route/page context plus public Biography, offering, and credit content.
   - Behavior: recommendation-only panels; clearable; no Apply button, automatic tag changes, route mutation, publish/export/download, or Focus action.
   - Files: `EPK/public/publisher/index.html`, `EPK/public/publisher/publisher-ai-route-helper.js`, `EPK/scripts/test-career-route-tag-helper.mjs`.

## Shared Boundaries

- No EPK-local provider/model wiring.
- No hardcoded fallback token; missing Spectra token fails closed before `fetch`.
- No social/supporter/platform adapters.
- No Focus cadence automation or hidden Focus write.
- No schema change.
- No new repo.
- No broader Music/Career cockpit.
- Do not infer AI suggestions, findings, or recommendations may mutate or publish public data without explicit user action and a newly approved slice.

## Music/Career Domain Direction

Future Music/Career work may need internal visibility across Dave's distinct public/project identities, social profile/status visibility, mailing-list/supporter awareness, back-catalogue reuse, content-batch planning, press/venue/collaborator contacts, and public EPK/booking/one-sheet/show-specific promo/PDF exports.

Do not force this whole domain into a static public EPK page. Build/review internal career visibility separately from public/export surfaces.

## Safe Assumptions

- `public/data/epk.json` remains the public content source of truth for current EPK output until app source says otherwise.
- Publisher and local/admin tooling are editing/export surfaces, not proof of private access by themselves.
- Published snapshots should stay editor-free.
- Current EPK repo can be used as the implementation seed for Music/Career public/professional surfaces until Beam records a rename/new-repo decision.
- The five helper intents listed above are implemented review/read-only paths, not publish paths.

## Useful Entry Points

- `app-guides/epk/session-start.md`
- `logs/project-logs/EPK_PUBLISHER_EVOLUTION.md`
- `EPK/EPK/public/publisher/index.html`
- `EPK/EPK/public/publisher/publisher.js`
- `EPK/EPK/public/publisher/publisher-ai-refine.js`
- `EPK/EPK/public/publisher/publisher-ai-consistency.js`
- `EPK/EPK/public/publisher/publisher-ai-promo-refine.js`
- `EPK/EPK/public/publisher/publisher-ai-route-helper.js`
- `EPK/EPK/scripts/test-career-refine-epk-copy.mjs`
- `EPK/EPK/scripts/test-career-copy-consistency.mjs`
- `EPK/EPK/scripts/test-career-promo-refine.mjs`
- `EPK/EPK/scripts/test-career-route-tag-helper.mjs`
- `integrations/epk-to-focus.event-packet.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_PROMO_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_ROUTE_TAG_AI_SLICE_2026-07-01.md`

## Validation Hints

- Verify public pages do not expose admin/editor/mode toolbar controls.
- Check publisher actions are explicit exports or user-approved writes.
- Check contact behavior against current app source before changing assumptions.
- Check future social/supporter/contact visibility remains internal until explicitly exported/published.
- For all implemented AI helper intents, confirm only `riskClass: "read-only"` is sent.
- Confirm missing Spectra token fails closed and no hardcoded fallback token is present.
- Confirm suggestions remain visible/discardable and are not auto-applied except the already-approved manual Apply path for editable copy-refinement fields.
- Confirm findings/recommendations remain visible/clearable and are not auto-applied.
- For `career.suggest_epk_route_tags`, confirm route inputs/selects/checkboxes remain unchanged and no Focus/publish/export/download action occurs.

## Update Rules

Refresh this pack after any EPK publisher, Page Builder, publishing, auth, contact, poster, media-card, Music/Career cockpit, social visibility, supporter visibility, AI suggestion, AI findings, AI recommendations, or repo-boundary sprint.
