# Prism Spectra Current Surface — Mini

**Purpose:** Tier-1 app card for low-token Spectra sessions.

**Last verified:** 2026-06-28
**Verified against:** direct source inspection of `devknowsdev/prism-spectra` main branch (tarballs + GitHub API), 2026-06-28
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
  Startup Ollama probe now wired to both daemon and gateway (Tier 1 — on branch pending PR merge).
  `localTierAvailable()` still a **stub** (always returns true) — TODO comment added, real fix is Tier 2.
- **Executors** — Ollama (`qwen3:9b` general, `qwen2.5-coder:7b` coding), Claude, GPT, terminal, mocks.
  Mock mode: set `AI_FORGE_MOCK_EXECUTORS=1`. Real executors are now default (post Tier 1).
- **Model lock** (`src/engine/modelLock.ts`) — serialising AsyncMutex around Ollama calls.
  Injects ~10s sleep on model switch. Do not remove — solves a real 16GB RAM constraint.
- **Learning loop** (`src/intelligence/learningLoop.ts`) — tracks `(provider, node_type)` success/cost/latency
  in `routing_weights` table. Never reorders tier chain; only breaks ties within the paid tier.
- **Pattern cache** (`src/memory/patternCache.ts`) — exact SHA-256 hash of `(node_type + intent + context)`.
  No fuzzy/semantic matching yet (Tier 0 + Tier 3 target).
- **Graph builder + Wizard** — real. Graph builder uses Claude for intent decomposition (requires API key),
  falls back to deterministic templates. Fallback template path ignores failure-avoidance notes
  (known gap, §4.8 of handover pack).
- **Capabilities layer** (`src/capabilities/`) — scaffold only. Every capability returns
  `{success: false, error: 'Not implemented'}`. Do not build on yet.
- **Test suite** — `npm test` (60/60 as of 2026-06-28), `npm run test:ai-request`, `npm run test:setup`.

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
npm test                # full e2e suite (60/60)
npm run test:ai-request # AI request contract test
npm run workbench       # start daemon (port AI_FORGE_DAEMON_PORT, default 3000)
npm run ai:gateway      # start AI-only gateway (same port default — do not run both at once)
npm run forge           # CLI
npm run demo            # demo run
```

⚠️ `npm run workbench` and `npm run ai:gateway` share the same default port via `AI_FORGE_DAEMON_PORT`.
Do not run both simultaneously without an explicit port override.

## Next planned build targets

- **Tier 2** — model registry revival: port role-tagged model catalog shape from Track B into Track A's `ollama.ts` (same ledger/lock path). Revive local pre-classifier idea through governed path.
- **Tier 0** — semantic primitive: `embedText()` via Ollama `/api/embed` + brute-force cosine in plain JS. No native dependency. Enables Tier 3 (fuzzy pattern cache, semantic failure-avoidance, adaptive wizard).

## Relevant Beam packs

- `context-packs/prism-spectra/harvest-current.md`
- `context-packs/prism-spectra/model-routing-current.md`
- `docs/research/spectra-openrouter-audit.md`
- `docs/research/deep-research-report.md` — Phase 5 (memory/search spec, unbuilt)
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `docs/patterns/APPROVAL_QUEUE_PATTERN.md`
- `docs/patterns/EVENT_LEDGER_PATTERN.md`
