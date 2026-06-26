# Prism Workspace Current State — Mini

**Purpose:** Tier-1 suite orientation for low-token AI sessions.

**Last verified:** 2026-06-25  
**Verified against:** Beam internal suite-role docs and current Beam context packs as of 2026-06-25
**Target budget:** 500-1,000 tokens
**Scope:** Prism suite repo roles and current direction. Source code still overrides this pack.

## Suite map

- `prism-beam`: AI-facing reference, context, contracts, schemas, harvest, prompt, anti-drift, and handover layer. Not runtime code.
- `prism-spectra`: live AI cockpit, local-first model/runtime router, CLI/workbench, approval-gated execution, checkpoint/rollback, provenance, capability palette.
- `prism-focus`: downstream planning/focus app. Should request AI services through Spectra.
- `EPK`: downstream public music/professional app. Should request AI services through Spectra.

## Current strategic direction

Spectra should become the calm local-first AI cockpit for Prism. Beam should minimize repeated orientation and token usage by storing compact, verified context packs and research summaries.

## Operating rules

- Start with Beam before repo source.
- Read the smallest relevant pack.
- Escalate to source only for the exact task.
- Source code overrides stale docs.
- New findings should be compressed back into Beam.
- Avoid broad repo scans as default orientation.

## Safety rules

- No hidden writes.
- No hidden model escalation to cloud.
- No direct Focus/EPK-to-model routing.
- No destructive or external action without explicit approval.
- Preview/propose must stay separate from execute/apply.
- Checkpoint before risky writes.
- Log model/provider/action provenance where relevant.

## Next likely work

- Keep Beam current and compact.
- Add token-efficiency docs and mini-packs.
- Add Spectra OpenRouter/model-routing harvest docs.
- Use free/low-context AI sessions only with tiny boot + mini-pack + targeted evidence.
