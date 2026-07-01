# EPK Copy Consistency AI Slice — 2026-07-01

## Status

Implemented and merged in `devknowsdev/EPK` PR #25.

## Purpose

Record the third completed app-side Music/Career slice after the Beam EPK → Music/Career boundary reframe.

This slice adds read-only copy consistency checking across EPK Biography, offerings, and credits. It is a findings-only review surface, not a rewriting or publishing feature.

## Implemented slice

`career.check_epk_copy_consistency`

Flow:

```text
EPK publisher Biography, offerings, and credits
→ minimized public-copy snapshot
→ Spectra /api/v1/ai/request
→ sourceApp=EPK
→ intent=career.check_epk_copy_consistency
→ riskClass=read-only
→ preferredMode=local-first
→ visible findings panel
→ clear findings only
```

## Changed app files

EPK PR #25:

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-consistency.js`
- `EPK/public/publisher/publisher.css`
- `EPK/scripts/test-career-copy-consistency.mjs`

## Request shape

- `sourceApp: "EPK"`
- `intent: "career.check_epk_copy_consistency"`
- `riskClass: "read-only"`
- `preferredMode: "local-first"`
- `input.copy`: minimized public copy fields from Biography, offerings, and credits
- `input.instruction`: review for internal consistency, duplicated ideas, unclear claims, tone mismatch, and factual drift; do not rewrite; do not invent facts; return findings only
- `context.appSurface: "publisher"`
- `context.reviewType: "copy-consistency"`

## Data minimization

The checker sends only relevant public copy fields:

- Biography copy
- offering title/description/tags
- credit title/role/year/description/tags

It does not send publisher settings, GitHub or local tokens, private notes, links, contact endpoint config, or raw full editor JSON beyond the required public copy fields.

## Review outcome

The slice stays inside the approved EPK → Spectra boundary. EPK does not own provider/model routing. Spectra already accepts arbitrary non-empty read-only intents while enforcing `riskClass: "read-only"`, so no cross-repo change was required.

## Validation reported by Codex

- `node --check EPK/public/publisher/publisher-ai-consistency.js`
- `node EPK/scripts/test-career-copy-consistency.mjs`
- `node EPK/scripts/test-career-refine-epk-copy.mjs`
- `node EPK/scripts/validate-epk-admin-upgrade.mjs`
- `git diff --check`
- Browser check against a Spectra-shaped local mock:
  - Check copy consistency control appears.
  - Missing token stops before `fetch` and shows a clear warning.
  - Structured findings render visibly and clear cleanly.
  - Biography, offering, and credit fields remain unchanged.
  - Captured request retains `sourceApp`, `intent`, `riskClass`, and `preferredMode`.
  - Existing Biography, offering, and credit refinement still returns separate review drafts.
  - No console errors.
  - No publish/export action invoked.

## Guardrails confirmed

- No rewriting.
- No automatic apply.
- No input dispatch.
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

## Related Beam references

- `context-packs/epk/current-surface.min.md`
- `context-packs/epk/current-surface.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
