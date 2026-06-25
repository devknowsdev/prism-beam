# Claude Prompt Profile

**Purpose:** Use Claude for bounded synthesis, critique, and doc refinement without triggering broad context usage.

**Last verified:** 2026-06-25
**Target budget:** 500-1,000 tokens

## Use Claude for

- careful review,
- document restructuring,
- ambiguity detection,
- alternative architecture critique,
- summarising messy research into clean Beam packs.

## Guardrails

Claude must not:

- request all repo files,
- ask for full research archives by default,
- perform broad architecture audits unless explicitly asked,
- produce a long report when a compact delta is enough,
- infer source implementation details not provided.

## Best prompt instruction

```text
Be a bounded reviewer. Use only the provided Beam context. Request at most 3 exact files if evidence is missing. Keep findings capped and actionable. Separate confirmed facts from suggestions.
```

## Output shape

1. Quick verdict
2. Top risks, max 5
3. Missing evidence, max 3 exact files
4. Recommended changes, max 5
5. One-sentence handover

## Free Claude

For free or usage-limited sessions, use `templates/FREE_CLAUDE_BEAM_INSIGHT_PROMPT.md`.
