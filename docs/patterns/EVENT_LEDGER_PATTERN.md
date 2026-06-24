# Event Ledger Pattern

This pattern describes Prism's append-only visibility layer for provenance,
review, and calm read models.

## Contract

An event ledger records what happened, when it happened, how severe it was, and
what it relates to. It is a provenance and visibility tool first. It does not
imply execution.

## Core Fields

Events usually include:

- `id`
- `time`
- `type`
- `summary`
- `severity`
- `source`
- `relatedCapabilityId?`
- `relatedArtifactId?`
- `relatedConversationId?`
- `relatedCheckpointId?`
- `relatedApprovalId?`
- `metadata?`

## Event Naming

- Use stable dot-separated names such as `workbench.opened`,
  `approval.requested`, or `artifact.previewed`.
- Keep event names descriptive and narrow.
- Prefer verbs for actions and nouns for state-bearing summaries.

## Severity

Keep the severity enum small and easy to scan. A low-noise set such as `info`,
`notice`, `warning`, and `error` is usually enough for a calm workbench.

## Related IDs

Related IDs link events back to the objects that matter for review:

- capability manifests
- artifacts
- conversations
- checkpoints
- approvals

## In-Memory First

- Start with an in-memory ledger while the event shape is still changing.
- Keep append and query behaviour simple.
- Avoid database persistence until the shape has stabilised.

## When Persistence Should Be Added

Add persistence only when:

- the event shape has held steady across multiple sprints,
- the read models are stable,
- and the project needs durability beyond process lifetime.

## How Read Models Consume Events

Read models should turn the ledger into calm, focused views:

- Resume cards
- Approval cards
- Changes timelines
- Capability surfaces
- Health and warning summaries

## Testing Approach

Test the ledger by checking:

- append behaviour
- filter behaviour
- newest-first or documented ordering
- limit handling
- related ID lookups
- `get(id)` lookup

## Important Warning

An event ledger is not an execution queue. It should never be treated as a
signal that work has already run or that a write is allowed.
