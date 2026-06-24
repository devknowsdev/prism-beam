# Suite-Setup-001 — Prism Suite Usability Readiness Audit

Date: 2026-06-24
Repo modified: `devknowsdev/prism-beam`
Repos inspected only: `devknowsdev/EPK`, `devknowsdev/prism-focus`, `devknowsdev/prism-spectra`
Branch: `codex/suite-setup-001-usability-readiness`

## Executive summary

The Prism suite has enough structure for Dave to start using parts of it, but the setup experience is uneven.

- `EPK` is the closest to usable without installation. It is a static site/publisher repo with a documented Cloudflare Pages deploy root, public routes, a hosted publisher route, and a local admin path. Its biggest usability gap is not launchability; it is first-run publisher setup and privacy clarity.
- `prism-focus` is also close to usable because it is a static no-build app. It has a hosted GitHub Pages link, a direct `index.html` path, and a local static-server option. Its biggest usability gap is first-run setup: backup expectations, optional AI setup, and install/PWA guidance.
- `prism-spectra` is usable by a developer but not yet comfortable for Dave as a daily app. It has package scripts for build, typecheck, tests, CLI, and a daemon-backed workbench, but it lacks a `doctor`, `setup`, or guided first-run path.
- `prism-beam` is easy to inspect as a reference repo, but its setup/readiness material was not yet gathered in one place before this sprint. Beam should remain non-runtime and should point future AI/app work toward setup wizards rather than becoming an app launcher.

This sprint does not implement setup wizards. It records the setup map and recommends the smallest next app-specific PRs.

## What was inspected

### `prism-beam`

- `README.md`
- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- `context-packs/workspace/current-state.md`
- `context-packs/epk/current-surface.md`
- `context-packs/prism-focus/current-surface.md`
- `context-packs/prism-spectra/current-surface.md`
- `integrations/registry.md`
- `schemas/registry.json`
- `logs/repo-snapshot-log.md`
- `scripts/run-workspace-smoke.sh`

### `EPK`

- `EPK/README.md`
- `EPK/public/index.html`
- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher.js`
- `EPK/package.json` lookup, which was not found

### `prism-focus`

- `README.md`
- `web/README.md`
- `index.html`
- `package.json` lookup, which was not found
- Search for PWA/manifest/service-worker evidence, with no matching evidence found in the connector search

### `prism-spectra`

- `README.md`
- `package.json`
- `docs/PROJECT_PORTAL.md`
- `docs/BUILD_STABILIZATION_NOTES.md`
- `docs/SPECTRA_WORKBENCH_SHELL.md`
- `src/cli.ts`
- `tools/daemon.ts`

## What was tested

This audit was performed through the GitHub connector. It verified repository access, current files, documented commands, package scripts, and public/static entry points by reading repo files.

| Check | Result |
| --- | --- |
| GitHub access for all four repos | Verified through connector metadata calls. |
| `prism-beam` required orientation files | Verified present by fetching current files. |
| `EPK/README.md` | Verified present. |
| `EPK/package.json` | Not found. This supports the static/no-build reading, but does not prove there are no package files elsewhere. |
| `EPK/public/index.html` | Verified present as public entry. |
| `EPK/public/publisher/index.html` | Verified present as hosted publisher entry. |
| `prism-focus/README.md` | Verified present. |
| `prism-focus/index.html` | Verified present as app entry. |
| `prism-focus/package.json` | Not found. This supports the no-build reading. |
| `prism-focus` PWA evidence | No manifest/service-worker evidence found by connector search. Not a full exhaustive tree scan. |
| `prism-spectra/package.json` | Verified present with Node >=22 and scripts. |
| `prism-spectra` setup/doctor scripts | No `doctor` or `setup` script in `package.json`. |
| `prism-spectra` CLI entry | Verified `npm run forge`, `npm run start`, and `--status` help text in `src/cli.ts`. |
| `prism-spectra` daemon/workbench entry | Verified daemon comment says `tsx tools/daemon.ts`, binds to `127.0.0.1:3000`, and serves the workbench HTML. |

## What was not tested

These were not executed in this connector-only session:

- `git diff --check`
- `bash scripts/run-workspace-smoke.sh`
- `python3 -m http.server` for EPK or Focus
- Opening EPK public pages in a browser
- Opening EPK publisher in a browser
- Opening Focus in a browser
- `node src/test_workflows.js` in Focus
- `python3 tools/validate_architecture.py` in Focus
- `npm install`, `npm run typecheck`, `npm test`, `npm run build`, `npm run demo`, `npm run forge`, or daemon/workbench launch in Spectra
- Any publish, deploy, email, external write, broad scan, watcher, or secret-requiring flow

## Commands inspected or safe to run locally next

### Beam

```bash
git diff --check
bash scripts/run-workspace-smoke.sh
```

Connector result: script content inspected; commands not executed.

### EPK

```bash
cd EPK
python3 -m http.server 8000
# Public EPK: http://localhost:8000/EPK/public/
# Local/admin UI: http://localhost:8000/EPK/admin/admin.html
# Hosted-publisher equivalent path if served from repo root: http://localhost:8000/EPK/public/publisher/
```

Connector result: `EPK/README.md` documents static-server local/admin use from repo root and Cloudflare Pages deploy settings. Commands not executed.

### prism-focus

```bash
python3 -m http.server 8080
# Then open http://localhost:8080
node src/test_workflows.js
python3 tools/validate_architecture.py
```

Connector result: README and `web/README.md` document file-open and local-server paths, plus the Node workflow test and optional architecture lint. Commands not executed.

### prism-spectra

```bash
npm install
npm run typecheck
npm test
npm run build
npm run demo
npm run forge -- --status
npm run forge
npx tsx tools/daemon.ts
```

Connector result: package scripts and CLI/daemon files inspected. Commands not executed. `npm run doctor` and `npm run setup` are recommended but do not currently exist.

## App-by-app launch status

### EPK

Current launch evidence:

- Public deploy root is documented as `EPK/public` when Cloudflare Pages project root is `EPK`, or `EPK/public` from repo root when Cloudflare root stays at repo root.
- `EPK/public/index.html` exists and loads `app.js`, `public-clean.js`, and `public-media-contact.js`.
- Hosted publisher route is documented as `/publisher/` and `EPK/public/publisher/index.html` exists.
- README documents local/admin launch through a local static server from the repo root.

Status: likely launchable as a static site, but not browser-tested in this sprint.

Primary risk: `public/publisher/` is publicly servable unless Cloudflare Access or equivalent platform auth protects it. The publisher correctly warns that it is not a password gate.

### prism-focus

Current launch evidence:

- README says no build step, no account, no server required for day-to-day use.
- README links a live GitHub Pages demo.
- `index.html` exists at repo root and uses classic scripts/vendor assets.
- `web/README.md` says most of the app works by opening `index.html` directly, but voice notes are better served over a local server.

Status: likely launchable as static/no-build app, but not browser-tested in this sprint.

Primary risk: first-run expectations are scattered. Backup/export, optional AI, localStorage, IndexedDB audio caveats, and possible install/PWA path need a calm guided setup.

### prism-spectra

Current launch evidence:

- `package.json` exists and requires Node >=22.
- Scripts include `build`, `typecheck`, `demo`, `test:browser`, `forge`, `start`, and `test`.
- CLI help documents `npm run forge`, `npm run forge -- --status`, and `npm run forge -- --mode build_feature`.
- Daemon file documents `tsx tools/daemon.ts`, local host/port defaults, and a local-token header model.
- Workbench shell doc says it is read-only and served by the existing daemon.

Status: developer-launchable, not yet Dave-comfortable.

Primary risk: there is no single safe `doctor` or `setup` command to confirm Node version, install state, provider configuration, local token, daemon launch, workbench URL, and approval posture.

### prism-beam

Current launch evidence:

- Beam is not a runtime app.
- README points future AI sessions to Start Here and context packs.
- README documents `bash scripts/run-workspace-smoke.sh` as the reference smoke check.
- `scripts/run-workspace-smoke.sh` checks required Beam files and reports sibling repo presence.

Status: usable as reference material; not an app to open.

Primary risk: setup and schema information needs human-readable landing pages so Dave does not have to read JSON or infer app launch paths from scattered docs.

## App-by-app install/setup status

| App | Install/setup status |
| --- | --- |
| EPK | No package install found. Static launch/deploy path documented. Publisher setup still requires manual GitHub owner/repo/branch/path/token understanding. |
| prism-focus | No package install found. Static/no-build launch documented. Optional AI has manual installer guidance for Ollama. Backup and audio caveats documented but not first-run guided. |
| prism-spectra | Node/TypeScript install required. Package scripts exist. No `setup` or `doctor` script found. CLI and daemon/workbench paths need a single guided path. |
| prism-beam | No package install found. Reference smoke script exists. Needs a setup landing page/index after this audit. |

## One-click/simple setup opportunities

### EPK

- Add a `Setup publisher` first-run card inside the hosted publisher.
- Add a simple `Open public site`, `Open publisher`, and `Open latest published snapshot` route card.
- Add a clear Cloudflare Pages setup checklist that copies current recommended root/output settings.
- Add a publisher config check that explains owner, repo, branch, live data path, snapshot path, and token scope in plain English.
- Keep GitHub token session-only; do not save it.
- Add a reminder that `/publisher/*` needs Cloudflare Access before it is private.

### prism-focus

- Add a first-run setup wizard with only a few choices: display comfort, starting widgets, backup reminder, optional AI, and voice-note/local-server note.
- Add a one-click backup/export reminder card in Day Log or Settings.
- Add a simple local launch script only if it does not add dependency overhead.
- Consider a PWA/install-to-home-screen path if feasible, but verify service worker/cache behavior carefully before adding it.
- Do not import EPK or Spectra data silently. Cross-app packets should enter as reviewed imports only.

### prism-spectra

- Add `npm run doctor` to check Node version, dependency install state, package scripts, config file location, provider environment variables, local token posture, daemon port, and writable local demo directories.
- Add `npm run setup` or a CLI setup wizard that explains safe defaults before writing config.
- Add `npm run workbench` or a documented workbench launch command that starts the daemon and prints the local URL/token instructions.
- Add an approval/adapters checklist visible from CLI or docs.
- Keep default behavior safe: no broad scans, no watchers, no default destructive or external writes.

### prism-beam

- Add a setup landing page that links this audit, the matrix, and schema UX plan.
- Add human-readable schema cards for existing JSON schemas.
- Add an app launch index so future AI sessions and Dave can find the current launch path quickly.
- Continue Beam-004 pattern/harvest work only after usability basics are mapped.

## Setup wizard recommendations

### EPK-Setup-001 — Publisher first-run setup wizard

Goal: make the publisher usable without asking Dave to understand every repo path.

Recommended flow:

1. Confirm public deploy path and hosted publisher route.
2. Show Cloudflare Access privacy warning.
3. Ask for GitHub owner, repo, branch, data path, and snapshot path with defaults.
4. Explain GitHub token use as session-only.
5. Validate current `epk.json` shape before publish.
6. Provide `Preview`, `Download JSON`, `Publish live`, and `Publish snapshot` as visibly separate actions.

### Focus-Setup-001 — First-run setup + backup/PWA path

Goal: make Focus comfortable on first open.

Recommended flow:

1. Choose calm defaults and starting widgets.
2. Explain where data lives: `localStorage`; audio in IndexedDB; no server by default.
3. Encourage immediate first backup after initial setup.
4. Offer optional AI setup separately, default off.
5. Explain file-open vs local-server mode, especially for voice notes.
6. Investigate PWA/install only as a separate reviewed step.

### Spectra-Setup-001 — `npm run doctor` and setup wizard

Goal: make Spectra safe to start without mental overhead.

Recommended flow:

1. `npm run doctor` checks the environment without writing.
2. `npm run setup` explains and asks before creating config.
3. CLI `--status` output becomes friendlier and maps providers to next steps.
4. Workbench launch prints local URL and token guidance.
5. Adapter/approval setup checklist explains what actions are read-only, local-write, external-write, or destructive.

### Beam-UX-001 — Schema cards and setup landing page

Goal: make Beam's contracts usable by humans and future agents.

Recommended flow:

1. Add a `docs/setup/README.md` landing page.
2. Add schema cards for every schema in `schemas/registry.json`.
3. Add copyable sample packets.
4. Add validation commands and expected outcomes.
5. Link app ownership and approval posture from each card.

## Schema UX recommendations

Beam schemas should become usable through plain-language documentation, examples, and validation instructions, not just JSON files.

Recommended schema UX layers:

- Schema card: one markdown page per schema with purpose, owner, consumers, risk class, required fields, examples, and validation command.
- Plain-English summary: a short explanation of what the packet means and what the receiving app may do with it.
- Copyable sample packet: safe example JSON that can be pasted into a validator or future import UI.
- App ownership block: which app proposes, reviews, consumes, or executes the packet.
- Approval block: whether the packet is read-only, local-write after review, external-write, or destructive.
- Spectra workbench idea: a future schema/setup workbench can show schema cards, sample packets, validation results, and approval classification without mutating app state.

Do not let schemas become hidden automation:

- No hidden writes.
- No automatic imports.
- No app mutation without review.
- No schema-driven destructive action without explicit approval.
- No automatic external writes just because a packet validates.

See `docs/setup/SCHEMA_UX_PLAN.md` for the dedicated plan.

## Prioritised follow-up PRs

1. `Spectra-Setup-001 — npm doctor/setup wizard`
   - Highest leverage because Spectra is the hardest app for Dave to start safely.
   - First step: add read-only `npm run doctor`.
2. `Focus-Setup-001 — First-run setup + backup/PWA path`
   - High user value because Focus is likely Dave's daily app.
   - First step: add a calm first-run modal or settings checklist without changing storage shape.
3. `EPK-Setup-001 — Publisher first-run setup wizard`
   - High confidence because EPK already has publisher surfaces and publish config fields.
   - First step: add a first-run setup card and config explainer.
4. `Beam-UX-001 — Schema cards / setup landing page`
   - Makes Beam's schemas and app launch map easier to use.
   - First step: add `docs/setup/README.md` and schema card template.

## What future prompts can omit

Future prompts can omit:

- The basic app ownership model.
- The fact that Beam is not runtime code, not a monorepo, and not a dependency.
- The current app launch map at a high level.
- The setup-readiness distinction between EPK/Focus static apps and Spectra Node/TypeScript tooling.
- The need for EPK publisher, Focus first-run/backup, Spectra doctor/setup, and Beam schema-card follow-up PRs.

Future prompts should still include:

- The target repo and branch.
- Whether app code may be modified.
- Whether browser/local command validation is available.
- Any exact setup wizard scope or UX constraints.

## Caveats

- This audit is evidence-first but connector-only. It did not execute shell commands or open browser UI.
- Some repository tree details may be missed where connector search did not provide full tree enumeration.
- Do not claim any app is fully working until the relevant local/browser commands are run and recorded.
