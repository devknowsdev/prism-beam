# Codex prism-focus Widget Sprint Template

Reasoning level: HIGH.

## Required Reading

- `prism-focus/README.md`
- `prism-focus/docs/ORIENTATION.md`
- `prism-focus/src/ARCHITECTURE.md`
- `prism-beam/docs/REPO_BOUNDARIES.md`
- `prism-beam/docs/CHANGE_BOUNDARY_CHECKLIST.md`

## Boundaries

- Allowed repos: `prism-focus` only.
- Do not move orchestration logic into the UI.
- Do not publish externally from the widget layer.
- Do not add dependencies.

## Out of Scope

- Prism Core routing
- Music CRM ownership
- EPK public publishing

## Validation Requirements

- `node src/test_workflows.js`
- architecture lint if the repo uses it for the change

## Final Report Format

1. Widget or UI area changed
2. Behavior summary
3. Files changed
4. Validation results
5. Boundary notes
6. Recommended next step

