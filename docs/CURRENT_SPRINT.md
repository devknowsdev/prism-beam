# Current Sprint

This file is a lightweight pointer, not a full sprint backlog.

## Current status

Beam-001 through Beam-003 established Beam as the Prism suite's AI-facing
reference layer, added app context packs, and added the first integration and
schema contracts.

The older `sprint-026-beam-support-spine` branch is being salvaged into a fresh
branch from current `main` so its useful support-spine docs can be preserved
without reverting Beam's newer identity.

## Current sprint intent

Preserve useful support-spine material:

- role and ecosystem orientation
- repo boundary notes
- shared vocabulary
- safety/session contracts
- change boundary checklists
- reusable prompt/report templates
- initial Spectra-derived pattern notes

## Guardrails

- Do not reintroduce `Workspace Meta` as the current Beam identity.
- Do not modify app repos.
- Do not add runtime code or dependencies.
- Treat old support-spine material as reference docs to reconcile with Beam's
  current AI-facing role.
