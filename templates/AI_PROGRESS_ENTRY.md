# AI Progress Entry Template

Use this when updating `AI_PROGRESS_LOG.md` after a Beam or Prism session.

```markdown
### YYYY-MM-DD — [AI/model/session type] — [short task title]

**Task:** [What the session attempted.]

**Files changed or reviewed:**

- `[path]` — [short reason]
- `[path]` — [short reason]

**Outcome:** [What was completed or left incomplete.]

**Validation:** [List specific checks performed. If any were skipped, name them explicitly:
e.g. "JSON schema parse: skipped — no local checkout available; link/path check: not run —
connector-only write, verify before next structural session." Do not write `not run` alone.]

**Source/Beam mismatches:** [Any stale docs or source contradictions, or `none found`.]

**Risks / cautions:** [Known uncertainty, connector limits, branch/main notes, or `none`.]

**Next suggested step:** [One precise next action for the next AI.]

**Next AI should read:**

- `AI_LOAD_ME_FIRST.md`
- `AI_PROGRESS_LOG.md`
- `[task-specific file]`
```

Keep entries compact. If an entry becomes long, write a detailed report under `docs/progress/` and link to it from the progress log.
