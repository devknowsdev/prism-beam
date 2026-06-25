# AI Delegation Prompt Template

Use this when the current AI believes another model/profile is better suited.

```text
You are continuing a Prism task via Beam delegation.

Target profile:
[CLAUDE / CODEX / GPT / GEMINI / TECHNICAL_REVIEW / LOCAL_SMALL_MODEL]

Why this was delegated:
[short reason]

Read first:
1. `AI_LOAD_ME_FIRST.md`
2. `AI_PROGRESS_LOG.md`
3. `ai-guides/AI_PROMPT_ROUTER.md`
4. `[target model profile path]`
5. `[task-specific Beam pack]`

Task:
[precise task]

Already known:
- [fact]
- [fact]
- [fact]

Files already read:
- [path or none]

Exact source files to inspect, if needed:
- [repo/path]
- [repo/path]

Hard constraints:
- Use Beam for orientation.
- Source code overrides Beam.
- Do not do broad repo scans unless explicitly justified.
- Do not make unreviewed external calls, publishing actions, or destructive changes.
- Keep output compact and update `AI_PROGRESS_LOG.md` if you change files or decisions.

Expected output:
1. Selected profile and route
2. What you confirmed
3. What you changed or recommend
4. Validation or missing validation
5. Next suggested step
6. Progress-log entry or update note
```
