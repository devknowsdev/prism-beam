# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-07-01
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Beam PR #24 is merged to `main` and reframes `EPK` as the current implementation seed for a broader Prism Music/Career domain. Cleanup branch `beam/music-career-doc-consistency-20260701` applies Claude's post-merge doc-consistency fixes. Spectra routing/cockpit/real-mode JSON work is merged through PR #33. The review-first Spectra AI bridge is merged to `prism-focus:main` through PR #25.

**Most recent completed work:** Claude reviewed the Music/Career boundary and approved with doc-only changes. The cleanup branch refreshes stale EPK contact assumptions, adds Music/Career pointers to older Beam overview docs, and tracks open Music/Career questions in `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`.

**Validation:** Repo source/Beam packs were inspected through GitHub. No app source was changed. No tests were run because this is docs/contracts/research only.

**Current next priority:** Merge the Beam doc-consistency cleanup, then implement the smallest safe app-side slice Claude recommended: EPK publisher `career.refine_epk_copy` through Spectra's existing read-only `/api/v1/ai/request`, rendered as a discardable local draft.

**Known caution:** The current `EPK` repo is only an implementation seed. The online EPK page is not the whole Music/Career product. Any future repo rename or new `prism-career` repo requires explicit approval and a follow-up Beam boundary contract. Social/supporter/platform adapters are explicitly deferred.

## Recent session entries

### 2026-07-01 — GPT-5.5 Thinking — Music/Career doc consistency after Claude review

**Task:** Apply Claude's post-merge review findings from PR #24.

**Files changed:**

- `docs/contracts/EPK_CONTRACT.md` — replaced stale `mailto:`-only contact assumption with source-check/current `/api/contact` warning and Music/Career boundary pointer.
- `integrations/epk-to-spectra.adapter-contract.md` — refreshed contact assumptions, public/private rules, and Music/Career output framing.
- `docs/PRISM_BEAM_ROLE.md` — added Music/Career boundary pointer.
- `docs/ECOSYSTEM_OVERVIEW.md` — added Music/Career boundary pointer and narrowed public/private cautions.
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md` — tracks the five unresolved questions from the placement contract.
- `AI_PROGRESS_LOG.md` — logs this cleanup.

**Decision:** Treat Claude's verdict as accepted: boundary sound, no reversal needed, doc consistency needed before implementation.

**Validation:** Confirmed PR #24 is merged. Read the exact stale docs Claude named. No app source changed. No tests run because this is docs-only.

**Next suggested step:** Open/merge cleanup PR, then implement only `career.refine_epk_copy` in the existing EPK publisher via Spectra read-only AI request.

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

**Next suggested step:** Ask Claude to review the branch before implementation. Claude should look for product-boundary mistakes, schema overcommitment, privacy leaks, social/supporter data ownership gaps, repo-sprawl risks, and a safer minimal first slice.

### 2026-07-01 — Codex — Focus Spectra AI bridge merged

**Outcome:** Focus PR #25 merged the Spectra-first assistant, current setup
guidance, resource monitor, classifier smoke path, and review-first proposals.

**Validation:** JavaScript syntax and diff checks passed. Mock and real browser
flows passed; the real flow rendered a structured 10-minute proposal through
`ollama / qwen3.5:9b` with no console errors. Apply was not clicked.

**Known baseline:** The architecture validator still reports ten legacy files
without required module headers. Focus has no npm build/test scripts.

**Next suggested step:** Add focused browser automation, then clean up the
module-header validator baseline separately.

### 2026-07-01 — Codex — Spectra cockpit/Focus architecture corrections merged

**Task:** Repair real Focus JSON responses, cohere cockpit approvals with suite
primitives, and give `runAiRequest()` the existing cache/cascade intelligence.

**Files changed or reviewed:**

- `prism-spectra/src/executors/{aiPrompt,ollama}.ts` — real JSON instruction and schema-constrained output.
- `prism-spectra/tools/cockpit/projectCockpit.ts` — suite approval/ledger wiring.
- `prism-spectra/src/engine/executionEngine.ts` — shared cache/routing/fallback path.
- `prism-spectra/test/{ai-request,cockpit-html}.test.ts` — regression coverage.

**Outcome:** Merged to Spectra `main` through PRs #30 and #33. PRs #31/#32
provided isolated review diffs before final promotion.

**Validation:** Typecheck, focused AI/cockpit/routing tests, core engine 60/60,
real `qwen3.5:9b` structured response, and local cockpit smoke passed. Final
browser validation also passed: Focus rendered the real reply and a structured
10-minute proposal with Apply/Dismiss review controls and no console errors.

**Source/Beam mismatches:** Beam still described Tier 2b/3a/3b as unbuilt,
classified `src/events` as inert Track B, and listed empty real-mode response
handling as unresolved. Corrected in this housekeeping branch.

**Risks / cautions:** Real gateway and browser behavior are verified. Apply was
not clicked, so the validation did not import the proposed task.

**Next suggested step:** Completed by Focus PR #25.

### 2026-06-29 — GPT-5.5 Thinking — Spectra mock Focus chat JSON response

Dave confirmed Focus chat now reaches Spectra and routes to Ollama mock, but the UI displayed the raw debug executor echo because Focus requested valid JSON while the mock executor returned `[ollama:mock:model] handled ...`.

Changes:
- `src/executors/ollamaMock.ts`: added `mockOutputFor()` and `isFocusJsonAiRequest()`.
- `src/executors/ollamaMock.ts`: Prism Focus JSON/chat requests now return JSON with `reply`, `proposedTasks`, `proposedSchedule`, and `followUpQuestion` instead of a transport/debug echo.
- `test/ai-request.test.ts`: added a Focus chat request fixture and assertions that mock mode returns a structured response with a string `reply` and empty proposal arrays.

Commits:
- `aaaee02fb1ce3f4f9d22fc9737daee19eb7cf08c` — `fix: return Focus-shaped JSON from mock AI requests`
- `a5cbe27e99bd047a2e7df9f1caa2652a5296081a` — `test: cover Focus JSON mock response`

Validation:
- Fetched changed files back from GitHub after writing.
- Real local validation still needed: `npm run test:ai-request && npm run test:cockpit`.

Next:
- Pull and restart the gateway.
- Retest Focus chat in mock mode.

### 2026-06-29 — GPT-5.5 Thinking — Spectra provider probe budget recovery fix

Dave's direct curl to `/api/v1/ai/request` returned `500` with `no executor within budget`; Ollama was blocked as `RPM budget exhausted (0/0)`, while free/paid providers were unavailable due missing API keys.

Root cause:
- `applyProviderProbe()` wrote `rpmLimit: 0` for unavailable providers.
- `Ledger.ensureRows()` uses `INSERT OR IGNORE`, so a stale persisted `ollama` row with `rpm_limit=0` stayed in `.demo/ai-gateway.db`.
- When Ollama later became available, `applyProviderProbe()` did not clear the old block.

Changes:
- `src/config/providerProbe.ts`: widened probe-aware `setBudget` typing to allow `rpmLimit: null`.
- `src/config/providerProbe.ts`: now writes `{ rpmLimit: status.available ? null : 0 }`, so available providers clear the startup-probe RPM block.
- `test/ai-request.test.ts`: added regression coverage that a stale `ollama rpmLimit=0` is cleared by an available Ollama probe before AI request execution.

Commits:
- `74b96c083a53d2aa61bb2a65b09bc9328790f4ed` — `fix: clear provider probe rpm block when available`
- `ddfbfca23f421c9800761654090303194451f118` — `test: cover provider probe budget recovery`

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit guided-first validation failure UX

Dave browser-tested the cockpit and found the UI was stuck between guided workflow and process controls: it said validation failed, but did not make the next step obvious enough.

Changes:
- `tools/cockpit/projectCockpit.ts`: changed failed-validation guidance to say `Review the failed validation output below, then rerun validation after fixing the issue.`
- `tools/cockpit/projectCockpit.ts`: added inline `Validation output` inside the guided panel using the latest Spectra Validation log lines from the profile.
- `tools/cockpit/projectCockpit.ts`: changed failed-validation actions to `Open advanced logs` and `Run validation again`, making advanced logs explicitly secondary.
- `test/cockpit-html.test.ts`: added regression coverage for guided-first failure copy, inline output, rerun action, and advanced-log secondary action.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit guided-panel log-access fix

Dave browser-tested Slice 2 and found that validation failed but logs were hard to access because the advanced drawer collapsed while moving toward it. Root cause: the cockpit auto-refresh re-rendered the whole page every few seconds and reset local UI state.

Changes:
- `tools/cockpit/projectCockpit.ts`: added `advancedOpen` and `openLogRoles` client-side state so the advanced drawer and open log cards survive auto-refresh renders.
- `tools/cockpit/projectCockpit.ts`: added a direct `Open validation logs` guided action for failed validation instead of only showing passive status text.
- `tools/cockpit/projectCockpit.ts`: made the successful state expose an `Open Focus` guided action.
- `test/cockpit-html.test.ts`: added regression coverage for failed-validation `show-logs`, direct log button rendering, drawer-state persistence, and open-log persistence.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit Slice 2 guided panel scaffold

Implemented Slice 2 on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

Changes:
- `tools/cockpit/projectCockpit.ts`: added checklist/action/guidance types and exported `deriveCockpitGuidance(profile)` for the Focus ↔ Spectra bridge workflow.
- `tools/cockpit/projectCockpit.ts`: added `guidance` to the profile response.
- `tools/cockpit/projectCockpit.ts`: added guided panel UI with mission, state summary, next safe action, readiness checklist, waiting state, and collapsed advanced controls.
- `test/cockpit-html.test.ts`: added guidance derivation tests.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit Slice 1 PID parser hardening

Implemented Slice 1 on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

Changes:
- `tools/cockpit/projectCockpit.ts`: exported `parsePidOutput(raw)`, changed `listeningPids()` to use it, and filtered blank, zero, negative, and non-integer PID tokens.
- `tools/cockpit/projectCockpit.ts`: changed the external PID pill renderer to display only positive finite numeric PIDs.
