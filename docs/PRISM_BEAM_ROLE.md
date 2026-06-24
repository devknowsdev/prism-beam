# Prism Beam Role

`prism-beam` is the reusable support, library, and guidance repo for the Prism
ecosystem.

It is not a product UI and it is not a runtime engine. Its job is to make the
other repos easier to build, review, and keep aligned.

## Repo Roles

| Repo | Role |
|---|---|
| `prism-beam` | Reusable support/source repo for stable patterns, prompts, templates, guides, checklists, and later shared packages. |
| `prism-spectra` | Product/workbench repo for execution, capability routing, approvals, and runtime behavior. |
| `prism-focus` | UI/reference/proving-ground repo for human-facing workflows and calm dashboard ideas. |

## Beam Material Policy

- Stable material belongs in Beam when it can be reused across repos without
  extra interpretation.
- Emerging material can live in Beam when it is clearly labeled and still being
  validated.
- Experimental material can live in Beam only when the label is explicit and
  the scope stays small.
- Repo-specific implementation code should stay in the owning runtime repo
  until it is clearly reusable.

## What Beam Should Hold

- Reusable prompts and sprint templates
- Reusable handover and report templates
- Reusable safety and hygiene checklists
- Reusable pattern notes for manifests, ledgers, queues, and workbenches
- Later, small shared packages that are proven stable enough to extract

## What Beam Should Not Become

- A dumping ground for every interesting draft
- A product UI
- A runtime execution repo
- A place to move unstable Spectra code too early

## Practical Rule

If a pattern is still changing every sprint, keep it close to the product repo.
If it is stable enough to help the next build, document it in Beam.

See also:

- [Beam extraction index](BEAM_EXTRACTION_INDEX.md)
- [Ecosystem overview](ECOSYSTEM_OVERVIEW.md)
