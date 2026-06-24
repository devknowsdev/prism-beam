# Suite AI Engine Update

Date: 2026-06-25

## Decision

`prism-spectra` is the Prism suite AI engine.

`prism-beam` remains the AI-facing reference and contract layer.

`prism-focus` and `EPK` are client apps that may request AI help from Spectra,
but they should not grow their own long-term provider routing or model-selection
systems.

Ollama is a local provider behind Spectra, not one separate app-local AI engine
per Prism app.

## Evidence checked

Spectra currently has:

- `src/executors/ollama.ts`
- `src/executors/index.ts`
- `src/routing/router.ts`
- `src/intelligence/learningLoop.ts`
- `src/engine/executionEngine.ts`
- `tools/daemon.ts`

Focus currently has:

- legacy direct provider code in `src/ai.js`
- local daemon bridge code in `src/ai_adapter_local.js`

EPK has no known direct provider wiring from the searched evidence.

## Beam files added

- `docs/app-cards/SPECTRA_AS_SUITE_AI_ENGINE.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`

## Next runtime step

Recommended Spectra sprint:

```text
Spectra-AI-Gateway-001 — add POST /api/v1/ai/request as a read-only routed AI request endpoint
```

That endpoint should let Focus and EPK ask for suggestions, parsing, summaries,
and drafts through Spectra without forcing every request into graph execution.

## Follow-up after Spectra endpoint exists

Recommended Focus sprint:

```text
Focus-AI-Bridge-001 — route aiCall through AiAdapter/Spectra before legacy direct providers
```

Focus direct provider settings should become an explicit legacy fallback, then be
removed after the Spectra path is comfortable.

## Safety notes

- Beam does not make runtime AI calls.
- Focus still owns task/planner state.
- EPK still owns public/promotional truth.
- Spectra should propose, preview, route, and execute through existing approval
  and checkpoint boundaries.
- EPK -> Focus remains review-first; Spectra should not automate that loop until
  a later contract explicitly permits it.
