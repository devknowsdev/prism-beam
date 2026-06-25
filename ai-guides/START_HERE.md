# Start Here For AI Sessions

Beam is the canonical AI-facing reference layer for the Prism suite. It stores
durable guides, context packs, patterns, prompts, schemas, logs, and contracts
so future sessions can start aligned instead of rediscovering the suite from
scratch.

Beam is not a runtime dependency, not a monorepo, and not the owner of app
implementation code.

## Preferred Entry Point

For new AI sessions, read this first:

1. `AI_LOAD_ME_FIRST.md`
2. `ai-guides/TINY_BOOT.md`
3. `ai-guides/AI_PROMPT_ROUTER.md`
4. the model profile selected by the router
5. the task-specific mini-pack selected by the router

This file remains as the older full start guide, but `AI_LOAD_ME_FIRST.md` is now
the lowest-token entry point.

## Required Reading Order

Use this route unless the user explicitly asks for a full audit:

1. `AI_LOAD_ME_FIRST.md`
2. `ai-guides/TINY_BOOT.md`
3. `ai-guides/AI_PROMPT_ROUTER.md`
4. selected model profile under `ai-guides/model-profiles/`
5. `context-packs/workspace/current-state.min.md`
6. one app/task mini-pack only if relevant
7. full current-surface pack only if the mini-pack is insufficient
8. exact source files only when needed for verification or implementation

Do not read all Beam files or all app repos just to orient.

## Suite Map

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution
  boundaries.
- `prism-beam` owns the canonical AI-readable reference layer that keeps the
  suite aligned.

## Default AI Operating Rules

- Use Beam for orientation before app source.
- Use the smallest relevant context pack.
- Use evidence before edits: inspect current source when implementation facts matter.
- Keep one repo per sprint and one PR per sprint unless the user explicitly approves otherwise.
- Preserve local-first and review-first behavior.
- Treat external writes, publishing, email sending, deploys, and destructive operations as explicit user-approved actions.
- Keep runtime implementation code in the owning app repo.
- Use Beam material as guidance, not as proof that current app source is still shaped the same way.

## Before Editing A Repo

- Confirm the requested repo, branch, and PR scope.
- Read the relevant Beam mini-pack and model profile.
- Inspect only exact repo files needed for the task.
- Check scripts/tests/workflows if validation is required.
- Check git status and avoid staging unrelated user changes.
- Prefer current source files over stale docs when they conflict.

## What Not To Infer

- Do not infer that Beam is a runtime package.
- Do not infer that the Prism suite is a monorepo.
- Do not infer private auth from a frontend-only gate.
- Do not infer email can be sent from static contact UI.
- Do not infer app ownership from old repo names, archived docs, or historical research notes.
- Do not infer permission for broad folder scanning, file watching, hidden writes, publishing, or destructive cleanup.

## Current Low-Token Packs

- `context-packs/workspace/current-state.min.md`
- `context-packs/epk/current-surface.min.md`
- `context-packs/prism-focus/current-surface.min.md`
- `context-packs/prism-spectra/current-surface.min.md`

## Current Full Context Packs

- `context-packs/workspace/current-state.md`
- `context-packs/epk/current-surface.md`
- `context-packs/prism-focus/current-surface.md`
- `context-packs/prism-spectra/current-surface.md`

## Model Profiles

- `ai-guides/model-profiles/CLAUDE.md`
- `ai-guides/model-profiles/CODEX.md`
- `ai-guides/model-profiles/GPT.md`
- `ai-guides/model-profiles/GEMINI.md`
- `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md`

## Current App Guides

- `app-guides/epk/session-start.md`
- `app-guides/prism-focus/session-start.md`
- `app-guides/prism-spectra/session-start.md`

## Current Registries

- `integrations/registry.md`
- `schemas/registry.json`

## Final Work Reports

Final reports should include the branch, commit, PR URL when applicable, files
created or modified, validation commands and exact results, stale references
removed or intentionally retained, rollback notes where useful, and what future
prompts can omit because Beam now stores it.
