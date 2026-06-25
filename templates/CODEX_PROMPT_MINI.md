# Mini Codex Prompt Template

**Purpose:** Keep Codex prompts short, repo-scoped, and Beam-oriented.

**Target budget:** 1,000-2,000 tokens

```text
You are working in [repo name].

Start by reading:
- prism-beam/ai-guides/TINY_BOOT.md
- prism-beam/context-packs/workspace/current-state.min.md
- [task-specific Beam pack]

Task:
[clear implementation or audit request]

Hard constraints:
- Do not modify any repo except [repo].
- Do not add dependencies unless explicitly justified.
- Do not perform hidden writes, broad scans, deploys, publishing, email, or destructive actions.
- Source code overrides Beam if implementation facts conflict.
- Keep changes minimal and reversible.
- Add/update tests where appropriate.

Likely files:
- [path]
- [path]
- [path]

Expected output:
- Files changed
- Why each change was needed
- Tests run and exact results
- Any source/Beam mismatch found
- Final git status
- Handover note
```
