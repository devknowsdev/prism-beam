# Schema UX Plan

Date: 2026-06-24
Sprint: Suite-Setup-001

Beam already has machine-readable schemas and integration contracts. The next step is to make them understandable enough that Dave and future AI sessions can use them without mentally parsing raw JSON.

## Goal

Turn Beam schemas into human-usable setup and review material:

- plain-English schema cards
- copyable examples
- validation commands
- ownership and approval summaries
- app-specific setup implications

This should improve usability without making Beam a runtime dependency or letting schemas trigger hidden app mutations.

## Current schema evidence

`schemas/registry.json` currently lists:

| Schema | Status | Schema file | Contract file | Consumers | Notes |
| --- | --- | --- | --- | --- | --- |
| EPK to Focus Event Packet | draft | `schemas/epk-to-focus.event-packet.schema.json` | `integrations/epk-to-focus.event-packet.md` | `EPK`, `prism-focus` | Review-first packet for proposing Focus tasks from EPK event/promo truth. |
| Suite Approval Request | draft | `schemas/approval-request.schema.json` | `integrations/approval-posture.md` | all Prism apps | Portable request shape for review-first local/external/destructive actions. |

## Schema card format

Each schema should have a markdown card under a future folder such as `docs/schema-cards/`.

Recommended sections:

1. **Purpose**
   - What the packet is for in one paragraph.
2. **Who owns what**
   - Source app.
   - Reviewing app.
   - Executing app, if any.
   - Beam's role as contract/schema reference only.
3. **Risk class**
   - read-only
   - local-write after review
   - external-draft
   - external-write
   - destructive
4. **Plain-English field guide**
   - Required fields.
   - Optional fields.
   - Human meaning of each field.
5. **Copyable safe example**
   - Minimal sample JSON.
   - Richer sample JSON.
6. **Validation command**
   - Exact command once a validator exists.
   - Expected pass/fail output.
7. **What happens after validation**
   - Validation does not mean automatic import.
   - Receiving app must show review UI for mutation.
   - Spectra must classify action risk before execution.
8. **What must not happen**
   - No hidden writes.
   - No automatic imports.
   - No destructive action without approval.
9. **Next app-side work**
   - Which app needs to implement the review/import/setup UI.

## Plain-English schema summaries

### EPK to Focus Event Packet

Plain meaning: EPK can propose event or promo-related work for Focus. Focus should treat the packet as a suggestion to review, not as permission to mutate task or planner state automatically.

Ownership:

- EPK owns the source public/promotional truth.
- Focus owns daily planning, tasks, scheduling, and personal execution state.
- Beam owns the reference contract and schema.
- Spectra may later help route or validate packets, but should not bypass Focus review.

Recommended UX:

- Show the event/promo packet as a review card in Focus.
- Let Dave accept, edit, schedule, or reject proposed tasks.
- Show which EPK fields produced each proposed Focus task.
- Save only after Dave confirms.

### Suite Approval Request

Plain meaning: before an action writes locally, writes externally, or does something destructive, the app should present a clear approval request with risk class, summary, target, and rollback/provenance notes.

Ownership:

- Beam owns the reference schema and approval posture notes.
- Spectra should own orchestration and approval queue implementation.
- Each app owns its own UI for local user confirmation when it performs the action.

Recommended UX:

- Show action summary in plain language.
- Show risk class and why it is classified that way.
- Show exact target path/service where possible.
- Show preview/diff before writes.
- Require explicit confirmation for external-write and destructive classes.

## Copyable sample packets

These examples are illustrative. They should be reconciled with the exact JSON schema before app-side implementation.

### EPK to Focus packet example

```json
{
  "source": "EPK",
  "type": "event-promo-task-proposal",
  "event": {
    "name": "Venue show promo",
    "date": "2026-07-12",
    "venue": "Example Venue",
    "city": "Makhanda"
  },
  "proposedTasks": [
    {
      "title": "Prepare poster copy for Venue show promo",
      "reason": "Generated from reviewed EPK event/promo details",
      "suggestedDate": "2026-07-05"
    }
  ]
}
```

### Approval request example

```json
{
  "actionId": "publish-epk-snapshot-20260624",
  "summary": "Publish an immutable EPK snapshot",
  "riskClass": "external-write",
  "sourceApp": "EPK",
  "target": {
    "repo": "devknowsdev/EPK",
    "path": "EPK/public/published/20260624-epk-001/epk.json"
  },
  "requiresApproval": true,
  "rollbackNote": "Snapshot publish creates a new versioned file and should not overwrite existing snapshots."
}
```

## Validation commands

Beam should eventually provide a safe validation-only command or documented one-liner. Until that exists, schema cards should include a placeholder that is explicit about not mutating apps.

Future option:

```bash
node tools/validate-schema.mjs schemas/epk-to-focus.event-packet.schema.json examples/epk-to-focus.sample.json
```

Rules for validators:

- Read schema and sample only.
- Print pass/fail and errors.
- Do not write app state.
- Do not publish, import, send, scan, or call external services.
- Do not require secrets.

## App ownership display

Every schema card should include this ownership block:

| Role | Meaning |
| --- | --- |
| Source app | The app that produces or proposes the data. |
| Reviewing app | The app that shows it to Dave before mutation. |
| Executing app | The app that performs a confirmed action, if any. |
| Beam | Stores the reference schema/contract only. |

## Future Spectra schema/setup workbench possibility

Spectra could eventually provide a calm local schema/setup workbench that:

- lists Beam schemas and contracts as reference material
- shows plain-English cards
- validates sample packets
- classifies action risk
- shows approval posture
- previews effects before execution

Strict boundaries:

- Beam remains a reference layer, not an imported runtime package.
- Spectra may read Beam docs/schemas as files or copied context, but app actions still require review and approval.
- Validation does not imply mutation.
- A workbench must not run broad scans, watchers, external writes, or destructive actions by default.

## What should not happen

- No hidden writes.
- No automatic imports.
- No app mutation without review.
- No schema-driven destructive action without approval.
- No schema-driven external write without explicit approval.
- No fake auth around schema-driven tooling.
- No Beam runtime dependency.
- No monorepo migration.

## Recommended next Beam UX work

`Beam-UX-001 — Schema cards / setup landing page`

Suggested files:

- `docs/setup/README.md`
- `docs/schema-cards/epk-to-focus.event-packet.md`
- `docs/schema-cards/approval-request.md`
- `examples/epk-to-focus.event-packet.sample.json`
- `examples/approval-request.sample.json`

Suggested validation:

- `git diff --check`
- `bash scripts/run-workspace-smoke.sh`
- JSON syntax validation for examples

## What future prompts can omit

Future prompts can refer to this plan instead of restating how Beam schemas should become user-facing schema cards, why validation must be non-mutating, or why app-side imports require review.
