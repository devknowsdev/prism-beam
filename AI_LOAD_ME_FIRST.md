# AI Load Me First

**Purpose:** One safe entry file for any AI session using Prism Beam.

**Last verified:** 2026-06-25
**Target budget:** 800-1,200 tokens
**Hard max:** 1,500 tokens

## Start here

Beam is the orientation and reference layer for the Prism suite. Use it before reading app source.

Do not load every Beam file. Do not read every repo just to orient. Pick the smallest correct path for your model and task.

## Step 1 — Read the current progress handover

Read:

- `AI_PROGRESS_LOG.md`

Use it to see what the previous AI session changed, what remains open, and what the next suggested step is.

## Step 2 — Choose your session profile

| Session type | Read profile |
|---|---|
| Claude / reviewer | `ai-guides/model-profiles/CLAUDE.md` |
| Codex / coding agent | `ai-guides/model-profiles/CODEX.md` |
| GPT / planner or synthesiser | `ai-guides/model-profiles/GPT.md` |
| Gemini / second-opinion reviewer | `ai-guides/model-profiles/GEMINI.md` |
| DeepSeek-style or focused technical reviewer | `ai-guides/model-profiles/TECHNICAL_REVIEW.md` |
| Local, small, or free model | `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md` |
| Unsure | `ai-guides/MODEL_SPECIFIC_PROMPTING.md` |

## Step 3 — Read the universal minimum

Read these first:

1. `ai-guides/TINY_BOOT.md`
2. `ai-guides/AI_PROMPT_ROUTER.md`
3. `ai-guides/AI_PROGRESS_PROTOCOL.md`
4. `ai-guides/AI_DELEGATION_PROTOCOL.md`
5. `ai-guides/AI_USAGE_LIMITS.md`
6. your selected model profile
7. `context-packs/workspace/current-state.min.md`

For free or usage-limited sessions, also read:

- `ai-guides/FREE_AI_MODE.md`

## Step 4 — Check delegation and usage risk

Before expanding context or starting work, decide:

- Am I the right profile for this task?
- Is the task small, medium, large, or unsafe to continue here?
- Should I produce a delegation prompt for another AI/profile?

If another profile is better suited, use `templates/AI_DELEGATION_PROMPT.md`.

## Step 5 — Choose the task route

Use `ai-guides/AI_PROMPT_ROUTER.md` to choose one route:

- implementation,
- research or audit,
- handover,
- prompt generation,
- delegation recommendation,
- progress/changelog update,
- Spectra model routing,
- open-source harvest,
- Focus integration,
- EPK integration,
- free or low-context review.

## Step 6 — Load only task-relevant context

Examples:

- Spectra work: `context-packs/prism-spectra/current-surface.min.md`
- Focus work: `context-packs/prism-focus/current-surface.min.md`
- EPK work: `context-packs/epk/current-surface.min.md`
- OpenRouter/model-routing work: `context-packs/prism-spectra/model-routing-current.md`
- Open-source harvest work: `context-packs/prism-spectra/harvest-current.md`
- Token-efficiency work: `docs/token-efficiency/CONTEXT_BUDGETS.md`
- Progress/handover work: `AI_PROGRESS_LOG.md` and `ai-guides/AI_PROGRESS_PROTOCOL.md`
- Delegation work: `ai-guides/AI_DELEGATION_PROTOCOL.md` and `templates/AI_DELEGATION_PROMPT.md`

## Step 7 — Source escalation

Source code overrides Beam. Read source only when it is needed for a specific implementation or verification question.

Before reading source, state:

- repo,
- exact path,
- reason,
- question it answers.

## Step 8 — End-of-session update

If you changed files, confirmed decisions, recommended delegation, found mismatches, or left work partially complete, update `AI_PROGRESS_LOG.md` using `templates/AI_PROGRESS_ENTRY.md`.

## Hard rules

- Beam is reference, not runtime code.
- Focus and EPK should request AI services through Spectra.
- Do not make unreviewed file changes, external calls, publishing actions, or destructive changes.
- Preview/propose before execute/apply.
- State uncertainty rather than inventing repo facts.
- Do not claim exact remaining usage/quota unless the platform exposes it.
- Delegate when another profile is clearly safer or more efficient.
- Compress important new findings back into Beam.
- Leave a compact progress entry for the next AI.

## First response expected

Start by stating:

1. selected model profile,
2. selected task route,
3. progress log status,
4. task size estimate,
5. usage risk,
6. delegation needed: yes/no,
7. packs read,
8. whether source escalation is needed.

Then proceed with the task or provide a delegation prompt.
