# Safe Capability Integration Checklist

Use before adding a new tool, adapter, workflow, or AI-access point.

## Capability definition

- [ ] Owner repo is clear.
- [ ] Allowed reads are listed.
- [ ] Allowed writes are listed.
- [ ] Forbidden actions are listed.
- [ ] Risk class is assigned.
- [ ] Approval rule is documented.

## Safety checks

- [ ] No hidden writes.
- [ ] No fake auth.
- [ ] No automatic email/social/calendar actions unless explicitly approved.
- [ ] No folder scanning or file watching unless explicitly approved.
- [ ] No destructive actions without rollback plan.
- [ ] No secrets committed.

## Validation

- [ ] Safe read path tested.
- [ ] Approval path tested where applicable.
- [ ] Failure path documented.
- [ ] Beam contract/pattern updated if the capability is reusable.
