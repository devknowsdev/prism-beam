# Workspace Meta — Coordination & support spine

Purpose: a small meta-repo that holds workspace-level coordination artifacts,
reusable prompts, checklists, patterns, and helper scripts.

## Start Here

- [Beam role](docs/PRISM_BEAM_ROLE.md)
- [Ecosystem overview](docs/ECOSYSTEM_OVERVIEW.md)
- [Current sprint](docs/CURRENT_SPRINT.md)
- [Beam extraction index](docs/BEAM_EXTRACTION_INDEX.md)
- [Repository boundaries](docs/REPO_BOUNDARIES.md)
- [Shared vocabulary](docs/SHARED_VOCABULARY.md)

## Patterns

- [Capability manifest pattern](docs/patterns/CAPABILITY_MANIFEST_PATTERN.md)
- [Event ledger pattern](docs/patterns/EVENT_LEDGER_PATTERN.md)
- [Approval queue pattern](docs/patterns/APPROVAL_QUEUE_PATTERN.md)
- [Workbench data spine pattern](docs/patterns/WORKBENCH_DATA_SPINE_PATTERN.md)

## Templates

- [Sprint prompt template](docs/templates/SPRINT_PROMPT_TEMPLATE.md)
- [Handover report template](docs/templates/HANDOVER_REPORT_TEMPLATE.md)

## Checklists

- [Repo hygiene checklist](docs/checklists/REPO_HYGIENE_CHECKLIST.md)
- [Safe capability integration checklist](docs/checklists/SAFE_CAPABILITY_INTEGRATION_CHECKLIST.md)

## Contracts

- `docs/AI_SESSION_CONTRACTS.md` — standard session types and safety rules.
- `docs/CHANGE_BOUNDARY_CHECKLIST.md` — pre-edit boundary checklist.
- `docs/contracts/` — repo-specific implementation contracts.
- `docs/prompts/` — reusable Codex prompt templates.

## Research

- [Deep research report](docs/research/deep-research-report.md)

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
