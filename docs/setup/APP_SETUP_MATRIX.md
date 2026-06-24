# Prism App Setup Matrix

Date: 2026-06-24
Sprint: Suite setup/readiness completion + post-setup Focus/EPK stabilization refresh

This matrix records current setup evidence for the Prism suite. It is a practical launch/readiness map, not a runtime dependency plan.

## Current setup status

| App | Current launch method | Dependency level | Setup coverage now present | Remaining setup risk | Recommended next PR |
| --- | --- | --- | --- | --- | --- |
| `EPK` | Static public site from `EPK/public`; Cloudflare Pages can use project root `EPK` with output `public`, or repo root with output `EPK/public`; local/admin path documented through `python3 -m http.server 8000`; hosted publisher route is `/publisher/`. | Low. Static HTML/CSS/JS evidence inspected. | `EPK/docs/EPK_SETUP.md`, README first-run section, and `EPK/public/publisher/setup-checklist.html` landed via PR #10. Focus packet export landed via PR #11 in `EPK/public/publisher/publisher-focus-packet.js` with `EPK/docs/FOCUS_PACKET_EXPORT.md`. | Medium. Publisher remains public unless `/publisher/*` is protected with Cloudflare Access or equivalent. Tokens remain session-only. Public deploy root remains public. Focus packets are local/manual exports only and should not be treated as sync. | `EPK-Setup-002 — deployment and Cloudflare Access verification checklist` |
| `prism-focus` | Hosted GitHub Pages link in README; open root `index.html`; local server recommended with `python3 -m http.server 8080` then `http://localhost:8080`. | Low. Vanilla HTML/CSS/JS with classic scripts; Node only needed for workflow tests. | First-run setup guide/modal, compass entry point, and README setup path landed via PR #11. EPK packet import review screen landed via PR #13. Browser interaction repairs landed via PRs #14-#15. Keyboard command runtime landed via PR #16. | Medium. Data remains browser `localStorage`; audio is IndexedDB and not included in JSON backups; optional AI can add setup complexity. EPK imports mutate Focus only after explicit review/import. Keyboard undo/redo is in-memory session snapshot history, not a durable event log. | `Focus-Setup-002 — PWA/install and backup verification pass` |
| `prism-spectra` | Node/TypeScript package; scripts include `npm run forge`, `npm run start`, `npm run typecheck`, `npm test`, `npm run build`, `npm run demo`, `npm run test:browser`; daemon/workbench can run through `npm run workbench`. | Medium/high. Requires Node >=22 and npm dependencies. | Read-only `npm run doctor`, `npm run setup`, and `npm run workbench` landed via PR #17. Setup-safe `test:setup` / explicit `test:full` split landed via PR #18. Manual daemon e2e workflow landed via PR #19. | Medium/high. Provider keys, daemon token, approvals, adapters, and safe execution still need careful handling. Full daemon/e2e work remains deliberate and should stay separate from setup-safe validation. | `Spectra-Stabilization-003 — split daemon e2e into an abortable execute-graph stream test with cleanup` |
| `prism-beam` | No runtime launch. Read `README.md`, `ai-guides/START_HERE.md`, context packs, registries, and docs. Smoke script: `bash scripts/run-workspace-smoke.sh`. | Low. Docs/reference repo. | Suite setup/readiness audit, setup matrix, schema UX plan, completion summary, setup landing page, schema cards, EPK -> Focus smoke fixture, and Focus interaction app card are present under `docs/`, `fixtures/`, `schemas/`, and `integrations/`. | Low as docs-only, but high drift risk if setup/integration truths are not refreshed after app PRs. | `Beam-Patterns-001 — reusable pattern cards for review-first imports, browser interaction repair, and local undo boundaries` |

## Current comfort ranking

1. `prism-focus` — easiest for Dave to open immediately because it has a hosted path, direct `index.html`, static-server path, first-run setup modal, manual EPK import review screen, interaction repairs, and keyboard commands.
2. `EPK` — easy to view and now has first-run docs/checklist plus a manual Focus packet export path, but publisher privacy still depends on Cloudflare Access or equivalent.
3. `prism-beam` — easy for AI/reference use, but not an app.
4. `prism-spectra` — more comfortable than before because `doctor/setup/workbench`, setup-safe tests, and a manual daemon e2e workflow exist, but still the most powerful and risk-sensitive repo.

## Immediate local validation path

Run these in a local checkout when shell access is available:

```bash
# Beam
cd prism-beam
git diff --check
bash scripts/run-workspace-smoke.sh

# EPK
cd ../EPK
python3 -m http.server 8000
# Open public/admin/publisher/checklist routes manually in browser.
# In the publisher, use Promo brief -> Focus task packet to generate JSON.

# Focus
cd ../prism-focus
python3 -m http.server 8080
node src/test_workflows.js
python3 tools/validate_architecture.py
# Use the Focus inbox/import button with Beam fixture:
# ../prism-beam/fixtures/epk-to-focus.sample-event-packet.json

# Spectra
cd ../prism-spectra
npm install
npm run doctor
npm run setup
npm run test:setup
npm run typecheck
npm run build
npm run forge -- --status
```

Do not run publish, email, deploy, broad scan, watcher, destructive, or secret-requiring commands as part of a setup audit.

## Completed setup commits

| Repo | Merge commit |
| --- | --- |
| `prism-beam` | `736073fd1c44a41bc533f3dc0aec575b9206cee7` |
| `prism-focus` | `c1e4d31a8aef7f0c38ae50fdb0a79fe5e562bd6f` |
| `prism-spectra` | `d2956e614cdfe4b4fdb0caecfd907a29e4c9f236` |
| `EPK` | `5656a4df1c86b9aa64e23359023cf681e61c5a60` |

## Post-setup integration/stabilization updates

| Repo | PR | Merge commit | Beam-facing result |
| --- | --- | --- | --- |
| `prism-beam` | #9 | `d651958447f08255915ba7f7f0a6b4dd1f87cbf3` | Suite setup wrap-up and current-state/setup/snapshot refresh. |
| `prism-beam` | #10 | `81dc802534559396f1da81ea6c42bc61fd4084d4` | Spectra test surface note. |
| `prism-beam` | #11 | `159e736eed4295c8ddc42fd25aeda03b2a801683` | Setup landing page and human-readable schema cards. |
| `prism-beam` | #12 | `149c3178976522870d64bd8a7e4dbb8f96961f61` | EPK -> Focus smoke fixture/checklist. |
| `EPK` | #11 | `35329b3f365ee26724845dae490285bfc9486d40` | Publisher can generate/copy/download review-first Focus packet JSON. |
| `prism-focus` | #13 | `318aaf5914a708369d1eb3bda901952ab5d1554e` | Focus can paste/review/select/import EPK packet tasks. |
| `prism-focus` | #14 | `2fcc1bd0e13e99bdacf0cfdc0d2b2fa2f7e218e3` | Browser task actions and planner previews repaired. |
| `prism-focus` | #15 | `c9a3c3edd89934e5d10712ceb8b451324a91c39a` | Clickable-surface audit and no-clobber/timer fixes. |
| `prism-focus` | #16 | `6c1d0e783debdef20424303b1a59a62ce43c7efc` | Keyboard navigation, confirmed delete, and in-memory undo/redo layer. |
| `prism-spectra` | #18 | `f6d883f59e12c1dea15b71801101bf3c5aa838e7` | Setup-safe test path and explicit full-test alias. |
| `prism-spectra` | #19 | `1886993ec38f92e1622c66e5789a52b4e26bc4d0` | Manual daemon e2e workflow for deliberate full validation. |

## What future prompts can omit

Future prompts can refer to this matrix instead of relisting each app's current setup status, launch method, dependency level, completed setup PRs, post-setup Focus/EPK stabilization PRs, and recommended next setup/stabilization PR.
