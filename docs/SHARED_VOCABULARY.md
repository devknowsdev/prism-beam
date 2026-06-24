# Shared Vocabulary

Purpose: define the terms Prism uses across repos so docs, reviews, and future
implementation notes stay consistent.

## Terms

| Term | Meaning |
|---|---|
| Intent | The user goal or requested outcome that starts a workflow. Intent is the thing the system tries to satisfy, not the implementation plan. |
| Capability | A named unit of work the executive layer can route to, such as planning, file ingest, summarisation, publishing prep, or a domain adapter. |
| Adapter | The boundary object that talks to an external system, local service, or device. Adapters hide vendor/API detail from the orchestration layer. |
| Workflow | A named sequence of steps that turns intent into a result, often producing intermediate artifacts and approvals along the way. |
| Artifact | A durable output produced by work, such as a file, report, sidecar, draft, transcript, or generated asset. |
| Approval | A recorded human decision that authorises a risky or externally visible action. |
| Ledger | The record of what happened, why it happened, and who or what approved it. |
| Executive Memory | The orchestration-side memory of decisions, provenance, and prior outcomes that help future routing and governance. |
| Operational Data | The dashboard-side state used for planning and daily execution, such as tasks, queues, reviews, and checklist progress. |
| Music Management Layer | The Prism-named business/output layer, `prism-music`, that owns bookings, mail, social, publishing, CRM, gigs, releases, and commercial music operations. |
| Human Approval Gate | A required checkpoint where a person must confirm before an external write, publish, send, or delete action can proceed. |
| Canonical State | The authoritative source of truth for a domain. Derived indexes and views can be rebuilt from it. |
| Rebuildable Index | A derived search or retrieval structure that can be regenerated from canonical state without losing truth. |

## Usage Rules

- Use one term consistently across docs when the same concept is meant.
- If a system owns the canonical state, other systems should consume it rather
  than recreate it.
- If an index or cache can be regenerated, do not treat it as canonical.
- If an action can affect the outside world, assume it needs an approval gate
  unless a doc says otherwise.
