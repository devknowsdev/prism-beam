# AI Prompt Router

**Purpose:** Route any AI session to the correct Beam prompt/profile/context path.

**Last verified:** 2026-06-25
**Target budget:** 1,000-2,000 tokens
**Hard max:** 3,000 tokens

## Routing rule

Choose one model profile and one task route. Load only the files in that route unless source verification is needed.

Before expanding context, check delegation and usage risk using:

- `ai-guides/AI_DELEGATION_PROTOCOL.md`
- `ai-guides/AI_USAGE_LIMITS.md`

## Model profile selection

| Situation | Profile |
|---|---|
| You are Claude, or acting mainly as a reviewer/synthesiser | `ai-guides/model-profiles/CLAUDE.md` |
| You are Codex or a coding agent that can edit/test files | `ai-guides/model-profiles/CODEX.md` |
| You are GPT/ChatGPT-style and doing planning, synthesis, prompts, or schemas | `ai-guides/model-profiles/GPT.md` |
| You are Gemini-style and doing second-opinion or large-context review | `ai-guides/model-profiles/GEMINI.md` |
| You are DeepSeek-style or acting mainly as a focused technical reviewer | `ai-guides/model-profiles/TECHNICAL_REVIEW.md` |
| You are local, small, free, or low-context | `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md` |
| Unsure | `ai-guides/MODEL_SPECIFIC_PROMPTING.md`, then behave conservatively |

## Universal first-load files

Always begin with:

1. `AI_LOAD_ME_FIRST.md`
2. `AI_PROGRESS_LOG.md`
3. `ai-guides/TINY_BOOT.md`
4. `ai-guides/AI_DELEGATION_PROTOCOL.md`
5. `ai-guides/AI_USAGE_LIMITS.md`
6. selected model profile
7. `context-packs/workspace/current-state.min.md`

## Task routes

### 1. Beam token-efficiency / orientation work

Read:

- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `ai-guides/FREE_AI_MODE.md`
- `docs/token-efficiency/CONTEXT_BUDGETS.md`
- `docs/token-efficiency/REPO_SOURCE_ESCALATION_POLICY.md`

Optional:

- `docs/token-efficiency/BEAM_TOKEN_EFFICIENCY_AUDIT.md`

### 2. Progress / changelog / handover work

Read:

- `AI_PROGRESS_LOG.md`
- `ai-guides/AI_PROGRESS_PROTOCOL.md`
- `templates/AI_PROGRESS_ENTRY.md`
- `schemas/ai-progress-entry.schema.json`

Use this route when continuing work from another AI session or when updating the shared AI-to-AI handover state.

### 3. Delegation recommendation

Read:

- `ai-guides/AI_DELEGATION_PROTOCOL.md`
- `ai-guides/AI_USAGE_LIMITS.md`
- `templates/AI_DELEGATION_PROMPT.md`
- `schemas/ai-delegation.schema.json`

Use this route when another AI/profile is better suited or the current session is at risk of cutting off.

### 4. Spectra implementation or architecture work

Read:

- `context-packs/prism-spectra/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`

Optional, depending on task:

- `context-packs/prism-spectra/harvest-current.md`
- `context-packs/prism-spectra/model-routing-current.md`
- relevant pattern docs under `docs/patterns/`

### 5. Spectra model routing / OpenRouter work

Read:

- `context-packs/prism-spectra/model-routing-current.md`
- `docs/research/spectra-openrouter-audit.md`
- `schemas/model-provider.schema.json`
- `schemas/model-catalog-entry.schema.json`
- `schemas/openrouter-policy.schema.json`
- `schemas/routing-modes.schema.json`
- `harvest/spectra/openrouter.json`
- `harvest/spectra/openrouter-policies.json`

### 6. Open-source harvest work

Read:

- `context-packs/prism-spectra/harvest-current.md`
- `docs/research/spectra-open-source-harvest.md`
- `schemas/harvest-entry.schema.json`
- `harvest/spectra/tools-harvest-current.json`

### 7. Focus integration work

Read:

- `context-packs/prism-focus/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`

Then inspect exact Focus source files only if needed.

### 8. EPK integration work

Read:

- `context-packs/epk/current-surface.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`

Then inspect exact EPK source files only if needed.

### 9. Prompt or handover generation

Read:

- selected model profile
- `AI_PROGRESS_LOG.md`
- `templates/HANDOVER_MINI.md` or `templates/CODEX_PROMPT_MINI.md`
- relevant app mini-pack

### 10. Free/low-context review

Read:

- `ai-guides/FREE_AI_MODE.md`
- `AI_PROGRESS_LOG.md`
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
Progress log status: [read/current/stale/not found]
Estimated task size: [small/medium/large/unsafe-to-continue]
Usage risk: [low/medium/high]
Delegation needed: yes/no
Beam files read: [list]
Source escalation needed: yes/no
Next action: [one sentence]
```
