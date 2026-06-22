# Workspace Coordination

Last-Updated: 2026-06-22

This meta-repo coordinates `prism-focus`, `prism-spectra`, and the workspace
helper layer by providing:

- `docs/` — guidance and onboarding for contributors.
- `.github/workflows/` — reusable workflows that can be referenced via `uses:`.
- `scripts/` — local helper scripts for testing and installing templates.
- `deploy/` — example deploy configs for Cloudflare Pages and a deploy script example for the orchestration repo.

Structure:

- `docs/CHANGE_GUIDE.md` — high-level instructions for the workspace.
- `scripts/run-workspace-smoke.sh` — runs both repo tests.
- `scripts/install-templates.sh` — copies PR template and CODEOWNERS into each repo.

Repository layout recommendation:

- Keep `prism-focus/` and `prism-spectra/` as separate repos.
- Add `prism-beam/` as the orchestration / coordination repo (this folder) in the same workspace or local sibling. It does not need code, only infra, docs, and workflows.
