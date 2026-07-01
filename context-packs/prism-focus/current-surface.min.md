# Prism Focus Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Focus sessions.

**Last verified:** 2026-07-01
**Verified against:** `prism-focus:main` after PR #25 and Spectra `main` after PR #33.
**Scope:** `prism-focus`. Verify exact source before implementation.

## Role

Focus is the downstream planning/focus app in the Prism suite. It should not own general model routing.

## Current source surface

Stable notable files/routes after 2026-06-26 hardening:

- `src/planner_functions.js` — planner scheduling/action helpers.
- `src/planner_timeline_cursor.js` — day-scheduler cursor tracking plus click-start / click-end task creation.
- `src/storage.js` — defensive per-key `adhd4_*` localStorage loading and Focus-key clearing helper; no longer forces Music Tools visible for existing users.
- `src/actions_export.js` — full backup export plus backup-gated factory reset flow.
- `src/factory_reset_ui.js` — Day Log factory-reset UI patch.
- `src/focus_header_controls.js` — grouped controls: `Focus mode`, `Log`, `Assistant`, `Manage`.
- `index.html` — classic script order is significant; verify load order before adding render/action patches.

Merged AI/UI bridge files:

- `src/ai_adapter_local.js` — dynamic Spectra URL/token resolution plus `health()`, `testAiRequest()`, and `/api/v1/ai/request` helper.
- `src/ai_spectra_settings.js` — Settings -> AI Spectra gateway panel, current model guidance, setup wizard, gateway test, and provider-failure guidance.
- `src/ai_chat_spectra_bridge.js` — app-aware chat, structured proposals, review-first Apply.
- `src/ai_chat_repaint_patch.js` — live chat repaint and composer behavior.
- `src/journal_checkin_patch.js` — renames Dump widget to Journal, hides standalone Check-in from default/migrated layouts, and does not render energy/check-in UI in Journal.
- `src/daylog_menu_patch.js` — hides Day Log from the dashboard widget surface and exposes it as a top-level Log modal with compact tracked-time summary.
- `src/widget_catalog_patch.js` — assigns widget categories/descriptions, groups hidden widgets by category, keeps hidden system surfaces out of drawer/count UI, and hides Music Tools on first upgraded load.
- `src/hotkeys_patch.js` — whitelisted, configurable local hotkeys.
- `src/render_music.js` — Music Tools remain available but default hidden under Creative tools.
- `docs/AI_SPECTRA_BRIDGE.md` — validated Focus-side setup, model, safety, and troubleshooting guidance.

## AI boundary

Focus should request AI help through Spectra, not by calling Ollama, OpenRouter, OpenAI, Anthropic, Gemini, or other model providers directly.

Existing legacy AI/provider files may still exist; do not expand direct provider ownership in Focus.

Beam-confirmed flow:

```text
Focus feature/chat/voice/day dump -> Focus AiAdapter -> Spectra /api/v1/ai/request -> provider response -> Focus review UI -> user Apply before task/planner writes
```

## Browser validation status — 2026-07-01

Validated locally by Dave with Focus static site at `http://localhost:4173/` and Spectra gateway at `http://127.0.0.1:3000`.

PASS:

- Focus bridge merged to `main` through PR #25.
- Spectra `main` gateway health returned `200 OK` with token accepted and CORS headers present.
- Mock mode request/chat path worked.
- Real gateway started with `AI_FORGE_MOCK_EXECUTORS=0`.
- Installed current local stack was present: `qwen3.5:9b`, `qwen3:1.7b`, `qwen2.5-coder:7b`.
- Real Ollama mode rendered an `ollama / qwen3.5:9b` reply, a structured
  10-minute proposal, and Apply/Dismiss controls with no console errors.
- Machine safety check showed no immediate resource danger: about 139 GiB disk free, `.ollama` about 35 GiB, Spectra `.demo` about 1.8 MiB, memory pressure safe, thermal warnings absent, and `ollama ps` ended empty.

OPEN:

- Apply was not clicked during real validation, so no proposal was imported.
- Stale gateway DB state can set Ollama RPM limit to `0/0`; fresh validation DB avoids this local-state blocker.
- Chat file attachments remain text-only and warn that full daemon file API support is still needed.

## Expected AI use cases

- parse/summarise planning input,
- suggest task breakdowns,
- help with daily/focus flows,
- support reviewed imports such as EPK event packets,
- request read-only or draft-style assistance through Spectra,
- chat-based stream-of-consciousness day dumps into proposed tasks/schedules,
- app-aware explanation of Focus capabilities.

## Current local model guidance

Use installed models before asking user to download anything larger:

- `qwen3.5:9b` — Focus assistant, day dumps, planning, task breakdowns, general/planner/reasoner routes.
- `qwen3:1.7b` — classifier and fast fallback/smoke-test route.
- `qwen2.5-coder:7b` — coding/dev help only.

If ordinary Focus chat routes to a coder model, it may over-focus on terminal/dev help. If settings smoke tests use the full planner prompt, they may be too heavy for quick validation on M1 16GB.

## Safety defaults

- No hidden task creation from external apps.
- No broad background scanning.
- No external model calls directly from Focus.
- Any write/action flow should be explicit and auditable.
- Planner helper calls can mutate local Focus state only after visible user action or reviewed import.
- AI chat/day-dump proposals should stay local-draft/read-only until user clicks Apply.
- Hotkeys should call only whitelisted local app functions, ignore normal typing in inputs, and remain user-configurable.
- Factory reset should remain backup-prompted and typed-confirmed; normal refresh must preserve local data.
- Refresh the resource/status monitor before heavier real local model testing.

## UI/control posture

Top-level controls should stay grouped by user intention:

- `Focus mode` — visible major state switch.
- `Log` — metadata/history surface for Day Log, with compact today summary only.
- `Assistant` — planning wizard, AI daily plan, chat, voice listen, AI settings, and reviewed imports.
- `Manage` — files, widgets, settings, setup, theme, backup, factory reset.

Avoid returning to a long row of icon-only global controls. Prefer Journal over Dump wording for user-facing labels. Day Log should be treated as metadata/history, not a primary dashboard widget. Plan-day actions should live under Assistant rather than as their own top-level menu.

## Next implementation slice

1. Add automated browser smoke coverage for Settings -> AI and the first reviewed helper action.
2. Resolve the legacy module-header validator debt separately.
3. Keep attachments text-only until full daemon file API integration is ready.
4. Consider removing direct provider fallback only after Spectra is comfortably established.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`
- `docs/progress/FOCUS_SPECTRA_AI_BRIDGE_2026-06-27.md`

## Source escalation

Read this pack first, then inspect only the exact Focus files needed.
