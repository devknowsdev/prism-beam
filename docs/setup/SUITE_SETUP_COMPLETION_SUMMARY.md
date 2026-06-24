# Prism Suite Setup Completion Summary

Date: 2026-06-24

## Purpose

This document records the completion of the first setup/readiness pass across the four active Prism repositories.

It is an AI-facing handover and orientation reference. It does not create runtime coupling between repositories.

## Repositories covered

| Repo | Role | Setup/readiness result |
| --- | --- | --- |
| `prism-beam` | AI-facing reference, context, schemas, contracts, logs, anti-drift | Suite-level setup/readiness audit landed on `main`. |
| `prism-focus` | Daily planning, tasks, routines, backup/local human operations | First-run guide and setup modal landed on `main`. |
| `prism-spectra` | Local orchestration, adapters, approvals, workbench, safe execution | Read-only `doctor`, `setup`, and `workbench` path landed on `main`. |
| `EPK` | Public press kit, publisher/admin tooling, structured promotional truth | First-run EPK setup guide and publisher checklist landed on `main`. |

## Completed setup PRs and commits

| Repo | PR / branch | Merge commit | What changed |
| --- | --- | --- | --- |
| `prism-beam` | `codex/suite-setup-001-usability-readiness` | `736073fd1c44a41bc533f3dc0aec575b9206cee7` | Added suite usability/readiness audit, app setup matrix, and schema UX plan. |
| `prism-focus` | PR #11, `codex/focus-setup-001-first-run-readiness` | `c1e4d31a8aef7f0c38ae50fdb0a79fe5e562bd6f` | Added first-run setup guide, modal, compass entry point, README links, and CI docs-lint repair. |
| `prism-spectra` | PR #17, `codex/spectra-setup-001-doctor` | `d2956e614cdfe4b4fdb0caecfd907a29e4c9f236` | Added read-only setup doctor, setup guide, `doctor/setup/workbench` scripts, README/portal links, and self-contained CI validation. |
| `EPK` | PR #10, `codex/epk-setup-001-first-run` | `5656a4df1c86b9aa64e23359023cf681e61c5a60` | Added EPK setup guide, README first-run section, and standalone publisher checklist page. |

## Current first-run commands and entry points

### Beam

```bash
cd prism-beam
git diff --check
bash scripts/run-workspace-smoke.sh
```

Primary entry points:

- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- `context-packs/workspace/current-state.md`
- `docs/setup/APP_SETUP_MATRIX.md`
- `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`

### Focus

```bash
cd prism-focus
python3 -m http.server 8080
node src/test_workflows.js
python3 tools/validate_architecture.py
```

Browser entry points:

- hosted GitHub Pages demo from the repo README
- local `http://localhost:8080`
- first-run setup guide from the compass button

### Spectra

```bash
cd prism-spectra
npm install
npm run doctor
npm run setup
npm run typecheck
npm run build
npm run forge -- --status
npm run workbench
```

Safety note: `doctor` and `setup` are read-only. `workbench` starts the local daemon and should be run deliberately.

### EPK

```bash
cd EPK
python3 -m http.server 8000
```

Local browser entry points:

- `http://localhost:8000/EPK/public/`
- `http://localhost:8000/EPK/public/publisher/`
- `http://localhost:8000/EPK/public/publisher/setup-checklist.html`
- `http://localhost:8000/EPK/admin/admin.html`

Hosted publisher note: protect `/publisher/*` with Cloudflare Access or equivalent before treating it as private.

## Remaining known risks

### Beam

- Beam is still reference-only and must not be treated as a runtime dependency.
- Setup truth can drift unless app-specific setup docs are kept current.

### Focus

- Browser state remains localStorage/IndexedDB based.
- JSON backups do not include audio blobs.
- First-run modal is not a data migration or import system.

### Spectra

- The full daemon e2e `npm test --silent` path previously appeared to hang in CI. The setup PR validates `npm ci`, `npm run doctor`, `npm run typecheck`, and `npm run build`; the hanging e2e suite should be handled in a separate stabilization PR.
- Provider keys, daemon tokens, approval classes, and adapter behavior remain sensitive setup surfaces.

### EPK

- Anything in `EPK/public` is public unless platform protection is configured.
- The publisher does not save GitHub tokens; tokens remain session-only.
- Static contact opens the visitor's email app; it does not send email server-side.

## Suggested next PR sequence

1. `Beam-UX-001 — setup landing page and schema cards`
2. `Spectra-Stabilization-001 — isolate or time-bound hanging daemon e2e test`
3. `EPK-Setup-002 — deployment and Cloudflare Access verification checklist`
4. `Focus-Setup-002 — PWA/install and backup verification pass`

## Future prompts can omit

Future prompts can assume that setup/readiness coverage exists for all four active repos and can start from this document plus `docs/setup/APP_SETUP_MATRIX.md`.

Do not omit repo-specific evidence checks before modifying app code.
