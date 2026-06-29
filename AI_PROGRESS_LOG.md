# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-06-29
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Spectra Tier 1 (PR #22), Tier 2a (PR #23), the Spectra side of the Focus/Spectra bridge (PR #24), Tier 2b routing intelligence (PR #25), Tier 3a semantic cache (PR #26), Tier 3b-A route decision cache hints (PR #27), Tier 3b-B ExecutionEngine route-hint wiring (PR #28), and Tier 3c routing telemetry/export hardening (PR #29) are merged to `devknowsdev/prism-spectra:main`. The Focus side remains on `devknowsdev/prism-focus:spectra-focus-ai-init-20260627`. Spectra cockpit prototype work is active on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

**Most recent completed work:** GPT fixed the Focus/Spectra bridge 500 root cause found by Dave's curl output: Spectra was denying Ollama with `RPM budget exhausted (0/0)` because provider probing persisted `rpmLimit=0` when Ollama was unavailable and did not clear it when Ollama became available again. Commits: `74b96c083a53d2aa61bb2a65b09bc9328790f4ed` and `ddfbfca23f421c9800761654090303194451f118`.

**Validation:** GPT fetched the changed files back from GitHub and added regression coverage in `test/ai-request.test.ts`. Dave should pull, restart the gateway, run `npm run test:ai-request && npm run test:cockpit`, then retest Focus Settings → AI.

**Current next priority:** Pull `spectra-project-cockpit-20260629`, restart the cockpit gateway, verify the bridge with curl/Focus. If the persisted DB still has the stale value before restart, run a one-off SQLite reset for `ollama` or delete only the local gateway DB if the data is disposable.

**Known caution:** Local real-model runs can use several GB of RAM/GPU and heat even when disk temp files are tiny. Ollama model storage is persistent and currently the main disk footprint. Keep real-mode validation short on M1 16GB until a status monitor exists. For cockpit work, do not add free-form shell input, hidden writes, or browser-based control of externally owned processes.

## Recent session entries

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

Validation:
- Fetched changed files back from GitHub after writing.
- Real local validation still needed: `npm run test:ai-request && npm run test:cockpit`.

Next:
- Pull and restart the gateway.
- Retest curl and Focus Settings → AI.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit guided-first validation failure UX

Dave browser-tested the cockpit and found the UI was stuck between guided workflow and process controls: it said validation failed, but did not make the next step obvious enough.

Changes:
- `tools/cockpit/projectCockpit.ts`: changed failed-validation guidance to say `Review the failed validation output below, then rerun validation after fixing the issue.`
- `tools/cockpit/projectCockpit.ts`: added inline `Validation output` inside the guided panel using the latest Spectra Validation log lines from the profile.
- `tools/cockpit/projectCockpit.ts`: changed failed-validation actions to `Open advanced logs` and `Run validation again`, making advanced logs explicitly secondary.
- `test/cockpit-html.test.ts`: added regression coverage for guided-first failure copy, inline output, rerun action, and advanced-log secondary action.

Commits:
- `cfa63bac38b765bccaa43e0efbd18da7ba2a3d58` — `fix: make validation failure guided-first`
- `e1458fe1745d5d2053e528745508a1b27203aa4c` — `test: cover guided-first validation failure`

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
