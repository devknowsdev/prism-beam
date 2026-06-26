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

For the lowest-token path, future AI sessions should read
[`AI_LOAD_ME_FIRST.md`](AI_LOAD_ME_FIRST.md) first. That file points the AI to the
current progress log, low-token multi-AI coordination protocol, correct model
profile, prompt router, delegation/usage checks, and task-specific packs.

Core routing and handover files:

- [`AI_LOAD_ME_FIRST.md`](AI_LOAD_ME_FIRST.md)
- [`AI_PROGRESS_LOG.md`](AI_PROGRESS_LOG.md)
- [`ai-guides/TINY_BOOT.md`](ai-guides/TINY_BOOT.md)
- [`ai-guides/AI_PROMPT_ROUTER.md`](ai-guides/AI_PROMPT_ROUTER.md)
- [`ai-guides/AI_PROGRESS_PROTOCOL.md`](ai-guides/AI_PROGRESS_PROTOCOL.md)
- [`ai-guides/LOW_TOKEN_MULTI_AI_COORDINATION.md`](ai-guides/LOW_TOKEN_MULTI_AI_COORDINATION.md)
- [`docs/progress/AI_CHANGE_REVIEW_QUEUE.md`](docs/progress/AI_CHANGE_REVIEW_QUEUE.md)
- [`ai-guides/AI_DELEGATION_PROTOCOL.md`](ai-guides/AI_DELEGATION_PROTOCOL.md)
- [`ai-guides/AI_USAGE_LIMITS.md`](ai-guides/AI_USAGE_LIMITS.md)
- [`ai-guides/AI_SESSION_LOADING_POLICY.md`](ai-guides/AI_SESSION_LOADING_POLICY.md)
- [`ai-guides/FREE_AI_MODE.md`](ai-guides/FREE_AI_MODE.md)

The older full start guide remains available at [`ai-guides/START_HERE.md`](ai-guides/START_HERE.md).

Current low-token entry packs:

- [`context-packs/workspace/current-state.min.md`](context-packs/workspace/current-state.min.md)
- [`context-packs/prism-spectra/current-surface.min.md`](context-packs/prism-spectra/current-surface.min.md)
- [`context-packs/prism-focus/current-surface.min.md`](context-packs/prism-focus/current-surface.min.md)
- [`context-packs/epk/current-surface.min.md`](context-packs/epk/current-surface.min.md)

Model-specific prompt profiles:

- [`ai-guides/MODEL_SPECIFIC_PROMPTING.md`](ai-guides/MODEL_SPECIFIC_PROMPTING.md)
- [`ai-guides/model-profiles/CLAUDE.md`](ai-guides/model-profiles/CLAUDE.md)
- [`ai-guides/model-profiles/CODEX.md`](ai-guides/model-profiles/CODEX.md)
- [`ai-guides/model-profiles/GPT.md`](ai-guides/model-profiles/GPT.md)
- [`ai-guides/model-profiles/GEMINI.md`](ai-guides/model-profiles/GEMINI.md)
- [`ai-guides/model-profiles/TECHNICAL_REVIEW.md`](ai-guides/model-profiles/TECHNICAL_REVIEW.md)
- [`ai-guides/model-profiles/LOCAL_SMALL_MODEL.md`](ai-guides/model-profiles/LOCAL_SMALL_MODEL.md)

Model-specific prompt wrappers:

- [`templates/model-specific/CLAUDE_FREE_REVIEW.md`](templates/model-specific/CLAUDE_FREE_REVIEW.md)
- [`templates/model-specific/CODEX_SAFE_IMPLEMENTATION.md`](templates/model-specific/CODEX_SAFE_IMPLEMENTATION.md)
- [`templates/model-specific/GPT_HANDOVER_SYNTHESIS.md`](templates/model-specific/GPT_HANDOVER_SYNTHESIS.md)
- [`templates/model-specific/GEMINI_DELTA_REVIEW.md`](templates/model-specific/GEMINI_DELTA_REVIEW.md)
- [`templates/model-specific/TECHNICAL_REVIEW.md`](templates/model-specific/TECHNICAL_REVIEW.md)
- [`templates/model-specific/LOCAL_MODEL_CHECKLIST.md`](templates/model-specific/LOCAL_MODEL_CHECKLIST.md)

Delegation and progress templates/schemas:

- [`templates/AI_PROGRESS_ENTRY.md`](templates/AI_PROGRESS_ENTRY.md)
- [`templates/AI_DELEGATION_PROMPT.md`](templates/AI_DELEGATION_PROMPT.md)
- [`schemas/ai-progress-entry.schema.json`](schemas/ai-progress-entry.schema.json)
- [`schemas/ai-delegation.schema.json`](schemas/ai-delegation.schema.json)

Full current-surface packs:

- [`context-packs/workspace/current-state.md`](context-packs/workspace/current-state.md)
- [`context-packs/epk/current-surface.md`](context-packs/epk/current-surface.md)
- [`context-packs/prism-focus/current-surface.md`](context-packs/prism-focus/current-surface.md)
- [`context-packs/prism-spectra/current-surface.md`](context-packs/prism-spectra/current-surface.md)

Token-efficiency controls:

- [`docs/token-efficiency/BEAM_TOKEN_EFFICIENCY_AUDIT.md`](docs/token-efficiency/BEAM_TOKEN_EFFICIENCY_AUDIT.md)
- [`docs/token-efficiency/CONTEXT_BUDGETS.md`](docs/token-efficiency/CONTEXT_BUDGETS.md)
- [`docs/token-efficiency/REPO_SOURCE_ESCALATION_POLICY.md`](docs/token-efficiency/REPO_SOURCE_ESCALATION_POLICY.md)
- [`ai-guides/LOW_TOKEN_MULTI_AI_COORDINATION.md`](ai-guides/LOW_TOKEN_MULTI_AI_COORDINATION.md)

Spectra model/harvest entry packs:

- [`context-packs/prism-spectra/harvest-current.md`](context-packs/prism-spectra/harvest-current.md)
- [`context-packs/prism-spectra/model-routing-current.md`](context-packs/prism-spectra/model-routing-current.md)
- [`docs/research/spectra-openrouter-audit.md`](docs/research/spectra-openrouter-audit.md)
- [`docs/research/spectra-open-source-harvest.md`](docs/research/spectra-open-source-harvest.md)
- [`docs/research/spectra-model-runtime-audit.md`](docs/research/spectra-model-runtime-audit.md)
- [`docs/research/spectra-workbench-ui-harvest.md`](docs/research/spectra-workbench-ui-harvest.md)
- [`docs/research/spectra-security-approval-sandbox-audit.md`](docs/research/spectra-security-approval-sandbox-audit.md)

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
- [Mini handover template](templates/HANDOVER_MINI.md)
- [Mini Codex prompt template](templates/CODEX_PROMPT_MINI.md)
- [Free Claude Beam insight prompt](templates/FREE_CLAUDE_BEAM_INSIGHT_PROMPT.md)
- [Next continuation prompt](templates/NEXT_CONTINUATION_PROMPT.md)

### Contracts and prompt starters

- `docs/contracts/` — app-specific support-spine contract notes.
- `docs/prompts/` — reusable Codex prompt starters.

### Research

- [Deep research report](docs/research/deep-research-report.md)
- [Spectra OpenRouter audit](docs/research/spectra-openrouter-audit.md)
- [Spectra open-source harvest summary](docs/research/spectra-open-source-harvest.md)
- [Spectra model runtime audit](docs/research/spectra-model-runtime-audit.md)
- [Spectra workbench UI harvest](docs/research/spectra-workbench-ui-harvest.md)
- [Spectra security/approval/sandbox audit](docs/research/spectra-security-approval-sandbox-audit.md)

## How App Repos Should Use Beam

App repos should treat Beam as a reference and coordination source. Before a
sprint, read the relevant Beam guide, then inspect the target app repo directly
and let current source files override stale documentation. Implementation code
stays in the owning app repo unless a small stable reference pattern clearly
belongs in Beam.

For Beam maintenance, foundational instruction edits should normally be staged on
`beam/ai-change-review-queue-v2` and reviewed before protected `main`, unless the
maintainer has explicitly opened `main` for a short instruction-update window.

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
