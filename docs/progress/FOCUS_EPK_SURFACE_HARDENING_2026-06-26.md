# Focus + EPK Surface Hardening — 2026-06-26

**Status:** staged in Beam review queue.

## Scope

This note compresses a multi-repo maintenance session covering:

- `devknowsdev/prism-focus`
- `devknowsdev/EPK`
- Beam follow-up on `beam/ai-change-review-queue-v2`

## Focus changes confirmed on `devknowsdev/prism-focus/main`

### Planner/day scheduler

- Added `src/planner_functions.js` as a classic-script planner actions helper layer.
- Added `src/planner_timeline_cursor.js` for day-scheduler cursor tracking and click-start / click-end task creation.
- Updated `index.html` load order so planner helper/cursor patches load after planner actions/render code.

### Persistence and reset safety

- Hardened `src/storage.js` so corrupt individual `adhd4_*` values do not broad-reset the app.
- Added `clearFocusLocalStorage()` for explicit local Focus data clearing.
- Updated `src/actions_export.js` with backup-building/download helpers and `factoryResetWithBackupPrompt()`.
- Added `src/factory_reset_ui.js` so the Day Log export/restore area includes an explicit backup-gated factory reset button.

### Top-level controls

- Added `src/focus_header_controls.js` to replace the crowded icon-only header with labelled grouped controls:
  - `Plan day`
  - `Focus mode`
  - `Assistant`
  - `Manage`
- The patch wraps the existing render flow instead of rewriting `render.js`.
- Underlying actions are preserved and regrouped by user intention.

## EPK changes confirmed on `devknowsdev/EPK/main`

### Access and redaction model

- Added `EPK/functions/_middleware.js` as a Cloudflare Pages middleware gate.
- Middleware uses hosting environment configuration; no password is committed to GitHub.
- Anonymous users can open a public shell, but content/social/media/file/publisher surfaces are protected or redacted.
- `/data/epk.json` returns redacted JSON to anonymous users.
- Admin/publisher/file/data/snapshot JSON routes stay protected.

### Public empty-shell CTA

- Added `EPK/public/public-empty-cta.js`.
- Public empty shell now frames the product as a general public outreach/profile kit, not only a music EPK.
- Added top `How to build this` button that opens an on-demand wizard.
- Wizard steps: Purpose, Identity, Proof, Audience routes, Publish safely.
- Updated `EPK/public/index.html` to load the public CTA patch after `app.js`.

### Publisher/control simplification

- Updated `EPK/public/publisher/publisher-focus-packet.js` to simplify top-level publisher controls.
- Publisher top bar now uses `Preview`, `Publish`, and `Tools`.
- Sidebar grouping now separates Build, Media, Tools/design/advanced, and Publish.

### Headers and deployment safety

- Updated protected/no-store/noindex behavior through `_headers`, middleware responses, redirects/robots where applicable.
- EPK deployment requires hosting environment values for protected/private behavior.

## Validation performed

- GitHub connector verified current `main` status for both repos.
- `devknowsdev/prism-focus/main` was confirmed ahead of the pre-session base by 16 commits and behind by 0.
- `devknowsdev/EPK/main` was confirmed ahead of the pre-session base by 14 commits and behind by 0.
- Exact file fetches verified key new files and script order.

## Validation not performed

- Browser/runtime testing was not run in this assistant environment.
- Cloudflare Pages deployment/redeploy behavior was not directly tested.
- Beam token-budget and link/path scripts were not run locally.

## Open follow-up

- Redeploy/test EPK on Cloudflare with required environment values set.
- Test EPK anonymous public shell, redacted JSON, owner login, publisher access, and full unlocked EPK.
- Test Focus header menus, planner click-create flow, persistence after hard refresh, and backup-gated factory reset.
- Review whether `beam/ai-change-review-queue-v2` should be reset after main has received these updates.
