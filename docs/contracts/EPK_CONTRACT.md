# EPK Support-Spine Contract

## Owner

`EPK` owns public/promotional truth, the public site, publisher tooling,
published snapshots, contact handoff UI, media/gallery metadata, and
browser-only poster/export workflows.

## Beam relationship

Beam may store EPK guardrails, schemas, prompt packs, context packs, and reusable
patterns. Beam does not own EPK runtime code or public content.

## Boundary rules

- Public pages must not expose editor/admin controls.
- Hosted publisher must not be treated as private without real platform auth.
- Static contact remains `mailto:` unless a backend/form-service sprint is
  explicitly approved.
- Publishing to GitHub/public data is an external write requiring explicit user
  action.
