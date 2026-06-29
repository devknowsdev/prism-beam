# AI Progress Log

**Purpose:** Single current handover/changelog file for AI continuity across Prism work.

**Last updated:** 2026-06-29
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Spectra Tier 1 (PR #22), Tier 2a (PR #23), the Spectra side of the Focus/Spectra bridge (PR #24), Tier 2b routing intelligence (PR #25), Tier 3a semantic cache (PR #26), Tier 3b-A route decision cache hints (PR #27), Tier 3b-B ExecutionEngine route-hint wiring (PR #28), and Tier 3c routing telemetry/export hardening (PR #29) are merged to `devknowsdev/prism-spectra:main`. The Focus side remains on `devknowsdev/prism-focus:spectra-focus-ai-init-20260627` and has now been browser-validated locally through mock mode, with real Ollama mode partially validated. Spectra cockpit prototype work is active on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

**Most recent completed work:** GPT fixed the Spectra cockpit Slice 2 guided-panel usability bug reported from local browser testing: the advanced drawer/log view now survives auto-refresh re-renders, and failed validation shows a direct `Open validation logs` action in the guided panel. Commits: `8c56a95b59014b156ade2ce5b709737ad9add136` and `94c014717eae197ddd0d0c58892ca90ed55f0301`.

**Validation:** The fix was verified from this GPT session by fetching the changed files back from GitHub and adding regression coverage for drawer/log persistence and the direct validation-log action. The real repo command `npm run test:cockpit` was not run by GPT because this environment does not have the local repo checkout/npm dependency state. Dave/Codex should pull the branch, restart the gateway, and run `npm run test:cockpit` locally before continuing to Slice 3 or opening a PR.

**Current next priority:** Pull `spectra-project-cockpit-20260629`, restart the cockpit gateway, click `Open validation logs`, and inspect the `Spectra Validation` output. If clean after local `npm run test:cockpit`, the next implementation slice is Slice 3: plain-language card labels and external-process copy in `tools/cockpit/projectCockpit.ts` only.

**Known caution:** Local real-model runs can use several GB of RAM/GPU and heat even when disk temp files are tiny. Ollama model storage is persistent and currently the main disk footprint. Keep real-mode validation short on M1 16GB until a status monitor shows disk, `.ollama` size, `.demo` size, memory pressure, loaded Ollama model, top CPU process, gateway mode, and thermal state. Route hints are advisory and must preserve local-first routing order, provider availability checks, and budget ledger checks. For cockpit work, do not add free-form shell input, hidden writes, or browser-based control of externally owned processes.

## Recent session entries

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit guided-panel log-access fix

Dave browser-tested Slice 2 and found that validation failed but the logs were hard to access because the advanced drawer collapsed while moving toward it. Root cause: the cockpit auto-refresh re-rendered the whole page every few seconds and reset local UI state.

Changes:
- `tools/cockpit/projectCockpit.ts`: added `advancedOpen` and `openLogRoles` client-side state so the advanced drawer and open log cards survive auto-refresh renders.
- `tools/cockpit/projectCockpit.ts`: added a direct `Open validation logs` guided action for failed validation instead of only showing passive status text.
- `tools/cockpit/projectCockpit.ts`: made the successful state expose an `Open Focus` guided action.
- `test/cockpit-html.test.ts`: added regression coverage for failed-validation `show-logs`, direct log button rendering, drawer-state persistence, and open-log persistence.

Commits:
- `8c56a95b59014b156ade2ce5b709737ad9add136` — `fix: keep cockpit logs accessible across refresh`
- `94c014717eae197ddd0d0c58892ca90ed55f0301` — `test: cover cockpit log drawer persistence`

Validation:
- Fetched changed files back from GitHub after writing.
- Real `npm run test:cockpit` still needs to be run locally because this GPT session does not have the local repo checkout/npm dependency state.

Next:
- Pull and restart the cockpit gateway.
- Click `Open validation logs` from the guided panel when validation fails.
- Use the logs to identify the failing validation command.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit Slice 2 guided panel scaffold

Implemented Slice 2 from the Spectra cockpit guided-layer handover on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

Changes:
- `tools/cockpit/projectCockpit.ts`: added checklist/action/guidance types and an exported `deriveCockpitGuidance(profile)` function for the Focus ↔ Spectra bridge workflow.
- `tools/cockpit/projectCockpit.ts`: changed `ProjectCockpit.profile()` to include `guidance` derived from the profile's gateway and role statuses.
- `tools/cockpit/projectCockpit.ts`: added the guided panel CSS and client-side rendering helpers for mission, state summary, next safe action, readiness checklist, waiting state, and collapsed advanced controls.
- `tools/cockpit/projectCockpit.ts`: moved existing role cards under a collapsed `Advanced process controls` section without removing them.
- `tools/cockpit/projectCockpit.ts`: wired approve buttons through structured `data-guided-action` packets instead of inline JSON in `onclick`, keeping the guided layer structured while avoiding fragile HTML attributes.
- `test/cockpit-html.test.ts`: added guidance derivation tests for focus stopped, focus external, focus owned with validation not run, and focus owned with validation passed; retained PID parser and inline-script parse checks.

Commits:
- `e51dc951c2bf6df96fb7fa0bd86676624ff5c281` — `feat: add cockpit guided panel scaffold`
- `bdf6af509936dab3268b9a0ab7aa5b245c564f79` — `test: cover cockpit guidance scaffold`

Validation:
- Fetched changed files back from GitHub after writing.
- `compare_commits` from Slice 1 head `7d193ff188cb8d7af7886f1a773d303a3b9dadc6` to `spectra-project-cockpit-20260629` reports 2 commits and only 2 files changed.
- Real `npm run test:cockpit` still needs to be run locally because this GPT session does not have the local repo checkout/npm dependency state.

Next:
- Run `npm run test:cockpit` locally on the Spectra branch.
- Start cockpit with `AI_FORGE_AI_GATEWAY_TOKEN="dev-local-token" AI_FORGE_MOCK_EXECUTORS=1 npm run cockpit` and smoke `http://127.0.0.1:3000/cockpit`.
- Verify the guided panel appears above the collapsed advanced cards and that `Approve — Start Focus UI` calls the existing role start endpoint.

### 2026-06-29 — GPT-5.5 Thinking — Spectra cockpit Slice 1 PID parser hardening

Implemented Slice 1 from the Spectra cockpit guided-layer handover on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629`.

Changes:
- `tools/cockpit/projectCockpit.ts`: exported `parsePidOutput(raw)`, changed `listeningPids()` to use it, and filtered blank, zero, negative, and non-integer PID tokens.
- `tools/cockpit/projectCockpit.ts`: changed the external PID pill renderer to derive `realPids` and display only positive finite numeric PIDs.
- `test/cockpit-html.test.ts`: added six parser assertions for empty, whitespace, single PID, multiple PID, zero, and negative input, plus a guard that the HTML no longer uses the raw `status.port.pids.join` display path.

Commits:
- `0a49f62a11c5d624f9713a2454df446f17a03f8c` — `fix: harden cockpit PID parsing`
- `7d193ff188cb8d7af7886f1a773d303a3b9dadc6` — `test: cover cockpit PID parsing`

Validation:
- Fetched changed files back from GitHub after writing.
- `compare_commits` from previous branch head `5f12919502a55b40a700e2ba2126559a9a1cdaff` to `spectra-project-cockpit-20260629` reports 2 commits and only 2 files changed.
- Real `npm run test:cockpit` still needs to be run locally because this GPT session does not have the local repo checkout/npm dependency state.

Next:
- Run `npm run test:cockpit` locally on the Spectra branch.
- If clean, proceed to Slice 2 guided panel scaffold only.

### 2026-06-29 — GPT-5.5 Thinking — Focus/Spectra bridge browser validation and resource safety check

Dave validated the Focus side of the Spectra bridge from local branch `spectra-focus-ai-init-20260627`. Focus static site ran on port 4173. Spectra `main` AI gateway ran on port 3000 with `AI_FORGE_AI_GATEWAY_TOKEN="dev-local-token"`.

Observed results: health endpoint returned `200 OK` with CORS headers in mock and real modes; Focus accepted token settings; mock mode chat returned through Spectra; real mode loaded `qwen3.5:9b` and Focus displayed `ollama / qwen3.5:9b`, but the assistant response body was empty from Focus's perspective. Earlier failures were explained by configuration/state: Ollama server not running, stale `qwen3:9b` guidance, and stale gateway DB setting Ollama RPM limit to `0/0`.

Machine safety check: `.demo` runtime files stayed tiny (~1.8 MiB), Ollama model storage was ~35 GiB, disk free was ~139 GiB, memory pressure was safe, thermal warnings were absent, and `ollama ps` ended with no loaded model. Next step is resource/status monitor plus real-response parsing/smoke hardening before Focus PR.
