# Workspace Meta — Coordination & tooling

Purpose: a small meta-repo that holds workspace-level coordination artifacts, reusable CI snippets, and helper scripts to run workspace-wide smoke checks and installs.

Quick start (local):

Run the workspace smoke tests (requires both repos to be siblings of this folder):

```bash
bash scripts/run-workspace-smoke.sh
```

Install PR/CODEOWNERS templates into each repo:

```bash
bash scripts/install-templates.sh
```

See `docs/COORDINATION.md` for the recommended repo layout and GitHub integration notes.
