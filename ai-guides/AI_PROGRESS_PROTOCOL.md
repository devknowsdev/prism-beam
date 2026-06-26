# AI Progress, Changelog, and Handover Protocol

**Purpose:** Give GPT, Claude, Codex, DeepSeek, Gemini, local models, and future agents a shared repo-based handover mechanism.

**Last verified:** 2026-06-26
**Target budget:** 1,000-2,000 tokens
**Hard max:** 3,000 tokens

## Core idea

Each AI should be able to see what the previous AI did by reading one current progress file:

- `AI_PROGRESS_LOG.md`

This prevents the user from having to repeat orientation and handover details between models.

## Required behavior

At session start, every AI must read:

1. `AI_LOAD_ME_FIRST.md`
2. `AI_PROGRESS_LOG.md`
3. `ai-guides/AI_PROMPT_ROUTER.md`
4. `ai-guides/LOW_TOKEN_MULTI_AI_COORDINATION.md`
5. selected model profile
6. task-relevant mini-pack/docs

During the session, every AI that changes files, confirms decisions, or leaves incomplete work must keep a compact chat-side session delta.

At session end, every AI that changes files or decisions must ask the user whether to commit the session log. When the user confirms, update:

- `AI_PROGRESS_LOG.md`

If the work is large, also create or update a detailed report under:

- `docs/progress/`

For Beam foundational files, prefer staging proposed progress/rule/instruction/context-pack changes on:

- `beam/ai-change-review-queue-v3`

Then review through its PR before merging into protected `main`.

## Low-token coordination rule

Do not re-read the whole progress log, rescan repos, or poll live status before every write. That creates the token burn Beam exists to prevent.

Before writing, verify only the exact target file/ref/SHA and directly adjacent files needed for a safe change.

Re-check broader live status only when:

- the user says another AI changed the same repo,
- the write fails because the SHA/ref is stale,
- the task scope changes,
- the session has been idle long enough that another AI may plausibly have continued,
- or the target path is part of a known high-conflict area.

## Session delta format

Use this compact block after meaningful work, not necessarily after every sentence:

```text
Session delta:
- Changed: <repo:path or none>
- Decision: <one-line decision or none>
- Validation: <done/not done>
- Open: <next exact step>
- Commit prompt: Tell me when to commit this session log to Beam.
```

## Append-only rule

`AI_PROGRESS_LOG.md` is an append-only log with one exception.

**The only section AIs may overwrite:** `## Current active handover` — replace its content
entirely to reflect the new current state after each session.

**All other edits are additive only:**

- New session entries are always prepended inside `## Recent session entries` (newest at top).
- Previous session entries must never be edited or deleted by a subsequent AI.
- If a previous entry is found to be incorrect, append a correction note as a new entry:

```markdown
### YYYY-MM-DD — [AI type] — Correction to [date] entry

**Correction:** [what was wrong in the earlier entry and what is accurate]
```

This rule exists because future AI sessions read previous entries as verified history.
Errors that compound across sessions are harder to detect than a logged correction.

## What belongs in `AI_PROGRESS_LOG.md`

Keep it compact:

- active handover,
- last 3-5 session entries,
- files changed,
- validation performed,
- unresolved risks,
- exact next step,
- source/Beam mismatches.

Do not paste long reports, full diffs, or full research archives into the progress log.

## What belongs in detailed progress reports

Use `docs/progress/` for longer records:

- full sprint summaries,
- detailed changelogs,
- large validation logs,
- archive entries moved out of `AI_PROGRESS_LOG.md`.

## Entry rules

Each session entry must include:

- date,
- AI/model/session type,
- task,
- files changed,
- outcome,
- validation,
- risks/mismatches,
- next suggested step.

`Validation: not run` alone is not an acceptable entry. An AI that cannot run validation must
still list:

- what specific checks were skipped,
- why they were skipped,
- and what a future AI or human should verify before treating the session's changes as confirmed.

## Multi-AI continuation workflow

Example:

1. Claude reviews Beam and updates `AI_PROGRESS_LOG.md` once at session end.
2. GPT reads `AI_LOAD_ME_FIRST.md`, `AI_PROGRESS_LOG.md`, and `LOW_TOKEN_MULTI_AI_COORDINATION.md`, sees Claude's entry, and continues from the next step.
3. Codex reads the same compact handover, implements a scoped change, validates it, keeps a chat-side session delta, and asks the user when to commit the log.
4. Claude reads the updated log and reviews only the latest changes.

The repo becomes the shared handover channel without becoming a high-frequency coordination database.

## Token control

`AI_PROGRESS_LOG.md` must stay below 5,000 tokens.

When it grows too large:

1. Move older entries to `docs/progress/archive/YYYY-MM.md`.
2. Keep only active handover, last 3-5 entries, unresolved risks, and next step.
3. Add a link to the archive.

## Source truth

Progress logs are handover records, not proof of implementation. If implementation details matter, verify exact source files.

## Final report rule

A session that edits the repo should end with:

```text
Progress log updated: yes/no
Files changed: ...
Validation: ...
Next AI should read: ...
Session delta: ...
```
