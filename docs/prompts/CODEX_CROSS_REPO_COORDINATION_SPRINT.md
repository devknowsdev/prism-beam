# Codex Cross-Repo Coordination Sprint Template

Reasoning level: HIGH.

## Required Reading

- `prism-beam/docs/AI_SESSION_CONTRACTS.md`
- `prism-beam/docs/CHANGE_BOUNDARY_CHECKLIST.md`
- `prism-beam/docs/REPO_BOUNDARIES.md`
- `prism-beam/docs/REPO_ALIGNMENT_AUDIT.md`
- all affected repo READMEs

## Boundaries

- Allowed repos: only the explicitly named repos in the sprint brief.
- Do not change runtime behavior unless explicitly approved.
- Do not add dependencies.
- Do not change schemas unless explicitly requested.

## Out of Scope

- Broad refactors
- Unbounded implementation work
- Public behavior changes without approval

## Validation Requirements

- `git status`
- `git diff --stat`
- repo-local safe checks only

## Final Report Format

1. Repos touched
2. Why coordination was necessary
3. Files changed
4. Validation run
5. What remains blocked
6. Recommended next sprint

