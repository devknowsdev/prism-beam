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

Current contract and schema registries:

- [`integrations/registry.md`](integrations/registry.md)
- [`schemas/registry.json`](schemas/registry.json)

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
