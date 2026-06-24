# prism-focus Current Surface

## Scope

Low-token current-state pack for `prism-focus`.

## Last Verified

2026-06-24 against local `prism-focus` README, orientation docs, architecture
doc, AI API doc, and storage/source map. Local checkout had pre-existing
uncommitted/ahead changes.

## Evidence Used

- `prism-focus/README.md`
- `prism-focus/docs/ORIENTATION.md`
- `prism-focus/src/ARCHITECTURE.md`
- `prism-focus/docs/AI_API.md`
- `prism-focus/src/storage.js`
- `prism-focus/src/test_workflows.js`

## Current Truths

- Focus is the human-facing operations dashboard for planning, tasks, review,
  day execution, routines, and personal execution state.
- It is vanilla HTML/CSS/JS with classic script loading and no build step.
- Persistence is primarily browser `localStorage` with keys prefixed `adhd4_`;
  audio metadata/blobs have device-local caveats.
- Current key surfaces include Focus Board, Tasks, Planner, Day Wizard, Dump,
  Daily Check-in, Day Log, Habits, Music Tools, and optional AI.
- Optional AI supports Ollama or Claude and must remain graceful when disabled.

## Safe Assumptions

- Focus should stay low-overwhelm, local-first, and user-controlled.
- Cross-app data should enter as review/import material before mutation.
- Existing Node workflow tests are the main quick validation path.

## Do Not Infer

- Do not infer Focus owns orchestration, external publishing, or adapter policy.
- Do not infer another app may write directly into Focus state.
- Do not infer AI may execute arbitrary commands beyond whitelisted/audited
  flows.

## Known Stale Areas

- `ADHDashboard` appears in legacy names, storage keys, archived docs, and some
  local AI install text. Treat it as historical or compatibility naming unless
  current source proves otherwise.
- `src/state/` is described as a draft ES-module split and is not the loaded
  runtime path.

## Useful Entry Points

- `app-guides/prism-focus/session-start.md`
- `prism-focus/README.md`
- `prism-focus/docs/ORIENTATION.md`
- `prism-focus/src/ARCHITECTURE.md`
- `prism-focus/src/storage.js`
- `prism-focus/docs/AI_API.md`

## Validation Hints

- `node src/test_workflows.js`
- `python3 tools/validate_architecture.py`
- Manual backup/restore check when persistence changes.

## Future prompts can omit

Future prompts can omit Focus's current role, local-first/no-build shape,
primary surfaces, AI caution, localStorage caution, and future EPK review/import
direction.

## Update Rules

Refresh after Focus state migration, test-count changes, AI command changes,
or any approved cross-app import work.
