# Suite AI Engine Boundary Contract

Status: Draft canonical boundary
Date: 2026-06-25
Owner: `prism-beam`
Runtime owner: `prism-spectra`

## Purpose

Define how AI responsibilities are divided across the Prism suite so the system
learns and grows through one central local hub instead of many disconnected
app-local AI integrations.

## Canonical decision

`prism-spectra` is the suite AI engine.

`prism-beam` is the AI-facing memory/reference layer.

`prism-focus` and `EPK` are client apps that may request AI assistance through
Spectra, but they should not own long-term provider routing, model selection, or
provider-learning behavior.

Ollama is a local model provider used by Spectra. It is not a separate AI engine
that should be configured independently by every app.

## Boundary table

| Concern | Owner | Notes |
| --- | --- | --- |
| Canonical AI/session memory for future agents | `prism-beam` | Docs, context packs, contracts, patterns, prompt packs. No runtime execution. |
| Runtime provider access | `prism-spectra` | Ollama and any paid/cloud providers are routed through Spectra. |
| Provider routing | `prism-spectra` | Cost-first local routing with learning-based paid provider preference. |
| Model selection | `prism-spectra` | App clients request intent/capability, not app-local models. |
| Provider outcome learning | `prism-spectra` | Current learning loop records provider/node-type outcomes. |
| Task graph planning/execution | `prism-spectra` | Uses approval, checkpoint, provenance, and validation boundaries. |
| Focus task/planner state | `prism-focus` | AI suggestions must still be reviewed before changing Focus state. |
| EPK public/promotional truth | `EPK` | AI help must remain draft/review-first before publication. |
| Cross-app contracts | `prism-beam` | Reference contracts only; implementation stays in app repos. |

## Allowed flows

### Focus asks for a suggestion

```text
Focus feature -> Focus AiAdapter -> Spectra daemon/API -> Spectra provider gateway -> provider response -> Focus review/UI
```

Allowed for task parsing, task breakdown, journal interpretation, daily plan
suggestions, day-end prompt suggestions, and plan previews.

Focus remains responsible for user review before adding tasks or changing planner
state.

### EPK asks for copy or planning help

```text
EPK publisher/admin action -> Spectra daemon/API -> provider response -> EPK draft/review UI
```

Allowed for draft promo copy, press blurb suggestions, event planning, and packet
suggestions.

EPK remains responsible for review before publishing, exporting, or writing
public data.

### Spectra executes a graph

```text
Client app/workbench -> Spectra graph/preview/approval -> Spectra execution engine -> checkpoint/provenance/logs
```

Execution must respect existing preview, approval, checkpoint, and rollback
expectations.

## Disallowed drift

- Do not make Focus the long-term owner of Ollama or provider routing.
- Do not add an EPK-local Ollama/provider router.
- Do not put runtime AI calls in Beam.
- Do not add hidden app-to-app sync.
- Do not bypass the Focus review/import boundary for EPK task packets.
- Do not run provider calls from setup/doctor paths.
- Do not expand Focus direct provider code as the primary AI architecture.

## Migration status

Spectra already has a local Ollama executor, executor registry, router, learning
loop, execution engine, daemon/workbench API surfaces, and conversation and
attachment surfaces.

Focus already has legacy direct AI provider code in `src/ai.js` and a better
local daemon bridge in `src/ai_adapter_local.js`.

EPK currently has no known direct provider wiring and should keep AI assistance
behind Spectra if it is added later.

## Required next runtime contract

Before migrating Focus feature calls, Spectra should expose a small read-only AI
request endpoint, separate from graph execution:

```text
POST /api/v1/ai/request
```

Minimum fields:

- `sourceApp`
- `intent`
- `riskClass`
- `input`
- `context`
- `preferredMode`

Minimum behavior:

- route through Spectra provider policy
- prefer local Ollama when available and appropriate
- record provider, model, and provenance
- return a structured response
- perform no app mutation

## Approval posture

Use `integrations/approval-posture.md` risk classes.

Default classification:

| Request | Default risk |
| --- | --- |
| AI suggestion / parse / summarize | `read-only` |
| Draft content in app UI | `local-draft` |
| Create Focus task from approved suggestion | `local-write` |
| Download/export generated file | `local-write` |
| Create external draft | `external-draft` |
| Publish/send/post/write to public or third-party system | `external-write` |
| Delete/overwrite canonical state | `destructive` |

## Future prompts can omit

Future prompts can assume that Spectra is the suite AI engine, Beam is not a
runtime AI engine, Ollama belongs behind Spectra, Focus direct providers are a
legacy/transition concern, and the next runtime step is a Spectra read-only
`/api/v1/ai/request` endpoint before migrating Focus feature calls.

## Update rules

Update this contract when Spectra adds the AI request endpoint, Focus migrates
`aiCall()` to Spectra-first behavior, EPK adds AI-assisted features, Spectra
changes provider routing/model selection/learning behavior, or the suite adds a
new app that requests AI assistance.
