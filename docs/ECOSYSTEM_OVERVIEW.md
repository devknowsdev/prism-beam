# Prism Ecosystem Overview

The Prism suite is a set of independent repos aligned by Beam rather than a
single monorepo.

## Current app cluster

| Repo | Owns | Should not own |
|---|---|---|
| `EPK` | Current implementation seed for Dave's public/professional Music-Career surface: public EPK outputs, publisher, media/gallery/contact/poster workflows, structured public/career truth, and promo surfaces. | Daily planning state, orchestration engine, hidden backend writes, public exposure of private social/supporter/platform data, or the whole internal Music/Career cockpit by default. |
| `prism-focus` | Tasks, routines, day planning, local-first personal execution state. | EPK public content, Spectra adapter execution, hidden cross-app mutations. |
| `prism-spectra` | Orchestration, adapters, approvals, sidecars, workbench, safe execution. | Public EPK page chrome, Focus localStorage mutation without review, hidden scanning. |
| `prism-beam` | AI-facing guidance, logs, context packs, schemas, contracts, prompt packs, patterns, and harvest notes. | Runtime app code, secrets, user state, direct product execution. |

`EPK` historically meant the public electronic press kit app. Current Beam
boundary docs reframe it as the implementation seed for a broader Prism
Music/Career domain. The online EPK page is one public/export output, not the
whole career-management interface. See `docs/REPO_BOUNDARIES.md` for canonical
boundary language.

## Operating model

- One repo per sprint unless the user explicitly approves a cross-repo
  coordination sprint.
- One PR per sprint.
- Source files override stale docs.
- Beam records durable lessons so future AI sessions can start with less prompt
  context.
- Runtime code remains in its owning repo unless a small reference snippet is
  clearly useful as Beam material.

## Current integration direction

- EPK can produce reviewed event/promo packets for Focus.
- Focus should review imports before mutating tasks or planner state.
- Spectra should read structured app surfaces and classify action risk before
  execution.
- Music/Career AI suggestions should route through Spectra's read-only AI
  request path and return to app-local draft/review UI.
- Beam stores contracts and schemas for those boundaries.
