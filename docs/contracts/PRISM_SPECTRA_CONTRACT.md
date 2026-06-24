# prism-spectra Contract

Purpose: define the implementation boundary for Prism Core / AI-Forge.

## Repo Purpose

`prism-spectra` owns executive reasoning, capability routing, adapters, local
orchestration, provenance, approval logic, and the future Prism Core service.

## Owns

- Routing and orchestration
- Capability registry and capability contracts
- Memory, ledger, replay, and provenance
- Checkpointing and validation
- File operations that belong to the core engine
- Local daemon and core service surfaces
- Adapter contracts and adapter implementations

## Does Not Own

- `prism-focus` planner or dashboard UI state
- Music CRM data
- Public press-kit publication
- Workspace coordination docs
- Product-specific UI widgets

## Allowed Implementation Work

- Core engine changes
- Adapter contracts
- Adapter implementations
- Local daemon endpoints
- Runtime safety and provenance work
- Repo-local tests and docs

## Forbidden Implementation Work

- ADHDashboard UI ownership
- Music business CRM ownership
- Public surface publishing logic
- Cross-repo state mutation
- Dependency additions unless explicitly requested

## Canonical State Rules

- `prism-spectra` may own canonical orchestration and provenance state.
- It may not own canonical state for dashboard planning or music business data.
- Rebuildable indexes, caches, and derived views should remain clearly derived.

## External Action Rules

- External actions must be gated by approval logic.
- Adapters must make their allowed actions explicit.
- No adapter should silently publish, send, or delete without an approved path.

## Testing and Validation Expectations

- `npm test`
- `npm run demo` when orchestrator behavior changes
- repo-local unit or integration checks relevant to the change

## Documentation Expectations

- Update portal or README pointers when repository role changes need to be
  visible.
- Keep architecture docs and contracts in sync when behavior changes.

## Correct Changes

- Define a new adapter contract
- Add a capability registry improvement
- Tighten approval logic
- Improve the daemon's local orchestration surface

## Boundary Violations

- Implementing ADHDashboard widget state
- Writing direct music CRM logic
- Owning public EPK publication
- Turning Prism Core into a dashboard UI repo

