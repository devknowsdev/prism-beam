# Approval Queue Pattern

This pattern describes how Prism tracks pending and resolved approvals without
executing work automatically.

## Approval Request Shape

An approval request usually includes:

- `id`
- `createdAt`
- `updatedAt`
- `status`
- `title`
- `summary`
- `approvalClass`
- `checkpointPolicy`
- `relatedCapabilityId?`
- `relatedArtifactIds`
- `relatedFilePaths`
- `previewAvailable`
- `previewSummary?`
- `cliEquivalent?`
- `riskNotes`
- `localRemoteBoundary`
- `requestedBy`
- `decision?`

## Status Lifecycle

- `pending`
- `approved`
- `rejected`
- `cancelled`
- `expired`

## Decision Model

When an approval is resolved, store:

- `status` as `approved`, `rejected`, or `cancelled`
- `decidedAt`
- `decidedBy`
- `reason?`

## Approval Classes

Use the same approval classes as the capability manifest pattern:

- `observe`
- `preview`
- `write`
- `destructive`
- `remote`
- `expensive`

## Checkpoint Policy Relationship

- `write` and `destructive` work should usually require a checkpoint policy.
- The approval card should make the checkpoint expectation visible.
- The queue should not silently bypass the checkpoint model.

## Preview Availability

- A preview should be visible whenever the work can be safely summarised first.
- If preview is impossible, explain why in `riskNotes`.
- The workbench should show the preview state before any execution path exists.

## Local / Remote Boundary Summary

- Make it obvious whether the action stays local.
- Make it obvious if data may leave the machine.
- Make it obvious if the capability needs remote approval semantics.

## Risk Notes

Risk notes should explain the non-obvious part:

- why the approval exists
- what might be lost
- what cannot be reversed
- what is expensive
- what crosses a boundary

## Important Rule

Resolving approval does not execute anything unless a separate execution path
is explicitly wired later. The queue is for state and provenance, not hidden
automation.

## Ledger Link

Requesting or resolving an approval should emit ledger events such as
`approval.requested` and `approval.resolved`.
