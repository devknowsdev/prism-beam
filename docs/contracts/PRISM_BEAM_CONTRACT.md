# prism-beam Support-Spine Contract

## Owner

`prism-beam` owns AI-readable reference material: guides, context packs,
contracts, schemas, patterns, logs, templates, prompt packs, and harvest notes.

## Boundary rules

- Beam is not a runtime dependency.
- Beam is not a monorepo.
- Beam must not store secrets, user data, or app state.
- Beam should record stable, reusable lessons and point app repos toward current
  contracts.
- Beam docs should not override source evidence from app repos.

## Update rule

When an app sprint creates durable cross-app knowledge, update Beam in the same
PR if it is only documentation/reference material, or in a follow-up Beam PR if
that keeps the app sprint cleaner.
