# AI Usage and Context Limit Awareness

**Purpose:** Prevent Prism AI sessions from cutting off midway by requiring early task sizing, compact context loading, and handoff before overflow.

**Last verified:** 2026-06-25
**Target budget:** 800-1,500 tokens
**Hard max:** 2,500 tokens

## Core rule

Do not pretend to know exact remaining quota or context unless the platform shows it.

Instead, estimate risk and choose a safe continuation strategy.

## Task size classes

| Class | Meaning | Required behavior |
|---|---|---|
| `small` | Can complete with current context and few files | proceed |
| `medium` | Needs several steps or targeted source reads | proceed, but update handover early |
| `large` | Likely to need many files, tests, or long reasoning | split into phases or delegate |
| `unsafe-to-continue` | High chance of cutoff, missing validation, or broad context need | stop and produce handoff prompt |

## Early self-check

At the start of non-trivial work, state:

```text
Estimated task size: small / medium / large / unsafe-to-continue
Usage risk: low / medium / high
Handoff needed now: yes/no
```

## Mid-session checkpoint

Before opening many files, writing long reports, or making multi-file changes, create a compact progress note:

- what is known,
- what has been read,
- what remains,
- exact next step.

## When to hand off

Hand off when:

- the task needs validation the current AI cannot run,
- the task is becoming a full audit unintentionally,
- more than 3-5 source files are needed in a low-context session,
- context is getting crowded,
- the user would benefit from another model profile,
- the current session may cut off before final report.

## What not to do

- Do not load long research archives by default.
- Do not continue silently when the task is too large.
- Do not ask the user to repeat everything.
- Do not leave partial work without an `AI_PROGRESS_LOG.md` entry or handoff prompt.

## Safe ending format

If stopping early, end with:

```text
Stopping point: [where work paused]
Reason: [usage/context/validation/delegation]
Files read: [list]
Known facts: [short list]
Next AI/profile: [target]
Use prompt: [prompt or template path]
Progress log update needed: yes/no
```
