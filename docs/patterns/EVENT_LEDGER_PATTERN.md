# Event Ledger Pattern

An event ledger records meaningful system actions as append-only evidence.

## Use when

- Recording approvals, publishes, imports, exports, or adapter actions.
- Building review-first workflows that need provenance.
- Explaining what happened after an AI-assisted session.

## Pattern

- events are append-only
- each event has a timestamp, actor/source, action, target, risk class, and
  summary
- derived views can be rebuilt from events
- destructive actions should reference rollback/backup evidence

## Do not use when

- The data is temporary UI state.
- A simple note or log entry is enough.

## Safety note

A ledger does not make a risky action safe. It makes the action auditable.
