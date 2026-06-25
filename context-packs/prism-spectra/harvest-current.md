# Prism Spectra Harvest Current Pack

**Purpose:** Compact open-source harvest posture for Spectra implementation sessions.

**Last verified:** 2026-06-25
**Scope:** Policy and research summary. Verify current licenses before copying code.

## Harvest rule

Do not clone another platform. Harvest patterns, wrap large tools as sidecars, and import only small, well-licensed dependencies when justified.

## Reuse modes

- `import-dependency`: small, permissive, clear purpose.
- `wrap-sidecar`: useful but too large/opinionated to embed.
- `provider-adapter`: external model/API provider behind Spectra policy.
- `reimplement-pattern`: learn the workflow; write Prism-native code.
- `reference-only`: useful inspiration, no direct dependency.
- `avoid`: license, size, safety, or architecture mismatch.

## Current high-value patterns

| Source | What to harvest | Mode |
|---|---|---|
| Aider | repo map, git-native patch/diff/test loop | reimplement-pattern / possible sidecar later |
| Cline | Plan/Act flow, visible tool calls, approval gating | reimplement-pattern |
| OpenHands | agent canvas/task visibility ideas | reference-only |
| Open WebUI / LibreChat / AnythingLLM / Jan | chat/workspace/model UI ideas | reference-only |
| lazygit | calm pane layout, git visibility | reference-only / sidecar optional |
| CodeMirror / Monaco | diff/code review UI | import-dependency candidate |
| xyflow / React Flow | bounded graph views | import-dependency candidate |
| Mermaid | lightweight diagrams | import-dependency candidate |
| Uppy / wavesurfer.js | upload/audio UI capabilities | import-dependency candidate |
| ffmpeg / whisper.cpp | media sidecar/local capability patterns | sidecar / import candidate depending integration |

## Avoid/default defer

- GPL/AGPL code in core without deliberate license decision.
- Heavy always-on agent platforms.
- Unbounded graph dashboards.
- Plugin marketplaces before safety model is stable.
- Hidden cloud routing.
- Direct Focus/EPK model provider logic.
- Copying harvested code without attribution/license review.

## MVP harvest focus

For Spectra MVP, prioritize:

1. Plan/propose/apply separation.
2. Diff preview before writes.
3. Approval queue.
4. Event/provenance timeline.
5. Explicit model/provider boundary.
6. Beam context loader.
7. Handover generation.
8. Local-first runtime mode.
