# Spectra as Suite AI Engine

Date: 2026-06-25
Repos evidenced: `devknowsdev/prism-spectra`, `devknowsdev/prism-focus`, `devknowsdev/EPK`, `devknowsdev/prism-beam`

## Purpose

Record the canonical Prism suite decision that `prism-spectra` is the overall AI
engine and central orchestration hub for the suite.

Ollama is a local model provider behind Spectra. It is not a separate AI engine
that each Prism app should integrate independently.

## Canonical decision

```text
Spectra is the suite AI engine.
Beam is the suite AI memory/reference layer.
Focus is a human planning/task app that may request AI help from Spectra.
EPK is public/promotional truth that may request AI help from Spectra.
Ollama is one provider behind Spectra, not one app-local integration per app.
```

## Why this matters

The suite should learn and grow through one central local hub instead of splitting
AI behavior across app-local provider settings.

Centralizing AI through Spectra gives the suite one place for:

- provider routing
- local Ollama configuration
- paid/cloud provider fallback policy
- model selection
- task graph planning
- approvals
- checkpoints and rollback
- execution provenance
- provider outcome learning
- conversations and attachments
- future cross-app memory coordination

## Current evidence

### Spectra already owns the orchestration role

`prism-spectra` describes itself as the local-first AI orchestration and execution
engine for the Prism workspace. It owns routing, memory, checkpointing,
capability surfaces, adapters, safety, and execution provenance.

Key current files:

- `prism-spectra/README.md`
- `prism-spectra/src/executors/ollama.ts`
- `prism-spectra/src/executors/index.ts`
- `prism-spectra/src/routing/router.ts`
- `prism-spectra/src/intelligence/learningLoop.ts`
- `prism-spectra/src/engine/executionEngine.ts`
- `prism-spectra/tools/daemon.ts`

### Spectra already has Ollama provider plumbing

Current Spectra Ollama executor evidence:

- default host: `http://127.0.0.1:11434`
- coder model: `qwen2.5-coder:7b`
- general model: `qwen3:9b`
- local provider probe through `/api/tags`
- local model calls through Ollama HTTP
- model choice based on task packet node type

### Spectra already has routing and learning primitives

Current Spectra routing evidence:

```text
ollama -> free_tier -> paid provider
```

The learning loop records provider outcomes and updates routing weights by
provider and node type. This is currently provider-routing learning, not yet a
complete personal-memory system.

### Focus still has legacy direct AI surfaces

Focus currently has direct provider logic in `prism-focus/src/ai.js`, including
local Ollama and browser-side Anthropic calls. This should now be treated as a
legacy/transition surface, not the desired long-term architecture.

Focus also already has a better bridge in `prism-focus/src/ai_adapter_local.js`,
which talks to the local Spectra/AI daemon API on `127.0.0.1:3000`.

### EPK does not currently need direct provider wiring

EPK should stay focused on structured public/promotional truth and publisher
workflows. If EPK needs AI copy/planning help, it should request that through
Spectra rather than adding its own Ollama/provider logic.

## Target architecture

```text
Focus UI ─┐
          ├─ local adapter/request ─> Spectra daemon/API ─> provider gateway ─> Ollama / paid providers
EPK UI  ──┘                              │
                                         ├─ approvals
                                         ├─ checkpoints
                                         ├─ provenance
                                         ├─ task history
                                         ├─ learning loop
                                         ├─ conversations
                                         └─ attachments

Beam = canonical contracts/context/pattern memory, not runtime execution.
```

## App responsibilities

| Repo | AI responsibility |
| --- | --- |
| `prism-spectra` | Owns AI provider access, routing, learning, orchestration, approvals, execution provenance, local daemon/API, workbench, conversations, attachments. |
| `prism-focus` | Requests suggestions/plans through Spectra, reviews proposed changes, owns its local task/planner state. |
| `EPK` | Requests copy/planning help through Spectra when needed, owns public/promotional truth and publisher output. |
| `prism-beam` | Records contracts, cards, context packs, prompt packs, anti-drift rules. No runtime AI calls. |

## Anti-drift rules

- Do not add a separate Ollama integration to EPK.
- Do not expand Focus direct provider routing as the long-term path.
- Do not add app-local provider memory to Focus or EPK.
- Do not put runtime AI execution in Beam.
- Do not let Spectra mutate Focus or EPK state without an explicit review/import
  or approval boundary.
- Do not treat Spectra's current routing learning as full personal memory; it is
  provider/outcome learning until broader memory contracts are added.
- Do not enable real provider calls during setup/doctor paths.
- Do not make Spectra automation of EPK -> Focus task creation implicit; the
  manual review-first loop remains the safety boundary until a later contract says
  otherwise.

## Migration direction

### Step 1 — Beam records the boundary

This card and `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md` make the suite decision
canonical before runtime changes.

### Step 2 — Spectra adds a plain AI request contract

Recommended next Spectra sprint:

```text
Spectra-AI-Gateway-001 — add POST /api/v1/ai/request as a read-only routed AI request endpoint
```

The endpoint should support Focus/EPK feature requests without forcing every
request into a graph execution path.

### Step 3 — Focus prefers Spectra for AI calls

Recommended Focus sprint after Spectra has the endpoint:

```text
Focus-AI-Bridge-001 — route aiCall through AiAdapter/Spectra before legacy direct providers
```

Focus should keep local review/confirmation behavior for imported or created
state. Direct Ollama/Anthropic settings should become legacy fallback, then be
removed after the Spectra path is comfortable.

### Step 4 — EPK uses Spectra only if AI is needed

Recommended future EPK sprint only when needed:

```text
EPK-AI-Bridge-001 — request promo copy/planning help through Spectra without direct provider wiring
```

## Minimum Spectra API shape

Suggested read-only request endpoint:

```http
POST /api/v1/ai/request
```

Suggested payload:

```json
{
  "sourceApp": "prism-focus",
  "intent": "daily-plan-suggestion",
  "riskClass": "read-only",
  "input": {},
  "context": {},
  "preferredMode": "local-first"
}
```

Suggested response:

```json
{
  "ok": true,
  "provider": "ollama",
  "model": "qwen3:9b",
  "response": {},
  "provenance": {
    "routedBy": "prism-spectra",
    "recorded": true
  }
}
```

## Future prompts can omit

Future prompts can omit the decision that Spectra is the suite AI engine, the
rule that Ollama belongs behind Spectra rather than inside each app, the warning
that Focus direct AI providers are legacy/transition surfaces, and the
recommendation to add a Spectra `/api/v1/ai/request` endpoint before migrating
Focus feature calls.
