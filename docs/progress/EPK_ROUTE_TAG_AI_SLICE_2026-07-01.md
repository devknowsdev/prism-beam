# EPK Route Tag AI Slice — 2026-07-01

## Status

Implemented and merged in `devknowsdev/EPK` PR #27.

## Purpose

Record the fifth completed app-side Music/Career slice after the Beam EPK → Music/Career boundary reframe.

This slice adds read-only Audience Page route-tag recommendations. It is a recommendation surface only, not a tag-apply, route-mutation, publishing, export, or Focus feature.

## Implemented slice

`career.suggest_epk_route_tags`

Flow:

```text
EPK publisher Audience Page card
→ minimized route/page context
→ public Biography/offering/credit context
→ Spectra /api/v1/ai/request
→ sourceApp=EPK
→ intent=career.suggest_epk_route_tags
→ riskClass=read-only
→ preferredMode=local-first
→ visible clearable recommendations
→ no Apply
→ no tag or route mutation
```

## Changed app files

EPK PR #27:

- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-route-helper.js`
- `EPK/scripts/test-career-route-tag-helper.mjs`

## Request shape

- `sourceApp: "EPK"`
- `intent: "career.suggest_epk_route_tags"`
- `riskClass: "read-only"`
- `preferredMode: "local-first"`
- `input.route`: minimized route/page context
- `input.content`: minimized public Biography, offering, and credit content
- `input.instruction`: recommend existing tags, offerings, credits, or biography angles; do not invent facts; do not rewrite copy; do not apply tags; return recommendations only
- `context.appSurface: "publisher"`
- `context.reviewType: "route-tag-recommendations"`

## Data minimization

The helper sends:

- route id, label, audience, bio style, sections, offering tags, and video tags;
- public Biography copy;
- offering titles, descriptions, and tags;
- credit titles, roles, years, descriptions, and tags.

It does not send local token values, private/contact configuration, raw full editor JSON, publisher settings, or unrelated admin data.

## Review outcome

The slice stays inside the approved EPK → Spectra boundary. EPK does not own provider/model routing. Spectra already accepts arbitrary non-empty read-only intents while enforcing `riskClass: "read-only"`, so no cross-repo change was required.

## Validation reported by Codex

- `node --check EPK/public/publisher/publisher-ai-route-helper.js`
- `node EPK/scripts/test-career-route-tag-helper.mjs`
- `node EPK/scripts/test-career-refine-epk-copy.mjs`
- `node EPK/scripts/test-career-copy-consistency.mjs`
- `node EPK/scripts/test-career-promo-refine.mjs`
- `node EPK/scripts/validate-epk-admin-upgrade.mjs`
- `git diff --check`
- Browser validation while serving `EPK/public` at `/publisher/`:
  - Six Audience Page cards rendered one `Suggest route tags` control each.
  - Without a token, the helper stopped before `fetch` and displayed the Spectra configuration warning.
  - With a configured mock, captured request retained `sourceApp`, `intent`, `riskClass`, and `preferredMode`.
  - Captured input contained minimized route context plus Biography, offering, and credit content.
  - No token/private/contact/raw-editor configuration was included.
  - Structured recommendations rendered in the separate `Route tag recommendations` panel.
  - Route inputs, selects, and checkboxes remained unchanged.
  - Biography, offering description, and credit description source fields remained unchanged.
  - No Apply control appeared.
  - Clear hid the panel and emptied its output.
  - Biography, offering, and credit refinement regressions passed.
  - Copy consistency regression passed.
  - Promo Kit refinement regression passed.
  - Browser console errors: `[]`.
  - No publish, export, download, or Focus action was invoked.

## Guardrails confirmed

- No Apply button.
- No automatic tag changes.
- No route mutation.
- No source-field mutation.
- No hidden publish/export/email action.
- No downloads.
- No Focus action.
- No EPK-local AI provider/model wiring.
- No social/supporter/platform adapter.
- No new schema.
- No new repo.
- No broader Music/Career cockpit.

## Do not infer

Do not infer broader Music/Career implementation from this slice. The implemented app-side surface is limited to:

1. Biography copy refinement.
2. Offering and credit description refinement.
3. Read-only copy consistency checking across Biography, offerings, and credits.
4. Suggestion-only Promo Kit copy refinement.
5. Read-only Audience Page route-tag recommendations.

## Related Beam references

- `context-packs/epk/current-surface.min.md`
- `context-packs/epk/current-surface.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `integrations/epk-to-spectra.adapter-contract.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_PROMO_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
