# EPK to Focus Loop Smoke Test

Date: 2026-06-24

## Purpose

Verify the first manual end-to-end loop:

```text
EPK publisher event details → Focus packet JSON → prism-focus review screen → selected Focus tasks
```

This is a manual review-first loop. It is not sync.

## Implemented pieces

EPK exporter:

- Repo: `devknowsdev/EPK`
- PR: `#11`
- Merge commit: `35329b3f365ee26724845dae490285bfc9486d40`
- Main file: `EPK/public/publisher/publisher-focus-packet.js`

Focus importer:

- Repo: `devknowsdev/prism-focus`
- PR: `#13`
- Merge commit: `318aaf5914a708369d1eb3bda901952ab5d1554e`
- Main files: `src/actions_import.js`, `src/render_import.js`

## Canonical smoke fixture

Use:

```text
fixtures/epk-to-focus.sample-event-packet.json
```

This packet mirrors the fields emitted by the EPK publisher and accepted by the Focus review screen.

## Compatibility check

The EPK exporter emits the fields Focus validates:

- `schemaVersion`
- `packetType`
- `source.system`
- `review.status`
- `event.title`
- `event.date`
- `event.timezone`
- `tasks[].title`

The EPK exporter emits task fields Focus uses:

- `title`
- `scope`
- `dueDate`
- `estimatedMinutes`
- `category`
- `notes`
- `sourceId`

## Manual smoke steps

### Generate from EPK

Open the publisher and go to:

```text
Promo brief → Focus task packet
```

Fill in:

- Event name: `DU!F live at Test Venue`
- Date: `2026-07-12`
- Venue: `Test Venue`
- City: `Makhanda`
- CTA: `https://example.com/tickets`

Click:

```text
Generate Focus packet
```

Expected:

- JSON appears in the packet textarea.
- `packetType` is `epk-to-focus.event-packet`.
- `source.system` is `EPK`.
- `event.timezone` is `Africa/Johannesburg`.
- 5 proposed tasks are present.

### Review in Focus

Open `prism-focus` and click the inbox/import button.

Paste the packet JSON.

Click:

```text
Review packet
```

Expected:

- The event context is visible.
- Proposed tasks appear with checkboxes.
- All tasks are selected by default.
- Select all / none controls work.
- No task exists before the final import click.

### Import selected tasks

Select 2 or 3 tasks.

Click:

```text
Import selected
```

Expected:

- Only selected tasks are created.
- Category is `Music admin` or a matching local category.
- Notes mention the EPK event context.
- A success message reports the count.

### Duplicate check

Paste the same packet again and import the same selected tasks.

Expected:

- Already imported source IDs are skipped.
- No duplicate task rows are created.

## Result log

```text
Date:
Browser:
EPK URL:
Focus URL:
Packet generated:
Packet reviewed:
Selected task count:
Imported task count:
Duplicate import skipped:
Issues found:
Fix PRs opened:
```

## Next step

If this smoke pass is clean, add lightweight importer tests in `prism-focus`.

If it fails, patch only the failing repo before adding new automation.
