# AI Change Review Queue

**Active branch:** `beam/ai-change-review-queue-v3`
**Superseded branches:** `beam/ai-change-review-queue`, `beam/ai-change-review-queue-v2`
**Purpose:** Safe staging branch for AI session logs, Beam rule proposals, instruction edits, and context-pack updates that need review before protected `main`.

## Why this branch exists

Beam `main` is the foundational orientation and anti-drift layer for the Prism suite. It should normally stay protected.

This branch is a review queue. It lets GPT, Claude, Codex, and other AI sessions add compact logs and proposed Beam updates without bypassing human review.

The earlier `beam/ai-change-review-queue` branch diverged while `main` was temporarily opened for direct instruction updates. PR #17 was closed without merge as superseded. `beam/ai-change-review-queue-v2` later accumulated useful staged content but became historically divergent after the same content was landed directly onto `main`. Use `beam/ai-change-review-queue-v3`, which was created cleanly from current `main` on 2026-06-26.

## What belongs here

- Compact session-log updates awaiting review.
- Proposed edits to `AI_LOAD_ME_FIRST.md`.
- Proposed edits to AI protocols, model profiles, and prompt router files.
- Proposed context-pack updates after app repo changes.
- Proposed integration-contract or registry changes.
- Detailed progress reports under `docs/progress/`.

## What does not belong here

- Product runtime code.
- Large source dumps.
- Full chat transcripts.
- Unverified claims about app repo state.
- Permanent divergence from `main`.

## Low-token working rule

Do not poll live repo state before every write.

Use this workflow instead:

1. Start from Beam orientation and `AI_PROGRESS_LOG.md`.
2. Keep a compact chat-side session delta during work.
3. Verify only exact target file refs/SHA before writes.
4. Add or update the review-queue files once the user says the session is done.
5. Open or update a PR from `beam/ai-change-review-queue-v3` into `main` for review.

## Session delta format

```text
Session delta:
- Changed: <repo:path or none>
- Decision: <one-line decision or none>
- Validation: <done/not done>
- Open: <next exact step>
- Commit prompt: Tell me when to commit this session log to Beam.
```

## Review rule

Before merging this branch into `main`, check that changes are:

- compact,
- source-backed where they mention implementation,
- non-duplicative,
- consistent with Beam as reference rather than runtime,
- and aligned with Prism repo boundaries.

## Current intended use

Use this branch for Beam maintenance work that would otherwise be blocked by protected `main`, especially:

- updating progress logs after Focus/EPK/Spectra/Beam changes,
- adding low-token multi-AI coordination rules,
- refreshing app current-surface packs,
- and staging instruction changes for review.
