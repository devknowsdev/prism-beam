# Prism Beam Role

`prism-beam` is the canonical AI-facing support spine for the Prism suite.

It is not a product UI, runtime engine, package dependency, or monorepo. Its job
is to make the independent app repos easier to build, review, and keep aligned
by storing stable guidance, contracts, context, patterns, schemas, prompts,
checklists, and project memory.

## Repo roles

| Repo | Role |
|---|---|
| `prism-beam` | AI-readable reference, training, harvest, contract, schema, prompt, and anti-drift layer. |
| `EPK` | Structured public/promotional truth, public EPK site, publisher tooling, snapshots, and promo surfaces. |
| `prism-focus` | Daily planning, tasks, routines, personal execution state, and low-overwhelm user workflows. |
| `prism-spectra` | Local-first orchestration, adapters, approvals, sidecars, workbench, and safe execution boundaries. |

## Beam material policy

- Stable cross-app knowledge belongs in Beam.
- Emerging knowledge can live in Beam when clearly marked as provisional.
- Runtime implementation code stays in the owning app repo.
- Small snippets belong in Beam only when they are reference examples, not shared
  runtime dependencies.
- Beam should reduce future token spend and prevent architectural drift.

## Practical rule

If a pattern is still changing every sprint, keep it close to the app repo. If it
is stable enough to help the next build or future AI session, document it in
Beam.

## Related files

- [`README.md`](../README.md)
- [`ai-guides/START_HERE.md`](../ai-guides/START_HERE.md)
- [`docs/COORDINATION.md`](COORDINATION.md)
- [`docs/BEAM_EXTRACTION_INDEX.md`](BEAM_EXTRACTION_INDEX.md)
