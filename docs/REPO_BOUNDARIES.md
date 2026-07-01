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
8. Product-domain expansion must be recorded as a Beam contract before app-side implementation.

## Ownership map

| Repo | Owns | Boundary caution |
|---|---|---|
| `EPK` | Current implementation seed for Dave's public/professional music-career surface: structured EPK/career data, publisher/admin surfaces, public EPK/press/booking outputs, snapshots, and promo tooling. | Do not treat the EPK page as the whole career product. Public EPK pages are outputs of a broader Prism Music/Career domain, not the parent interface. Do not expose private dashboard, social/account, supporter, contact, or admin data. |
| `prism-focus` | Personal planning state, tasks, routines, low-overwhelm UX. | Do not mutate localStorage or task state from other apps without review/import. Career/Music batch-session or cadence work must stay review-first if it becomes Focus tasks. |
| `prism-spectra` | Orchestration, adapters, approvals, sidecars, workbench, and suite AI routing. | Do not run broad autonomous writes; classify actions before execution. Career/Music AI help must route through Spectra, not app-local provider wiring. |
| `prism-beam` | AI guides, schemas, contracts, patterns, logs, prompts, harvest notes, and suite-domain boundary decisions. | Do not become a runtime dependency, app-state store, or dumping ground. |

## Product-domain note: Prism Music/Career

`EPK` remains the current repo name and implementation surface, but the product
domain is now broader than an online electronic press kit.

Future work may treat the current `EPK` repo as the seed of a `Prism Music` or
`Prism Career` app/domain. In that model:

- the EPK page is one public/export output;
- career operations, project identity, socials visibility, content planning,
  back-catalogue reuse, supporter/mailing-list awareness, press/venue contacts,
  and booking material belong to the broader Music/Career domain;
- public pages, PDFs, one-sheets, booking packets, and show-specific promo packs
  are generated/reviewed outputs, not the canonical internal interface;
- any future repo rename or new `prism-career` repo requires explicit approval
  and a follow-up Beam boundary contract.

## Cross-repo coordination

Cross-repo work should happen through Beam contracts first. App-side
implementation should follow in separate, focused PRs after the contract is
accepted.
