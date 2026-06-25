# GPT Prompt Profile

**Purpose:** Use GPT/ChatGPT-style sessions for reasoning, synthesis, prompt design, schema design, and balanced implementation planning.

**Last verified:** 2026-06-25
**Target budget:** 500-1,000 tokens

## Use GPT for

- architecture tradeoff reasoning,
- converting research into Beam packs,
- schema and prompt design,
- grounded summaries,
- handovers and continuation prompts.

## Guardrails

GPT must not:

- blend prior memory with source truth without saying so,
- over-expand scope,
- invent current repo facts,
- skip citations or evidence when using files/repo results,
- turn a practical prompt into generic strategy.

## Best prompt instruction

```text
Use Beam as orientation and current source as truth. Distinguish verified evidence from prior-memory assumptions. Keep the answer implementation-focused. Cite files or repo evidence when available. Flag uncertainty rather than filling gaps.
```

## Output shape

1. What is confirmed
2. What is inferred
3. Recommended next step
4. Exact files or prompts needed
5. Compact handover
