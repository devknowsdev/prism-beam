# AI Load Me First

**Purpose:** One safe entry file for any AI session using Prism Beam.

**Last verified:** 2026-06-25
**Target budget:** 800-1,200 tokens
**Hard max:** 1,500 tokens

## Start here

Beam is the orientation and reference layer for the Prism suite. Use it before reading app source.

Do not load every Beam file. Do not read every repo just to orient. Pick the smallest correct path for your model and task.

## Step 1 — Choose your session profile

| Session type | Read profile |
|---|---|
| Claude / reviewer | `ai-guides/model-profiles/CLAUDE.md` |
| Codex / coding agent | `ai-guides/model-profiles/CODEX.md` |
| GPT / planner or synthesiser | `ai-guides/model-profiles/GPT.md` |
| Gemini / second-opinion reviewer | `ai-guides/model-profiles/GEMINI.md` |
| Local, small, or free model | `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md` |
| Unsure | `ai-guides/MODEL_SPECIFIC_PROMPTING.md` |

## Step 2 — Read the universal minimum

Read these first:

1. `ai-guides/TINY_BOOT.md`
2. `ai-guides/AI_PROMPT_ROUTER.md`
3. your selected model profile
4. `context-packs/workspace/current-state.min.md`

For free or usage-limited sessions, also read:

- `ai-guides/FREE_AI_MODE.md`

## Step 3 — Choose the task route

Use `ai-guides/AI_PROMPT_ROUTER.md` to choose one route:

- implementation,
- research or audit,
- handover,
- prompt generation,
- Spectra model routing,
- open-source harvest,
- Focus integration,
- EPK integration,
- free or low-context review.

## Step 4 — Load only task-relevant context

Examples:

- Spectra work: `context-packs/prism-spectra/current-surface.min.md`
- Focus work: `context-packs/prism-focus/current-surface.min.md`
- EPK work: `context-packs/epk/current-surface.min.md`
- OpenRouter/model-routing work: `context-packs/prism-spectra/model-routing-current.md`
- Open-source harvest work: `context-packs/prism-spectra/harvest-current.md`
- Token-efficiency work: `docs/token-efficiency/CONTEXT_BUDGETS.md`

## Step 5 — Source escalation

Source code overrides Beam. Read source only when it is needed for a specific implementation or verification question.

Before reading source, state:

- repo,
- exact path,
- reason,
- question it answers.

## Hard rules

- Beam is reference, not runtime code.
- Focus and EPK should request AI services through Spectra.
- Do not make unreviewed file changes, external calls, publishing actions, or destructive changes.
- Preview/propose before execute/apply.
- State uncertainty rather than inventing repo facts.
- Compress important new findings back into Beam.

## First response expected

Start by stating:

1. selected model profile,
2. selected task route,
3. packs read,
4. whether source escalation is needed.

Then proceed with the task.
