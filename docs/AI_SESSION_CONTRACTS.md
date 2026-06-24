# AI Session Contracts

Purpose: standardize what kinds of Codex sessions are allowed to change, so
future work stays inside the correct repo boundary and current state is not
confused with future direction.

## Global Rule

No sprint may modify more than one runtime repo unless it is explicitly labeled
`Cross-Repo Coordination` and approved by the human before edits begin.

Runtime repo means any repo that owns application behavior, public surface
behavior, or runtime state.

## 1. Documentation Sprint

- Allowed repos: `prism-beam` only.
- Forbidden repos: `prism-spectra`, `prism-focus`, `EPK`, future `prism-music`
  runtime work.
- Allowed changes: docs, README pointers, templates, audits, checklists,
  contracts, and coordination notes.
- Forbidden changes: runtime code, dependency files, schemas, behavior,
  deployment config, or external actions.
- Required reading: current prism-beam ecosystem docs, repo alignment audit,
  `docs/BUILD_METHOD_STANDARDS.md`, and the target repo README if a pointer is
  being updated.
- Required validation: `git status`, `git diff --stat`, and link sanity checks
  if available.
- Required final report: files created, files modified, repos touched, runtime
  code changed yes/no, dependencies added yes/no, checks run, and next sprint.
- Human approval requirements: approval required only if the session would also
  touch a runtime repo.

## 2. Repo Audit Sprint

- Allowed repos: `prism-beam` for reports; read-only inspection of the other
  repos.
- Forbidden repos: any runtime repo edits.
- Allowed changes: audit docs, naming docs, and coordination notes in
  `prism-beam`.
- Forbidden changes: code, manifests, schemas, deployment, and behavior.
- Required reading: current repo READMEs, alignment audits, boundary docs, and
  the specific repo files under audit.
- Required validation: status, diff stat, and evidence references for any
  claim.
- Required final report: current identity, actual structure, actual runtime
  responsibilities, claimed responsibilities, drift, smallest correction, and
  correction type.
- Human approval requirements: approval required before any file edits outside
  `prism-beam`.

## 3. Runtime Implementation Sprint

- Allowed repos: exactly one runtime repo plus `prism-beam` docs if needed for
  coordination notes.
- Forbidden repos: all other runtime repos.
- Allowed changes: runtime code, tests, repo-local docs, and repo-local scripts
  within the selected runtime repo.
- Forbidden changes: dependency additions unless explicitly requested,
  cross-repo code movement, schema work outside the selected repo, and public
  behavior changes not called for by the sprint.
- Required reading: the target repo README, its portal or architecture docs,
  the relevant contract doc, and the boundary checklist.
- Required validation: repo-local tests or safe smoke checks relevant to the
  change.
- Required final report: summary of the implementation, files changed, tests
  run, residual risks, and whether any public behavior changed.
- Human approval requirements: approval required before editing any second
  runtime repo.

## 4. Adapter Implementation Sprint

- Allowed repos: `prism-spectra` only, unless the prompt explicitly names a
  different runtime owner.
- Forbidden repos: `prism-focus`, `EPK`, future `prism-music`, and unrelated
  runtime repos.
- Allowed changes: adapter contracts, adapter implementations, mocks, tests,
  and repo-local docs.
- Forbidden changes: UI state ownership, direct UI publishing, and runtime
  logic outside the adapter boundary.
- Required reading: `prism-spectra` README, portal docs, boundary checklist,
  and the specific adapter contract.
- Required validation: unit tests or safe daemon checks that stay local.
- Required final report: adapter surface, allowed actions, forbidden actions,
  validation results, and any unresolved boundary questions.
- Human approval requirements: approval required if the adapter would affect
  external side effects or another repo boundary.

## 5. UI/Widget Sprint

- Allowed repos: `prism-focus` only.
- Forbidden repos: `prism-spectra`, `EPK`, and future `prism-music` runtime
  changes.
- Allowed changes: widgets, render files, action files, state files, tests, and
  repo-local docs.
- Forbidden changes: provider routing, adapter policy, publishing logic, and
  external side effects.
- Required reading: `prism-focus` README, orientation docs, architecture docs,
  and the relevant widget or state files.
- Required validation: `node src/test_workflows.js` or the repo-local safe
  equivalent.
- Required final report: widget or UI area changed, behavior summary, files
  changed, and validation results.
- Human approval requirements: approval required before any change that would
  publish externally or change a second runtime repo.

## 6. EPK/Public Surface Sprint

- Allowed repos: `EPK` only, plus `prism-beam` docs if a coordination note is
  needed.
- Forbidden repos: `prism-spectra`, `prism-focus`, and any music-management
  runtime repo that does not own the EPK surface.
- Allowed changes: public pages, admin UI, published snapshots, structured data,
  and public-surface docs.
- Forbidden changes: music CRM ownership, Prism Core orchestration, unrelated
  dashboard logic, or hidden backend behavior.
- Required reading: `EPK/README.md`, `public/index.html`, `public/data/epk.json`,
  and the `prism-beam` boundary docs.
- Required validation: local static-site sanity checks or safe file inspection.
- Required final report: public surface changed, data touched, bridge touched,
  and whether published behavior changed.
- Human approval requirements: approval required before anything that writes
  externally or changes public behavior.

## 7. Music Management Planning Sprint

- Allowed repos: `prism-beam` only unless the human explicitly authorizes a
  second repo for evidence gathering.
- Forbidden repos: runtime implementation edits in `prism-spectra`, `prism-focus`,
  and `EPK`.
- Allowed changes: planning docs, contracts, vocabulary, and future-layer notes.
- Forbidden changes: runtime features, schemas, and repo moves.
- Required reading: ecosystem overview, repo boundaries, naming audit, and any
  future `prism-music` planning notes.
- Required validation: link sanity and doc coherence review.
- Required final report: planning decision, open questions, and the smallest
  next step.
- Human approval requirements: approval required before any repo other than
  `prism-beam` is edited.

## 8. Cross-Repo Coordination Sprint

- Allowed repos: `prism-beam` plus the explicitly named runtime repos in the
  prompt.
- Forbidden repos: any repo not named in the prompt.
- Allowed changes: coordination docs, pointer READMEs, prompt templates,
  boundary contracts, and other non-runtime cross-repo glue.
- Forbidden changes: runtime feature implementation unless the sprint was
  explicitly approved as a cross-repo implementation effort.
- Required reading: all affected READMEs, boundary docs, session contracts, and
  the current sprint note plus `docs/BUILD_METHOD_STANDARDS.md` when the sprint
  is making build-method or process changes.
- Required validation: `git status`, `git diff --stat`, and repo-local checks
  only where safe.
- Required final report: affected repos, exact cross-repo reason, files changed,
  why coordination was necessary, and what remains blocked.
- Human approval requirements: explicit approval before edits begin and again
  before any second runtime repo is touched.
