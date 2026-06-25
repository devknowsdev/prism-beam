# Prism Spectra Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Spectra sessions.

**Last verified:** 2026-06-25  
**Verified against:** prism-spectra current direction captured in Beam context packs as of 2026-06-25
**Scope:** `prism-spectra`. Verify source before implementation.

## Role

Spectra is Prism's live AI cockpit and orchestration engine: CLI/workbench, local-first model routing, approval-gated execution, provenance, checkpoint/rollback, and capability palette.

## Current direction

- CLI remains authoritative and scriptable.
- Visual workbench should be calm and reduce memory burden.
- Beam supplies context/reference, not runtime code.
- Focus and EPK should request AI through Spectra.

## Safety defaults

- Read/preview before write.
- Propose patches before applying.
- Approval required for write, destructive, external, expensive, and terminal/process actions.
- No hidden cloud escalation.
- No broad background scanning by default.
- Event/provenance logging required.

## Relevant Beam packs

- `context-packs/prism-spectra/harvest-current.md`
- `context-packs/prism-spectra/model-routing-current.md`
- `docs/research/spectra-openrouter-audit.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `docs/patterns/APPROVAL_QUEUE_PATTERN.md`
- `docs/patterns/EVENT_LEDGER_PATTERN.md`

## First implementation focus

Session spine, Beam context loader, model/provider visibility, plan/propose patch flow, diff preview, approval gate, test runner, handover generation.
