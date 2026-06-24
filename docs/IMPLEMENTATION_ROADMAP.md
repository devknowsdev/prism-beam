# Implementation Roadmap

Purpose: turn the research phases into a conservative build sequence. This is a
planning document, not a commitment that every phase is already underway.

## Stage Legend

- `Now`: safe, foundational, or already-supported work that reduces risk.
- `Next`: core infrastructure that should follow once the docs and contracts are stable.
- `Later`: valuable work that depends on a mature core and clearer boundaries.
- `Deferred`: useful ideas that stay out of the near-term roadmap.

## Phased Roadmap

| Phase | Topic | Stage | Why it sits there |
|---|---|---|---|
| 0 | Repo Orientation and Safety Pass | Now | Establishes the current state before anything else changes. |
| 1 | Architecture Documentation | Now | This is the governance layer the ecosystem needs first. |
| 2 | Local Dev Environment | Next | Shared local-stack guidance should follow the architecture docs. |
| 3 | Tool Adapter Layer | Next | Adapters are a core contract, but they depend on repo boundaries being clear. |
| 4 | File Ingest Pipeline | Next | Canonical-state ingestion is a foundation, not an optional extra. |
| 5 | Memory and Search Layer | Next | Search should be built on top of canonical state and rebuildable indexes. |
| 6 | Creative Asset Pipeline | Later | Useful output work, but it depends on stable ingest, approvals, and storage rules. |
| 7 | Booking and Calendar Pipeline | Later | External side effects need the approval model and adapter contracts to be solid first. |
| 8 | Audio Analysis Pipeline | Later | Media analysis is important, but it is downstream of ingest and storage discipline. |
| 9 | Social Scheduling Pipeline | Later | Publishing flow must wait for a mature approval and ledger model. |
| 10 | Coding Sprint Assistant | Later | Helpful for delivery, but not required to establish the core ecosystem contract. |
| 11 | Dashboard and Personal OS UI | Later | The humane operator surface depends on the core orchestration and data model stabilising first. |
| 12 | Stabilisation and Tests | Now | Smoke checks, mocks, and failure-mode docs are part of the foundation, not an afterthought. |

## Deferred Ideas

The research also suggests optional additions that remain deferred until the
core stack is stable:

- Docker-first packaging.
- Open WebUI as a temporary cockpit.
- Optional Qdrant or similar long-running vector service.
- ComfyUI or other heavier media-generation tools.
- n8n-style automation as optional infrastructure.
- Larger autonomous coding agents beyond the safety contract.

