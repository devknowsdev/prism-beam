# Focus + Spectra AI Bridge Progress — 2026-06-27

## Status

Staged on feature branches, not merged to app `main` yet.

- Focus branch: `devknowsdev/prism-focus:spectra-focus-ai-init-20260627`
- Spectra branch: `devknowsdev/prism-spectra:spectra-focus-ai-init-20260627`
- Beam update branch: `devknowsdev/prism-beam:main`

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

Branch: `spectra-focus-ai-init-20260627` — 10 commits ahead of `main`, 0 behind at time of Beam update.

Files changed:

- `src/ai_adapter_local.js`
  - URL/token resolution is dynamic per request.
  - Adds `health()` and `testAiRequest()` helpers.
  - Routes read-only AI requests to `/api/v1/ai/request`.
- `src/ai_spectra_settings.js`
  - Adds visible Settings -> AI Spectra gateway panel.
  - Adds guided Focus AI setup wizard.
  - Adds dev-default setup, copy/download gateway command, health/request test, provider-failure status, and friendlier Ollama failure messages.
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
- `index.html`
  - Loads `ai_spectra_settings.js`.
  - Loads `ai_chat_spectra_bridge.js` after `ai_spectra_bridge.js` and before later AI/runtime scripts.
- `docs/AI_SPECTRA_BRIDGE.md`
  - Documents Spectra-first setup, wizard, safety boundary, local storage keys, and remaining follow-ups.

## Spectra branch changes

Branch: `spectra-focus-ai-init-20260627` — 4 commits ahead of `main`, 0 behind at time of Beam update.

Files changed:

- `package.json`
  - Adds `test:focus-ai` and `focus:ai:gateway` scripts.
- `tools/focus-ai-smoke.ts`
  - Adds smoke test for `GET /api/v1/health` and `POST /api/v1/ai/request` using a Focus read-only request.
- `docs/FOCUS_AI_INIT.md`
  - Documents Focus AI setup path, mock/real Ollama mode, smoke test command, and browser limitation that a page cannot silently start Node/Ollama.

## Manual validation observed in session

User validated on local machine:

- Focus Settings -> AI could reach Spectra in mock mode.
- Real Ollama initially failed because Ollama server was not running.
- `curl http://127.0.0.1:11434/api/tags` later returned installed local models.
- Installed models included `qwen3:8b`, `qwen2.5-coder:7b`, `phi3:mini`, `deepseek-coder:6.7b`, `qwen2.5:7b`, `mistral:7b`, and `llama3.1:8b`.
- Spectra real Ollama mode then worked when started with `OLLAMA_GENERAL_MODEL="qwen3:8b"` and `OLLAMA_CODER_MODEL="qwen2.5-coder:7b"`.
- Focus panel showed provider `ollama`, model `qwen3:8b`, and boundary `local`.

Recommended local model policy for now:

```text
Focus general assistant / day dumps: qwen3:8b
Coding/dev help only:              qwen2.5-coder:7b
Fast fallback:                     phi3:mini or mistral:7b
```

Do not require larger model downloads yet. User cancelled `qwen3:14b` due to size and chose to proceed with installed models.

## Validation not run by assistant

- No assistant-side local `npm install`, typecheck, unit tests, or browser automation were run.
- No PRs were opened.
- No merge to Focus/Spectra `main` was performed.
- Full chat day-dump proposal flow still needs browser testing after latest Focus pull/hard refresh.

## Current cautions

- The Focus chat bridge currently supports text chat. Chat file attachments remain blocked with a clear message because they still depend on the older/full local daemon file API.
- Task/planner writes must stay review-first. Spectra should propose; Focus should apply only after user action.
- If ordinary Focus chat routes to `qwen2.5-coder:7b`, it may behave like a terminal/coding assistant. Route ordinary Focus chat/planning to `qwen3:8b`.
- The old direct provider code in `src/ai.js` still exists as legacy/transition code. Do not expand it as the primary architecture.
- Settings UI may still need copy cleanup so generic mock-mode notes do not visually imply mock mode is active when real Ollama is active.

## Suggested next implementation steps

1. Pull latest Focus branch locally and hard-refresh browser.
2. Test Focus Assistant with:

   ```text
   What can you do in this app?
   ```

   Expected: app-aware Focus response, not terminal-command help.

3. Test day-dump scheduling:

   ```text
   I need to schedule my day. I have to reply to emails, shower, eat, practise guitar, work on Prism, rest, and sort dinner. Make it gentle and realistic.
   ```

   Expected: reply plus proposed Focus tasks/schedule blocks and `Apply proposed tasks` button.

4. Verify applying proposed tasks creates local Focus tasks with `ts`, `estimatedMins`, `durationMins`, `note`, and review-first confirmation.
5. Fix any prompt/JSON parsing issues discovered in browser testing.
6. Consider Spectra-side routing policy so `focus-chat-message`, `focus-day-dump-schedule`, and `focus-task-breakdown` prefer `qwen3:8b`, while coding intents use `qwen2.5-coder:7b`.
7. Open PRs for Focus and Spectra after manual browser validation.

## Next AI should read

- `AI_LOAD_ME_FIRST.md`
- `AI_PROGRESS_LOG.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `context-packs/prism-focus/current-surface.min.md`
- `docs/progress/FOCUS_SPECTRA_AI_BRIDGE_2026-06-27.md`
