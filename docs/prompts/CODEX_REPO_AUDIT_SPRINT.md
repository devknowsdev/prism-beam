# Codex Repo Audit Sprint Template

Reasoning level: HIGH.

## Required Reading

- `prism-beam/docs/REPO_ALIGNMENT_AUDIT.md`
- `prism-beam/docs/NAMING_ALIGNMENT_AUDIT.md`
- `prism-beam/docs/REPO_BOUNDARIES.md`
- target repo README
- target repo portal or architecture docs

## Boundaries

- Allowed repos: `prism-beam` for reporting; read-only inspection of the target
  repo and any explicitly named evidence repo.
- Do not modify runtime code.
- Do not add dependencies.
- Do not change public behavior.

## Out of Scope

- Implementation work
- Schema or runtime migrations
- Cross-repo refactors

## Validation Requirements

- `git status`
- `git diff --stat`
- evidence-backed audit notes

## Final Report Format

1. Current identity
2. Actual structure
3. Actual runtime responsibilities
4. Claimed responsibilities
5. Alignment with prism-beam boundaries
6. Drift or contradiction
7. Smallest correction
8. Correction type

