# AI Prompt Router

**Purpose:** Route any AI session to the correct Beam prompt/profile/context path.

**Last verified:** 2026-06-25
**Target budget:** 1,000-2,000 tokens
**Hard max:** 3,000 tokens

## Routing rule

Choose one model profile and one task route. Load only the files in that route unless source verification is needed.

## Model profile selection

| Situation | Profile |
|---|---|
| You are Claude, or acting mainly as a reviewer/synthesiser | `ai-guides/model-profiles/CLAUDE.md` |
| You are Codex or a coding agent that can edit/test files | `ai-guides/model-profiles/CODEX.md` |
| You are GPT/ChatGPT-style and doing planning, synthesis, prompts, or schemas | `ai-guides/model-profiles/GPT.md` |
| You are Gemini-style and doing second-opinion or large-context review | `ai-guides/model-profiles/GEMINI.md` |
| You are local, small, free, or low-context | `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md` |
| Unsure | `ai-guides/MODEL_SPECIFIC_PROMPTING.md`, then behave conservatively |

## Universal first-load files

Always begin with:

1. `AI_LOAD_ME_FIRST.md`
2. `ai-guides/TINY_BOOT.md`
3. selected model profile
4. `context-packs/workspace/current-state.min.md`

## Task routes

### 1. Beam token-efficiency / orientation work

Read:

- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `ai-guides/FREE_AI_MODE.md`
- `docs/token-efficiency/CONTEXT_BUDGETS.md`
- `docs/token-efficiency/REPO_SOURCE_ESCALATION_POLICY.md`

Optional:

- `docs/token-efficiency/BEAM_TOKEN_EFFICIENCY_AUDIT.md`

### 2. Spectra implementation or architecture work

Read:

- `context-packs/prism-spectra/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`

Optional, depending on task:

- `context-packs/prism-spectra/harvest-current.md`
- `context-packs/prism-spectra/model-routing-current.md`
- relevant pattern docs under `docs/patterns/`

### 3. Spectra model routing / OpenRouter work

Read:

- `context-packs/prism-spectra/model-routing-current.md`
- `docs/research/spectra-openrouter-audit.md`
- `schemas/model-provider.schema.json`
- `schemas/model-catalog-entry.schema.json`
- `schemas/openrouter-policy.schema.json`
- `schemas/routing-modes.schema.json`
- `harvest/spectra/openrouter.json`
- `harvest/spectra/openrouter-policies.json`

### 4. Open-source harvest work

Read:

- `context-packs/prism-spectra/harvest-current.md`
- `docs/research/spectra-open-source-harvest.md`
- `schemas/harvest-entry.schema.json`
- `harvest/spectra/tools-harvest-current.json`

### 5. Focus integration work

Read:

- `context-packs/prism-focus/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`

Then inspect exact Focus source files only if needed.

### 6. EPK integration work

Read:

- `context-packs/epk/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`

Then inspect exact EPK source files only if needed.

### 7. Prompt or handover generation

Read:

- selected model profile
- `templates/HANDOVER_MINI.md` or `templates/CODEX_PROMPT_MINI.md`
- relevant app mini-pack

### 8. Free/low-context review

Read:

- `ai-guides/FREE_AI_MODE.md`
- `templates/FREE_CLAUDE_BEAM_INSIGHT_PROMPT.md` if Claude-like
- one relevant mini-pack only

## Source escalation rule

Before source reads, state:

```text
I need source escalation for: [repo/path]
Reason: [why]
Question answered: [specific question]
Limit: [max files/snippets]
```

## First response format

```text
Selected profile: [profile]
Selected route: [route]
Beam files read: [list]
Source escalation needed: yes/no
Next action: [one sentence]
```
