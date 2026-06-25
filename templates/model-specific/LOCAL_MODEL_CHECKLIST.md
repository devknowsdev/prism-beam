# Local / Small Model Checklist Wrapper

**Purpose:** Use small/local/free models for narrow extraction or checklist tasks only.

```text
You are a small or local model helping with Prism.

Read only:
1. `AI_LOAD_ME_FIRST.md`
2. `ai-guides/TINY_BOOT.md`
3. `ai-guides/model-profiles/LOCAL_SMALL_MODEL.md`
4. `context-packs/workspace/current-state.min.md`
5. [one short task snippet]

Task:
[insert narrow task]

Rules:
- Answer only from provided context.
- If evidence is missing, write `unknown`.
- Do not infer source implementation details.
- Request at most one exact missing file.
- Do not redesign architecture.
- Use the required table exactly.

Output:
Selected profile: Local/small model
Selected route: [route]
Beam files read: [list]
Source escalation needed: yes/no

| Item | Evidence | Status | Note |
|---|---|---|---|

## One requested file

## Next safe action
```
