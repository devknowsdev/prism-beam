# Workspace Current State

## Scope

Prism suite repo map and AI session orientation.

## Last Verified

2026-06-24 against Beam files from Beam-001 and local sibling repo entry points.

## Evidence Used

- `README.md`
- `docs/COORDINATION.md`
- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- Local sibling `EPK`, `prism-focus`, and `prism-spectra` README/docs/source
  entry points.

## Current Truths

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution
  boundaries.
- `prism-beam` owns AI-readable guidance, context packs, patterns, schemas,
  logs, prompt packs, and anti-drift rules.
- Beam is not a monorepo and not a runtime dependency.
- Work one repo per sprint and one PR per sprint unless explicitly approved.

## Future AI Reading Order

1. `ai-guides/START_HERE.md`
2. Relevant suite or workspace context pack
3. Relevant app guide
4. Relevant pattern, schema, or integration contract
5. Relevant build-method guide

Patterns, schemas, integration contracts, and build-method guides are still
Beam-003+ work.

## Safe Assumptions

- Use Beam for orientation and anti-drift memory.
- Verify target repo source before editing.
- Keep app implementation in the owning app repo.

## Do Not Infer

- Do not infer shared runtime coupling from shared docs.
- Do not infer private auth, publishing permission, or external-write approval
  from the existence of a guide.
- Do not let historical names override current repo names.

## Useful Entry Points

- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- `docs/COORDINATION.md`
- App context packs under `context-packs/`
- App guides under `app-guides/`

## Validation Hints

- `git diff --check`
- `bash scripts/run-workspace-smoke.sh`
- Search for stale names when changing repo identity or suite topology.

## Future prompts can omit

Future prompts can omit the suite ownership map, Beam's non-runtime role, the
one-repo/one-PR sprint rule, and the default AI reading order.

## Update Rules

Refresh this pack when repo ownership changes, a new app joins the suite, or
Beam adds schemas/contracts that change the default reading order.
