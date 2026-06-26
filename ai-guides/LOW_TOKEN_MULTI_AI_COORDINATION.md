# Low-Token Multi-AI Coordination Protocol

**Purpose:** Let multiple AIs work across Prism repos without forcing expensive live-status checks before every write.

**Last verified:** 2026-06-26
**Target budget:** 700-1,200 tokens

## Core rule

Do not re-read the whole progress log, rescan repos, or poll live status before every write. That creates the token burn Beam exists to prevent.

Use a three-stage model instead:

1. **Orient once at session start.**
   - Read `AI_LOAD_ME_FIRST.md`.
   - Read `AI_PROGRESS_LOG.md`.
   - Read the smallest task-relevant mini-pack.

2. **Keep a compact chat-side session delta during the session.**
   - Maintain the delta in assistant replies after meaningful changes.
   - Do not commit every tiny update to the repo.
   - Keep the delta short enough that the user can copy it into a handover if the session cuts off.

3. **Commit the Beam progress log once at the end.**
   - Ask the user to say when the session is done.
   - When confirmed, update `AI_PROGRESS_LOG.md` once with the final compact entry.

## Before writing files

Before writing a file, check only what the write requires:

- the exact target file,
- its current SHA/ref,
- the exact branch,
- and any directly adjacent file needed to avoid a broken change.

Do not broaden into repo scans unless the task requires it.

## When to re-check broader live status

Re-read `AI_PROGRESS_LOG.md`, compare branches, or re-orient only when one of these is true:

- the user says another AI changed the same repo,
- the write fails because the SHA/ref is stale,
- the task scope changes,
- the session has been idle long enough that another AI may plausibly have continued,
- or the target path is part of a known high-conflict area.

## Session delta format

Use this compact chat-side block after meaningful work, not necessarily after every sentence:

```text
Session delta:
- Changed: <repo:path or none>
- Decision: <one-line decision or none>
- Validation: <done/not done>
- Open: <next exact step>
- Commit prompt: Tell me when to commit this session log to Beam.
```

## End-of-session behavior

At the end of a repo-changing or decision-changing session, say:

```text
Beam session log is ready. Tell me to commit it when this session is done.
```

Only after the user confirms, write the compact final entry to `AI_PROGRESS_LOG.md`.

## Why this exists

Beam is meant to reduce repeated explanation, repeated scanning, and orientation drift. A strict "check live status before every write" rule would improve freshness but would damage the low-token design. This protocol keeps freshness checks targeted and makes the repo progress log the shared handover bus without turning it into a high-frequency coordination database.
