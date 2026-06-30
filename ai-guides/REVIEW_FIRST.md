# Review-First Rules

These suite-wide rules apply before app-specific instructions.

## Evidence Before Edits

- Read current repo files before changing them.
- Prefer source files and live config over stale docs.
- Search for drift terms when the sprint is about naming, boundaries, auth,
  publishing, or integration contracts.
- Report what was validated and what remains unvalidated.

## Existing-Primitive Rule

Before introducing a new schema, execution sequence, or prompt-construction
special-case for any concept that already has a general-purpose handler in
the target repo, search for and extend the existing one first
(`src/approvals`, `src/events`, `src/capabilities`, `src/engine`,
`src/routing`, `src/executors` in `prism-spectra`). Use or extend what
exists. Only build new if a search genuinely turns up nothing, and say so
explicitly in the session output.

This applies to mock-vs-real parity too — if mock mode needed bespoke logic
to produce a correct shape, check whether the real path needs the
equivalent logic, not just a different one.

Added 2026-06-30 after three independent instances of the same drift in one
session: a cockpit approval system reinvented `ApprovalQueue`/`PrismEventLedger`,
the Focus AI-request path reinvented part of `runNode`'s cascade/cache
sequence, and the real Ollama prompt path silently dropped an instruction
that mock mode already handled correctly. See `prism-spectra/docs/CLAUDE_CONTINUATION_HANDOVER_20260630.md`
and `GPT_BUILD_PLAN_COCKPIT_ENGINE_FOCUS_JSON_20260630.md`.

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
