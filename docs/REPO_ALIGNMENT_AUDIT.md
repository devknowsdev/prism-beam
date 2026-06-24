# Repo Alignment Audit

Purpose: compare the current repository reality against the prism-beam ecosystem
docs without guessing beyond the evidence available in each repo.

Sources used:
- `prism-beam/docs/ECOSYSTEM_OVERVIEW.md`
- `prism-beam/docs/REPO_BOUNDARIES.md`
- `prism-beam/docs/SHARED_VOCABULARY.md`
- `prism-beam/docs/LOCAL_FIRST_STACK.md`
- `prism-beam/docs/IMPLEMENTATION_ROADMAP.md`
- `prism-spectra/README.md`, `prism-spectra/package.json`, `prism-spectra/src/index.ts`, `prism-spectra/tools/daemon.ts`, `prism-spectra/docs/*`
- `prism-focus/README.md`, `prism-focus/src/ARCHITECTURE.md`, `prism-focus/docs/PROJECT_PORTAL.md`, `prism-focus/src/*`
- `devknowsdev/EPK` repository contents via GitHub API, including `EPK/README.md`, `EPK/public/index.html`, and `EPK/public/data/epk.json`

## prism-beam

1. Current stated identity
- Workspace/meta coordination repo that owns ecosystem docs, shared vocabulary,
  roadmap guidance, repo boundaries, local stack guidance, and helper scripts.

2. Actual repo structure
- `README.md`
- `docs/` with coordination and ecosystem docs
- `scripts/` for smoke tests and template installs
- `templates/` for shared PR/CODEOWNERS content
- `deploy/` examples
- No application `src/` tree and no package manifest

3. Actual runtime responsibilities
- None identified.
- The repo provides docs and shell scripts only.

4. Claimed responsibilities in docs
- Coordinates workspace conventions and repo contracts.
- Does not claim to own application runtime behavior.

5. Alignment with prism-beam repo boundaries
- Strong alignment.
- The repo is behaving as the coordination/meta layer described in the new docs.

6. Drift or contradiction
- None identified in the current repo structure.
- `deploy/` examples still use legacy repo names in their filenames, but they are
  clearly examples rather than live runtime contracts.

7. Suggested smallest correction
- No change required for the boundary model.
- Keep using prism-beam as the canonical orientation point.

8. Correction type
- Do not change yet.

## prism-spectra

1. Current stated identity
- Local-first AI orchestration and execution engine for the Prism workspace.
- README, package metadata, and portals still use the AI-Forge naming in places.

2. Actual repo structure
- TypeScript source under `src/` with `engine/`, `routing/`, `memory/`,
  `safety/`, `runtime/`, `executors/`, `capabilities/`, `intelligence/`, and
  `taskGraph/`
- `tools/daemon.ts` for the local HTTP daemon
- `package.json` with `ai-forge-core`, Node 22+, and `npm test` / `npm run demo`
- `docs/` with project portals, architecture, ADRs, handovers, and audits

3. Actual runtime responsibilities
- Deterministic graph building and routing
- Execution engine and task graph handling
- Memory, ledger, replay, and provenance tracking
- Checkpointing, validation, and file locking
- Capability registry and built-in capabilities
- Local daemon endpoints for health, build-graph, route, and graph execution

4. Claimed responsibilities in docs
- Prism Core / AI-Forge orchestrator, capability engine, reference architecture
  for the workspace AI layer
- Workspace portal docs describe the repo as the canonical workspace-level
  portal for the orchestrator

5. Alignment with prism-beam repo boundaries
- Strong alignment.
- This repo owns orchestration, capability routing, memory, approvals, and
  provenance, which matches the executive / forge layer in prism-beam docs.

6. Drift or contradiction
- Naming drift remains: `AI-Forge` is still prominent in package name,
  descriptions, and many docs. That is legacy aliasing, not a boundary
  contradiction.
- Some docs still refer to older architectural notes and future recipes, but they
  do not conflict with the current orchestrator role.

7. Suggested smallest correction
- Keep the new Ecosystem Role pointer in the README.
- Prefer Prism Core language in cross-repo docs, while leaving the package name
  and historical AI-Forge references untouched for now.

8. Correction type
- Documentation-only.

## prism-focus

1. Current stated identity
- Local-first productivity dashboard, formerly ADHDashboard, with no build step
  and browser-local persistence.

2. Actual repo structure
- `index.html` entry point
- `src/` with state, storage, render, actions, AI integration, widgets, music
  tools, tests, and runtime helpers
- `vendor/` fonts and icons
- `generated/` artifacts
- `docs/`, `tools/`, `web/`, and archived handoff docs
- No backend app package or orchestration service

3. Actual runtime responsibilities
- Human-facing task and planning UI
- Local browser state and persistence
- Focus board, planner, wizard, journal, check-in, day log, habits, music
  tools, and optional AI helpers
- Node-based workflow test harness and architecture lint

4. Claimed responsibilities in docs
- Productivity dashboard designed for ADHD/autism-friendly workflows
- Optional AI integration
- No account, no server required for day-to-day use

5. Alignment with prism-beam repo boundaries
- Strong alignment.
- The repo is the human operations dashboard layer in the prism-beam model.

6. Drift or contradiction
- Legacy ADHDashboard naming remains in storage keys, archived docs, and some
  filenames. That is historical drift, not a functional contradiction.
- The repo is still internally migrating state into `src/state/*`, but that does
  not alter its role.

7. Suggested smallest correction
- Keep the new Ecosystem Role pointer in the README.
- Leave legacy `ADHDashboard` references where they support migration or
  historical continuity.

8. Correction type
- Documentation-only.

## EPK

1. Current stated identity
- EPK OS Pro — Dave Knowles.
- Public-facing site with admin editing, published snapshots, and a bridge for
  Spectra / automation.

2. Actual repo structure
- Repository root contains a nested `EPK/` directory.
- `EPK/README.md`
- `EPK/HANDOVER.md`
- `EPK/public/` with `index.html`, `gallery.html`, `admin.html`, `app.js`,
  `admin.js`, `media-manager.js`, `styles.css`, `_redirects`, `data/epk.json`,
  `published/`, and `photos/`
- A stray `.DS_Store` also exists at the repository root

3. Actual runtime responsibilities
- Public EPK site
- Content editor / admin surface
- Immutable published snapshot output
- Structured canonical content in `public/data/epk.json`
- `window.EPKAdapter` bridge metadata and runtime entrypoint
- Gallery/publication views

4. Claimed responsibilities in docs
- README explicitly documents Cloudflare Pages deployment, content editing
  options, published versions, and the Spectra bridge
- `public/index.html` declares the adapter and dataset via meta tags

5. Alignment with prism-beam repo boundaries
- Partial but good alignment.
- EPK behaves like a public surface of the future music management layer, not
  the whole business layer.

6. Drift or contradiction
- The repo still presents itself as a standalone EPK system in its own README
  and file layout.
- The repo has not been renamed into `prism-music`, so the destination layer is
  still conceptual rather than implemented.

7. Suggested smallest correction
- Keep the short Ecosystem Role section in the README.
- Treat EPK as a current surface that may later be absorbed into `prism-music`.

8. Correction type
- Documentation-only now.
- Future implementation only if and when the repo is actually absorbed.

