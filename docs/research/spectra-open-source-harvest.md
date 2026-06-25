# Spectra Open-Source Harvest Summary

**Purpose:** Compact Beam record of the open-source harvest decisions needed before Spectra implementation.

**Last verified:** 2026-06-25
**Source:** User-provided Spectra/OpenRouter/open-source harvest research output, 2026-06-25.

## Decision

Spectra should harvest patterns aggressively but dependencies conservatively.

Do not rebuild or clone Aider, Cline, OpenHands, Open WebUI, LibreChat, AnythingLLM, Jan, or ComfyUI wholesale.

## Reuse modes

- `import-dependency`: small, well-scoped, permissive library.
- `wrap-sidecar`: useful tool that should remain external.
- `provider-adapter`: external API/model provider behind Spectra policy.
- `reimplement-pattern`: borrow the idea, write Prism-native code.
- `reference-only`: study only.
- `avoid`: license, safety, or complexity mismatch.

## Highest-value patterns

- Aider: repo map, git-native patch workflow, diff/test loop.
- Cline: Plan/Act separation, explicit approval, tool-call visibility.
- OpenHands: sandbox warnings and task/canvas visibility; reference only.
- Open WebUI/LibreChat/AnythingLLM/Jan: model/chat/workspace UX references only.
- lazygit: calm keyboard-driven pane layout.
- CodeMirror/Monaco: diff review UI candidates.
- xyflow/React Flow/Mermaid: bounded graph and diagram views.
- Uppy/wavesurfer/ffmpeg/whisper.cpp: future media capability surfaces.

## Default avoid/defer list

- GPL/AGPL code in Spectra core without deliberate license review.
- Heavy always-on platforms on M1/16GB.
- Broad autonomous agents without approval gates.
- Plugin marketplace before safety model.
- Unbounded graph dashboard.
- Hidden cloud escalation.

## Beam storage

Structured entries belong in `harvest/spectra/*.json` and should follow `schemas/harvest-entry.schema.json`.

Long research reports are archives. First-load context should use `context-packs/prism-spectra/harvest-current.md`.
