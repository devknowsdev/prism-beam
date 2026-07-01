# EPK / Music-Career Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK/Music-Career sessions.

**Last verified:** 2026-07-01
**Verified against:** `devknowsdev/EPK/main` after admin/export/contact completion, redacted-shell/public-CTA/publisher-control hardening, Beam Music/Career boundary updates, and EPK PR #23 through PR #27.
**Scope:** `EPK` as current implementation seed for Dave's broader Prism Music/Career domain. Verify source before implementation.

## Role

`EPK` is the current repo and implementation seed for Dave Knowles's public/professional Music/Career surface.

The online EPK page is one public/export output, not the whole product. Future work should treat EPK, press/booking packets, show-specific promo packs, public pages, and PDFs as outputs generated from or managed by a broader internal Music/Career cockpit.

It currently includes:

- public audience pages,
- a Cloudflare-ready admin at `/admin/admin.html`,
- a publisher surface under `/publisher/`,
- branded client HTML/PDF exports via `print.html`,
- a server-side contact endpoint at `/api/contact`,
- hosting-layer public/private redaction behavior,
- a public redacted CTA shell for anonymous/non-owner users,
- five app-side Music/Career AI slices via Spectra read-only requests.

## Product-domain direction

Prism Music/Career may eventually need visibility across socials, content queues, back-catalogue reuse, supporter/mailing-list awareness, press/venue contacts, project identities, and public outputs.

Do not force that whole domain into a static EPK page. Do not assume a new repo is approved. Treat the existing `EPK` repo as the current seed until a Beam boundary contract explicitly approves a rename or new `prism-career` repo.

## Implemented Music/Career AI slices

1. EPK PR #23: `career.refine_epk_copy` for Biography fields.
2. EPK PR #24: `career.refine_epk_copy` for `offerings[n].description` and `credits[n].description`.
3. EPK PR #25: `career.check_epk_copy_consistency` for read-only findings across Biography, offerings, and credits.
4. EPK PR #26: `career.refine_epk_promo_copy` for suggestion-only Promo Kit copy refinement.
5. EPK PR #27: `career.suggest_epk_route_tags` for read-only Audience Page route-tag recommendations.

Common request posture:

- Spectra endpoint: existing `/api/v1/ai/request`.
- `sourceApp: "EPK"`.
- `riskClass: "read-only"`.
- `preferredMode: "local-first"`.
- No EPK-local provider/model wiring.
- Missing token fails closed before `fetch`; no hardcoded fallback token.

Specific behavior:

- Biography/offering/credit refinement returns visible local draft suggestions; Apply exists only for the already-approved editable refinement fields and uses existing local editor/input paths.
- Copy consistency returns findings only and does not rewrite, apply, dispatch input events, publish, export, or mutate source fields.
- Promo Kit refinement returns a draft suggestion only; there is no Apply button and the generated source brief remains unchanged.
- Route-tag helper returns clearable recommendations only; there is no Apply button, automatic tag change, route mutation, publish/export/download, or Focus action.

Do not infer any broader Music/Career cockpit, social/supporter/platform adapter, Focus automation, auto-posting, mailing-list integration, or new repo from these slices.

## Public/private surface model

- `EPK/functions/_middleware.js` controls public/private EPK routing.
- Private configuration belongs in hosting settings, not source code.
- Anonymous users may open the public shell, but content/social/media/file/publisher surfaces should be protected or redacted.
- `/data/epk.json` returns redacted JSON to anonymous users.
- `/admin`, `/publisher`, `/data`, `/published`, `/downloads`, `/files`, and JSON/private surfaces should remain protected or redacted.
- Future social/supporter/contact visibility must not leak into public pages unless deliberately exposed by an approved publish/export action.

## Publisher/control posture

- `EPK/public/publisher/publisher-focus-packet.js` currently simplifies publisher chrome.
- Top controls should stay labelled and grouped as `Preview`, `Publish`, and `Tools`.
- Sidebar should keep workflow grouping: Build, Media, Tools/design/advanced, Publish.
- Future Music/Career cockpit controls should separate internal visibility/review from public export/publish actions.

## Current operational notes

Cloudflare Pages should use:

```text
Build command: node EPK/scripts/prepare-cloudflare-pages.mjs
Build output directory: EPK/public
```

Contact delivery and owner access both require valid hosting configuration.

Local Spectra-backed AI suggestions/findings/recommendations require a configured local Spectra URL/token in the browser environment or localStorage. Missing token should fail closed before any request.

## Safety defaults

- No hidden publishing.
- No auto-posting to socials.
- No hidden email or external write from static/browser code.
- No private configuration values in public repo files.
- No hardcoded fallback AI token in public browser code.
- No direct cloud-model escalation from EPK.
- AI suggestions must remain reviewable local drafts unless the user explicitly applies an already-approved editable-field suggestion.
- AI findings/recommendations must remain findings/recommendations only unless a future approved slice explicitly adds a local editor action.
- Generated read-only source text and route/page data must not be mutated unless a future approved slice explicitly adds an editor path.
- Social/supporter/platform data must remain internal unless explicitly exported/published.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_PROMO_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_ROUTE_TAG_AI_SLICE_2026-07-01.md`

## Source escalation

For EPK/Music/Career implementation, read this mini-pack first, then inspect only exact EPK files needed for the requested change.

Common exact files:

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-refine.js`
- `EPK/public/publisher/publisher-ai-consistency.js`
- `EPK/public/publisher/publisher-ai-promo-refine.js`
- `EPK/public/publisher/publisher-ai-route-helper.js`
- `EPK/scripts/test-career-refine-epk-copy.mjs`
- `EPK/scripts/test-career-copy-consistency.mjs`
- `EPK/scripts/test-career-promo-refine.mjs`
- `EPK/scripts/test-career-route-tag-helper.mjs`
- `EPK/scripts/validate-epk-admin-upgrade.mjs`
- `EPK/functions/_middleware.js`
- `EPK/public/_headers`
- `EPK/public/_redirects`
- `EPK/public/print.html`
- `functions/api/contact.js`
