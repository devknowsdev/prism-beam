# Workspace Coordination

Last-Updated: 2026-06-22

This meta-repo coordinates `ADHDashboard-git` and `AI-Forge` by providing:

- `docs/` — guidance and onboarding for contributors.
- `.github/workflows/` — reusable workflows that can be referenced via `uses:`.
- `scripts/` — local helper scripts for testing and installing templates.
- `deploy/` — example deploy configs for Cloudflare Pages (ADHDashboard) and a deploy script example for AI-Forge.

Structure:

- `docs/CHANGE_GUIDE.md` — high-level instructions (copied from AI-Forge).
- `scripts/run-workspace-smoke.sh` — runs both repo tests.
- `scripts/install-templates.sh` — copies PR template and CODEOWNERS into each repo.

Repository layout recommendation:

- Keep `ADHDashboard-git/` and `AI-Forge/` as separate repos.
- Add `workspace-meta/` as an orchestration repo (this folder) in the same org or local sibling. It does not need code, only infra, docs, and workflows.
