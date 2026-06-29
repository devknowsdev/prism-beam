# AI Progress Log

**Purpose:** Single current handover/changelog file for AI-to-AI continuity across GPT, Claude, Codex, DeepSeek, Gemini, local models, and future agents.

**Last updated:** 2026-06-29
**Target budget:** 1,000-3,000 tokens
**Hard max:** 5,000 tokens

## Current active handover

**Status:** Spectra Tier 1 (PR #22), Tier 2a (PR #23), the Spectra side of the Focus/Spectra AI bridge (PR #24), and Spectra Tier 2b routing intelligence (PR #25) are merged to `devknowsdev/prism-spectra:main`. ADR-010 is committed to Spectra. Beam routing docs were refreshed before Tier 2b; this progress log is the freshest Spectra status source.

**Most recent completed work:** PR #25 implemented Track A Tier 2b routing intelligence: pure L1 heuristic classification, explicit `aiRole` model-role handling, provider availability state in the router, probe status sharing with the router, live classifier calls through `LocalModelLock`, local confidence scoring, low-confidence retry scaffolding, and focused Tier 2b tests.

**Validation:** Dave locally ran `npm run typecheck`, `npm run test:tier2b`, and `npm test` after the final classifier-weight fix. Results: typecheck clean; Tier 2b tests 7/7; original suite 60/60; combined `npm test` runs original 60 plus Tier 2b 7. GitHub Actions on PR #25 were also green: `Run AI-Forge Tests` and `Docs Lint` completed successfully.

**Current next priority:** Spectra Tier 3a: semantic cache Layer B plus Ollama embedding keepalive. Keep embeddings derived/rebuildable and retrieval advisory per ADR-005 through ADR-009. Alternative priority: browser-validate the Focus repo side of `spectra-focus-ai-init-20260627` before opening that PR.

**Known caution:** Tier 2b is merged, but live classifier behavior should still be exercised with real Ollama workloads. Focus chat attachments still depend on the full daemon file API. The Focus repo side of `spectra-focus-ai-init-20260627` is still unmerged and was last checked at 34 ahead / 0 behind `main`.

## Recent session entries

### 2026-06-29 — GPT-5.5 Thinking — Spectra Tier 2b routing intelligence merged

PR #25 (`feat: add Tier 2b routing intelligence`) was opened from `spectra-tier2b-routing-intelligence-20260629` and merged to Spectra `main` on 2026-06-29. It changed 9 files: `package.json`, `src/config/providerProbe.ts`, `src/engine/executionEngine.ts`, `src/executors/ollama.ts`, `src/index.ts`, `src/routing/l1Classifier.ts`, `src/routing/router.ts`, `src/types.ts`, and `test/tier2b-routing.test.ts`.

Local validation after the final fix: `npm run typecheck` passed, `npm run test:tier2b` passed 7/7, and `npm test` passed the original 60 tests plus the 7 Tier 2b tests. GitHub Actions also passed for the PR head.

Next suggested implementation is Tier 3a: semantic cache Layer B, Ollama embedding keepalive, derived/rebuildable vector metadata, graceful no-vector fallback, and clear cache-vs-ledger boundaries.

### 2026-06-29 — GPT-5.5 Thinking — Spectra routing docs, model-tag fix, and local validation

GPT fixed the local Ollama model stack to `qwen3.5:9b` for general/planner/reasoner, `qwen2.5-coder:7b` for coder, and `qwen3:1.7b` for classifier/fallback; added ADR-010; refreshed Beam routing docs; updated bootstrap/gateway docs and the AI request test expectation. Dave confirmed all three models pull successfully and local validation passed on Spectra `main` before Tier 2b: `npm run typecheck`, `npm run test:ai-request`, and `npm test` 64/64.

### 2026-06-29 — Claude (Sonnet 4.6) — Routing intelligence architecture drafted

Claude audited Beam/Spectra/Focus context and produced the ADR-010 draft plus Beam routing-pack replacement and Spectra mini-pack patch notes. Key findings: the routing-intelligence plan had not been committed to Beam; `classifyIntent()` existed but was unwired; `localTierAvailable()` was still a stub; the Focus repo side of the bridge remained unmerged; and Track B `modelRegistry.ts` ideas should be ported into Track A only, not expanded directly.

### 2026-06-29 — Claude (Sonnet 4.6) — Spectra-side Focus AI bridge merged

PR #24 (`spectra-focus-ai-init-20260627` → Spectra `main`) was opened and merged. It added `tools/focus-ai-smoke.ts`, `docs/FOCUS_AI_INIT.md`, and npm scripts `test:focus-ai` / `focus:ai:gateway`. This covered Spectra only; the Focus repo branch is separate and still needs browser validation.

### 2026-06-29 — Claude (Sonnet 4.6) — Spectra Tier 2a merged

PR #23 added Track A local model catalog support in `src/executors/ollama.ts`: `ModelRole`, `LocalModelEntry`, `LOCAL_MODEL_CATALOG`, `ROLE_BY_NODE_TYPE`, `selectModelForRole()`, legacy env-var compatibility, and standalone `classifyIntent()` primitive. `classifyIntent()` remained unwired until Tier 2b.

### 2026-06-28 — Claude (Sonnet 4.6) + GPT — Spectra Tier 1 router truth

PR #22 wired Ollama health probing into daemon/gateway startup, inverted mock executor flag to real-by-default (`AI_FORGE_MOCK_EXECUTORS=1` for mocks), added router stub caution, and added ADR-0025 superseding padded ADR-0009–0024. Branch validation before merge: typecheck clean and `npm test` 60/60 on branch.

### 2026-06-27 — GPT — Focus + Spectra AI bridge staged and compressed

Staged a Spectra-first Focus AI bridge: Focus local adapter/settings/chat/apply code on `prism-focus:spectra-focus-ai-init-20260627`, Spectra gateway smoke docs/scripts, and Beam compression-back docs. App branches were not fully merged; Focus side remains pending browser validation and PR.
