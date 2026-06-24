# Prism Setup Landing Page

Date: 2026-06-24

## Purpose

This is the calm entry point for setup and readiness work across the Prism suite.

Beam is still a reference layer. It does not run app code and does not create runtime coupling between repos.

## Read first

1. `docs/setup/SUITE_SETUP_COMPLETION_SUMMARY.md`
2. `docs/setup/APP_SETUP_MATRIX.md`
3. `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`
4. `docs/setup/SCHEMA_UX_PLAN.md`
5. Relevant schema card under `docs/schema-cards/`

## Current app setup state

| Repo | Setup entry point | Notes |
| --- | --- | --- |
| `prism-beam` | This page and `docs/setup/APP_SETUP_MATRIX.md` | Reference-only; no runtime launch. |
| `prism-focus` | First-run setup guide/modal in app repo | Browser data remains local. |
| `prism-spectra` | `npm run doctor`, `npm run setup`, `npm run test:setup`, `npm run workbench` | Setup-safe checks are separate from full daemon/e2e validation. |
| `EPK` | `EPK/docs/EPK_SETUP.md` and publisher setup checklist | Public deploy root is public unless platform protection is configured. |

## Current schema cards

| Schema | Card | Machine schema |
| --- | --- | --- |
| EPK to Focus Event Packet | `docs/schema-cards/EPK_TO_FOCUS_EVENT_PACKET.md` | `schemas/epk-to-focus.event-packet.schema.json` |
| Suite Approval Request | `docs/schema-cards/APPROVAL_REQUEST.md` | `schemas/approval-request.schema.json` |

## Decision rules

- App behavior changes belong in the owning app repo.
- Cross-repo truth, pattern guidance, schema cards, and anti-drift rules can belong in Beam.
- Source code in app repos overrides stale docs.
- Beam contracts and schemas do not grant permission for hidden imports, writes, or synchronization.
- Any Focus import from EPK must be review-first.
- Any Spectra write, publish, delete, or remote action must remain explicit and approval-aware.

## Future prompts can omit

Future prompts can start from this landing page instead of relisting suite ownership, setup status, schema-card locations, and safe setup entry points.
