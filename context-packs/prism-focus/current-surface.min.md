# Prism Focus Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Focus sessions.

**Last verified:** 2026-06-27  
**Verified against:** `devknowsdev/prism-focus/main` for stable 2026-06-26 planner/header/persistence hardening, plus active staged branch `devknowsdev/prism-focus:spectra-focus-ai-init-20260627` for Spectra AI bridge work and Journal/check-in consolidation. See `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md` and `docs/progress/FOCUS_SPECTRA_AI_BRIDGE_2026-06-27.md`.
**Scope:** `prism-focus`. Verify source before implementation.

## Role

Focus is the downstream planning/focus app in the Prism suite. It should not own general model routing.

## Current source surface

Stable notable files/routes after 2026-06-26 hardening:

- `src/planner_functions.js` — planner helper/action layer for scheduling, unscheduling, duration, copy, create, dump item, view navigation.
- `src/planner_timeline_cursor.js` — day-scheduler cursor tracking plus click-start / click-end task creation.
- `src/storage.js` — defensive per-key `adhd4_*` localStorage loading and Focus-key clearing helper.
- `src/actions_export.js` — full backup export plus backup-gated factory reset flow.
- `src/factory_reset_ui.js` — Day Log factory-reset UI patch.
- `src/focus_header_controls.js` — grouped top-level header controls: `Plan day`, `Focus mode`, `Assistant`, `Manage`.
- `index.html` — classic script order is significant; verify load order before adding render/action patches.

Active staged AI/UI bridge files on `spectra-focus-ai-init-20260627`:

- `src/ai_adapter_local.js` — dynamic Spectra URL/token resolution plus `health()`, `testAiRequest()`, and `/api/v1/ai/request` helper.
- `src/ai_spectra_settings.js` — Settings -> AI Spectra gateway panel, setup wizard, dev defaults, gateway test, provider-failure guidance.
- `src/ai_chat_spectra_bridge.js` — app-aware Focus Assistant chat through Spectra, local chat state, New/Delete/Clear controls, `Thinking…` placeholder, structured proposed tasks/schedule, review-first `Apply proposed tasks`.
- `src/ai_chat_repaint_patch.js` — live `#chat-messages` sync and textarea composer: Enter sends, Shift+Enter inserts a line break.
- `src/journal_checkin_patch.js` — renames Dump widget to Journal, embeds Daily Check-in inside Journal as optional/collapsible, hides standalone Check-in from default/migrated layouts.
- `docs/AI_SPECTRA_BRIDGE.md` — staged Focus-side setup and safety docs.

## AI boundary

Focus should request AI help through Spectra, not by calling Ollama, OpenRouter, OpenAI, Anthropic, Gemini, or other model providers directly.

Existing legacy AI/provider files may still exist; do not expand direct provider ownership in Focus.

Beam-confirmed flow:

```text
Focus feature/chat/voice/day dump -> Focus AiAdapter -> Spectra /api/v1/ai/request -> provider response -> Focus review UI -> user Apply before task/planner writes
```

## Expected AI use cases

- parse/summarise planning input,
- suggest task breakdowns,
- help with daily/focus flows,
- support reviewed imports such as EPK event packets,
- request read-only or draft-style assistance through Spectra,
- chat-based stream-of-consciousness day dumps into proposed tasks/schedules,
- app-aware explanation of Focus capabilities.

## Current local model guidance

Use installed models before asking user to download larger ones:

- `qwen3:8b` — default Focus assistant, day dumps, planning, task breakdowns.
- `qwen2.5-coder:7b` — coding/dev help only.
- `phi3:mini` or `mistral:7b` — fast fallback.

If ordinary Focus chat routes to a coder model, it may over-focus on terminal/dev help.

## Safety defaults

- No hidden task creation from external apps.
- No broad background scanning.
- No external model calls directly from Focus.
- Any write/action flow should be explicit and auditable.
- Planner helper calls can mutate local Focus state only after visible user action or reviewed import.
- AI chat/day-dump proposals should stay local-draft/read-only until user clicks Apply.
- Daily check-in should be optional/collapsible inside Journal, not a focus-pulling first task.
- Factory reset should remain backup-prompted and typed-confirmed; normal refresh must preserve local data.

## UI/control posture

Top-level controls should stay grouped by user intention:

- `Plan day` — day wizard, AI daily plan, reviewed imports.
- `Focus mode` — visible major state switch.
- `Assistant` — chat, voice listen, AI settings.
- `Manage` — files, widgets, settings, setup, theme, backup, factory reset.

Avoid returning to a long row of icon-only global controls. Prefer Journal over Dump wording for user-facing labels.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`
- `docs/progress/FOCUS_SPECTRA_AI_BRIDGE_2026-06-27.md`

## Source escalation

For Focus implementation, read this mini-pack first, then inspect only exact Focus files needed for the requested change. Do not rescan the whole repo just to orient.
