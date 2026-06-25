# Model-Specific Prompting Guide

**Purpose:** Adapt Beam prompts to different AI systems so each model gets instructions that suit its strengths and reduce known failure modes.

**Last verified:** 2026-06-25
**Target budget:** 1,500-3,000 tokens
**Hard max:** 5,000 tokens

## Core principle

Do not write one giant generic prompt for every AI.

Beam should provide:

1. shared Prism context,
2. a task-specific pack,
3. a model-specific instruction layer,
4. and strict source-escalation rules.

Model-specific guidance must be treated as operational prompt craft, not as permanent truth about a company or model. Review periodically.

## Universal base for all AIs

Every AI should be told:

- Beam is orientation, not runtime code.
- Source code overrides Beam.
- Read the smallest relevant pack first.
- Do not perform broad repo scans by default.
- Do not invent repo facts.
- Do not make hidden writes, external calls, deploys, publishing actions, or destructive changes.
- Ask for or inspect exact evidence only when needed.
- Compress useful findings back into Beam.

## Claude-style sessions

### Good fit

- long-form synthesis,
- careful critique,
- writing and restructuring docs,
- spotting ambiguity,
- turning messy context into coherent plans.

### Risk to mitigate

- can over-audit,
- can request too much context,
- can produce long elegant reports instead of small actionable changes,
- can spend usage quickly if asked to inspect whole repos.

### Prompting posture

Use Claude for bounded reviews and synthesis. Give hard limits.

Tell Claude:

- do not ask for full repos,
- request at most 3 exact files,
- keep findings capped,
- produce a compact handover,
- separate confirmed facts from inferred suggestions.

Use `templates/FREE_CLAUDE_BEAM_INSIGHT_PROMPT.md` for free/usage-limited Claude sessions.

## Codex / coding-agent sessions

### Good fit

- implementing source changes,
- running tests,
- producing diffs,
- repo-grounded verification,
- small refactors.

### Risk to mitigate

- may over-edit,
- may change adjacent files unnecessarily,
- may follow stale docs without enough source verification,
- may add dependencies or abstractions too early.

### Prompting posture

Give Codex exact repo, exact task, likely files, constraints, and validation commands.

Tell Codex:

- modify only the named repo,
- keep changes minimal,
- do not add dependencies unless justified,
- run the relevant tests/build/typecheck,
- report exact files changed and final status,
- update Beam only when the task is documentation/context work.

Use `templates/CODEX_PROMPT_MINI.md` as the base.

## GPT / ChatGPT-style sessions

### Good fit

- reasoning through architecture tradeoffs,
- converting research into implementation plans,
- creating prompts and schemas,
- summarising files and producing handovers,
- balanced discussion plus execution planning.

### Risk to mitigate

- can become too helpful and produce too much,
- may blend older memory with current source if not forced to verify,
- may overgeneralise from prior sessions.

### Prompting posture

Give a clear deliverable and require citations/source references when using files or repo evidence.

Tell GPT:

- distinguish current evidence from prior memory,
- cite repo/file evidence when available,
- produce a concise action plan,
- flag uncertainty,
- avoid expanding scope unless requested.

## Gemini-style sessions

### Good fit

- broad comparison,
- long-context review,
- alternate perspectives,
- multimodal or web-heavy research where available.

### Risk to mitigate

- can be expansive,
- may focus on breadth over implementation order,
- may need strict output structure to avoid drift.

### Prompting posture

Use Gemini for second-opinion audits and large-context cross-checks, but force it to output deltas only.

Tell Gemini:

- do not restate the whole project,
- identify only contradictions, missing risks, or improved structure,
- keep recommendations ranked,
- request exact files only.

## Local small-model sessions

### Good fit

- narrow summarisation,
- checklist execution,
- classification,
- extracting TODOs,
- formatting handovers,
- offline/private tasks.

### Risk to mitigate

- weak long-range reasoning,
- hallucination when context is vague,
- poor handling of large repos,
- brittle instruction following.

### Prompting posture

Use tiny prompts, small context, rigid output formats, and yes/no or table tasks.

Tell local models:

- do not infer missing source facts,
- answer only from provided context,
- output `unknown` when evidence is missing,
- request at most one exact missing file,
- do not perform architecture redesign.

## Free / low-context sessions

Use `ai-guides/FREE_AI_MODE.md` and include only:

1. `ai-guides/TINY_BOOT.md`
2. `context-packs/workspace/current-state.min.md`
3. one app mini-pack if needed
4. one model-specific prompt layer
5. the task

Do not paste long research reports or full repo trees.

## Prompt layering pattern

```text
Layer 1: Prism tiny boot
Layer 2: current workspace/app mini-pack
Layer 3: task-specific context
Layer 4: model-specific instruction layer
Layer 5: expected output format
Layer 6: source escalation limit
```

## Maintenance rule

When a model-specific guide stops matching real behavior, update the guide. Do not let outdated folklore become Beam policy.
