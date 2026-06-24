# prism-beam Contract

Purpose: define the implementation boundary for the workspace meta repo.

## Repo Purpose

`prism-beam` is the coordination and documentation repo for the Prism ecosystem.
It exists to keep the other repos aligned, not to implement product behavior.

## Owns

- Ecosystem docs
- Shared vocabulary
- Repo boundaries
- AI session contracts
- Change boundary checklist
- Repo-specific contracts
- Codex prompt templates
- Coordination scripts and templates

## Does Not Own

- Runtime behavior
- Application state
- Business data
- Public surface behavior
- Product feature execution

## Allowed Implementation Work

- Documentation updates
- Coordination scripts
- Template files
- Safe pointer updates in README files
- Workspace-level check scripts that do not mutate external systems

## Forbidden Implementation Work

- Product runtime code
- Application schemas
- Dependency additions
- Publishing workflows
- Deployment behavior
- Behavior changes in runtime repos

## Canonical State Rules

- `prism-beam` does not own product canonical state.
- It may document where canonical state lives and how other repos should treat
  it.
- It may define rebuildable coordination artifacts, but not product truth.

## External Action Rules

- No external action should be initiated from `prism-beam` unless the action is
  itself a coordination script that is already approved and non-destructive.
- Publishing, sending, deletion, and deployment belong in the owning runtime
  repo, not here.

## Testing and Validation Expectations

- `git status`
- `git diff --stat`
- link sanity checks for docs
- safe repo-local shell scripts only

## Documentation Expectations

- Every new coordination rule should be documented here or linked from here.
- README changes should remain small and navigational.

## Correct Changes

- Add `docs/AI_SESSION_CONTRACTS.md`
- Add repo boundary contracts
- Add prompt templates
- Update coordination docs with links to the new contract set

## Boundary Violations

- Adding runtime orchestration logic
- Writing app state for `prism-focus`
- Defining music CRM data models
- Implementing public publishing workflows

