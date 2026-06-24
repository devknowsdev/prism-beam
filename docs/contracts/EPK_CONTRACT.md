# EPK Contract

Purpose: define the implementation boundary for the public EPK surface.

## Repo Purpose

`EPK` owns the public-facing artist press-kit surface, the admin editor, and the
published snapshots that expose the press-kit content.

## Owns

- Public pages
- Gallery and admin surfaces
- Published snapshot output
- Structured press-kit JSON
- Browser bridge metadata for the public surface

## Does Not Own

- The whole music management layer
- Prism Core orchestration
- Dashboard planning state
- Music CRM as a business system

## Allowed Implementation Work

- Public-surface HTML, CSS, and JS
- Admin editing flows
- Content schema changes that stay within the public press-kit surface
- Published snapshot handling
- Bridge metadata and documentation for the public surface

## Forbidden Implementation Work

- Music CRM ownership
- Executive orchestration logic
- Dashboard state ownership
- General music-business workflow ownership
- Hidden backend logic that changes public behavior unexpectedly

## Canonical State Rules

- `public/data/epk.json` is the canonical public surface content.
- Published snapshots are derived from the canonical public data.
- Any future `prism-music` canonical state should be separate from EPK until
  absorption is explicitly implemented.

## External Action Rules

- Public publishing requires human approval.
- Any action that writes outside the local/public surface path must be gated and
  documented.

## Testing and Validation Expectations

- Safe static-site checks
- File-tree inspection
- Link sanity checks for docs
- Any repo-local validation that does not mutate external systems

## Documentation Expectations

- Keep the README ecosystem role section current.
- Document whether a change affects current EPK surface behavior or future
  `prism-music` direction.

## Correct Changes

- Adjust the public page layout
- Improve admin content editing
- Update press-kit data
- Add public-surface metadata

## Boundary Violations

- Turning EPK into the music CRM
- Moving Prism Core orchestration here
- Implementing dashboard planning state
- Hiding external publishing logic outside the approval path

