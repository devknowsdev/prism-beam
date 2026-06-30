# Prism Workspace Current State — Mini

**Purpose:** Tier-1 suite orientation for low-token AI sessions.

**Last verified:** 2026-06-30  
**Verified against:** Direct clone + live `npm run typecheck`/test runs on `devknowsdev/prism-spectra:spectra-project-cockpit-20260629` and `codex/cockpit-approval-ledger`, not report-only.
**Target budget:** 500-1,000 tokens
**Scope:** Prism suite repo roles and current direction. Source code still overrides this pack.

## Suite map

- `prism-beam`: AI-facing reference, context, contracts, schemas, harvest, prompt, anti-drift, and handover layer. Not runtime code.
- `prism-spectra`: live AI cockpit, local-first model/runtime router, CLI/workbench, approval-gated execution, checkpoint/rollback, provenance, capability palette.
- `prism-focus`: downstream planning/focus app. Should request AI services through Spectra and keep task/planner writes review-first.
- `EPK`: downstream public music/professional app. Should request AI services through Spectra.

## Current strategic direction

Spectra is the local-first AI engine/cockpit for Prism. Beam should minimize repeated orientation and token usage by storing compact, verified context packs and research summaries. Focus should consume Spectra through a small adapter/gateway surface, not by owning model/provider routing.

## Current project state

- Spectra routing work is merged through Tier 3c on `devknowsdev/prism-spectra:main`: Tier 2b routing intelligence, Tier 3a semantic cache, Tier 3b route decision cache hints/engine wiring, and Tier 3c telemetry/export hardening.
- Focus branch `spectra-focus-ai-init-20260627` is staged and locally browser-validated in mock mode. Real-mode validated end-to-end on 2026-06-30: root cause of empty/unstructured real-chat responses was Focus's JSON instruction being buried in a context dump and contradicted by a generic closing line; fixed via a single `expectsJson` signal plus Ollama's native `format`/`think:false` parameters (`prism-spectra` commit `87dcebd`). `qwen3.5:9b` now returns populated `structuredResponse` with task/schedule proposals (~23s local inference).
- Current local model stack: `qwen3.5:9b` for general/planner/reasoner, `qwen3:1.7b` for classifier/fallback, and `qwen2.5-coder:7b` for coder.
- Local resource safety matters on the M1 16GB target. Ollama model storage is persistent and can be large; Spectra `.demo` runtime files were tiny in validation.
- `spectra-project-cockpit-20260629` is mid-way through a coherence-correction queue (cockpit/engine code drifted from existing suite primitives): P0 Focus-JSON fix landed on the branch; P1 (cockpit actions now route through `ApprovalQueue`/`PrismEventLedger` instead of a bespoke packet) is implemented and pushed to `codex/cockpit-approval-ledger`, pending PR/merge; P2 (`runAiRequest` wired into the same cache/cascade path `runNode` already uses) and P3 (`aiRole`/`maxOutputTokens` set as structured fields instead of via intent-string regex) are scoped but not started.

## Operating rules

- Start with Beam before repo source.
- Read the smallest relevant pack.
- Escalate to source only for the exact task.
- Source code overrides stale docs.
- New findings should be compressed back into Beam.
- Avoid broad repo scans as default orientation.

## Safety rules

- No hidden writes.
- No hidden model escalation to cloud.
- No direct Focus/EPK-to-model routing.
- No destructive or external action without explicit approval.
- Preview/propose must stay separate from execute/apply.
- Checkpoint before risky writes.
- Log model/provider/action provenance where relevant.
- Keep real local model tests short until resource status is visible.

## Next likely work

- Get `codex/cockpit-approval-ledger` (P1) reviewed and merged into `spectra-project-cockpit-20260629` before starting P2.
- Implement P2/P3: extract `runNode`'s cache→route→execute→confidence-gate→retry sequence into a shared method, wire `runAiRequest` into it, and set `aiRole`/`maxOutputTokens` as structured fields. See `prism-spectra/docs/GPT_BUILD_PLAN_COCKPIT_ENGINE_FOCUS_JSON_20260630.md` §3–4.
- Add a Focus/Spectra local resource/status monitor: disk free, `.ollama` size, Spectra `.demo` size, memory pressure, loaded Ollama model, top CPU process, gateway mode/health, and thermal warning state where available.
- Refresh Focus setup/model guidance to current local stack.
- Add a lighter real-mode classifier smoke path or output cap for Settings -> Test Spectra.
- Keep Beam current and compact after each validation pass.
