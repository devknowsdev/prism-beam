# Schema Card — Suite Approval Request

Date: 2026-06-24

## What this is

A portable request shape for actions that need human review before proceeding.

It is a reference schema. It does not execute anything by itself.

## Files

- Contract: `integrations/approval-posture.md`
- Machine schema: `schemas/approval-request.schema.json`
- Registry entry: `schemas/registry.json`

## Owner and consumers

| Field | Value |
| --- | --- |
| Owner | `prism-beam` |
| Consumers | `EPK`, `prism-focus`, `prism-spectra`, `prism-beam` |
| Status | Draft reference contract/schema |
| Risk class | Varies by requested action |

## Required top-level fields

- `schemaVersion`
- `requestId`
- `sourceSystem`
- `targetSystem`
- `riskClass`
- `action`
- `summary`
- `reason`
- `expectedEffects`
- `rollbackPlan`
- `createdAt`
- `status`

## Risk classes

- `read-only`
- `local-draft`
- `local-write`
- `external-draft`
- `external-write`
- `destructive`

## Minimal example

```json
{
  "schemaVersion": "1.0.0",
  "requestId": "approval-20260624-001",
  "sourceSystem": "prism-spectra",
  "targetSystem": "EPK",
  "riskClass": "external-write",
  "action": "publish-live-epk-json",
  "summary": "Publish edited EPK JSON to the live public data path.",
  "reason": "Dave approved the updated press-kit copy and gallery order.",
  "expectedEffects": [
    "Updates EPK/public/data/epk.json",
    "Triggers Cloudflare redeploy"
  ],
  "rollbackPlan": "Revert the Git commit or republish the previous JSON backup.",
  "createdAt": "2026-06-24T18:00:00.000Z",
  "status": "pending"
}
```

## Human review checklist

Before approval:

1. Confirm the source and target systems.
2. Check the risk class.
3. Confirm the expected effects are understandable.
4. Confirm rollback is realistic.
5. Confirm no private data, token, or secret is included in inputs.
6. Approve only the specific action described.

## Safety rule

The approval request records intent and review state. It does not grant blanket permission for future actions.

Every write, publish, destructive, or remote action still needs explicit scope and review.
