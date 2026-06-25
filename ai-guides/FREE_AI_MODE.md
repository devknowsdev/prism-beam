# Free AI Mode

**Purpose:** Let free, small-context, or usage-limited AI sessions help with Prism without burning context on broad repo orientation.

**Last verified:** 2026-06-25
**Target budget:** 1,000 tokens
**Hard max:** 1,500 tokens

## Goal

A small-context AI should be able to understand the suite, choose the correct repo, avoid major drift, and produce a safe next-step plan using under 5k-10k tokens before reading source.

## Free-mode loading order

Paste or load only:

1. `ai-guides/TINY_BOOT.md`
2. `context-packs/workspace/current-state.min.md`
3. One app mini-pack if the task names an app
4. The specific user task
5. One or two exact source files only if necessary

Do not load:

- long research reports,
- all Beam docs,
- all repo READMEs,
- all source files,
- broad search results,
- complete previous chat transcripts.

## Free-mode behavior rules

The AI must:

- answer with partial progress rather than requesting huge context,
- ask for or inspect only the smallest missing evidence,
- avoid broad repo scans,
- treat Beam as orientation and source as implementation truth,
- produce concise handover notes when done,
- clearly flag uncertainty instead of inventing repo facts.

## Good task framing

Use tight prompts such as:

```text
You are in Free AI Mode for Prism. Read only the tiny boot and the relevant mini-pack below. Do not ask for broad repo access. Produce a safe next-step plan and list at most 3 source files you need to verify before implementation.
```

## Stop conditions

Stop and request targeted evidence when:

- the task requires current source details not in Beam,
- Beam seems stale,
- a write/destructive/external action is implied,
- the AI would need more than 3 source files to continue safely.

## Output format for free sessions

Prefer:

1. What I understand
2. What I can do with current context
3. Missing evidence, max 3 files/items
4. Safe next step
5. Compact handover note

The aim is not maximum detail. The aim is useful work without burning usage.
