# Change Boundary Checklist

Use before editing any Prism repo.

## Pre-edit checks

- [ ] Which repo owns this behaviour?
- [ ] Is this a docs/reference change or runtime behaviour change?
- [ ] Is only one repo in scope?
- [ ] If more than one repo is in scope, did the user explicitly approve it?
- [ ] Have Beam context packs and app guides been read?
- [ ] Have current target repo files been inspected?
- [ ] Are stale docs being overridden by source evidence where needed?

## Safety checks

- [ ] Does this add or change an external write?
- [ ] Does this publish, send email, post, push, delete, or overwrite?
- [ ] Does this touch public pages or hosted admin/publisher routes?
- [ ] Does this mutate localStorage, task state, or planner state?
- [ ] Does this scan folders, watch files, or ingest user files?
- [ ] Is rollback possible and documented?

## Final report checks

- [ ] Files changed.
- [ ] Runtime behaviour changed yes/no.
- [ ] Public behaviour changed yes/no.
- [ ] Dependencies added yes/no.
- [ ] Validation commands and results.
- [ ] Known caveats.
- [ ] What future prompts can omit.
