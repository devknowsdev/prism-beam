# Repo Boundaries

Purpose: state what each repo owns, what it explicitly does not own, and where
the seams are meant to stay.

## Boundaries by Repo

| Repo | Owns | Does not own | Typical seams |
|---|---|---|---|
| `prism-spectra` | Orchestration, capability routing, governance, memory, execution provenance, adapter policy, and core safety rules. | ADHDashboard state, music CRM data, public press-kit publication, or front-end-only workflow state. | CLI, local API, typed adapters, execution logs, provenance records. |
| `prism-focus` | Human operations UI, planning, task and review state, daily execution flows, and dashboard interactions. | Core model routing, adapter internals, approval policy enforcement, or external publishing logic. | Thin client calls into Prism Core, dashboard state, human approvals. |
| `EPK` | Public-facing press-kit publication, artist content, and browser-side presentation of the brand payload. | The whole music business, private ops queues, core orchestration, or dashboard state. | Static/public pages, structured JSON, limited publish bridge. |
| `prism-beam` | Workspace coordination docs, scripts, templates, repo contracts, and cross-repo guidance. | Runtime behavior, business data, application state, or production feature execution. | Documentation, helper scripts, smoke checks, governance notes. |

## Specific Rules

- `prism-spectra` owns orchestration and capabilities, not ADHDashboard state
  or music CRM data.
- `prism-focus` owns human operations UI and workflow state, not model routing
  or external publishing logic.
- `EPK` owns public press-kit publication, not the whole music business.
- `prism-beam` owns coordination docs and scripts, not runtime behavior.

## Shared Contract

- Canonical state lives in the repo that owns the domain.
- Derived views may be duplicated, but they remain rebuildable.
- External side effects should pass through the owning repo's approval gate.
- Cross-repo communication should happen through documented seams, not hidden
  coupling.

## Music Management Layer Note

The future Music Management layer is the business/output owner for bookings,
mail, social, publishing, CRM, gigs, releases, and commercial operations.
`prism-music` is the Prism-named business/output owner for bookings, mail,
social, publishing, CRM, gigs, releases, and commercial operations. `EPK` is
one public surface of that layer, but it is not the layer itself.
