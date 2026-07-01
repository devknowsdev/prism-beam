# EPK Refine Copy AI Slice — 2026-07-01

## Status

Implemented and merged in `devknowsdev/EPK` PR #23 and PR #24.

## Purpose

Record the first two completed app-side Music/Career slices after the Beam EPK → Music/Career boundary reframe.

## Implemented slice

`career.refine_epk_copy`

Flow:

```text
EPK publisher Biography, offering description, and credit description fields
→ Spectra /api/v1/ai/request
→ sourceApp=EPK
→ intent=career.refine_epk_copy
→ riskClass=read-only
→ preferredMode=local-first
→ visible discardable draft suggestion
→ manual Apply only
```

## Changed app files

EPK PR #23:

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-refine.js`
- `EPK/public/publisher/publisher.css`
- `EPK/scripts/test-career-refine-epk-copy.mjs`

EPK PR #24:

- `EPK/public/publisher/publisher-ai-refine.js`
- `EPK/scripts/test-career-refine-epk-copy.mjs`

## Request shape

- `sourceApp: "EPK"`
- `intent: "career.refine_epk_copy"`
- `riskClass: "read-only"`
- `preferredMode: "local-first"`
- `input.text`: currently edited field text
- `input.instruction`: refine for clarity/flow while preserving facts and not inventing details
- `context.appSurface: "publisher"`
- `context.field`: `bio.short`, `bio.acoustic`, `bio.full`, `offerings[n].description`, or `credits[n].description`

## Review outcome

Claude approved the boundary with one required fix before merge: remove the shippable default local auth fallback. Codex fixed this before merge so missing local auth fails closed before the request.

EPK PR #24 reused that approved request path and intent. It added dynamic description controls and event delegation without adding another endpoint, provider wiring, schema, or write path.

## Validation reported by Codex

- `node --check EPK/public/publisher/publisher-ai-refine.js`
- `node EPK/scripts/test-career-refine-epk-copy.mjs`
- `node EPK/scripts/validate-epk-admin-upgrade.mjs`
- `git diff --check`
- Browser check against a Spectra-shaped local mock:
  - suggestion appears while source text remains unchanged;
  - discard preserves source text;
  - apply changes source text only after explicit click through existing input handler;
  - no console errors;
  - no publish/export action invoked.

For EPK PR #24, Codex additionally reported:

- Biography, offering, and credit refinement passed browser validation.
- Add, duplicate, reorder, and delete rerender paths preserved dynamic controls.
- Tokenless requests stopped before `fetch`.
- Captured requests retained `sourceApp`, `intent`, `riskClass`, and `preferredMode`.
- No console errors.
- No publish/export action occurred.

## Guardrails confirmed

- No EPK-local AI provider/model wiring.
- No hidden publish/export/email action.
- No social/supporter/platform adapter.
- No Focus cadence automation.
- No new schema.
- No new repo.
- No broader Music/Career cockpit.

## Do not infer

Do not infer broader Music/Career implementation from these slices. The implemented app-side surface is limited to:

1. Biography copy refinement.
2. Offering and credit description refinement.

## Related Beam references

- `context-packs/epk/current-surface.min.md`
- `context-packs/epk/current-surface.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
