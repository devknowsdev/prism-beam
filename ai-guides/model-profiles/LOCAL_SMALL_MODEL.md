# Local / Small Model Prompt Profile

**Purpose:** Use small, free, or local models for narrow, low-risk tasks without expecting broad reasoning.

**Last verified:** 2026-06-25
**Target budget:** 500-1,000 tokens

## Use local/small models for

- checklist execution,
- summarising short provided text,
- extracting TODOs,
- formatting handovers,
- classifying a small set of items,
- private/offline review where quality demands are modest.

## Guardrails

Small/local models must not:

- infer missing source facts,
- redesign architecture,
- inspect broad repos,
- handle large ambiguous tasks,
- make safety or license decisions alone.

## Best prompt instruction

```text
Answer only from the provided context. If evidence is missing, write `unknown`. Do not infer repo implementation details. Request at most one exact missing file. Use the required output table exactly.
```

## Output shape

Use rigid formats:

| Item | Evidence | Status | Note |
|---|---|---|---|

or:

1. Known
2. Unknown
3. One requested file
4. Next safe action

## Best Beam context

Use only:

- `ai-guides/TINY_BOOT.md`
- one `.min.md` pack
- the task text
- one exact source snippet if necessary
