# Prism Spectra Model Routing Current Pack

**Purpose:** Compact routing-policy context for AI sessions working on Spectra model/provider behavior.

**Last verified:** 2026-06-29
**Scope:** Policy guidance only. Spectra source code remains implementation truth.

## Current decision

Spectra owns routing policy. External gateways such as OpenRouter may provide
catalogue/API access, but must not silently choose policy for Prism.

Routing intelligence architecture is defined in ADR-010
(`prism-spectra/docs/adr/ADR-010-routing-intelligence-architecture.md`).

## Routing intelligence: what is built vs what is planned

| Component | Status |
|---|---|
| Multi-tier router (local → free → paid) | ✅ live |
| Ollama health probe at startup | ✅ live (Tier 1) |
| `ModelRole`, `LOCAL_MODEL_CATALOG`, `classifyIntent()` | ✅ exists, unwired |
| `localTierAvailable()` real implementation | ❌ stub — always returns true |
| L1 heuristic classification | ❌ not started (Tier 2b) |
| Cascade quality-gate + confidence scoring | ❌ not started (Tier 2b) |
| Semantic cache (vector similarity layer) | ❌ not started (Tier 3a) |
| L2 embedding classification | ❌ not started (Tier 3b) |
| Route decision cache | ❌ not started (Tier 3b) |
| Telemetry per request | ❌ not started (Tier 4) |

## Cascade model — critical framing

Cascade is a **quality-gate fallback**, not a default execution strategy.

```
Route decision → select primary model (local OR cloud)
              → execute
              → quality-gate check
              → escalate only if confidence < threshold
```

For a query classified as cloud-appropriate, Spectra routes directly to cloud.
No local attempt is made. The cascade only fires when the routed model
underperforms relative to the confidence threshold.

## Modes

| Mode | Cloud allowed? | OpenRouter | Required behavior |
|---|---|---|---|
| `local-only` | no | blocked | local runtimes only |
| `local-first` | fallback only | approval required | try local first; warn before cloud |
| `balanced` | yes | allowed with controls | show provider/model/cost/data boundary |
| `cloud-allowed` | yes | allowed | still log provenance and sensitive-data warnings |

## Classification tiers (planned — ADR-010)

**L1 — heuristic (< 5ms, no model call):** keyword signals, query length, node
type. Outputs task class: `code | reasoning | creative | general | unknown`.

**L2 — embedding (Ollama, ~50ms):** cosine similarity against route utterance
centroids. Replaces `classifyIntent()` LLM call for classification once stable.
`classifyIntent()` becomes fallback for low-confidence L1+L2 results.

**Confidence scoring:** mean log probability from Ollama logprobs + heuristic
signals (uncertainty phrases, suspiciously short response, placeholder text).
Escalation threshold: 0.4 (configurable via env var).

## Local runtime priority

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

- No hidden cloud escalation. All escalation events logged with reason.
- No direct Focus/EPK model calls.
- No API keys in repo files.
- No model output treated as authoritative without validation.
- No write/destructive action based on model output without preview and approval.
- All Ollama calls (execute, classify, embed) must go through `ModelLock`.

## Beam/Spectra split

Beam stores model/provider research, policies, and context packs.

Spectra implements runtime enforcement, model calls, approval gates, and
event/provenance logging.
