# EPK Promo Copy AI Slice — 2026-07-01

## Status

Implemented and merged in `devknowsdev/EPK` PR #26.

## Purpose

Record the fourth completed app-side Music/Career slice after the Beam EPK → Music/Career boundary reframe.

This slice adds suggestion-only Promo Kit copy refinement for the generated Markdown promo brief. It is a review surface only, not an Apply, source-mutation, publishing, or export feature.

## Implemented slice

`career.refine_epk_promo_copy`

Flow:

```text
EPK publisher Promo Kit generated Markdown brief
→ Spectra /api/v1/ai/request
→ sourceApp=EPK
→ intent=career.refine_epk_promo_copy
→ riskClass=read-only
→ preferredMode=local-first
→ visible discardable draft suggestion
→ no Apply
→ no source mutation
```

## Changed app files

EPK PR #26:

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-promo-refine.js`
- `EPK/scripts/test-career-promo-refine.mjs`

## Request shape

- `sourceApp: "EPK"`
- `intent: "career.refine_epk_promo_copy"`
- `riskClass: "read-only"`
- `preferredMode: "local-first"`
- `input.text`: generated Markdown promo brief
- `input.instruction`: refine for clarity, flow, and usefulness to presenters, venues, press, or collaborators while preserving facts and not inventing details
- `context.appSurface: "publisher"`
- `context.field: "brief-text"`

## Source and mutation posture

The source is the generated Promo Kit Markdown brief in `#brief-text`.

The helper does not provide an Apply button because the source brief is generated/read-only. The suggestion can be discarded. The generated source brief remains unchanged.

## Review outcome

The slice stays inside the approved EPK → Spectra boundary. EPK does not own provider/model routing. Spectra already accepts arbitrary non-empty read-only intents while enforcing `riskClass: "read-only"`, so no cross-repo change was required.

## Validation reported by Codex

- `node --check EPK/public/publisher/publisher-ai-promo-refine.js`
- `node EPK/scripts/test-career-promo-refine.mjs`
- `node EPK/scripts/test-career-refine-epk-copy.mjs`
- `node EPK/scripts/test-career-copy-consistency.mjs`
- `node EPK/scripts/validate-epk-admin-upgrade.mjs`
- `git diff --check`
- Browser check against a Spectra-shaped local mock:
  - `Refine promo copy` appears beside generated brief actions.
  - `#brief-text` contains the generated Markdown promo brief.
  - Captured request retains `sourceApp`, `intent`, `riskClass`, `preferredMode`, and `context.field`.
  - Mock receives the configured local token header.
  - Suggestion renders in `#promo-refine-draft`.
  - `#brief-text` remains byte-for-byte unchanged.
  - No Apply button appears in the Promo Kit suggestion panel.
  - Discard hides the panel and clears the suggestion while preserving source brief.
  - Existing Biography, offering, and credit refinement still render separate review drafts.
  - Copy consistency findings still render and clear correctly.
  - Browser console errors: `[]`.
  - No publish/export action occurred.

## Guardrails confirmed

- No Apply button.
- No generated source brief mutation.
- No hidden publish/export/email action.
- No downloads.
- No localStorage writes.
- No EPK-local AI provider/model wiring.
- No social/supporter/platform adapter.
- No Focus cadence automation.
- No new schema.
- No new repo.
- No broader Music/Career cockpit.

## Do not infer

Do not infer broader Music/Career implementation from this slice. The implemented app-side surface is limited to:

1. Biography copy refinement.
2. Offering and credit description refinement.
3. Read-only copy consistency checking across Biography, offerings, and credits.
4. Suggestion-only Promo Kit copy refinement.

## Related Beam references

- `context-packs/epk/current-surface.min.md`
- `context-packs/epk/current-surface.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
