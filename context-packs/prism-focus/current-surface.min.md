# Prism Focus Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Focus sessions.

**Last verified:** 2026-06-25  
**Verified against:** prism-focus boundary captured in Beam suite AI contract as of 2026-06-25
**Scope:** `prism-focus`. Verify source before implementation.

## Role

Focus is the downstream planning/focus app in the Prism suite. It should not own general model routing.

## AI boundary

Focus should request AI help through Spectra, not by calling Ollama, OpenRouter, OpenAI, Anthropic, Gemini, or other model providers directly.

## Expected AI use cases

- parse/summarise planning input,
- suggest task breakdowns,
- help with daily/focus flows,
- request read-only or draft-style assistance through Spectra.

## Safety defaults

- No hidden task creation from external apps.
- No broad background scanning.
- No external model calls directly from Focus.
- Any write/action flow should be explicit and auditable.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`

## Source escalation

For Focus implementation, read this mini-pack first, then inspect only exact Focus files needed for the requested change.
