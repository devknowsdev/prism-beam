# Prism Ecosystem Overview

The Prism suite is a set of independent repos aligned by Beam rather than a
single monorepo.

## Current app cluster

| Repo | Owns | Should not own |
|---|---|---|
| `EPK` | Public/promotional truth, EPK site, publisher, media/gallery/contact/poster workflows. | Daily planning state, orchestration engine, hidden backend writes. |
| `prism-focus` | Tasks, routines, day planning, local-first personal execution state. | EPK public content, Spectra adapter execution, hidden cross-app mutations. |
| `prism-spectra` | Orchestration, adapters, approvals, sidecars, workbench, safe execution. | Public EPK page chrome, Focus localStorage mutation without review, hidden scanning. |
| `prism-beam` | AI-facing guidance, logs, context packs, schemas, contracts, prompt packs, patterns, and harvest notes. | Runtime app code, secrets, user state, direct product execution. |

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
- Beam stores contracts and schemas for those boundaries.
