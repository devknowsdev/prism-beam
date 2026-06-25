# Prism Spectra Model Routing Current Pack

**Purpose:** Compact routing-policy context for AI sessions working on Spectra model/provider behavior.

**Last verified:** 2026-06-25
**Scope:** Policy guidance only. Spectra source code remains implementation truth.

## Current decision

Spectra owns routing policy. External gateways such as OpenRouter may provide catalogue/API access, but must not silently choose policy for Prism.

## Modes

| Mode | Cloud allowed? | OpenRouter | Required behavior |
|---|---|---|---|
| `local-only` | no | blocked | local runtimes only |
| `local-first` | fallback only | approval required | try local first; warn before cloud |
| `balanced` | yes | allowed with controls | show provider/model/cost/data boundary |
| `cloud-allowed` | yes | allowed | still log provenance and sensitive-data warnings |

## Local runtime priority

Research recommends local-first support for:

- Ollama as primary local runtime surface.
- llama.cpp / Metal and MLX / MLX-LM as Apple Silicon paths.
- LM Studio as optional local lab / OpenAI-compatible endpoint.
- Local embeddings for retrieval/memory where possible.

## OpenRouter posture

- Use as optional external provider adapter and dynamic model catalogue.
- Block in `local-only` mode.
- Avoid `openrouter/auto` by default.
- Use explicit model slugs first.
- Prefer REST/OpenAI-compatible calls rather than SDK dependency.
- Require cost/data-boundary visibility.
- Log provider/model/usage/provenance.

## Hard safety rules

- No hidden cloud escalation.
- No direct Focus/EPK model calls.
- No API keys in repo files.
- No model output treated as authoritative without validation.
- No write/destructive action based on model output without preview and approval.

## Beam/Spectra split

Beam stores model/provider research, policies, and context packs.

Spectra implements runtime enforcement, model calls, approval gates, and event/provenance logging.
