# Focus Interaction Stabilization Card

Date: 2026-06-24
Repos evidenced: `devknowsdev/prism-focus`, `devknowsdev/EPK`, `devknowsdev/prism-beam`

## Purpose

Compact Beam memory for the post-setup Focus stabilization layer. Future AI
sessions should read this before proposing new Focus interaction, import,
keyboard, or undo/redo work.

## Current Focus capabilities to remember

### EPK packet review/import

Focus now has a review-first EPK packet importer.

Implementation entry points:

- `prism-focus/src/actions_import.js`
- `prism-focus/src/render_import.js`
- `prism-beam/fixtures/epk-to-focus.sample-event-packet.json`
- `prism-beam/docs/integrations/EPK_FOCUS_LOOP_SMOKE.md`

Flow:

```text
paste packet JSON -> review packet -> select proposed tasks -> import selected
```

Safety boundary:

- EPK proposes task JSON.
- Focus reviews/imports selected tasks.
- No hidden sync.
- No direct EPK -> Focus task creation.
- Duplicate `sourceId` values are skipped instead of creating duplicate task rows.

### Browser interaction repair layer

Focus now has a browser-only interaction repair layer.

Implementation entry point:

- `prism-focus/src/interaction_fixes.js`

It currently handles:

- loading/repairing global browser action behavior where needed
- moving drag behavior from the whole task row to the drag grip
- planner month hover previews
- no-clobber planner navigation repaint fixes
- robust delete behavior
- robust timer save/quick-log behavior
- loading the keyboard command runtime

Do not reimplement these repairs elsewhere without first inspecting the current
Focus source.

### Clickable-surface audit

Focus records the browser clickable-surface audit at:

```text
prism-focus/docs/CLICKABLE_SURFACE_AUDIT.md
```

Use it before claiming a button/control is missing or broken. Node workflow tests
alone are not enough proof that browser inline handlers and post-render behavior
are wired correctly.

### Keyboard command runtime

Focus now has keyboard commands at:

```text
prism-focus/src/keyboard_commands.js
```

Current command map:

| Key | Action |
| --- | --- |
| Up / Down | Select previous/next visible task |
| Right | Level down / open into selected task |
| Left | Level up / back out of selected task |
| Enter | Activate/open selected task |
| Space | Start timer/stopwatch on selected task |
| Backspace | Open delete confirmation for selected task |
| Enter while confirming delete | Confirm delete |
| Backspace or Escape while confirming delete | Cancel delete |
| Cmd/Ctrl+Z | Undo from in-memory snapshot history |
| Cmd/Ctrl+Shift+Z or Cmd/Ctrl+Y | Redo from in-memory snapshot history |

Keyboard commands must not run while the user is typing in inputs, textareas,
selects, or contenteditable areas.

Undo/redo is an in-memory session snapshot safety net. It is not a persistent
event log, not a replacement for backups, and not a durable rollback system.

## Anti-drift rules

- Do not rebuild EPK import from scratch; inspect `actions_import.js` and
  `render_import.js` first.
- Do not add direct EPK -> Focus writes; preserve the review/import screen.
- Do not automate this loop through Spectra until the manual smoke loop is clean
  and a later Beam contract explicitly approves automation.
- Do not bind global keyboard commands without excluding typing targets.
- Do not treat keyboard undo/redo as durable recovery.
- Destructive actions still require confirmation.
- Source files override this card if they diverge.

## Suggested next work

- Run the manual EPK -> Focus smoke checklist in a real browser.
- Add lightweight Focus importer tests after the smoke pass is clean.
- Extract a reusable Beam pattern for review-first imports.
- Extract a reusable Beam pattern for browser interaction repair layers.
- Extract a reusable Beam pattern for local in-memory undo boundaries.

## Future prompts can omit

Future prompts can omit the existence and location of the Focus importer,
interaction repair layer, clickable-surface audit, keyboard command runtime, and
the safety rule that EPK proposes while Focus reviews/imports selected tasks.
