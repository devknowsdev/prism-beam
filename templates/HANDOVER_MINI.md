# Mini Handover Template

**Purpose:** Compact continuation prompt for Prism sessions.

**Target budget:** 800-1,500 tokens

```text
You are continuing Prism work.

Read first:
1. prism-beam/ai-guides/TINY_BOOT.md
2. prism-beam/context-packs/workspace/current-state.min.md
3. [one relevant app mini-pack or current-surface pack]

Current task:
[one paragraph]

Known facts:
- [fact 1]
- [fact 2]
- [fact 3]

Constraints:
- Beam is reference, not runtime code.
- Source code overrides Beam.
- Do not do broad repo scans.
- Do not make hidden writes, external calls, or destructive changes.
- Ask for or fetch only exact files needed.

Files likely relevant:
- [path]
- [path]
- [path]

Validation expected:
- [command/test/doc check]

Output wanted:
- What you understand
- Minimal plan
- Exact files to inspect or change
- Safety concerns
- Handover summary when done
```
