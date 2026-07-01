# Review-First Rules

These suite-wide rules apply before app-specific instructions.

## Evidence Before Edits

- Read current repo files before changing them.
- Prefer source files and live config over stale docs.
- Search for drift terms when the sprint is about naming, boundaries, auth,
  publishing, or integration contracts.
- Report what was validated and what remains unvalidated.

## Reuse Before Reinvention

- Before introducing a schema, execution sequence, audit trail, risk model,
  cache, retry path, or prompt-construction special case, search the target
  repo for the existing general-purpose primitive first.
- In `prism-spectra`, check `src/approvals`, `src/events`, `src/capabilities`,
  `src/engine`, `src/routing`, and `src/executors` before building a parallel
  concept.
- Extend the governed path when it fits. Build a new path only when the search
  genuinely turns up no suitable primitive, and record that finding.
- Check mock/real parity explicitly: bespoke mock behavior that produces a
  correct contract is evidence that the real path may need equivalent wiring.

## Safety Rules

- No fake auth. Frontend-only password gates, hidden flags, or obscured routes
  do not make hosted tools private.
- No hidden writes. Drafting, exporting, snapshotting, publishing, and emailing
  are separate actions.
- No destructive operations without explicit approval.
- No automatic email sending without a real approved backend or form service.
- No dependency sprawl. Add dependencies only when the owning repo genuinely
  needs them and the user-approved sprint scope supports it.
- No broad folder scanning or file watching unless explicitly approved.
- Preserve local-first and review-first behavior by default.

## Write Boundaries

- Drafts are local working material.
- Exports are user-requested files or artifacts.
- Snapshots are durable records of a reviewed state.
- External writes include GitHub publication, hosted data changes, email
  sending, deploys, form submissions, and third-party API mutations.

Keep these paths visibly separate in UI, code, docs, and final reports.

## Final Reports

Every implementation report should explain validation, any skipped checks, known
risks, and rollback notes when a change affects external writes, auth, data
shape, or repo boundaries.
