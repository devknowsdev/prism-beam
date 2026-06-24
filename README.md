# Prism Beam

Prism Beam is the canonical AI-facing reference layer for the Prism suite.

Beam stores the durable material future GPT, Claude, Codex, and local-agent
sessions should read before making changes: operating guides, project memory,
harvested code and tool notes, reusable UI/UX patterns, prompts, schemas,
integration contracts, architecture logs, anti-drift rules, and compact context
packs.

Beam is not a runtime package, not a monorepo, and not something Prism apps
import during product execution. It is the reference, training, harvest, and
contract layer that keeps independent app repos aligned.

## Suite Map

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution
  boundaries.
- `prism-beam` owns the canonical AI-readable reference layer that keeps the
  suite aligned.

## Why Beam Exists

Prism work crosses multiple independent repos. Without a durable AI-readable
reference layer, every new session has to rediscover ownership boundaries,
safety rules, naming decisions, and recent lessons. Beam reduces that repeated
token cost and lowers architectural drift by storing the durable context once.

## What Beam Owns

- AI operating guides and session-start guides.
- App-specific guardrails and current-truth summaries.
- Project memory, architecture logs, and sprint handover material.
- Reusable patterns, prompts, checklists, schemas, and integration contracts.
- Anti-drift rules and compact context packs for future AI sessions.
- Small reusable snippets only when they are clearly reference material, not app
  implementation code.

## What Beam Does Not Own

- Product runtime code.
- App state, business data, or user data.
- Hidden external writes or execution side effects.
- App-specific implementation that belongs in `EPK`, `prism-focus`, or
  `prism-spectra`.
- A bundled monorepo workspace or a shared dependency that apps must import.

## Start Here For AI Sessions

Future AI sessions should read [`ai-guides/START_HERE.md`](ai-guides/START_HERE.md)
first, then follow its reading order for any relevant context packs, app guides,
patterns, schemas, integration contracts, or build-method guides.

Current low-token entry packs:

- [`context-packs/workspace/current-state.md`](context-packs/workspace/current-state.md)
- [`context-packs/epk/current-surface.md`](context-packs/epk/current-surface.md)
- [`context-packs/prism-focus/current-surface.md`](context-packs/prism-focus/current-surface.md)
- [`context-packs/prism-spectra/current-surface.md`](context-packs/prism-spectra/current-surface.md)

Current setup/readiness entry point:

- [`docs/setup/README.md`](docs/setup/README.md)

Current contract and schema registries:

- [`integrations/registry.md`](integrations/registry.md)
- [`schemas/registry.json`](schemas/registry.json)

Current boundary contracts:

- [`docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`](docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md)

Current schema cards:

- [`docs/schema-cards/EPK_TO_FOCUS_EVENT_PACKET.md`](docs/schema-cards/EPK_TO_FOCUS_EVENT_PACKET.md)
- [`docs/schema-cards/APPROVAL_REQUEST.md`](docs/schema-cards/APPROVAL_REQUEST.md)

Current app cards:

- [`docs/app-cards/FOCUS_INTERACTION_STABILIZATION.md`](docs/app-cards/FOCUS_INTERACTION_STABILIZATION.md)
- [`docs/app-cards/SPECTRA_AS_SUITE_AI_ENGINE.md`](docs/app-cards/SPECTRA_AS_SUITE_AI_ENGINE.md)

## Support Spine Reference Index

These Beam support-spine references preserve the useful material from the older
`sprint-026-beam-support-spine` branch while keeping the current Prism Beam
identity from Beam-001 through Beam-003.

### Core orientation

- [Beam role](docs/PRISM_BEAM_ROLE.md)
- [Ecosystem overview](docs/ECOSYSTEM_OVERVIEW.md)
- [Current sprint](docs/CURRENT_SPRINT.md)
- [Beam extraction index](docs/BEAM_EXTRACTION_INDEX.md)
- [Repository boundaries](docs/REPO_BOUNDARIES.md)
- [Shared vocabulary](docs/SHARED_VOCABULARY.md)

### Build method and session safety

- [AI session contracts](docs/AI_SESSION_CONTRACTS.md)
- [Build method standards](docs/BUILD_METHOD_STANDARDS.md)
- [Change boundary checklist](docs/CHANGE_BOUNDARY_CHECKLIST.md)

### Patterns

- [Capability manifest pattern](docs/patterns/CAPABILITY_MANIFEST_PATTERN.md)
- [Event ledger pattern](docs/patterns/EVENT_LEDGER_PATTERN.md)
- [Approval queue pattern](docs/patterns/APPROVAL_QUEUE_PATTERN.md)
- [Workbench data spine pattern](docs/patterns/WORKBENCH_DATA_SPINE_PATTERN.md)

### Checklists

- [Repo hygiene checklist](docs/checklists/REPO_HYGIENE_CHECKLIST.md)
- [Safe capability integration checklist](docs/checklists/SAFE_CAPABILITY_INTEGRATION_CHECKLIST.md)

### Templates

- [Sprint prompt template](docs/templates/SPRINT_PROMPT_TEMPLATE.md)
- [Handover report template](docs/templates/HANDOVER_REPORT_TEMPLATE.md)

### Contracts and prompt starters

- `docs/contracts/` — app-specific support-spine contract notes.
- `docs/prompts/` — reusable Codex prompt starters.

### Research

- [Deep research report](docs/research/deep-research-report.md)

## How App Repos Should Use Beam

App repos should treat Beam as a reference and coordination source. Before a
sprint, read the relevant Beam guide, then inspect the target app repo directly
and let current source files override stale documentation. Implementation code
stays in the owning app repo unless a small stable reference pattern clearly
belongs in Beam.

## Local Helpers

Run Beam's reference smoke check:

```bash
bash scripts/run-workspace-smoke.sh
```

Install shared PR/CODEOWNERS templates into sibling app repos when that is
explicitly part of a maintenance sprint:

```bash
bash scripts/install-templates.sh
```

See [`docs/COORDINATION.md`](docs/COORDINATION.md) for sprint coordination
rules.
