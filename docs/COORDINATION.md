# Workspace Coordination

Last-Updated: 2026-06-24

This meta-repo coordinates `prism-focus`, `prism-spectra`, the current `EPK`
surface, and the workspace helper layer by providing reusable support and
guidance for the Prism ecosystem:

- `docs/` — guidance and onboarding for contributors.
- `docs/PRISM_BEAM_ROLE.md` — the Beam role and material-stability policy.
- `.github/workflows/` — reusable workflows that can be referenced via `uses:`.
- `scripts/` — local helper scripts for testing and installing templates.
- `deploy/` — example deploy configs for Cloudflare Pages and a deploy script example for the orchestration repo.

Structure:

- `docs/ECOSYSTEM_OVERVIEW.md` — current repo map and long-term layer model.
- `docs/REPO_BOUNDARIES.md` — repo ownership and seams.
- `docs/SHARED_VOCABULARY.md` — shared terms.
- `docs/LOCAL_FIRST_STACK.md` — local stack guidance.
- `docs/IMPLEMENTATION_ROADMAP.md` — phased roadmap from the research.
- `docs/CURRENT_SPRINT.md` — the active sprint and its validation checklist.
- `docs/AI_SESSION_CONTRACTS.md` — session types and edit rules.
- `docs/CHANGE_BOUNDARY_CHECKLIST.md` — pre-edit checklist for agents.
- `docs/contracts/` — repo-specific implementation contracts.
- `docs/prompts/` — reusable Codex prompt templates.
- `docs/patterns/`, `docs/templates/`, and `docs/checklists/` — reusable Beam
  support spine materials.
- `scripts/run-workspace-smoke.sh` — runs both repo tests.
- `scripts/install-templates.sh` — copies PR template and CODEOWNERS into each repo.

Repository layout recommendation:

- Keep `prism-focus/` and `prism-spectra/` as separate repos.
- Treat `EPK/` as an evolving public surface that may later be absorbed into
  `prism-music`.
- Keep `prism-beam/` as the orchestration / coordination repo and reusable
  support spine in the same workspace or local sibling. It does not need
  product runtime code, only infra, docs, patterns, templates, and workflows.
