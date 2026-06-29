# Prism Spectra Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Spectra sessions.

**Last verified:** 2026-06-29
**Verified against:** Tier 1 (PR #22), Tier 2a (PR #23), Focus bridge Spectra side (PR #24), and direct source inspection of `devknowsdev/prism-spectra` main branch, 2026-06-29.
**Scope:** `prism-spectra`. Verify source before implementation.

## Role

Spectra is Prism's live AI cockpit and orchestration engine: local-first model routing,
approval-gated execution, event ledger, checkpoint/rollback, capability palette,
and a full workbench HTTP API served by a long-running daemon.

## What is real and built

- **Daemon** (`npm run workbench`, `tools/daemon.ts`) — full workbench HTTP API. Not a POC.
  Endpoints include: attachment CRUD (`/api/v1/upload`, `/api/v1/workbench/attachments/*`),
  conversation management (`/api/v1/workbench/conversations/*`), SSE graph-execution streaming,
  per-node preview in isolated temp dirs, and changes feed (`/api/v1/workbench/changes?limit=N`).
- **AI request gateway** (`npm run ai:gateway`, `tools/ai-gateway.ts`) — fully wired.
  `POST /api/v1/ai/request` routes through real router → ledger → learning loop → provenance.
  Token-gated (`x-local-token` header). `GET /api/v1/health` available.
- **Router** (`src/routing/router.ts`) — cost-ascending tiers: ollama → free_tier → paid (gpt/claude).
  Startup Ollama probe is wired to both daemon and gateway (Tier 1 / PR #22 merged).
  `localTierAvailable()` still a **stub** (always returns true) — real fix is Tier 2b (ADR-010).
- **Executors** — Ollama (`qwen3.5:9b` general/planner/reasoner, `qwen2.5-coder:7b` coding,
  `qwen3:1.7b` classifier/fallback), Claude, GPT, terminal, mocks.
  Mock mode: set `AI_FORGE_MOCK_EXECUTORS=1`. Real executors are now default (post Tier 1).
  **Tier 2a additions in `src/executors/ollama.ts`:** `ModelRole` type, `LocalModelEntry` interface,
  `LOCAL_MODEL_CATALOG` (5 roles: classifier/planner/reasoner/coder/fallback, env-var override pattern),
  `ROLE_BY_NODE_TYPE` map, `selectModelForRole()`, `classifyIntent()` standalone primitive
  (15s timeout, 80-token limit, returns null on any failure).
  **`classifyIntent()` is unwired.** Wiring is Tier 2b and must go through `ModelLock`.
- **Model lock** (`src/engine/modelLock.ts`) — serialising AsyncMutex around Ollama calls.
  Injects ~10s sleep on model switch. Do not remove — solves a real 16GB RAM constraint.
- **Learning loop** (`src/intelligence/learningLoop.ts`) — tracks `(provider, node_type)` success/cost/latency
  in `routing_weights` table. Never reorders tier chain; only breaks ties within the paid tier.
- **Pattern cache** (`src/memory/patternCache.ts`) — exact SHA-256 hash of `(node_type + intent + context)`.
  No fuzzy/semantic matching yet (Tier 3a target).
- **Graph builder + Wizard** — real. Graph builder uses Claude for intent decomposition (requires API key),
  falls back to deterministic templates. Fallback template path ignores failure-avoidance notes
  (known gap, §4.8 of handover pack).
- **Capabilities layer** (`src/capabilities/`) — scaffold only. Every capability returns
  `{success: false, error: 'Not implemented'}`. Do not build on yet.
- **Focus AI bridge (Spectra side)** — `tools/focus-ai-smoke.ts`, `docs/FOCUS_AI_INIT.md`,
  `test:focus-ai` and `focus:ai:gateway` scripts. Merged PR #24. Focus repo side
  (`prism-focus:spectra-focus-ai-init-20260627`) is unmerged — currently 34 ahead / 0 behind main,
  needs browser validation before PR.
- **Test suite** — `npm test` (59/60 as of Tier 2a / PR #24 — 1 pre-existing daemon e2e failure,
  environment-dependent, not a regression), `npm run test:ai-request`, `npm run test:setup`.

## Track A vs Track B

**Track A — active.** `ExecutionEngine`, `TaskGraph`, `Router`, `Ledger`, `LearningLoop`,
`PatternCache`, `TaskHistory`, `CheckpointManager`, `GraphBuilder`, `Wizard`, `executors/*`,
canonical `src/types.ts`. Build here only.

**Track B — experimental, inert.** `src/runtime/**`, `src/events/**`, `routing/taskClassifier.ts`,
`routing/types.ts`, `types/contracts.ts`, `types/taskTypes.ts`, `config/modelRegistry.ts`,
`providers/ollamaClient.ts`, `executors/localExecutor.ts`, `memory/ledgerStore.ts`, `memory/replay.ts`.
Excluded from `tsconfig.test.json`. Unreachable from Track A's real execution path. Do not expand.

One Track B idea worth reviving deliberately: `config/modelRegistry.ts` role-tagged model catalog
(classifier/planner/reasoner/coder/fallback) — but must be ported into Track A's governed path
(ledger + model lock), not taken wholesale from Track B.

## ADR direction

ADR-005 through ADR-009 (no leading-zero padding) = active: SQLite canonical, embeddings derived
and rebuildable, retrieval advisory, graceful no-vector fallback required.

ADR-0009 through ADR-0024 (4-digit padded) = superseded by ADR-0025 (2026-06-28).
These are aspirational/historical. Do not build toward capability graphs or autonomy levels.

ADR-010 (2026-06-29) — routing intelligence architecture: cascade quality-gate,
L1/L2 classification, semantic caching, provider circuit breaker, telemetry.
See `prism-spectra/docs/adr/ADR-010-routing-intelligence-architecture.md`.

## Safety defaults

- Read/preview before write.
- Propose patches before applying.
- Approval required for write, destructive, external, expensive, and terminal/process actions.
- No hidden cloud escalation.
- No broad background scanning by default.
- Event/provenance logging required.

## Key commands

```bash
npm run doctor          # health check — run first
npm test                # full e2e suite (59/60; one known environment-dependent daemon e2e failure)
npm run typecheck       # TypeScript check via tsconfig.test.json
npm run test:ai-request # AI request contract test
npm run test:focus-ai   # Spectra-side Focus AI gateway smoke test
npm run workbench       # start daemon (port AI_FORGE_DAEMON_PORT, default 3000)
npm run ai:gateway      # start AI-only gateway (same port default — do not run both at once)
npm run forge           # CLI
npm run demo            # demo run
```

⚠️ `npm run workbench` and `npm run ai:gateway` share the same default port via `AI_FORGE_DAEMON_PORT`.
Do not run both simultaneously without an explicit port override.

## Next planned build targets

- **Tier 2b** — cascade quality-gate + L1 heuristic classification + real `localTierAvailable()`.
  Wire `classifyIntent()` through `ModelLock`. Add confidence scoring. No new dependencies.
- **Tier 3a** — semantic cache Layer B + embedding keepalive via Ollama embeddings.
- **Tier 3b** — L2 embedding classification + route decision cache.
- **Tier 4** — routing telemetry + full model capability profiles.

## Relevant Beam packs

- `context-packs/prism-spectra/harvest-current.md`
- `context-packs/prism-spectra/model-routing-current.md`
- `docs/research/spectra-openrouter-audit.md`
- `docs/research/deep-research-report.md` — Phase 5 (memory/search spec, unbuilt)
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `docs/patterns/APPROVAL_QUEUE_PATTERN.md`
- `docs/patterns/EVENT_LEDGER_PATTERN.md`
