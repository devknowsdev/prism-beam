# prism-focus Support-Spine Contract

## Owner

`prism-focus` owns daily planning, tasks, routines, low-overwhelm personal
execution state, and browser-local workflow surfaces.

## Beam relationship

Beam may store Focus session-start guidance, import contracts, schema references,
and reusable local-first/AI-whitelist patterns. Beam does not own Focus runtime
state or UI implementation.

## Boundary rules

- Cross-app imports must be reviewed before mutating Focus state.
- Do not write directly into Focus `localStorage` from another app.
- Optional AI features must remain bounded, auditable, and explainable.
- No automatic calendar, email, social, or external posting without explicit
  approval and a real implementation contract.
