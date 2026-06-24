# Start Here For AI Sessions

Beam is the canonical AI-facing reference layer for the Prism suite. It stores
durable guides, context packs, patterns, prompts, schemas, logs, and contracts
so future sessions can start aligned instead of rediscovering the suite from
scratch.

Beam is not a runtime dependency, not a monorepo, and not the owner of app
implementation code.

## Required Reading Order

1. `ai-guides/START_HERE.md`
2. Relevant suite or workspace context pack
3. Relevant app guide
4. Relevant pattern, schema, or integration contract
5. Relevant build-method guide

Beam-002 adds the first workspace, EPK, Focus, and Spectra context packs and
app guides. Patterns, schemas, integration contracts, and build-method guides
remain planned Beam-003+ structure. If a referenced guide does not exist yet,
say so briefly, then inspect the target repo directly.

## Suite Map

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution
  boundaries.
- `prism-beam` owns the canonical AI-readable reference layer that keeps the
  suite aligned.

## Default AI Operating Rules

- Use evidence before edits: read current files, scripts, and docs in the target
  repo before changing anything.
- Keep one repo per sprint and one PR per sprint unless the user explicitly
  approves otherwise.
- Preserve local-first and review-first behavior.
- Treat external writes, publishing, email sending, deploys, and destructive
  operations as explicit user-approved actions.
- Keep runtime implementation code in the owning app repo.
- Use Beam material as guidance, not as proof that current app source is still
  shaped the same way.

## Before Editing A Repo

- Confirm the requested repo, branch, and PR scope.
- Inspect repo structure, README, coordination or project docs, scripts, and
  workflow files if present.
- Search for stale names or drift terms relevant to the sprint.
- Check git status and avoid staging unrelated user changes.
- Prefer current source files over stale docs when they conflict.

## What Not To Infer

- Do not infer that Beam is a runtime package.
- Do not infer that the Prism suite is a monorepo.
- Do not infer private auth from a frontend-only gate.
- Do not infer email can be sent from static contact UI.
- Do not infer app ownership from old repo names, archived docs, or historical
  research notes.
- Do not infer permission for broad folder scanning, file watching, hidden
  writes, publishing, or destructive cleanup.

## Using Future Beam Material

When context packs exist, use them to reduce token load before opening large app
repos. When app guides exist, read the guide first, then verify against current
repo files. When patterns, schemas, or integration contracts exist, treat them
as the expected interface and call out any mismatch found in source.

Current context packs:

- `context-packs/workspace/current-state.md`
- `context-packs/epk/current-surface.md`
- `context-packs/prism-focus/current-surface.md`
- `context-packs/prism-spectra/current-surface.md`

Current app guides:

- `app-guides/epk/session-start.md`
- `app-guides/prism-focus/session-start.md`
- `app-guides/prism-spectra/session-start.md`

## Final Work Reports

Final reports should include the branch, commit, PR URL when applicable, files
created or modified, validation commands and exact results, stale references
removed or intentionally retained, rollback notes where useful, and what future
prompts can omit because Beam now stores it.
