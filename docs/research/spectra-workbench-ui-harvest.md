# Spectra Workbench UI Harvest Summary

**Purpose:** Compact Beam record of UI/UX patterns to shape Spectra without creating a giant dashboard.

**Last verified:** 2026-06-25
**Source:** User-provided Spectra/OpenRouter/UI harvest research output, 2026-06-25.

## UX decision

Spectra should be a calm, CLI-forward AI cockpit for a solo neurodivergent creator/developer.

It should show current task state, plan preview, model/provider/data boundary, diffs, approvals, and provenance before showing complex graphs or logs.

## MVP layout

- Top/status: active repo, mode, model/provider, data boundary.
- Left: current project/files/context.
- Main: conversation, plan, and proposed steps.
- Right: capability palette and approval queue.
- Bottom/on demand: diff preview, terminal/test output, event timeline.

## Harvest patterns

- Cline: Plan/Act separation and visible approvals.
- Aider: repo-aware coding loop and git/diff workflow.
- lazygit: calm keyboard-first pane layout.
- OpenHands: task visibility/canvas concepts, not platform adoption.
- CodeMirror/Monaco: code and diff review.
- xyflow/React Flow: bounded graph views only.
- Mermaid: lightweight diagrams.
- Excalidraw: optional planning/sketch surface later.
- Open WebUI/LibreChat/AnythingLLM/Jan: chat/model/workspace references only.

## Anti-patterns

- giant generic dashboard,
- unbounded graph canvas,
- raw log flood,
- hidden tool calls,
- mouse-only approvals,
- plugin marketplace too early,
- unsafe apply without diff,
- too many always-on services.

## MVP visible by default

- task summary,
- interpreted intent,
- selected model/provider,
- local/cloud boundary,
- proposed plan,
- affected files,
- approval state,
- diff before write.

## Deferred

- multi-agent boards,
- huge graph maps,
- media pipeline UI,
- marketplace/plugin UI,
- background scanners,
- autonomous long-running execution.
