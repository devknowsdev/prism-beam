# prism-spectra Current Surface

## Scope

Low-token current-state pack for `prism-spectra`.

## Last Verified

2026-06-24 against local `prism-spectra` README, project brief, package.json,
public exports, adapter docs/source, approval queue, sidecar docs/source, and
workbench docs/source.

## Evidence Used

- `prism-spectra/README.md`
- `prism-spectra/PROJECT_BRIEF.md`
- `prism-spectra/package.json`
- `prism-spectra/src/index.ts`
- `prism-spectra/docs/ADAPTER_CONTRACTS.md`
- `prism-spectra/src/adapters/approvalGuard.ts`
- `prism-spectra/src/approvals/queue.ts`
- `prism-spectra/docs/LOCAL_FILE_SIDECAR_CONVENTION.md`
- `prism-spectra/docs/LOCAL_FILE_INGEST_PLANNING.md`
- `prism-spectra/docs/SPECTRA_WORKBENCH_SHELL.md`
- `prism-spectra/docs/SPECTRA_WORKBENCH_DATA_SPINE.md`

## Current Truths

- Spectra is the local-first AI orchestration and execution engine for Prism.
- It owns routing, memory, checkpointing, capability surfaces, adapters,
  approvals, provenance, and safe execution.
- Adapter contracts distinguish read-only, local-write, external-draft,
  external-write, and destructive actions.
- External writes and destructive actions require explicit approval.
- Sidecar/local-file helpers are explicit-file-only by default and avoid folder
  scanning, file watching, media processing, external APIs, and database writes.
- Workbench shell/data spine is currently read-oriented and manifest/daemon
  summary driven.
- The EPK-to-Spectra adapter/read-order contract is documented in Beam and
  should be treated as reference context.

## Safe Assumptions

- Beam should feed Spectra reference context, not runtime imports.
- Use adapters, manifests, approvals, and explicit file references before
  inventing new execution paths.
- The workbench should grow from review/provenance surfaces before action
  surfaces.

## Do Not Infer

- Do not infer package name `ai-forge-core` means the old suite topology is
  current.
- Do not infer plan-only sidecar helpers may write.
- Do not infer read-only workbench routes authorize execution.
- Do not infer external publishing/email/social integrations exist just because
  mocks or contracts exist.

## Known Stale Areas

- Historical `AI-Forge` naming remains in package identity, docs, and lineage.
  Treat it as implementation history unless the sprint explicitly targets
  naming migration.
- Some docs are architecture or roadmap artifacts; verify source before editing.

## Useful Entry Points

- `app-guides/prism-spectra/session-start.md`
- `prism-spectra/README.md`
- `prism-spectra/docs/PROJECT_PORTAL.md`
- `prism-spectra/src/index.ts`
- `prism-spectra/docs/ADAPTER_CONTRACTS.md`
- `prism-spectra/docs/LOCAL_FILE_INGEST_PLANNING.md`
- `prism-spectra/docs/SPECTRA_WORKBENCH_DATA_SPINE.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `integrations/approval-posture.md`

## Validation Hints

- `npm test`
- `npm run demo`
- `npm run test:browser` for workbench data route/UI changes.

## Future prompts can omit

Future prompts can omit Spectra's current role, key surfaces, approval boundary
cautions, sidecar explicit-file rule, workbench read-oriented status, and
Beam-as-reference usage, plus the first EPK read-order contract location.

## Update Rules

Refresh after Spectra adapter, sidecar, workbench, approval, capability,
external-write, or naming-alignment sprints.
