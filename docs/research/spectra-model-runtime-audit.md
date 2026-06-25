# Spectra Model Runtime Audit Summary

**Purpose:** Compact Beam record of model/runtime direction for Spectra.

**Last verified:** 2026-06-25
**Source:** User-provided Spectra/OpenRouter/model-runtime research output, 2026-06-25.

## Decision

Spectra should own routing policy and support local-first model execution, with optional explicit cloud fallback.

## Runtime posture

- Primary local runtime surface: Ollama or equivalent local endpoint.
- Apple Silicon paths to investigate: llama.cpp with Metal, MLX / MLX-LM.
- Optional local lab/fallback: LM Studio/OpenAI-compatible local endpoint.
- Optional external gateway: OpenRouter, blocked in `local-only` mode.
- Direct cloud fallback: OpenAI/Anthropic/Gemini only through Spectra policy.

## Mode policy

| Mode | Cloud | Notes |
|---|---|---|
| `local-only` | no | local runtimes only |
| `local-first` | fallback only | explicit approval before cloud |
| `balanced` | yes | provider/model/cost/data boundary visible |
| `cloud-allowed` | yes | still log provenance and warn for sensitive data |

## Model classes to track

- small local general model,
- local coding model,
- embedding model,
- summarisation model,
- long-context cloud fallback,
- multimodal/vision/audio later.

## Metadata Beam should store

- provider,
- model slug,
- context length,
- modalities,
- license/terms notes,
- pricing/cost class,
- data-boundary notes,
- recommended Prism task classes,
- verification date.

## Metadata Spectra should enforce/log

- selected provider/model,
- Prism routing mode,
- cloud-boundary flag,
- user approval id,
- token/cost usage when available,
- fallback reason,
- ZDR/data-collection preference where applicable.
