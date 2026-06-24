# Repo Hygiene Checklist

Use before closing a Prism repo sprint.

- [ ] Correct repo and branch.
- [ ] One PR for the sprint.
- [ ] No unrelated app repo changes.
- [ ] No dependency changes unless explicitly requested.
- [ ] No generated clutter or local-only files committed.
- [ ] No secrets, tokens, personal exports, or private data committed.
- [ ] No merge conflict markers remain.
- [ ] `git diff --check` passes.
- [ ] Relevant JSON files parse where applicable.
- [ ] README/context docs updated only when the durable truth changed.
- [ ] Final report includes validation and caveats.
- [ ] Future prompts can omit section is included where useful.
