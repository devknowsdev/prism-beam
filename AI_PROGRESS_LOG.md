# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-07-01
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Beam has reframed `EPK` as the current implementation seed for the broader Prism Music/Career domain. EPK PR #23 through PR #27 are merged to `main`, completing five narrow app-side Music/Career helpers through Spectra's read-only AI request path.

**Implemented EPK Music/Career helpers:**

1. `career.refine_epk_copy` for publisher Biography copy refinement.
2. `career.refine_epk_copy` for offering and credit description refinement.
3. `career.check_epk_copy_consistency` for findings-only copy consistency checking across Biography, offerings, and credits.
4. `career.refine_epk_promo_copy` for suggestion-only Promo Kit copy refinement.
5. `career.suggest_epk_route_tags` for read-only Audience Page route-tag recommendations.

**Most recent completed work:** `devknowsdev/EPK` PR #27 added `career.suggest_epk_route_tags`. It sends minimized route/page context plus public Biography, offering, and credit context to Spectra's existing `/api/v1/ai/request` with `riskClass: "read-only"`, renders visible clearable recommendations, and does not apply tags, mutate routes, publish, export, download, or call Focus.

**Validation:** For EPK PR #27, Codex reported command checks for the new route helper plus existing refinement, consistency, Promo Kit, admin validator, and `git diff --check`. Configured/tokenless browser validation confirmed controls on six Audience Page cards, tokenless fail-closed behavior, captured routing payloads, minimized input without private/token/contact/raw-editor data, unchanged route/page fields and source fields, no Apply controls, clearable recommendations, existing AI helper regressions, zero console errors, and no publish/export/download/Focus action.

**Current next priority:** Pause before adding another app-side slice. Safe candidates include a review-only press/booking one-sheet checker, an EPK-only audience-page wording helper, or a reviewed Focus handoff contract. Do not build social/supporter/platform adapters, a Music/Career cockpit, auto-posting/emailing, or a new repo yet.

**Known caution:** The current `EPK` repo is only an implementation seed. The online EPK page is not the whole Music/Career product. Any future repo rename or new `prism-career` repo requires explicit approval and a follow-up Beam boundary contract. Social/supporter/platform adapters are explicitly deferred.

## Recent session entries

### 2026-07-01 — Codex — EPK Audience Page route-tag recommendations merged

**App PR:** `devknowsdev/EPK` PR #27 — `[codex] Add EPK route tag recommendations`; merged as `625d851930369c358c4deeb83824437f72cccfd4`.

**Files changed in EPK:**

- `EPK/public/publisher/index.html` — loads the route-tag helper script.
- `EPK/public/publisher/publisher-ai-route-helper.js` — decorates Audience Page cards with `Suggest route tags`, sends the read-only Spectra request, and renders clearable recommendations.
- `EPK/scripts/test-career-route-tag-helper.mjs` — covers request shape, minimized snapshots, missing-token fail-closed behavior, successful mocked response, clearing, unchanged source data, and absence of write/publish paths.

**Request shape:** `sourceApp: "EPK"`, `intent: "career.suggest_epk_route_tags"`, `riskClass: "read-only"`, `preferredMode: "local-first"`, through Spectra's existing `/api/v1/ai/request`.

**Boundary:** Recommendations only. No Apply, automatic tag changes, route mutation, publish/export/download, social/supporter/platform code, Focus code, provider wiring, schema change, broader cockpit, or new repo.

### 2026-07-01 — Codex — EPK Promo Kit copy refinement merged

**App PR:** `devknowsdev/EPK` PR #26 — `[codex] Add EPK promo copy refinement`; merged as `f21a12e2a3f42f3116d7f704297a83615c4d32c8`.

**Summary:** Added `career.refine_epk_promo_copy` for suggestion-only refinement of the generated Promo Kit Markdown brief. No Apply button and no generated source brief mutation.

### 2026-07-01 — Codex — EPK read-only copy consistency checker merged

**App PR:** `devknowsdev/EPK` PR #25 — `[codex] Add read-only EPK copy consistency checker`; merged as `e915a6955489190cf6961c434b7fca9ca21e9bbf`.

**Summary:** Added `career.check_epk_copy_consistency` for findings-only review across Biography, offerings, and credits.

### 2026-07-01 — Codex — EPK offering and credit description refinement merged

**App PR:** `devknowsdev/EPK` PR #24 — `Draft: extend EPK copy refinement to descriptions`; merged as `60e9e96c0ec5b220b3efbfe4a0dc0de226c2633e`.

**Summary:** Extended `career.refine_epk_copy` to `offerings[n].description` and `credits[n].description` with review-first draft suggestions.

### 2026-07-01 — GPT-5.5 Thinking / Codex / Claude — First EPK Music/Career AI slice merged

**App PR:** `devknowsdev/EPK` PR #23 — `[codex] Add read-only EPK copy refinement`; merged as `e0007a4bf1e53ec218973ed12a246f9abb84ce3e`.

**Summary:** Added `career.refine_epk_copy` for publisher Biography fields. Claude required removing a shippable fallback auth token before merge; Codex fixed it so missing local auth fails closed before request.

### 2026-07-01 — Music/Career Beam boundary and consistency cleanup

Beam PR #24 and PR #25 reframed `EPK` as the current implementation seed for Prism Music/Career and fixed post-review doc consistency. The online EPK is one public/export output inside a broader future Music/Career domain, not the whole product.

### 2026-07-01 — Focus and Spectra baseline

- Focus PR #25 merged the Spectra-first assistant and review-first proposals.
- Spectra PRs #30 and #33 repaired real Focus JSON responses, cockpit approval coherence, and `runAiRequest()` routing/cache behavior.
- Known Focus baseline: architecture validator still reports ten legacy files without required module headers; Focus has no npm build/test scripts.
