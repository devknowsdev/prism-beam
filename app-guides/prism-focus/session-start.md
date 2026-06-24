# prism-focus Session Start

## Scope

Compact guardrail for Focus work. Verify against the current `prism-focus` repo
before editing.

## Last Verified

2026-06-24 against local `prism-focus` README, docs, `src/ARCHITECTURE.md`,
`docs/AI_API.md`, `src/storage.js`, and source file map. The local checkout had
pre-existing changes, including a modified `README.md`; treat this as local
evidence, not a clean remote snapshot.

## Current Truths

- `prism-focus` owns daily planning, tasks, routines, and personal execution
  state.
- It is local-first: no account, no server required for day-to-day use, no build
  step, browser `localStorage` persistence, and IndexedDB for audio blobs.
- It should remain low-overwhelm and neurodivergent-friendly.
- Optional AI supports Ollama or Claude and should degrade gracefully when off.
- AI settings/API keys are separate from JSON backups; prompts should be bounded
  and explainable.
- Scheduled tasks, day planning, imports, restore flows, and task mutations must
  stay under user control.

## Safe Edit Zones

- Widget render/action pairs such as `src/render_tasks.js` and
  `src/actions_tasks.js`.
- Planner, day wizard, focus board, and task UI when following existing
  render/action patterns.
- Docs and tests that describe current behavior.

## Dangerous Zones

- `src/state.js`, `src/storage.js`, and migration/backup behavior.
- `index.html` script order.
- `src/ai.js`, `src/ai_exec.js`, and AI command execution.
- Restore backup, import, export, audio, and local AI installer flows.
- Anything that mutates Focus state from another app.

## Do

- Preserve user control over scheduled tasks, day planning, imports, and
  restores.
- Treat EPK event/promo packets as a future review/import flow, not direct
  mutation.
- Review cross-app imports before they mutate Focus state.
- Keep AI features bounded, explainable, and auditable.
- Be careful with `localStorage` keys and backup compatibility.

## Do Not

- Do not allow hidden writes from other apps.
- Do not add automatic calendar, email, social posting, or publishing behavior.
- Do not add folder scanning or file watching unless explicitly approved.
- Do not assume old `ADHDashboard` names are current user-facing language.

## Validation Hints

- `node src/test_workflows.js`
- `python3 tools/validate_architecture.py`
- Manually check backup/restore paths after persistence changes.
- Check AI command changes against `docs/AI_API.md`.

## Future prompts can omit

Future prompts can omit Focus ownership, local-first/no-build posture,
localStorage caution, user-control requirement for planning/imports, and the
rule that EPK packets should arrive through review/import rather than direct
mutation.

## Update Rules

Refresh this guide after state migration, AI execution, backup/restore,
calendar/import, or EPK-to-Focus integration work.
