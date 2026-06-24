# Sprint 003 — Boundary-Locked Implementation Contracts

Goal: create reusable implementation contracts and Codex prompt templates so
future work can begin without crossing repo boundaries or confusing current
state with future direction.

## Scope

- Read the current alignment docs and repo READMEs
- Create AI session contracts, boundary checklist, repo contracts, and prompt
  templates
- Update coordination docs and README pointers where clearly useful
- Keep changes documentation-only and boundary-safe

## Out of Scope

- Runtime feature implementation
- Dependency additions
- Database schemas
- Docker setup
- Public behavior changes
- Cross-repo runtime implementation
- Mass renaming

## Success Criteria

- Each repo has an explicit implementation contract
- AI session types and boundary checks are reusable
- Prompt templates are ready for future Codex sessions
- prism-beam remains the coordination and control point
- No runtime code changes are needed for the sprint to succeed

## Validation Checklist

- [ ] `docs/AI_SESSION_CONTRACTS.md` created
- [ ] `docs/CHANGE_BOUNDARY_CHECKLIST.md` created
- [ ] `docs/contracts/` populated with repo contracts
- [ ] `docs/prompts/` populated with prompt templates
- [ ] `docs/COORDINATION.md` links updated
- [ ] `README.md` pointer section updated if useful
- [ ] `git status` reviewed for docs-only changes
- [ ] No package manifests or lockfiles changed
- [ ] No runtime source files changed

## Next Proposed Sprint

Sprint 004 — Single-Repo Implementation Launch

Goal: begin implementation in exactly one runtime repo using the new contracts
and prompt templates as the gating layer.
