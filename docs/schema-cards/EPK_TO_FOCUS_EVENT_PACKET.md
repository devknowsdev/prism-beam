# Schema Card — EPK to Focus Event Packet

Date: 2026-06-24

## What this is

A review-first packet shape for proposing Focus tasks from EPK event or promo truth.

It is not an automatic import pipeline.

## Files

- Contract: `integrations/epk-to-focus.event-packet.md`
- Machine schema: `schemas/epk-to-focus.event-packet.schema.json`
- Registry entry: `schemas/registry.json`

## Owner and consumers

| Field | Value |
| --- | --- |
| Owner | `prism-beam` |
| Source app | `EPK` |
| Target app | `prism-focus` |
| Status | Draft reference contract/schema |
| Risk class | Local write after review |

## Required top-level fields

- `schemaVersion`
- `packetType`
- `source`
- `review`
- `event`
- `tasks`

## Key safety rule

Focus must show a review screen before creating or scheduling tasks from this packet.

The packet can propose tasks. It must not silently mutate Focus state.

## What the packet can carry

- source EPK record metadata
- review status
- event title/date/timezone/venue/city
- promo/admin deadlines
- travel/admin windows
- proposed tasks

## Minimal example

```json
{
  "schemaVersion": "1.0.0",
  "packetType": "epk-to-focus.event-packet",
  "source": {
    "system": "EPK",
    "recordId": "gig-2026-07-12"
  },
  "review": {
    "status": "pending",
    "required": true
  },
  "event": {
    "title": "DU!F live",
    "date": "2026-07-12",
    "timezone": "Africa/Johannesburg",
    "venue": "Venue name",
    "city": "Makhanda"
  },
  "tasks": [
    {
      "kind": "poster",
      "title": "Create gig poster",
      "scope": "project",
      "dueDate": "2026-07-05",
      "estimatedMinutes": 45,
      "category": "Music admin"
    }
  ]
}
```

## Human review checklist

Before Focus accepts a packet:

1. Confirm the event is real and still relevant.
2. Check date, timezone, venue, and city.
3. Review every proposed task title.
4. Check due dates and estimates.
5. Let Dave approve, edit, or skip each item.
6. Only then write Focus task/planner state.

## Future implementation note

The next app-side step is a Focus review/import screen that validates this packet and lets Dave choose which tasks to create.
