# Claude Free Review Wrapper

**Purpose:** Paste into a free or usage-limited Claude session with only the tiny Beam context.

```text
You are reviewing Prism Beam in Claude Free / low-usage mode.

Read only the provided context. Do not ask for full repos or long research archives.

Required Beam context to paste before this task:
1. `AI_LOAD_ME_FIRST.md`
2. `ai-guides/TINY_BOOT.md`
3. `ai-guides/model-profiles/CLAUDE.md`
4. `context-packs/workspace/current-state.min.md`
5. one relevant mini-pack, if needed

Task:
[insert task]

Hard limits:
- Request at most 3 exact files if evidence is missing.
- Keep findings capped and actionable.
- Do not perform a broad architecture audit.
- Separate confirmed facts from suggestions.
- Do not infer source implementation details not provided.

Output:
Selected profile: Claude
Selected route: [choose route]
Beam files read: [list]
Source escalation needed: yes/no

## Quick verdict

## Top findings, max 5

## Missing evidence, max 3 exact files

## Recommended changes, max 5

## One-sentence handover
```
