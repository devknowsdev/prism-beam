# Workbench Data Spine Pattern

A workbench data spine is a calm read model that lets a UI show project state
without becoming the owner of all runtime behavior.

## Use when

- A visual workbench needs to show status, previews, approvals, and recent
  events.
- The UI should reduce cognitive load without creating surprise writes.
- Spectra or a future app needs a read-first dashboard.

## Pattern

- collect stable read models from explicit sources
- show current state and pending approvals
- keep write/apply actions behind explicit controls
- avoid hidden background mutation
- prefer small projections over one giant dashboard

## Do not use when

- The UI would become an unbounded control panel.
- The workbench would write without an approval boundary.

## Safety note

Workbench surfaces should be read-only before write-capable. Apply buttons and
publish actions must be explicit and auditable.
