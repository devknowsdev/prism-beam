# Suite Approval Posture

## Status

Draft shared contract.

## Purpose

Define suite-wide risk classes so EPK, Focus, Spectra, and Beam use the same
review-first language before adding integrations.

## Risk Classes

| Risk class | Definition | Examples | Default rule | Required approval | Rollback/audit expectation |
|---|---|---|---|---|---|
| read-only | Reads data without changing app, local, public, or external state. | EPK: read `public/data/epk.json`; Focus: preview an import packet; Spectra: inspect adapter manifest or sidecar plan. | Allowed when scoped and explicit. | None unless the data source itself is sensitive. | Note evidence used when it affects decisions. |
| local-draft | Changes browser/UI draft state that is not yet canonical or exported. | EPK: edit publisher textarea before export; Focus: stage import choices in a review modal; Spectra: build a dry-run plan. | Allowed inside visible draft/review UI. | User intent to edit draft. | Discard draft without mutating canonical state. |
| local-write | Writes local app state or user-controlled local exports. | EPK: download JSON or poster PNG; Focus: create approved local tasks; Spectra: write an approved local sidecar. | Requires visible user action. | Explicit approval when mutating app state; export/download button counts for local export. | Provide undo/backup guidance or source metadata. |
| external-draft | Creates a draft in an external service without publishing/sending. | EPK: proposed GitHub patch draft; Focus: prepared calendar draft; Spectra: external publishing draft adapter. | Treat as higher risk than local draft. | Recommended, with preview. | Keep draft id/link and deletion instructions. |
| external-write | Mutates public, hosted, GitHub, email, calendar, or third-party state. | EPK: publish data/snapshot to GitHub/public site; Focus: create external calendar event; Spectra: send/post/publish through adapter. | Block until explicit approval. | Required. | Capture summary, approver, timestamp, target, and rollback/compensation notes. |
| destructive | Deletes, overwrites, or irreversibly replaces canonical data or external state. | EPK: delete/overwrite canonical public data without backup; Focus: restore backup over all data; Spectra: delete files or force-push public state. | Block by default. | Required, plus backup/rollback confirmation. | Require backup/checkpoint, audit record, and explicit rollback or recovery plan. |

## Required Suite Rules

- Reading EPK data is read-only.
- Editing browser draft data is local-draft.
- Downloading JSON or poster PNG is user-controlled local export/local-write.
- Publishing EPK data or snapshots to GitHub/public site is external-write.
- Focus imports from EPK must be reviewed before mutating state.
- Spectra adapters must classify actions before execution.
- Deleting or overwriting canonical public data is destructive unless protected
  by backup/rollback.

## Data Shape / Schema Reference

Use `schemas/approval-request.schema.json` for portable approval requests.

## Validation

- Parse `schemas/approval-request.schema.json`.
- Check future contracts name a risk class before describing writes.

## Future prompts can omit

Future prompts can omit the suite risk-class definitions, approval defaults, and
canonical examples for EPK reads, EPK exports, EPK publishing, Focus imports, and
Spectra adapter classification.

## Update Rules

Update this contract when a new app adds external writes, destructive actions,
or a different approval model.
