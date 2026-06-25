# AI Progress, Changelog, and Handover Protocol

**Purpose:** Give GPT, Claude, Codex, DeepSeek, Gemini, local models, and future agents a shared repo-based handover mechanism.

**Last verified:** 2026-06-25
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
4. selected model profile
5. task-relevant mini-pack/docs

At session end, every AI that changes files or decisions must update:

- `AI_PROGRESS_LOG.md`

If the work is large, also create or update a detailed report under:

- `docs/progress/`

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

## Multi-AI continuation workflow

Example:

1. Claude reviews Beam and updates `AI_PROGRESS_LOG.md`.
2. GPT reads `AI_LOAD_ME_FIRST.md` and `AI_PROGRESS_LOG.md`, sees Claude's entry, and continues from the next step.
3. Codex reads the same log, implements a scoped change, validates it, and updates the log.
4. Claude reads the updated log and reviews only the latest changes.

The repo becomes the shared handover channel.

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
```
