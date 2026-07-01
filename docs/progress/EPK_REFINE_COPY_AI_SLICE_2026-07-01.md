# EPK Refine Copy AI Slice — 2026-07-01

## Status

Implemented and merged in `devknowsdev/EPK` PR #23.

## Purpose

Record the first completed app-side Music/Career slice after the Beam EPK → Music/Career boundary reframe.

## Implemented slice

`career.refine_epk_copy`

Flow:

```text
EPK publisher Biography fields
→ Spectra /api/v1/ai/request
→ riskClass=read-only
→ visible discardable draft suggestion
→ manual Apply only
```

## Changed app files

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-refine.js`
- `EPK/public/publisher/publisher.css`
- `EPK/scripts/test-career-refine-epk-copy.mjs`

## Request shape

- `sourceApp: "EPK"`
- `intent: "career.refine_epk_copy"`
- `riskClass: "read-only"`
- `preferredMode: "local-first"`
- `input.text`: currently edited Biography field text
- `input.instruction`: refine for clarity/flow while preserving facts and not inventing details
- `context.appSurface: "publisher"`
- `context.field`: `bio.short`, `bio.acoustic`, or `bio.full`

## Review outcome

Claude approved the boundary with one required fix before merge: remove the shippable default local auth fallback. Codex fixed this before merge so missing local auth fails closed before the request.

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

## Guardrails confirmed

- No EPK-local AI provider/model wiring.
- No hidden publish/export/email action.
- No social/supporter/platform adapter.
- No Focus cadence automation.
- No new schema.
- No new repo.
- No broader Music/Career cockpit.

## Do not infer

Do not infer broader Music/Career implementation from this slice. Only Biography copy refinement exists app-side.

## Related Beam references

- `context-packs/epk/current-surface.min.md`
- `context-packs/epk/current-surface.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
