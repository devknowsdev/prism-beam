# prism-spectra Session Start

## Scope

Compact guardrail for Spectra work. Verify against the current `prism-spectra`
repo before editing.

## Last Verified

2026-06-24 against local `prism-spectra` README, project brief, `src/index.ts`,
adapter docs/source, approval queue, sidecar docs/source, workbench docs/source,
and `package.json`.

## Current Truths

- `prism-spectra` owns local-first orchestration and workbench logic.
- It is the approval, adapters, capability routing, memory, and safe-execution
  side of the suite.
- It should use Beam as reference/training context, not as a runtime dependency
  unless explicitly justified.
- Current package identity is still `ai-forge-core`; treat this as package
  lineage/implementation detail, not a reason to revive old suite topology.
- The code already exports adapters, ingest helpers, approvals, events,
  capabilities, workbench surfaces, routing, memory, and execution primitives.

## Safe Edit Zones

- Docs that clarify current contracts.
- Tests and mocks for adapter, approval, sidecar, capability, and workbench
  behavior.
- Narrow source changes inside an explicitly requested subsystem.

## Dangerous Zones

- Adapter approval/risk classification.
- External write, destructive, publishing, Git, email, or social actions.
- Filesystem adapter path guards and allowed-root logic.
- Sidecar write execution and explicit-file command modes.
- Workbench routes that could become write routes.
- Broad autonomous-agent loops or background execution.

## Do

- Prefer explicit adapters and explicit file references.
- Preserve review-first and approval-first behavior.
- Require explicit approval for external writes, destructive operations, and
  publishing actions.
- Use structured adapters/contracts when they exist instead of scraping or
  inference.
- Keep sidecar/file-reference patterns explicit-file-only unless approved.
- Keep workbench views calm, review-oriented, and free of surprise writes.

## Do Not

- Do not make Beam a runtime dependency by default.
- Do not scrape/infer where structured adapters or contracts exist.
- Do not add folder scanning, file watching, or recursive ingest unless
  explicitly approved.
- Do not add broad autonomous agents without approval gates.
- Do not turn read-only workbench screens into write workflows by accident.

## Validation Hints

- `npm test`
- `npm run demo` when orchestrator behavior changes.
- `npm run test:browser` when workbench UI/data routes change.
- Check adapter approval behavior against `docs/ADAPTER_CONTRACTS.md`.
- Check sidecar behavior against `docs/LOCAL_FILE_INGEST_PLANNING.md`.

## Future prompts can omit

Future prompts can omit Spectra ownership of orchestration/adapters/approvals,
the Beam-as-reference rule, explicit-file/sidecar caution, approval boundary
rules, and workbench read-oriented posture.

## Update Rules

Refresh this guide after adapter, approval, sidecar, workbench, capability, or
external-write integration sprints.
