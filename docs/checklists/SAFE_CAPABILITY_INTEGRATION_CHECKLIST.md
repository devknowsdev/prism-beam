# Safe Capability Integration Checklist

Use this checklist before turning a manifest into a real tool integration.

## Manifest

- [ ] Manifest exists.
- [ ] Load mode is declared.
- [ ] CPU profile is declared.
- [ ] Memory profile is declared.
- [ ] Approval class is declared.
- [ ] Checkpoint policy is declared.
- [ ] Local / remote boundary is declared.
- [ ] Provenance events are declared.

## Preview And Risk

- [ ] A preview path exists, or the manifest explains why preview is not
      possible.
- [ ] Risk notes explain the non-obvious parts.
- [ ] No hidden execution path exists.

## Execution Safety

- [ ] No unbounded workers are introduced.
- [ ] No external binary launches happen without approval.
- [ ] No remote write path is added without remote approval semantics.
- [ ] No destructive path is added without an explicit checkpoint model.

## Validation

- [ ] Tests are added or updated.
- [ ] Seed manifests validate.
- [ ] Invalid manifests are rejected without mutating prior state.
- [ ] Docs are updated so the next agent can see the boundary clearly.
