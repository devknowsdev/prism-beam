# Workspace Meta — Coordination & tooling

Purpose: a small meta-repo that holds workspace-level coordination artifacts, reusable CI snippets, and helper scripts to run workspace-wide smoke checks and installs.

## Ecosystem Role

This repository is responsible for workspace coordination, ecosystem docs,
shared vocabulary, repo boundaries, roadmap guidance, and workspace helper
scripts.
It is not responsible for runtime behavior or application state.
For the ecosystem map and boundary contract, see the docs in
[`docs/`](docs/), especially [docs/ECOSYSTEM_OVERVIEW.md](docs/ECOSYSTEM_OVERVIEW.md)
and [docs/REPO_BOUNDARIES.md](docs/REPO_BOUNDARIES.md).

Docs:

- `docs/ECOSYSTEM_OVERVIEW.md` — current repos and the long-term layer model.
- `docs/REPO_BOUNDARIES.md` — what each repo owns and does not own.
- `docs/SHARED_VOCABULARY.md` — shared terms used across Prism docs.
- `docs/LOCAL_FIRST_STACK.md` — the recommended local-first stack shape.
- `docs/IMPLEMENTATION_ROADMAP.md` — the staged roadmap from the research.
- `docs/CURRENT_SPRINT.md` — the active sprint and validation checklist.
- `docs/AI_SESSION_CONTRACTS.md` — standard session types and safety rules.
- `docs/CHANGE_BOUNDARY_CHECKLIST.md` — pre-edit boundary checklist.
- `docs/contracts/` — repo-specific implementation contracts.
- `docs/prompts/` — reusable Codex prompt templates.

Quick start (local):

Run the workspace smoke tests (requires both repos to be siblings of this folder):

```bash
bash scripts/run-workspace-smoke.sh
```

Install PR/CODEOWNERS templates into each repo:

```bash
bash scripts/install-templates.sh
```

See `docs/COORDINATION.md` for the workspace layout notes, and use the new
docs above as the primary architecture references.
