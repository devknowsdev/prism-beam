# Repository Boundaries

Beam keeps the Prism repos aligned without merging them into one codebase.

## Boundary rules

1. One repo per sprint unless cross-repo work is explicitly approved.
2. One PR per sprint.
3. Runtime code stays in the owning app repo.
4. Beam stores reference material, not app state or product execution code.
5. Source code and current repo files override stale docs.
6. External writes require explicit approval.
7. Destructive changes require explicit approval plus rollback/backup notes.

## Ownership map

| Repo | Owns | Boundary caution |
|---|---|---|
| `EPK` | Public site, publisher, structured EPK data, snapshots, promo tooling. | Do not let public pages expose editor controls; hosted publisher needs real auth if private. |
| `prism-focus` | Personal planning state, tasks, routines, low-overwhelm UX. | Do not mutate localStorage or task state from other apps without review/import. |
| `prism-spectra` | Orchestration, adapters, approvals, sidecars, workbench. | Do not run broad autonomous writes; classify actions before execution. |
| `prism-beam` | AI guides, schemas, contracts, patterns, logs, prompts, harvest notes. | Do not become a runtime dependency or dumping ground. |

## Cross-repo coordination

Cross-repo work should happen through Beam contracts first. App-side
implementation should follow in separate, focused PRs after the contract is
accepted.
