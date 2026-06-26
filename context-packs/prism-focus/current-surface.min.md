# Prism Focus Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Focus sessions.

**Last verified:** 2026-06-26  
**Verified against:** `devknowsdev/prism-focus/main` after planner cursor scheduling, persistence/factory-reset hardening, and grouped header-control pass. See `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`.
**Scope:** `prism-focus`. Verify source before implementation.

## Role

Focus is the downstream planning/focus app in the Prism suite. It should not own general model routing.

## Current source surface

Current notable files/routes after 2026-06-26 hardening:

- `src/planner_functions.js` — planner helper/action layer for scheduling, unscheduling, duration, copy, create, dump item, view navigation.
- `src/planner_timeline_cursor.js` — day-scheduler cursor tracking plus click-start / click-end task creation.
- `src/storage.js` — defensive per-key `adhd4_*` localStorage loading and Focus-key clearing helper.
- `src/actions_export.js` — full backup export plus backup-gated factory reset flow.
- `src/factory_reset_ui.js` — Day Log factory-reset UI patch.
- `src/focus_header_controls.js` — grouped top-level header controls: `Plan day`, `Focus mode`, `Assistant`, `Manage`.
- `index.html` — classic script order is significant; verify load order before adding render/action patches.

## AI boundary

Focus should request AI help through Spectra, not by calling Ollama, OpenRouter, OpenAI, Anthropic, Gemini, or other model providers directly.

Existing legacy AI/provider files may still exist; do not expand direct provider ownership in Focus.

## Expected AI use cases

- parse/summarise planning input,
- suggest task breakdowns,
- help with daily/focus flows,
- support reviewed imports such as EPK event packets,
- request read-only or draft-style assistance through Spectra.

## Safety defaults

- No hidden task creation from external apps.
- No broad background scanning.
- No external model calls directly from Focus.
- Any write/action flow should be explicit and auditable.
- Planner helper calls can mutate local Focus state only after visible user action or reviewed import.
- Factory reset should remain backup-prompted and typed-confirmed; normal refresh must preserve local data.

## UI/control posture

Top-level controls should stay grouped by user intention:

- `Plan day` — day wizard, AI daily plan, reviewed imports.
- `Focus mode` — visible major state switch.
- `Assistant` — chat, voice listen, AI settings.
- `Manage` — files, widgets, settings, setup, theme, backup, factory reset.

Avoid returning to a long row of icon-only global controls.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`

## Source escalation

For Focus implementation, read this mini-pack first, then inspect only exact Focus files needed for the requested change. Do not rescan the whole repo just to orient.
