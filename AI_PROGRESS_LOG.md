# AI Progress Log

**Purpose:** Single current handover/changelog file for AI-to-AI continuity across GPT, Claude, Codex, DeepSeek, Gemini, local models, and future agents.

**Last updated:** 2026-06-29
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Read this when

- starting any Beam-connected AI session,
- continuing work another AI began,
- deciding what changed recently,
- writing a handover,
- or checking whether a task is already done.

## Update this when

- you create, modify, or delete files,
- you make or confirm an architecture decision,
- you find source/Beam mismatch,
- you leave a task partially complete,
- or you produce a continuation prompt.

## Current active handover

**Status:** Spectra Tier 1 (PR #22), Tier 2a (PR #23), and the Spectra side of the Focus/Spectra AI bridge (PR #24) are all merged to `main`. ADR-010 is committed to Spectra. Beam's Spectra current-surface/model-routing packs and suite-AI app card are refreshed. The broken `qwen3:9b` default was removed from active Spectra code/tests/bootstrap docs; invalid-tag mentions remain only as warnings/history. Dave locally pulled the required Ollama models and validated Spectra `main`: typecheck clean, `test:ai-request` passed, `npm test` passed 64/64. The Focus repo side of `spectra-focus-ai-init-20260627` is still unmerged and was last checked at 34 ahead / 0 behind `main`.

**Most recent completed work:** GPT fixed the local Ollama model stack to `qwen3.5:9b` for general/planner/reasoner, `qwen2.5-coder:7b` for coder, and `qwen3:1.7b` for classifier/fallback; added ADR-010; refreshed Beam routing docs; updated bootstrap/gateway docs and the AI request test expectation. Dave then confirmed all three models pull successfully and local validation passes.

**Current next priority:** Spectra Tier 2b: wire `classifyIntent()` through `ModelLock`, implement real `localTierAvailable()`, add L1 heuristic classification, add confidence scoring/cascade quality-gate scaffolding, and log fallback reasons. Alternative priority: browser-validate the Focus repo side of `spectra-focus-ai-init-20260627` before opening that PR.

**Known caution:** `classifyIntent()` is still an unwired primitive and must go through `ModelLock` when wired. `localTierAvailable()` is still a router stub. Focus chat attachments still depend on the full daemon file API.

## Recent session entries

### 2026-06-29 — GPT-5.5 Thinking — Spectra routing docs, model-tag fix, and local validation

**Task:** Continue Claude's routing-intelligence documentation work, verify live Beam/Spectra state, fix the broken Ollama tag, commit all pending docs/code updates, and record Dave's local validation output.

**Files changed:**

- `devknowsdev/prism-spectra:src/executors/ollama.ts` — changed `OLLAMA_GENERAL_MODEL` from nonexistent `qwen3:9b` to `qwen3.5:9b`; catalog now uses `qwen3.5:9b` for planner/reasoner and `qwen3:1.7b` for classifier/fallback.
- `devknowsdev/prism-spectra:docs/adr/ADR-010-routing-intelligence-architecture.md` — added accepted ADR covering cascade quality-gate, L1/L2 classification, semantic cache, circuit breaker, warm routing, telemetry, model capability profiles, and build order.
- `devknowsdev/prism-spectra:tools/bootstrap-local-ai.sh` — default bootstrap now pulls coder, general, and classifier models; guards against invalid `qwen3:9b` override.
- `devknowsdev/prism-spectra:docs/LOCAL_AI_BOOTSTRAP.md` and `docs/AI_REQUEST_GATEWAY.md` — updated model stack and real-by-default/mock-mode guidance.
- `devknowsdev/prism-spectra:test/ai-request.test.ts` — expected mock model updated to `qwen3.5:9b`.
- `devknowsdev/prism-beam:context-packs/prism-spectra/model-routing-current.md` — replaced stale routing pack with ADR-010-aware version.
- `devknowsdev/prism-beam:context-packs/prism-spectra/current-surface.min.md` — refreshed Tier 2a, PR #22/#23/#24, qwen model stack, Focus bridge status, ADR-010 reference, and Tier 2b+ build targets. Note: this mini-pack still has an older test-suite line; progress log is newer for validation status.
- `devknowsdev/prism-beam:docs/app-cards/SPECTRA_AS_SUITE_AI_ENGINE.md` — updated suite-AI engine card with current Spectra model stack and ADR-010 direction.
- `devknowsdev/prism-beam:AI_PROGRESS_LOG.md` — compacted and refreshed this handover; later updated with Dave's local validation output.

**Outcome:** Beam now orients future AIs correctly for Spectra routing work. Spectra no longer has active code/test/bootstrap defaults expecting the invalid `qwen3:9b` tag.

**Validation:** GitHub connector verification confirmed updated `ollama.ts`, ADR-010, bootstrap script, gateway docs, AI request test, Beam routing pack, Beam Spectra mini-pack, and progress log. Dave then ran local validation on `prism-spectra` main: `ollama pull qwen3.5:9b`, `ollama pull qwen3:1.7b`, and `ollama pull qwen2.5-coder:7b` all succeeded; `npm run typecheck` passed; `npm run test:ai-request` passed; `npm test` passed 64/64.

**Next suggested step:** Tier 2b implementation in one PR: real `localTierAvailable()`, L1 classifier, `classifyIntent()` via `ModelLock`, confidence scoring, and cascade-quality logging.

**Next AI should read:** `AI_LOAD_ME_FIRST.md`, `AI_PROGRESS_LOG.md`, `context-packs/prism-spectra/model-routing-current.md`, `prism-spectra/docs/adr/ADR-010-routing-intelligence-architecture.md`, and optionally `context-packs/prism-spectra/current-surface.min.md` with the note that AI_PROGRESS_LOG has newer validation status.

### 2026-06-29 — Claude (Sonnet 4.6) — Routing intelligence architecture drafted

Claude audited Beam/Spectra/Focus context and produced the ADR-010 draft plus Beam routing-pack replacement and Spectra mini-pack patch notes. Key findings: the routing-intelligence plan had not been committed to Beam; `classifyIntent()` existed but was unwired; `localTierAvailable()` was still a stub; the Focus repo side of the bridge remained unmerged; and Track B `modelRegistry.ts` ideas should be ported into Track A only, not expanded directly.

### 2026-06-29 — Claude (Sonnet 4.6) — Spectra-side Focus AI bridge merged

PR #24 (`spectra-focus-ai-init-20260627` → Spectra `main`) was opened and merged. It added `tools/focus-ai-smoke.ts`, `docs/FOCUS_AI_INIT.md`, and npm scripts `test:focus-ai` / `focus:ai:gateway`. Validation before merge: typecheck clean, `npm test` 59/60 with same pre-existing daemon e2e failure. Caution: this covered Spectra only; the Focus repo branch is separate and still needs browser validation.

### 2026-06-29 — Claude (Sonnet 4.6) — Spectra Tier 2a merged

PR #23 added Track A local model catalog support in `src/executors/ollama.ts`: `ModelRole`, `LocalModelEntry`, `LOCAL_MODEL_CATALOG`, `ROLE_BY_NODE_TYPE`, `selectModelForRole()`, legacy env-var compatibility, and standalone `classifyIntent()` primitive. Typecheck clean; `npm test` 59/60 with the same pre-existing daemon e2e failure. `classifyIntent()` remained unwired.

### 2026-06-28 — Claude (Sonnet 4.6) + GPT — Spectra Tier 1 router truth

PR #22 wired Ollama health probing into daemon/gateway startup, inverted mock executor flag to real-by-default (`AI_FORGE_MOCK_EXECUTORS=1` for mocks), added router stub caution, and added ADR-0025 superseding padded ADR-0009–0024. Branch validation before merge: typecheck clean and `npm test` 60/60 on branch.

### 2026-06-27 — GPT — Focus + Spectra AI bridge staged and compressed

Staged a Spectra-first Focus AI bridge: Focus local adapter/settings/chat/apply code on `prism-focus:spectra-focus-ai-init-20260627`, Spectra gateway smoke docs/scripts, and Beam compression-back docs. User manually validated Spectra mock mode and real Ollama mode with `qwen3:8b` at the time. App branches were not fully merged; Focus side remains pending browser validation and PR.
