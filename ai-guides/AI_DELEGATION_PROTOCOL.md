# AI Delegation Protocol

**Purpose:** Help any AI decide when another model/session type is better suited, and generate a compact handoff prompt instead of forcing the wrong model to continue.

**Last verified:** 2026-06-25
**Target budget:** 1,000-2,000 tokens
**Hard max:** 3,000 tokens

## Core rule

If the current AI is not the best fit, it should say so early and produce a ready-to-use prompt for the better-suited AI.

Do not continue into a high-risk or high-usage task just because the user asked the current session first.

## Delegation triggers

Delegate or recommend delegation when:

- the task requires repo edits/tests and the current AI cannot safely run or inspect them,
- the task is mainly long-form critique and the current AI is a coding runner,
- the task is a narrow technical edge-case review better suited to a technical-review profile,
- the task needs a second opinion before implementation,
- the task is likely to exceed current context/usage limits,
- the task needs a free/low-context review rather than a large audit,
- the task requires validation that this AI cannot perform.

## Suggested target profiles

| Task need | Better target profile |
|---|---|
| Source implementation, tests, diffs | `CODEX.md` |
| Careful critique, doc synthesis, ambiguity review | `CLAUDE.md` |
| Prompt/schema/handover synthesis | `GPT.md` |
| Broad second-opinion or contradiction scan | `GEMINI.md` |
| Focused code/architecture edge-case review | `TECHNICAL_REVIEW.md` |
| Cheap checklist/extraction/formatting | `LOCAL_SMALL_MODEL.md` |

## Usage-limit awareness

AIs usually cannot know exact remaining user quota unless the platform exposes it. They must not claim exact remaining limits.

Instead, each AI should estimate task size and choose one of:

- `small`: answer or change can be completed now with compact context,
- `medium`: continue, but write progress notes early,
- `large`: recommend delegation, splitting, or a continuation prompt,
- `unsafe-to-continue`: stop and hand off before losing work.

## Stop-before-cutoff rule

If a task is large or uncertain, produce a handoff before doing deep work.

A good cutoff-safe response includes:

- current understanding,
- selected target AI/profile,
- why delegation is recommended,
- exact Beam files to read,
- exact source files to inspect, if any,
- expected output,
- progress-log update instruction.

## Delegation handoff format

Use `templates/AI_DELEGATION_PROMPT.md`.

## Progress log rule

If an AI recommends delegation, it should update or propose an `AI_PROGRESS_LOG.md` entry stating:

- delegation target,
- reason,
- prompt location or pasted prompt,
- unresolved work,
- files already read.

## Anti-patterns

- Do not ask the user to paste entire repos into another model.
- Do not send long research archives as default delegation context.
- Do not delegate vague tasks without a concrete prompt.
- Do not continue implementation when validation is impossible and a coding agent is available.
- Do not hide uncertainty about context or usage limits.
