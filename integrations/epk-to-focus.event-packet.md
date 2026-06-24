# EPK -> Focus Event Packet Contract

## Status

Draft reference contract. App-side manual implementation now exists in EPK and
Focus, but Beam remains the contract/reference owner only.

## Source App

EPK owns structured public/promotional truth.

## Target App

prism-focus owns daily planning, tasks, routines, and personal execution state.

## Contract Owner

prism-beam owns this reference contract. App implementation stays in the app
repos.

## Purpose

Move event and promo planning context from EPK into Focus as a review-first
packet. The packet proposes tasks and schedule windows; it does not mutate Focus
state by itself.

## Current App-Side Implementation Evidence

- EPK PR #11 added publisher-side packet export in
  `EPK/public/publisher/publisher-focus-packet.js` and documented it in
  `EPK/docs/FOCUS_PACKET_EXPORT.md`.
- Focus PR #13 added the review/import screen in `src/actions_import.js` and
  `src/render_import.js`.
- Beam PR #12 added `fixtures/epk-to-focus.sample-event-packet.json` and
  `docs/integrations/EPK_FOCUS_LOOP_SMOKE.md`.

Current loop:

```text
EPK publisher event details -> Focus packet JSON -> prism-focus review screen -> selected Focus tasks
```

This is still a manual review-first loop. It is not background sync and it is
not a Spectra automation target until the manual loop is stable and explicitly
contracted.

## What Crosses The Boundary

- event title
- act/project
- status
- event date
- timezone
- venue
- city
- doors
- set time
- load-in
- soundcheck
- CTA/ticket link
- poster deadline
- press deadline
- social announcement deadline
- travel/admin windows
- post-gig follow-up
- source link back to EPK/publisher
- proposed tasks
- stable source record id for duplicate detection

## What Must Not Cross The Boundary

- Direct writes to Focus `localStorage`, task arrays, planner state, or backup
  data.
- Automatic calendar, email, social posting, or publishing actions.
- Private publisher state that was not intentionally exported into the packet.
- Hidden task creation or scheduling.
- Spectra automation of EPK -> Focus task creation before the manual loop is
  stable, comfortable, and explicitly approved by a later contract.

## Data Shape / Schema Reference

Use `schemas/epk-to-focus.event-packet.schema.json`.

## Review And Approval Rule

Focus must show a review/import screen before creating tasks. User approval is
required before creating or scheduling tasks. Scheduling fields are proposals,
not silent commits.

Unknown fields should be preserved or ignored safely. They must not crash import.

## Safe Read Path

Read a user-provided packet or an explicit EPK export. Validate the packet
against the schema before presenting the review screen.

## Safe Write Path

Only Focus may mutate Focus state, and only after user approval in the review
screen. Imported tasks should retain source metadata for duplicate detection and
rollback notes.

EPK may generate, copy, or download packet JSON. It must not send the packet to
Focus or create Focus tasks itself.

## Failure/Rollback Notes

If validation fails, show a non-mutating error and leave Focus state unchanged.
If duplicate source records are detected, skip duplicates or offer explicit
update/skip/create-copy choices.

If a task import is approved, record enough source metadata to identify and undo
the imported batch manually or through a future rollback tool.

## Manual Smoke Fixture

Use:

```text
fixtures/epk-to-focus.sample-event-packet.json
```

Smoke checklist:

```text
docs/integrations/EPK_FOCUS_LOOP_SMOKE.md
```

## Sample Packet

```json
{
  "schemaVersion": "1.0.0",
  "packetType": "epk-to-focus.event-packet",
  "source": {
    "system": "EPK",
    "recordId": "epk-event-2026-07-18-cape-town",
    "recordUrl": "https://example.com/publisher/",
    "exportedAt": "2026-06-24T18:00:00Z"
  },
  "review": {
    "status": "pending",
    "required": true,
    "notes": "Review before creating Focus tasks."
  },
  "event": {
    "title": "Dave Knowles live set",
    "act": "Dave Knowles",
    "project": "EPK promo",
    "status": "confirmed",
    "date": "2026-07-18",
    "timezone": "Africa/Johannesburg",
    "venue": "Example Room",
    "city": "Cape Town",
    "doors": "19:00",
    "setTime": "21:00",
    "loadIn": "17:00",
    "soundcheck": "18:00",
    "ctaUrl": "https://tickets.example.com/event",
    "sourceLink": "https://example.com/published/20260718-epk/"
  },
  "deadlines": {
    "poster": "2026-07-01",
    "press": "2026-07-04",
    "socialAnnouncement": "2026-07-08",
    "postGigFollowUp": "2026-07-19"
  },
  "travelAdminWindows": [
    {
      "label": "Confirm transport",
      "date": "2026-07-16",
      "start": "10:00",
      "durationMins": 45
    }
  ],
  "tasks": [
    {
      "kind": "poster",
      "title": "Export gig poster",
      "scope": "project",
      "dueDate": "2026-07-01",
      "estimatedMinutes": 45,
      "category": "music",
      "sourceId": "epk-event-2026-07-18-cape-town:poster"
    }
  ]
}
```

## Validation

- Parse `schemas/registry.json`.
- Parse `schemas/epk-to-focus.event-packet.schema.json`.
- Use `fixtures/epk-to-focus.sample-event-packet.json` for manual loop smoke.
- Future app implementation should validate packet JSON before showing import
  review.

## Future prompts can omit

Future prompts can omit the rule that EPK packets propose Focus tasks but never
mutate Focus directly, the duplicate-detection requirement, the first packet
field list, the location of the first EPK exporter, the location of the Focus
review/import screen, and the location of the Beam smoke fixture/checklist.

## Update Rules

Update this contract when EPK changes event packet fields, Focus changes the
import UI or duplicate handling, Spectra adds any automation around this loop,
or the packet schema changes.
