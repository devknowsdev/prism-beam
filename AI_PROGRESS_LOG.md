# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-06-30
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Spectra Tier 1 (PR #22), Tier 2a (PR #23), the Spectra side of the Focus/Spectra bridge (PR #24), Tier 2b routing intelligence (PR #25), Tier 3a semantic cache (PR #26), Tier 3b-A route decision cache hints (PR #27), Tier 3b-B ExecutionEngine route-hint wiring (PR #28), and Tier 3c routing telemetry/export hardening (PR #29) are merged to `devknowsdev/prism-spectra:main`. The Focus side remains on `devknowsdev/prism-focus:spectra-focus-ai-init-20260627`. Spectra cockpit prototype work is active on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`, now running a coherence-correction queue (P0–P3, see 2026-06-30 entries below): P0 landed on the branch, P1 implemented and pushed to `codex/cockpit-approval-ledger` pending merge, P2/P3 not started.

**Most recent completed work:** Codex fixed the real-mode Focus JSON bug (P0) and the cockpit's approval/ledger coherence gap (P1). Both independently re-verified by a Claude session against live source, not taken on report.

**Validation:** See the two 2026-06-30 entries below for commits and exact validation commands run.

**Current next priority:** Review/merge `codex/cockpit-approval-ledger` (P1) into `spectra-project-cockpit-20260629`, then start P2 (engine cascade/cache consolidation) + P3 (aiRole/maxOutputTokens structured fields) as an isolated PR — higher risk, touches `src/engine/executionEngine.ts` directly.

**Known caution:** Local real-model runs can use several GB of RAM/GPU and heat even when disk temp files are tiny. Ollama model storage is persistent and currently the main disk footprint. Keep real-mode validation short on M1 16GB until a status monitor exists. For cockpit work, do not add free-form shell input, hidden writes, or browser-based control of externally owned processes.

## Recent session entries

### 2026-06-30 — Codex, verified by Claude — Cockpit approval/ledger coherence (P1)

**Task:** Replace the cockpit's bespoke `CockpitActionPacket`/flat-`risk` approval system with Spectra's real `ApprovalQueue`/`PrismEventLedger`, per `COCKPIT_APPROVAL_LEDGER_COHERENCE_HANDOVER_20260630.md`.

**Files changed or reviewed:**

- `tools/cockpit/projectCockpit.ts` — `CockpitActionPacket` → `CockpitGuidedAction` with `approvalClass`/`checkpointPolicy` (six-class taxonomy) replacing the flat `risk` field; added `handleApproveGuidedAction()` and the `/api/v1/cockpit/actions/approve` route; write-class actions now call `requestApproval()`/`resolveApproval()`, observe-class actions skip the queue entirely.
- `tools/ai-gateway.ts` — instantiates `InMemoryApprovalQueue`/`InMemoryPrismEventLedger` once at gateway-process scope (same in-memory pattern the Workbench already uses, no new persistence layer).
- `test/cockpit-html.test.ts` — added coverage for the approval/resolve ledger pair, observe-class actions never touching the queue, and (load-bearing) that the client script calls the approve endpoint *before* the process-execute endpoint.

**Outcome:** Complete. Mapping table (§4 of the handover) implemented exactly per `CockpitActionKind`. All explicit guardrails held: no `CapabilityRegistry` registration, no Workbench merge, no shared/persistent store, one-click approve UX unchanged in behavior.

**Validation:** Claude session independently checked out `codex/cockpit-approval-ledger` (`ba18e4d`, forked cleanly from cockpit-branch tip `71f5475`) fresh and ran `npm run typecheck && npm run test:cockpit && npm run test:ai-request` — all pass. Codex also reports a live cockpit smoke pass (not independently re-run).

**Source/Beam mismatches:** None found — the handover document had no drift against current source.

**Risks / cautions:** Minor, non-blocking: the old guided panel showed a `Risk: low/none` badge next to write-class approve buttons; this diff removes it entirely (no replacement using `approvalClass`). Cosmetic only — flagged for Dave to decide whether to restore it using the new taxonomy, not a correctness issue.

**Next suggested step:** Review and merge `codex/cockpit-approval-ledger` into `spectra-project-cockpit-20260629`, then start P2/P3.

**Next AI should read:**

- `AI_LOAD_ME_FIRST.md`
- `AI_PROGRESS_LOG.md`
- `prism-spectra/docs/GPT_BUILD_PLAN_COCKPIT_ENGINE_FOCUS_JSON_20260630.md` §3–4 (P2/P3 scope)

### 2026-06-30 — Codex, verified by Claude — Real-mode Focus JSON fix (P0)

**Task:** Fix real-mode Focus chat returning unstructured prose instead of the `{reply, proposedTasks, proposedSchedule, followUpQuestion}` shape, per `CODEX_PROMPT_P0_FOCUS_JSON_FIX.md`.

**Files changed or reviewed:**

- `src/engine/executionEngine.ts` — `runAiRequest()` now sets a single `packet.context.expectsJson` signal instead of three scattered heuristics.
- `src/executors/aiPrompt.ts` — `buildTaskPrompt()` surfaces Focus's literal instruction as the primary prompt text when `expectsJson` is true, and skips the generic "Respond concisely..." closing line that previously contradicted it.
- `src/executors/ollama.ts` — `OllamaExecutor.execute()` passes Ollama's native `format` (full JSON schema, not just `"json"`) and `think: false` when `expectsJson` is set.
- `test/ai-request.test.ts` — added coverage asserting the constructed prompt and the constructed Ollama request body directly (not model output), plus that `ollamaMock.ts` was left untouched.

**Outcome:** Complete. Root cause was the instruction being buried in a JSON-dumped context blob and contradicted by a generic closing instruction; mock mode already handled this correctly via bespoke logic that was never extended to the real path.

**Validation:** Claude session independently cloned `spectra-project-cockpit-20260629` fresh and ran `npm run typecheck && npm run test:ai-request && npm run test:cockpit` — all pass. Dave additionally validated against live `qwen3.5:9b` (Ollama 0.30.10): `structuredResponse` populated with task/schedule proposals, ~23s local inference.

**Source/Beam mismatches:** Beam's `current-state.min.md` had flagged this as an unresolved, undiagnosed blocker ("Fix or clarify empty real-mode response handling") — now corrected in that file.

**Risks / cautions:** None — `ollamaMock.ts` confirmed unchanged; fix is additive (new signal, new conditional branches) rather than a rewrite of existing paths.

**Next suggested step:** See P1 entry above (same session, landed immediately after).

**Next AI should read:**

- `AI_LOAD_ME_FIRST.md`
- `AI_PROGRESS_LOG.md`
- `prism-spectra/docs/GPT_BUILD_PLAN_COCKPIT_ENGINE_FOCUS_JSON_20260630.md`

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
