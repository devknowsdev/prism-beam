# Spectra OpenRouter Audit

**Purpose:** Compact Beam record of the OpenRouter findings needed for Spectra implementation.

**Last verified:** 2026-06-25
**Source:** User-provided Spectra/OpenRouter deep research output, 2026-06-25.

## Decision

OpenRouter should be treated as an optional external provider adapter and dynamic model-catalogue source.

It must not become Spectra's primary router, and it must be blocked in `local-only` mode.

## What OpenRouter is

OpenRouter is an external hosted model gateway and catalogue. It can expose model metadata, pricing, provider information, and an OpenAI-compatible request surface.

It is not a local runtime like Ollama, llama.cpp, MLX, or LM Studio.

## What Spectra may use

- Model catalogue metadata.
- Pricing/context/modality information.
- Optional cloud model calls through a Spectra-owned provider adapter.
- Provider allow/deny and ZDR/data-collection request preferences, when supported.

## What Spectra must not delegate

- Local-first policy.
- Sensitive-data decisions.
- Approval gates.
- Cost limits.
- Provenance logging.
- Routing authority.
- Whether cloud fallback is allowed.

## Mode policy

| Prism mode | OpenRouter policy |
|---|---|
| `local-only` | blocked |
| `local-first` | allowed only after explicit approval/fallback; prefer ZDR/data-deny controls |
| `balanced` | allowed with cost/data-boundary warning and policy controls |
| `cloud-allowed` | allowed with provider/model/cost/provenance visibility |

## OpenRouter auto-routing

Do not use `openrouter/auto` by default. It is opaque and weakens Spectra's visible routing model.

Initial integration should use explicit model slugs and Spectra-owned policy.

## Adapter posture

Prefer REST/OpenAI-compatible API calls over adding a dedicated SDK dependency unless a clear maintenance advantage emerges.

Do not commit API keys. All keys must live in environment variables or local untracked config.

## Required event/provenance fields

When Spectra calls OpenRouter, log:

- provider adapter: `openrouter`
- requested model slug
- selected model/provider if returned
- Prism mode
- ZDR/data-collection settings requested
- cloud-boundary flag
- estimated cost if known
- actual usage/cost if returned
- user approval id when applicable

## Risks

- External cloud boundary.
- Provider-policy variance.
- Pricing volatility.
- Model slug volatility.
- Opaque auto-routing.
- Prompt-cache or gateway-retention uncertainty.
- Accidental cloud escalation from local-first work.

## Implementation note

Beam stores this research and provider policy. Spectra enforces it.
