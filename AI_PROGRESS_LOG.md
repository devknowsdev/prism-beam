# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-07-01
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Beam PR #24 and PR #25 are merged to `main`, reframing `EPK` as the current implementation seed for a broader Prism Music/Career domain and fixing post-review doc consistency. EPK PR #23, PR #24, PR #25, and PR #26 are merged to `main`, completing four app-side Music/Career slices through Spectra's read-only AI request path: publisher Biography copy refinement, offering/credit description refinement, read-only copy consistency checking, and suggestion-only Promo Kit copy refinement. Spectra routing/cockpit/real-mode JSON work is merged through PR #33. The review-first Spectra AI bridge is merged to `prism-focus:main` through PR #25.

**Most recent completed work:** `devknowsdev/EPK` PR #26 added `career.refine_epk_promo_copy` for suggestion-only refinement of the generated Promo Kit Markdown brief. It sends only the generated brief text to Spectra's existing `/api/v1/ai/request` with `riskClass: "read-only"`, renders a visible discardable draft suggestion, and does not provide Apply, mutate the source brief, publish, or export.

**Validation:** For EPK PR #26, Codex reported JavaScript syntax check, focused Promo Kit refinement tests, existing refinement tests, existing consistency tests, the existing EPK admin validator, `git diff --check`, and configured browser validation against a Spectra-shaped mock. Browser validation confirmed Promo Kit rendering/discard, existing Biography/offering/credit refinement regressions, copy consistency regression, unchanged source fields, captured routing payloads, zero console errors, and no publish/export actions. Beam updates in this branch are docs/context only; no app source changed here.

**Current next priority:** Decide the next tiny Music/Career slice. Safe candidates include an Audience Page route-tag helper, a reviewed Focus handoff, or another EPK-only review helper. Do not build social/supporter/platform adapters, a Music/Career cockpit, auto-posting/emailing, or a new repo yet.

**Known caution:** The current `EPK` repo is only an implementation seed. The online EPK page is not the whole Music/Career product. Any future repo rename or new `prism-career` repo requires explicit approval and a follow-up Beam boundary contract. Social/supporter/platform adapters are explicitly deferred.

## Recent session entries

### 2026-07-01 — Codex — EPK Promo Kit copy refinement merged

**Task:** Add suggestion-only EPK Promo Kit copy refinement without widening the Music/Career boundary.

**App PR:** `devknowsdev/EPK` PR #26 — `[codex] Add EPK promo copy refinement`; merged as `f21a12e2a3f42f3116d7f704297a83615c4d32c8`.

**Files changed in EPK:**

- `EPK/public/publisher/index.html` — adds the `Refine promo copy` control and suggestion panel near the generated Promo Kit brief.
- `EPK/public/publisher/publisher-ai-promo-refine.js` — sends the read-only Spectra request and renders a discardable suggestion.
- `EPK/scripts/test-career-promo-refine.mjs` — covers request shape, missing-token fail-closed behavior, successful mocked response, unchanged source brief, discard behavior, and absence of write/publish paths.

**Request shape:** Uses `sourceApp: "EPK"`, `intent: "career.refine_epk_promo_copy"`, `riskClass: "read-only"`, and `preferredMode: "local-first"` through Spectra's existing `/api/v1/ai/request`. The payload sends only the generated Markdown promo brief text and a preserve-facts/no-invention instruction.

**Validation:** Codex reported JavaScript syntax, focused Promo Kit refinement tests, existing refinement tests, existing consistency tests, existing EPK admin validator, `git diff --check`, and configured browser checks. Browser validation confirmed Promo Kit rendering/discard, existing Biography/offering/credit refinement regressions, copy consistency regression, unchanged source fields, captured routing payloads, zero console errors, and no publish/export action.

**Decision:** The implemented app-side Music/Career surface now contains exactly four narrow helpers: Biography copy refinement, offering/credit description refinement, read-only copy consistency checking, and suggestion-only Promo Kit copy refinement. No Apply button, source mutation, publish/export, social/supporter/platform code, Focus code, provider wiring, schema change, broader cockpit, or new repo was added.

**Next suggested step:** Choose one more tiny review-first slice only after this Beam checkpoint is merged.

### 2026-07-01 — Codex — EPK read-only copy consistency checker merged

**Task:** Add a findings-only EPK publisher consistency checker across Biography, offering, and credit copy without widening the Music/Career boundary.

**App PR:** `devknowsdev/EPK` PR #25 — `[codex] Add read-only EPK copy consistency checker`; merged as `e915a6955489190cf6961c434b7fca9ca21e9bbf`.

**Files changed in EPK:**

- `EPK/public/publisher/index.html` — adds the copy consistency control and findings panel.
- `EPK/public/publisher/publisher-ai-consistency.js` — builds the minimized public-copy snapshot, sends the read-only Spectra request, and renders findings.
- `EPK/public/publisher/publisher.css` — styles the findings panel.
- `EPK/scripts/test-career-copy-consistency.mjs` — covers request shape, data minimization, missing-token fail-closed behavior, and no write/publish paths.

**Request shape:** Uses `sourceApp: "EPK"`, `intent: "career.check_epk_copy_consistency"`, `riskClass: "read-only"`, and `preferredMode: "local-first"` through Spectra's existing `/api/v1/ai/request`. The payload includes only relevant public copy fields from Biography, offerings, and credits. Output is findings only.

**Validation:** Codex reported JavaScript syntax, focused consistency tests, existing refinement tests, existing EPK admin validator, `git diff --check`, and browser checks. Missing-token requests stopped before `fetch`; structured findings rendered visibly and cleared cleanly; source fields remained unchanged; captured requests retained all four routing fields; no console errors or publish/export action occurred.

**Decision:** The implemented app-side Music/Career surface now contains exactly three narrow helpers: Biography copy refinement, offering/credit description refinement, and read-only copy consistency checking. No automatic apply, rewrite, publish/export, social/supporter/platform code, Focus code, provider wiring, schema change, broader cockpit, or new repo was added.

**Next suggested step:** Completed by EPK PR #26 and this Beam checkpoint.

### 2026-07-01 — Codex — EPK offering and credit description refinement merged

**Task:** Extend the existing review-first EPK publisher copy helper to offering and credit description fields without widening the Music/Career boundary.

**App PR:** `devknowsdev/EPK` PR #24 — `Draft: extend EPK copy refinement to descriptions`; merged as `60e9e96c0ec5b220b3efbfe4a0dc0de226c2633e`.

**Files changed in EPK:**

- `EPK/public/publisher/publisher-ai-refine.js` — adds dynamic offering/credit description controls and event-delegated refinement actions.
- `EPK/scripts/test-career-refine-epk-copy.mjs` — extends request-shape coverage to both dynamic description field kinds.

**Request shape:** Reuses `sourceApp: "EPK"`, `intent: "career.refine_epk_copy"`, `riskClass: "read-only"`, and `preferredMode: "local-first"` through Spectra's existing `/api/v1/ai/request`. Suggestions remain visible/discardable local drafts and require explicit manual Apply.

**Validation:** Codex reported JavaScript syntax, focused refinement tests, the existing EPK admin validator, `git diff --check`, and browser checks for Biography, offering, and credit refinement. Add, duplicate, reorder, and delete rerender paths preserved dynamic controls. Tokenless requests stopped before `fetch`; captured requests retained all four routing fields; no console errors or publish/export action occurred.

**Decision:** The implemented app-side Music/Career surface now contains exactly two narrow helpers: Biography copy refinement and offering/credit description refinement. No social/supporter/platform code, Focus code, new endpoint, provider wiring, schema change, broader cockpit, or new repo was added.

**Next suggested step:** Completed by EPK PR #25 and EPK PR #26.

### 2026-07-01 — GPT-5.5 Thinking / Codex / Claude — First EPK Music/Career AI slice merged

**Task:** Implement the smallest safe Music/Career app-side slice after Beam PR #24/#25: EPK publisher Biography copy refinement through Spectra's existing read-only AI request endpoint.

**App PR:** `devknowsdev/EPK` PR #23 — `[codex] Add read-only EPK copy refinement`.

**Files changed in EPK:**

- `EPK/public/publisher/index.html` — adds `Refine copy` controls and visible suggestion panels for Biography fields.
- `EPK/public/publisher/publisher-ai-refine.js` — builds and sends the Spectra request; handles visible draft, discard, and explicit apply.
- `EPK/public/publisher/publisher.css` — styles the suggestion panel.
- `EPK/scripts/test-career-refine-epk-copy.mjs` — request-shape and drift guard tests.

**Request shape:** `sourceApp: "EPK"`, `intent: "career.refine_epk_copy"`, `riskClass: "read-only"`, `preferredMode: "local-first"`; input contains the edited text plus constraints to preserve factual claims and not invent details; context identifies publisher surface and the Biography field.

**Review outcome:** Claude approved the boundary with one required fix: remove the shippable default local auth fallback. Codex fixed that so missing local auth fails closed before the request and added static assertions to prevent the fallback from returning.

**Validation:** Codex reported `node --check EPK/public/publisher/publisher-ai-refine.js`, `node EPK/scripts/test-career-refine-epk-copy.mjs`, `node EPK/scripts/validate-epk-admin-upgrade.mjs`, `git diff --check`, and browser validation against a Spectra-shaped mock. GPT verified PR #23 merged with merge commit `e0007a4bf1e53ec218973ed12a246f9abb84ce3e`.

**Decision:** This establishes the first implemented app-side Music/Career slice, but only for Biography copy refinement. Do not infer a broader Music/Career cockpit, social/supporter/platform adapter, Focus automation, or repo rename.

**Next suggested step:** Completed by Beam context packs, EPK PR #24, EPK PR #25, and EPK PR #26.

### 2026-07-01 — GPT-5.5 Thinking — Music/Career doc consistency after Claude review

**Task:** Apply Claude's post-merge review findings from PR #24.

**Files changed:**

- `docs/contracts/EPK_CONTRACT.md` — replaced stale contact assumption with source-check/current `/api/contact` warning and Music/Career boundary pointer.
- `integrations/epk-to-spectra.adapter-contract.md` — refreshed contact assumptions, public/private rules, and Music/Career output framing.
- `docs/PRISM_BEAM_ROLE.md` — added Music/Career boundary pointer.
- `docs/ECOSYSTEM_OVERVIEW.md` — added Music/Career boundary pointer and narrowed public/private cautions.
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md` — tracks the five unresolved questions from the placement contract.
- `AI_PROGRESS_LOG.md` — logs this cleanup.

**Decision:** Treat Claude's verdict as accepted: boundary sound, no reversal needed, doc consistency needed before implementation.

**Validation:** Confirmed PR #24 is merged. Read the exact stale docs Claude named. No app source changed. No tests run because this is docs-only.

**Next suggested step:** Completed by EPK PR #23 for the first tiny app-side slice.

### 2026-07-01 — GPT-5.5 Thinking — Music/Career boundary staged for Claude review

**Task:** Expand Beam's EPK boundary so the online EPK is treated as one public/export output inside a broader Prism Music/Career domain, then commit the relevant research and handover material for Claude review.

**Files changed:**

- `docs/REPO_BOUNDARIES.md` — adds Prism Music/Career product-domain note and reframes `EPK` as current implementation seed.
- `README.md` — adds Music/Career entry points.
- `context-packs/workspace/current-state.min.md` and `context-packs/workspace/current-state.md` — update suite orientation.
- `context-packs/epk/current-surface.min.md` and `context-packs/epk/current-surface.md` — reframe EPK pack as EPK/Music-Career seed surface.
- `context-packs/career-ops-research.md` — compressed research pack.
- `integrations/career-assistant-placement.contract.md` — placement contract.
- `integrations/registry.md` — registers the Music/Career placement contract.
- `docs/research/music-career/*` — research index and source research notes.

**Decision:** Prism Music/Career is the parent product domain. The current `EPK` repo remains the implementation seed for now; the EPK page is one output/module, not the whole app. No new repo is approved yet.

**Validation:** Checked Beam repo boundaries, approval posture, Spectra current pack, and Spectra `/api/v1/ai/request` source behavior. Current Spectra endpoint exists and accepts read-only AI requests only.

**Next suggested step:** Completed by Claude review, Beam PR #25 doc cleanup, and EPK PR #23.

### 2026-07-01 — Codex — Focus Spectra AI bridge merged

**Outcome:** Focus PR #25 merged the Spectra-first assistant, current setup guidance, resource monitor, classifier smoke path, and review-first proposals.

**Validation:** JavaScript syntax and diff checks passed. Mock and real browser flows passed; the real flow rendered a structured 10-minute proposal through `ollama / qwen3.5:9b` with no console errors. Apply was not clicked.

**Known baseline:** The architecture validator still reports ten legacy files without required module headers. Focus has no npm build/test scripts.

**Next suggested step:** Add focused browser automation, then clean up the module-header validator baseline separately.

### 2026-07-01 — Codex — Spectra cockpit/Focus architecture corrections merged

**Task:** Repair real Focus JSON responses, cohere cockpit approvals with suite primitives, and give `runAiRequest()` the existing cache/cascade intelligence.

**Outcome:** Merged to Spectra `main` through PRs #30 and #33. Validation included typecheck, focused AI/cockpit/routing tests, core engine tests, real local structured response, local cockpit smoke, and browser validation through Focus. Apply was not clicked.

### 2026-06-29 — GPT-5.5 Thinking — Spectra provider probe budget recovery fix

Dave's direct curl to `/api/v1/ai/request` returned `500` with `no executor within budget`; Ollama was blocked by a stale startup-probe budget row while free/paid providers were unavailable due missing API keys.

**Fix:** Spectra now clears the startup-probe RPM block when providers become available, with regression coverage for stale Ollama budget recovery.
