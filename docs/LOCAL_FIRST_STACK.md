# Local-First Stack

Purpose: document the recommended local stack shape for Prism without turning
this repo into an installer or runtime spec.

## Recommended Stack

- SQLite as canonical state for domain records, approvals, and ledgers.
- File-system-native media storage for audio, image, and document assets.
- Ollama as the default local model runtime.
- `launchd` jobs and file watchers for background work and ingest triggers.
- On-demand media tools for transcription, analysis, and asset generation.
- External adapters behind approval gates for anything that writes outside the
  local system.

## Architecture Guidance

- Keep canonical state in SQLite; treat search indexes, caches, and embeddings
  as rebuildable.
- Store assets on disk with stable paths and sidecars rather than hiding them
  inside an opaque blob store.
- Prefer local execution first, then remote fallback only when the task really
  needs it or a human explicitly chooses it.
- Keep the default assistant model small enough for the machine to breathe.
- Treat publishing, email, calendar writes, deletes, and GitHub writes as
  gated actions, not background conveniences.

## Operational Shape

- Always-on: SQLite, coordination scripts, file watch triggers, and the local
  model daemon if needed.
- On-demand: transcription, search rebuilding, asset transforms, and heavier
  media tools.
- Batch/overnight: embeddings refresh, large re-indexes, and long-running media
  jobs.

## Adapter Policy

Every external adapter should make its action surface explicit:

- `dry_run` support.
- `approval_required` for risky actions.
- `allowed_actions` scoped to the smallest useful set.

