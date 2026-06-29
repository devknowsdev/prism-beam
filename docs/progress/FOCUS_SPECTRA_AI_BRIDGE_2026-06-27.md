# Focus + Spectra AI Bridge Progress — 2026-06-27

## Status

Focus branch remains staged and not merged to Focus `main` yet.

- Focus branch: `devknowsdev/prism-focus:spectra-focus-ai-init-20260627`
- Spectra status: Spectra-side bridge and routing hardening are merged to `devknowsdev/prism-spectra:main` through PR #29 / commit `a9073b0c90852c75390edcd208844e621046f9a0`.
- Beam status: current tracking docs updated on 2026-06-29 after local browser validation.

## Purpose

Record the live Focus/Spectra AI-init session so future AIs do not repeat orientation or accidentally route Focus AI directly through app-local Ollama/provider code.

## Boundary decision confirmed

Keep Spectra as the suite AI engine and Focus as the review/app-state owner.

Correct flow:

```text
Focus feature/chat/voice/day dump
-> Focus AiAdapter
-> Spectra /api/v1/ai/request
-> Spectra provider routing, usually local Ollama
-> Focus review UI
-> user clicks Apply before local task/planner writes
```

Do not make Focus own long-term provider routing or direct model selection. Direct Focus provider code remains transitional/legacy.

## Focus branch changes

Branch: `spectra-focus-ai-init-20260627` — feature branch ahead of `main`, not merged at time of Beam update.

Files changed:

- `src/ai_adapter_local.js`
  - URL/token resolution is dynamic per request.
  - Adds `health()` and `testAiRequest()` helpers.
  - Routes read-only AI requests to `/api/v1/ai/request`.
- `src/ai_spectra_settings.js`
  - Adds visible Settings -> AI Spectra gateway panel.
  - Adds guided Focus AI setup wizard.
  - Adds dev-default setup, copy/download gateway command, health/request test, provider-failure status, and friendlier Ollama failure messages.
  - Needs copy/model refresh before PR: old `qwen3:9b` / older model guidance still appears in this area.
- `src/ai_chat_spectra_bridge.js`
  - Adds app-aware Focus Assistant chat bridge.
  - Routes text chat through `AiAdapter.aiRequest()` instead of old `/conversations` and graph-execution paths.
  - Adds local chat persistence using `adhd4_spectra_chat_state_v1`.
  - Adds `New chat`, `Delete chat`, and `Clear all` controls.
  - Shows user message immediately and a `Thinking…` assistant placeholder while waiting.
  - Instructs the model that it is inside Prism Focus, not a terminal assistant; it must ignore accidental pasted git/terminal commands unless explicitly asked.
  - Requests structured JSON with `reply`, `proposedTasks`, `proposedSchedule`, and `followUpQuestion`.
  - Renders proposed Focus changes with `Apply proposed tasks` and `Dismiss`.
  - Applies proposed tasks only after visible user confirmation.
- `src/ai_chat_repaint_patch.js`
  - Directly syncs the visible `#chat-messages` pane when async Spectra responses arrive.
  - Upgrades chat composer to textarea behavior: Enter sends, Shift+Enter inserts a line break.
- `src/journal_checkin_patch.js`
  - Renames user-facing Dump widget to Journal while preserving widget id `journal`.
  - Hides standalone Check-in from default/migrated widget layout so it does not act as a focus-pulling first task.
- `index.html`
  - Loads `ai_spectra_settings.js`.
  - Loads `ai_chat_spectra_bridge.js`, `ai_chat_repaint_patch.js`, and `journal_checkin_patch.js` in the classic script order.
- `docs/AI_SPECTRA_BRIDGE.md`
  - Documents Spectra-first setup, wizard, safety boundary, local storage keys, and remaining follow-ups.
  - Needs refresh with the 2026-06-29 validation findings.

## Spectra-side status

Spectra branch work is no longer the blocker. Spectra `main` now includes:

- `/api/v1/health` and `/api/v1/ai/request` gateway path used by Focus.
- Current local model stack in Track A:
  - `qwen3.5:9b` for general/planner/reasoner.
  - `qwen3:1.7b` for classifier/fallback.
  - `qwen2.5-coder:7b` for coder.
- Tier 2b routing intelligence.
- Tier 3a semantic cache.
- Tier 3b route decision cache hints and ExecutionEngine route-hint wiring.
- Tier 3c routing telemetry/export hardening.

## Manual validation observed on 2026-06-29

Dave validated on local machine:

- Focus static site served at `http://localhost:4173/`.
- Focus branch was `spectra-focus-ai-init-20260627` with remote tracking `origin/spectra-focus-ai-init-20260627`.
- Spectra gateway served at `http://127.0.0.1:3000`.
- Health check returned `200 OK`, accepted `x-local-token: dev-local-token`, and returned CORS headers.
- Mock mode worked: Focus -> Spectra -> mock executor returned a visible chat response.
- Real gateway mode started with `AI_FORGE_MOCK_EXECUTORS=0`.
- Installed local models present:
  - `qwen3.5:9b`
  - `qwen3:1.7b`
  - `qwen2.5-coder:7b`
- Real mode loaded `qwen3.5:9b`; Focus displayed provider/model metadata `ollama / qwen3.5:9b`.
- Real Focus chat response body was not usable yet: app displayed `I received that, but no response text was returned.`

Earlier local validation issues and resolutions:

- `401 Unauthorized` meant Focus/Spectra token mismatch; resetting Focus localStorage URL/token and starting Spectra with `AI_FORGE_AI_GATEWAY_TOKEN="dev-local-token"` fixed health.
- `EADDRINUSE` meant old gateway still owned port 3000; killing the old listener fixed startup.
- `fetch failed` meant Ollama server was not running; `ollama serve` fixed Ollama availability.
- `ollama: RPM budget exhausted (0/0)` came from stale local gateway DB state where the Ollama ledger row had `rpm_limit = 0`; fresh validation DB/workdir avoided the local-state blocker.
- Stale `qwen3:9b` references surfaced in setup guidance. Current installed/planned model is `qwen3.5:9b`, not `qwen3:9b`.

Resource safety snapshot from Dave's machine:

- Disk free: about 139 GiB.
- Ollama storage: about 35 GiB under `~/.ollama/models`.
- Spectra `.demo` runtime files: about 1.8 MiB.
- Memory pressure: safe; reported 74% free.
- Thermal state: no warning recorded.
- `ollama ps` ended empty, meaning no model was left loaded after testing.
- A temporary high-CPU macOS Spotlight/CoreSpotlight process was identified and later idle; not caused by Spectra/Ollama.

## Current local model policy

Use installed models before asking user to download larger ones:

```text
Focus assistant / day dumps / planning: qwen3.5:9b
Classifier / fast smoke test / fallback: qwen3:1.7b
Coding/dev help only:                  qwen2.5-coder:7b
```

Do not use stale guidance that references `qwen3:8b` or `qwen3:9b` unless source is deliberately changed and revalidated. Do not ask the user to download larger models until the resource monitor exists and a real need is proven.

## Validation not run by assistant

- No assistant-side local `npm install`, typecheck, unit tests, or browser automation were run.
- No PRs were opened.
- No merge to Focus `main` was performed.
- Journal/check-in consolidation still needs local browser verification after latest Focus pull/hard refresh.
- Real-mode response parsing/output handling still needs source-level follow-up.

## Current cautions

- The Focus chat bridge currently supports text chat. Chat file attachments remain blocked with a clear message because they still depend on the older/full local daemon file API.
- Task/planner writes must stay review-first. Spectra should propose; Focus should apply only after user action.
- If ordinary Focus chat routes to `qwen2.5-coder:7b`, it may behave like a terminal/coding assistant. Route ordinary Focus chat/planning to planner/general model role.
- The old direct provider code in `src/ai.js` still exists as legacy/transition code. Do not expand it as the primary architecture.
- Settings UI needs copy cleanup so generic mock-mode notes do not visually imply mock mode is active when real Ollama is active.
- Local real-model testing can use several GB of RAM/GPU and heat even when temporary disk use is tiny.
- Stale gateway DBs can preserve bad ledger limits; use fresh validation DBs or add a reset/repair path for local validation.

## Suggested next implementation steps

1. Add a local resource/status monitor before more heavy real-mode testing:
   - disk free,
   - `.ollama` model storage size,
   - Spectra `.demo` runtime size,
   - memory pressure,
   - loaded Ollama model via `ollama ps`,
   - top CPU process,
   - gateway health and mock/real mode,
   - thermal warning state where available.
2. Refresh Focus setup/model copy to current stack: `qwen3.5:9b`, `qwen3:1.7b`, `qwen2.5-coder:7b`.
3. Add a lighter real-mode classifier smoke path or output cap for Settings -> Test Spectra.
4. Fix or clarify empty real-mode response handling: if provider/model are returned but text is empty, show a targeted message and log the raw Spectra response.
5. Keep file attachments explicitly text-only until full local daemon file API support is integrated.
6. Re-test Focus Assistant with a tiny prompt first, then with day-dump scheduling.
7. Verify `Apply proposed tasks` creates local Focus tasks only after confirmation.
8. Open Focus PR only after the above local browser validation is clean.

## Next AI should read

- `AI_LOAD_ME_FIRST.md`
- `AI_PROGRESS_LOG.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `context-packs/prism-focus/current-surface.min.md`
- `docs/progress/FOCUS_SPECTRA_AI_BRIDGE_2026-06-27.md`
