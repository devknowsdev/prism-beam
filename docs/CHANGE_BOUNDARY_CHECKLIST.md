# Change Boundary Checklist

Purpose: a pre-edit checklist for future AI agents so they do not cross repo
boundaries by accident.

## Before Editing

- [ ] Which repo owns this change?
- [ ] Is this runtime, documentation, script, data, or public content?
- [ ] Does this touch canonical state?
- [ ] Does this create or alter external actions?
- [ ] Does this add dependencies?
- [ ] Does this change public behavior?
- [ ] Does this require human approval?
- [ ] Could this belong in `prism-spectra` instead of `prism-focus`?
- [ ] Could this belong in future `prism-music` instead of `EPK`?
- [ ] Is this current implementation or future direction?

## Decision Outcomes

- `proceed` — the change is in the right repo, does not cross boundaries, and
  the required validation is available.
- `split into smaller sprint` — the request is too broad for one safe edit.
- `move to another repo` — the work belongs in a different repo entirely.
- `document only` — the change is architectural or planning-only for now.
- `block pending human decision` — ownership, side effects, or public behavior
  are unclear.

## Stop Conditions

- [ ] The change would touch more than one runtime repo.
- [ ] The change would alter public behavior without explicit approval.
- [ ] The change would add dependencies.
- [ ] The change would create or modify external side effects.
- [ ] The change would require a schema or runtime move not requested in the
      sprint.
- [ ] The change would mix current implementation with future `prism-music`
      direction.

## Checklist Rule

If any stop condition is checked, stop and resolve the decision before editing.

