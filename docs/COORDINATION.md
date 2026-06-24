# Workspace Coordination

Last-Updated: 2026-06-24

Prism Beam coordinates AI-readable guidance for the Prism suite. It is a
reference, training, harvest, and contract layer for independent app repos, not
a runtime package or monorepo.

## Sprint Rule

- Work one repo per sprint unless the user explicitly approves a cross-repo
  change.
- Open one PR per sprint so review boundaries stay clear.
- Inspect the target repo before editing; Beam guidance does not replace current
  source evidence.
- Keep app implementation code in the app repo unless a small stable snippet or
  pattern has clear reference value in Beam.

## Current Repo Roles

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution
  boundaries.
- `prism-beam` owns the canonical AI-readable reference layer that keeps the
  suite aligned.

## What Beam Stores

- Shared AI operating guidance.
- App session-start guides.
- Context packs that reduce future token use.
- Reusable patterns and UI/UX notes.
- Schema and integration contracts.
- Project logs, architecture logs, and sprint memory.
- Prompt packs and future local-agent training material.
- Support-spine references, checklists, contracts, and reusable Codex prompts
  when they are stable enough to guide future work.

## Support-Spine Reference Areas

The older support-spine material is kept as reference material under `docs/`.
It should support the new Beam role rather than replace it.

- `docs/PRISM_BEAM_ROLE.md` — Beam role and material-stability policy.
- `docs/ECOSYSTEM_OVERVIEW.md` — current repo map and long-term layer model.
- `docs/REPO_BOUNDARIES.md` — repo ownership and seams.
- `docs/SHARED_VOCABULARY.md` — shared terms.
- `docs/LOCAL_FIRST_STACK.md` — local stack guidance.
- `docs/IMPLEMENTATION_ROADMAP.md` — phased roadmap from research.
- `docs/CURRENT_SPRINT.md` — active sprint and validation checklist.
- `docs/AI_SESSION_CONTRACTS.md` — session types and edit rules.
- `docs/CHANGE_BOUNDARY_CHECKLIST.md` — pre-edit checklist for agents.
- `docs/contracts/` — repo-specific implementation contracts.
- `docs/prompts/` — reusable Codex prompt templates.
- `docs/patterns/`, `docs/templates/`, and `docs/checklists/` — reusable
  support-spine material.

## What Stays In App Repos

App repos remain independent. Runtime code, product state, migrations, adapters,
UI implementation, and external-write logic stay with the app that owns the
domain. Beam may store a compact reusable pattern, contract, or example only
after it is stable enough to guide future work.

## Anti-Drift Purpose

Beam should help future sessions start with the same suite map, safety rules,
and known decisions. That should reduce repeated context loading, prevent stale
repo names from becoming current instructions, and make final reports easier to
compare across sprints.

## Current Structure

- `README.md` — Beam identity, suite map, and reference index.
- `ai-guides/` — suite-wide AI operating guides.
- `app-guides/` — compact session-start guardrails by app.
- `context-packs/` — low-token app and workspace summaries.
- `logs/project-logs/` — factual project memory and evolution notes.
- `templates/` — reusable contribution and AI guide templates.
- `scripts/` — local Beam maintenance helpers.
- `docs/` — durable support-spine references, prompts, checklists, and
  architecture notes.
