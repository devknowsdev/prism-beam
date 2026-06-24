# AI Session Contracts

Purpose: standardize what an AI session may change so future work stays inside
the correct repo boundary.

## Global rule

No sprint may modify more than one runtime repo unless it is explicitly labeled
as cross-repo coordination and approved by the human before edits begin.

## Session types

### Documentation/reference sprint

- Default repo: `prism-beam`.
- Allowed: guides, context packs, contracts, schemas, pattern notes, logs,
  prompts, templates, checklists.
- Forbidden: app runtime code, dependencies, hidden external actions.
- Validation: `git diff --check`, Beam smoke script, JSON validation where
  relevant.

### Runtime implementation sprint

- Default repo: exactly one app repo.
- Allowed: app-local code, tests, docs, scripts within the selected app.
- Forbidden: second app repo changes unless explicitly approved.
- Validation: app-local tests or safe smoke checks.

### EPK public/publisher sprint

- Default repo: `EPK`.
- Allowed: public site, publisher, data, snapshots, browser-only tooling.
- Forbidden: fake auth, hidden email sending, unrelated planner/orchestration
  work.
- Approval: required for publishing or any external write.

### Focus planning sprint

- Default repo: `prism-focus`.
- Allowed: planning/task/routine UI and state owned by Focus.
- Forbidden: hidden cross-app mutation, automatic calendar/email/social posting,
  unreviewed imports.
- Approval: required before mutating imported cross-app data.

### Spectra orchestration sprint

- Default repo: `prism-spectra`.
- Allowed: adapters, approval queue, sidecars, CLI/workbench safety surfaces.
- Forbidden: hidden scanning, broad autonomous writes, external writes without
  approval.
- Approval: required by action risk class.

### Cross-repo coordination sprint

- Default repo: `prism-beam` plus explicitly named repos.
- Allowed: boundary docs, contracts, prompt coordination, handovers.
- Forbidden: runtime changes unless explicitly requested.

## Final report requirements

Every session should report:

- branch and PR
- files created/modified
- validation run
- public/runtime behaviour changed yes/no
- dependencies added yes/no
- known risks
- what future prompts can omit
