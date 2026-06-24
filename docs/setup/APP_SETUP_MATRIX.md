# Prism App Setup Matrix

Date: 2026-06-24
Sprint: Suite-Setup-001

This matrix records current setup evidence for the Prism suite. It is a practical launch/readiness map, not a runtime dependency plan.

| App | Current launch method | Dependency level | One-click/simple option | Setup wizard needed | Setup risk | Missing pieces | Next PR |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `EPK` | Static public site from `EPK/public`; Cloudflare Pages can use project root `EPK` with output `public`, or repo root with output `EPK/public`; local/admin path documented through `python3 -m http.server 8000` from repo root and `http://localhost:8000/EPK/admin/admin.html`; hosted publisher route is `/publisher/`. | Low. No `EPK/package.json` found in this audit; static HTML/CSS/JS evidence inspected. | Add `Open public EPK`, `Open publisher`, `Open latest snapshot`, and `Copy Cloudflare settings` cards. | Yes, for publisher first-run config and privacy reminders. | Medium. Publisher can publish to GitHub when a token is pasted; hosted publisher is public unless protected by Cloudflare Access or equivalent. | First-run publisher config explainer; token scope/session-only guidance; contact email setup; Cloudflare Access reminder; template/media/gallery checks; clear hosted-publisher launch link. | `EPK-Setup-001 — Publisher first-run setup wizard` |
| `prism-focus` | Hosted GitHub Pages link in README; open root `index.html`; local server recommended with `python3 -m http.server 8080` then `http://localhost:8080`. | Low. No `package.json` found; vanilla HTML/CSS/JS with classic scripts; Node only needed for workflow tests. | Add `Open local Focus`, `Make first backup`, `Set up optional AI`, and possible install/PWA checklist. | Yes, for first-run calm defaults, backup/export, optional AI, and voice-note/local-server guidance. | Medium. Data is browser `localStorage`; audio is IndexedDB and not included in JSON backups; optional AI can add setup complexity. | First-run wizard; backup/export reminder; optional AI setup path; PWA/install investigation; no hidden imports from EPK or Spectra. | `Focus-Setup-001 — First-run setup + backup/PWA path` |
| `prism-spectra` | Node/TypeScript package; scripts include `npm run forge`, `npm run start`, `npm run typecheck`, `npm test`, `npm run build`, `npm run demo`, `npm run test:browser`; daemon source documents `tsx tools/daemon.ts` on `127.0.0.1:3000`; workbench is served by daemon. | Medium/high. Requires Node >=22 and npm dependencies. | Add `npm run doctor`, `npm run setup`, and `npm run workbench` or equivalent guided command. | Yes, strongly. Needs a CLI setup wizard and doctor before daily use. | High until guided. Providers, tokens, daemon local token, approval classes, config files, and safe execution boundaries are easy to misunderstand. | Doctor command; setup wizard; workbench launch guide; adapter/approval checklist; no unsafe default writes; clear provider status help. | `Spectra-Setup-001 — npm doctor/setup wizard` |
| `prism-beam` | No runtime launch. Read `README.md`, `ai-guides/START_HERE.md`, context packs, registries, and docs. Smoke script: `bash scripts/run-workspace-smoke.sh`. | Low. No package install found; shell script only. | Add setup landing page and app launch index in docs. | Not for runtime; yes for human-readable schemas and setup docs. | Low as docs-only, but high drift risk if setup truths remain scattered. | `docs/setup/README.md`; schema cards; sample packets; validation examples; app launch index. | `Beam-UX-001 — Schema cards / setup landing page` |

## Current comfort ranking

1. `prism-focus` — likely easiest for Dave to open immediately because it has a live demo, direct `index.html`, and static-server path.
2. `EPK` — likely easy to view, but publisher privacy/publish-token setup needs guidance before comfortable editing/publishing.
3. `prism-beam` — easy for AI/reference use, but not an app.
4. `prism-spectra` — most powerful and least first-run-friendly; needs doctor/setup before daily use.

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
# Open public/admin/publisher routes manually in browser.

# Focus
cd ../prism-focus
python3 -m http.server 8080
node src/test_workflows.js
python3 tools/validate_architecture.py

# Spectra
cd ../prism-spectra
npm install
npm run typecheck
npm test
npm run build
npm run forge -- --status
```

Do not run publish, email, deploy, broad scan, watcher, destructive, or secret-requiring commands as part of a setup audit.

## What future prompts can omit

Future prompts can refer to this matrix instead of relisting each app's current setup status, launch method, dependency level, and recommended next setup PR.
