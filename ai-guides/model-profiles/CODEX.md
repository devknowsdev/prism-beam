# Codex Prompt Profile

**Purpose:** Use Codex/coding-agent sessions for tightly scoped repo implementation with source verification and tests.

**Last verified:** 2026-06-25
**Target budget:** 500-1,000 tokens

## Use Codex for

- source modifications,
- tests/build/typecheck,
- small refactors,
- repo-grounded audits,
- implementation of Beam docs/schemas/templates.

## Guardrails

Codex must not:

- modify repos outside the named scope,
- add dependencies unless explicitly justified,
- perform hidden writes or destructive actions,
- follow stale docs over current source,
- broaden a task into a rewrite.

## Best prompt instruction

```text
Modify only the named repo. Read Beam first, then exact source files. Keep changes minimal and reversible. Run relevant validation. Report files changed, tests run, final status, and any Beam/source mismatch.
```

## Output shape

1. Files changed
2. Why each change was needed
3. Validation commands and exact results
4. Mismatches or risks
5. Final status
6. Handover note

## Base template

Use `templates/CODEX_PROMPT_MINI.md`.
