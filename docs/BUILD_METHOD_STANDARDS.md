# Build Method Standards

These rules keep Prism work small, reviewable, and useful for future AI sessions.

## Sprint shape

- One repo per sprint unless the user explicitly approves cross-repo coordination.
- One PR per sprint.
- Start from current `main`.
- Read Beam first, then inspect the target repo directly.
- Let source files override stale docs.
- Prefer small, reversible changes.

## Scope discipline

A sprint should clearly say:

- repo in scope
- files likely to change
- behaviour that must not change
- validation commands
- final report format
- what future prompts can omit after the work lands

## Safe implementation rules

- Do not add dependencies unless explicitly justified.
- Do not add fake auth.
- Do not add hidden writes.
- Do not publish, send, delete, or overwrite without explicit approval.
- Do not scan folders or add watchers unless explicitly approved.
- Preserve local-first and review-first behaviour.

## Beam update rule

When a product change creates a stable reusable lesson, update Beam with a guide,
context pack, pattern, contract, schema, prompt, or log entry. Do not duplicate
full app implementation in Beam.
