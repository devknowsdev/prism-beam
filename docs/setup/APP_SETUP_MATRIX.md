# Prism App Setup Matrix

Date: 2026-06-24
Sprint: Suite setup/readiness completion

This matrix records current setup evidence for the Prism suite. It is a practical launch/readiness map, not a runtime dependency plan.

## Current setup status

| App | Current launch method | Dependency level | Setup coverage now present | Remaining setup risk | Recommended next PR |
| --- | --- | --- | --- | --- | --- |
| `EPK` | Static public site from `EPK/public`; Cloudflare Pages can use project root `EPK` with output `public`, or repo root with output `EPK/public`; local/admin path documented through `python3 -m http.server 8000`; hosted publisher route is `/publisher/`. | Low. Static HTML/CSS/JS evidence inspected. | `EPK/docs/EPK_SETUP.md`, README first-run section, and `EPK/public/publisher/setup-checklist.html` landed via PR #10. | Medium. Publisher remains public unless `/publisher/*` is protected with Cloudflare Access or equivalent. Tokens remain session-only. Public deploy root remains public. | `EPK-Setup-002 — deployment and Cloudflare Access verification checklist` |
| `prism-focus` | Hosted GitHub Pages link in README; open root `index.html`; local server recommended with `python3 -m http.server 8080` then `http://localhost:8080`. | Low. Vanilla HTML/CSS/JS with classic scripts; Node only needed for workflow tests. | First-run setup guide/modal, compass entry point, and README setup path landed via PR #11. | Medium. Data remains browser `localStorage`; audio is IndexedDB and not included in JSON backups; optional AI can add setup complexity. | `Focus-Setup-002 — PWA/install and backup verification pass` |
| `prism-spectra` | Node/TypeScript package; scripts include `npm run forge`, `npm run start`, `npm run typecheck`, `npm test`, `npm run build`, `npm run demo`, `npm run test:browser`; daemon/workbench can run through `npm run workbench`. | Medium/high. Requires Node >=22 and npm dependencies. | Read-only `npm run doctor`, `npm run setup`, and `npm run workbench` landed via PR #17, with setup guide and portal links. | Medium/high. Provider keys, daemon token, approvals, adapters, and safe execution still need careful handling. Full daemon e2e `npm test --silent` path appeared to hang in CI and needs separate stabilization. | `Spectra-Stabilization-001 — isolate or time-bound hanging daemon e2e test` |
| `prism-beam` | No runtime launch. Read `README.md`, `ai-guides/START_HERE.md`, context packs, registries, and docs. Smoke script: `bash scripts/run-workspace-smoke.sh`. | Low. Docs/reference repo. | Suite setup/readiness audit, setup matrix, schema UX plan, and completion summary are present under `docs/setup/`. | Low as docs-only, but high drift risk if setup truths are not refreshed after app PRs. | `Beam-UX-001 — setup landing page and schema cards` |

## Current comfort ranking

1. `prism-focus` — easiest for Dave to open immediately because it has a hosted path, direct `index.html`, static-server path, and first-run setup modal.
2. `EPK` — easy to view and now has first-run docs/checklist, but publisher privacy still depends on Cloudflare Access or equivalent.
3. `prism-beam` — easy for AI/reference use, but not an app.
4. `prism-spectra` — more comfortable than before because `doctor/setup/workbench` exist, but still the most powerful and risk-sensitive repo.

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

# Focus
cd ../prism-focus
python3 -m http.server 8080
node src/test_workflows.js
python3 tools/validate_architecture.py

# Spectra
cd ../prism-spectra
npm install
npm run doctor
npm run setup
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

## What future prompts can omit

Future prompts can refer to this matrix instead of relisting each app's current setup status, launch method, dependency level, completed setup PR, and recommended next setup/stabilization PR.
