# Career Assistant / Music-Career Capability Placement

## Title

Career Assistant and Prism Music/Career capability placement across EPK, prism-focus, and prism-spectra

## Status

Draft — ready for Claude review. App-side implementation is not approved by this contract.

## Source App

None singularly. This contract defines placement and product-domain direction.

Evidence source:

- `context-packs/career-ops-research.md`
- `docs/research/music-career/README.md`

## Target App

`EPK`, `prism-focus`, `prism-spectra`.

`EPK` is currently treated as the implementation seed for the broader Prism Music/Career domain. The public EPK page is a generated/public output, not the whole product.

## Contract Owner

`prism-beam`. App implementation stays in the owning app repo per sprint.

## Purpose

Prevent the Music/Career idea from becoming either:

1. a too-small static EPK page that cannot provide career visibility; or
2. an unapproved fifth repo with duplicated AI/scheduling/publishing logic.

The contract records the current middle position:

- Prism Music/Career is the parent product domain.
- The online EPK is one public/export output inside that domain.
- The existing `EPK` repo is the current implementation seed until Dave explicitly approves a rename or new repo.
- AI drafting routes through Spectra.
- Planning/task/cadence writes stay review-first through Focus where appropriate.
- Beam stores the contract and research only.

## What Crosses The Boundary

| Capability | Owning repo/surface | Rationale |
|---|---|---|
| Music/Career public/professional source data and output generation | `EPK` as current implementation seed | Existing repo already owns public/promotional truth, publisher/admin surfaces, EPK JSON, exports, snapshots, and contact/public/private hardening. |
| EPK page, press one-sheet, booking packet, show-specific promo pack, PDF/public exports | `EPK` | These are outputs of Music/Career, not the internal parent interface. |
| Brand/voice/project-mode selection for drafts | `EPK` / Music-Career seed surface | Public/professional identity belongs near structured EPK/career data. |
| Content-batch task/session scheduling | `prism-focus` | Focus owns personal planning, tasks, routines, and low-overwhelm execution state. |
| Cadence guardrails such as last batch N weeks ago or posting above ceiling | `prism-focus` if computed from tasks/routines; otherwise defer | Focus can compute review-first planning guidance from its own state. Do not make EPK/Spectra mutate Focus state directly. |
| AI drafting and back-catalogue angle suggestions | `prism-spectra` | Spectra is the sole suite AI engine. Current `/api/v1/ai/request` endpoint exists and accepts read-only requests only. |
| Social/email/supporter/platform visibility | unresolved / defer implementation | Needed for Music/Career product, but canonical state owner and safe read adapters need a follow-up contract. |
| Research, placement, and anti-drift rules | `prism-beam` | Beam is reference-only and not runtime code. |

## What Must Not Cross The Boundary

- No auto-posting to any external platform: social, email, Patreon, Ko-fi, Bandcamp, mailing list, calendar, GitHub, or public site.
- No hidden external write. Posting/sending/publishing is `external-write` per `integrations/approval-posture.md` and is blocked until explicit approval.
- No app-local AI provider wiring in EPK/Music-Career or Focus for this capability. Drafting must route through Spectra.
- No hidden Focus state mutation from Spectra or EPK. Spectra returns a suggestion; Focus owns visible review/import/apply.
- No social/supporter/platform data exposure on public EPK pages unless deliberately included in an approved export/publish action.
- No default creation of a new `prism-career` repo. That requires explicit approval and a follow-up Beam boundary contract.
- No assumption that the current EPK public page can satisfy the internal Music/Career dashboard/cockpit requirement.

## Data Shape / Schema Reference

- Spectra AI requests use the current `/api/v1/ai/request` endpoint.
- Current Spectra source accepts `riskClass=read-only` only for this endpoint.
- Suggested future `intent` values may include:
  - `career.draft_content_batch`
  - `career.suggest_backcatalogue_angle`
  - `career.refine_epk_copy`
  - `career.draft_press_pitch`
  - `career.summarize_social_state`
- EPK/Music-Career source data should reuse current `public/data/epk.json` only where it fits. Do not force supporter/social/back-catalogue state into that JSON without a schema decision.
- Supporter/retention/back-catalogue/social visibility canonical data shape is undefined pending follow-up contract.

## Review And Approval Rule

- Spectra AI generation/suggestion = `read-only` at the API boundary.
- Rendering/editing a draft in EPK/Music-Career or Focus UI = `local-draft`.
- Turning an approved suggestion into a Focus task/session = `local-write`, visible user action required.
- Creating an external draft in an external service = `external-draft`, preview recommended.
- Sending/posting/publishing/updating public or third-party systems = `external-write`, explicit approval required.
- Deleting/overwriting canonical state = `destructive`, explicit approval plus backup/rollback required.

## Safe Read Path

- EPK/Music-Career public/professional data: follow `integrations/epk-to-spectra.adapter-contract.md` read order where applicable: `window.EPKAdapter` -> `public/data/epk.json` -> published snapshot -> DOM as last resort.
- Focus batch-session/task history: read via Focus's own storage layer inside Focus; do not let EPK or Spectra directly inspect/mutate Focus localStorage.
- Social/supporter/platform visibility: no canonical safe read path yet. Must be defined in a follow-up adapter contract before implementation.

## Safe Write Path

No new write path is introduced by this contract.

Existing/review-first paths may be reused:

- EPK/Music-Career visible draft before export/publish.
- Focus task/session creation only after user review/apply.
- Spectra read-only AI response with provenance, not app mutation.

## Failure/Rollback Notes

- If Spectra's AI request endpoint is unavailable, degrade to no draft offered. Do not fallback to app-local model/provider calls in EPK or Focus.
- If social/supporter data cannot be read safely, display unavailable/needs-connection state rather than inventing or scraping.
- If a draft is wrong, discard local draft; do not mutate canonical public data.
- No destructive actions are in scope for this contract.

## Validation

Before app-side implementation:

- Confirm Claude or another reviewer has checked this boundary decision.
- Confirm no EPK/Focus app-local Ollama/provider code is added for this feature.
- Confirm Spectra requests use `riskClass=read-only` for `/api/v1/ai/request`.
- Confirm any posting/publishing action is classified `external-write` and blocked pending approval.
- Confirm batch-session tasks appear through Focus's normal review/apply flow, not hidden writes from Spectra or EPK.
- Confirm public EPK exports do not expose private social/supporter/platform/contact data.

## Open Questions

1. Does the current `EPK` repo eventually get renamed to `prism-music` / `prism-career`, or does a separate repo get created later?
2. Where should supporter/retention/back-catalogue/social visibility canonical data live?
3. Which platform integrations are read-only enough to include first, and which should remain manual?
4. What is the smallest internal cockpit that proves the Music/Career product direction without becoming a bloated dashboard?
5. How should project identities be represented: real-name umbrella, separate handles/pages, or hybrid modes?

## Current Recommendation

Treat `EPK` as the current implementation seed, but stop treating the online EPK page as the product centre.

Next step should be a Claude review pass over this contract and the research pack before app implementation. Claude should look for boundary mistakes, privacy leaks, schema premature-commitment, repo-sprawl risk, and better minimal slices.

## Future prompts can omit

Future prompts can omit the decision that Music/Career is the parent product domain, that the EPK page is one output, that `EPK` remains only the current implementation seed, that Spectra owns AI drafting, that Focus owns review-first task/session application, and that auto-posting is forbidden.

## Update Rules

Update this contract when:

- Dave accepts/rejects the Music/Career domain framing;
- a repo rename or new repo is approved;
- Spectra changes `/api/v1/ai/request` risk classes;
- social/supporter/platform adapter contracts are added;
- EPK/Music-Career app-side implementation begins;
- supporter/back-catalogue canonical state owner is decided.
