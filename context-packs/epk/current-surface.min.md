# EPK / Music-Career Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK/Music-Career sessions.

**Last verified:** 2026-07-01
**Verified against:** `devknowsdev/EPK/main` after admin/export/contact completion, redacted-shell/public-CTA/publisher-control hardening, Beam Music/Career boundary updates, EPK PR #23 (Biography refinement), EPK PR #24 (offering/credit description refinement), EPK PR #25 (read-only copy consistency checker), and EPK PR #26 (Promo Kit copy refinement).
**Scope:** `EPK` as current implementation seed for Dave's broader Prism Music/Career domain. Verify source before implementation.

## Role

`EPK` is the current repo and implementation seed for Dave Knowles's public/professional Music/Career surface.

The online EPK page is one public/export output, not the whole product. Future work should treat EPK, press/booking packets, show-specific promo packs, public pages, and PDFs as outputs generated from or managed by a broader internal Music/Career cockpit.

It currently includes:

- public audience pages,
- a Cloudflare-ready admin at `/admin/admin.html`,
- a publisher surface under `/publisher/`,
- branded client HTML/PDF exports via `print.html`,
- a server-side contact endpoint at `/api/contact`,
- hosting-layer public/private redaction behavior,
- a public redacted CTA shell for anonymous/non-owner users,
- four app-side Music/Career AI slices: publisher Biography copy refinement, offering/credit description refinement, read-only copy consistency checking, and suggestion-only Promo Kit copy refinement via Spectra read-only requests.

## Product-domain direction

Prism Music/Career may eventually need visibility across socials, content queues, back-catalogue reuse, supporter/mailing-list awareness, press/venue contacts, project identities, and public outputs.

Do not force that whole domain into a static EPK page. Do not assume a new repo is approved. Treat the existing `EPK` repo as the current seed until a Beam boundary contract explicitly approves a rename or new `prism-career` repo.

## Implemented Music/Career AI slices

EPK PR #23 added `career.refine_epk_copy` for Biography fields. EPK PR #24 extended the same helper to offering and credit description fields:

- `EPK/public/publisher/index.html` adds `Refine copy` controls for `bio.short`, `bio.acoustic`, and `bio.full`.
- `EPK/public/publisher/publisher-ai-refine.js` adds dynamic controls for `offerings[n].description` and `credits[n].description` and calls Spectra's existing `/api/v1/ai/request` endpoint.
- The request uses `sourceApp: "EPK"`, `intent: "career.refine_epk_copy"`, `riskClass: "read-only"`, and `preferredMode: "local-first"`.
- Suggestions are visible, discardable local drafts.
- Apply requires an explicit click and uses the existing local editor/input path.
- Add, duplicate, reorder, and delete rerenders preserve the dynamic description controls.

EPK PR #25 added `career.check_epk_copy_consistency` for read-only findings across Biography, offerings, and credits:

- `EPK/public/publisher/index.html` adds a compact `Check copy consistency` control and findings panel.
- `EPK/public/publisher/publisher-ai-consistency.js` sends a minimized public-copy snapshot to Spectra's existing `/api/v1/ai/request` endpoint.
- `EPK/scripts/test-career-copy-consistency.mjs` checks request shape, data minimization, missing-token fail-closed behavior, and absence of write/publish paths.
- The request uses `sourceApp: "EPK"`, `intent: "career.check_epk_copy_consistency"`, `riskClass: "read-only"`, and `preferredMode: "local-first"`.
- Output is findings only. It does not rewrite, apply, publish, export, dispatch input events, or mutate source fields.

EPK PR #26 added `career.refine_epk_promo_copy` for suggestion-only Promo Kit copy refinement:

- `EPK/public/publisher/index.html` adds `Refine promo copy` beside the generated brief actions and a discardable suggestion panel.
- `EPK/public/publisher/publisher-ai-promo-refine.js` sends the generated Markdown promo brief to Spectra's existing `/api/v1/ai/request` endpoint.
- `EPK/scripts/test-career-promo-refine.mjs` checks request shape, missing-token fail-closed behavior, successful mocked response, unchanged source brief, discard behavior, and absence of write/publish paths.
- The request uses `sourceApp: "EPK"`, `intent: "career.refine_epk_promo_copy"`, `riskClass: "read-only"`, and `preferredMode: "local-first"`.
- Output is a draft suggestion only. There is no Apply button; the generated source brief remains unchanged.

For all implemented slices:

- No publish/export/social/supporter/platform/Focus code was added.
- No EPK-local provider/model wiring was added.
- No hardcoded fallback token is shipped; missing token fails closed before `fetch`.

Do not infer any broader Music/Career cockpit, social/supporter/platform adapter, or Focus automation from these slices.

## Public/private surface model

- `EPK/functions/_middleware.js` controls public/private EPK routing.
- Private configuration belongs in hosting settings, not source code.
- Anonymous users may open the public shell, but content/social/media/file/publisher surfaces should be protected or redacted.
- `/data/epk.json` returns redacted JSON to anonymous users.
- `/admin`, `/publisher`, `/data`, `/published`, `/downloads`, `/files`, and JSON/private surfaces should remain protected or redacted.
- Future social/supporter/contact visibility must not leak into public pages unless deliberately exposed by an approved publish/export action.

## Public empty-shell behavior

- `EPK/public/public-empty-cta.js` turns the redacted shell into a general public outreach/profile CTA.
- The shell should be useful beyond music: portfolio, press kit, booking page, speaker profile, service page, project brief, professional/freelancer profile, or organisation/project context page.
- The top `How to build this` button opens an on-demand wizard.
- Wizard steps: Purpose, Identity, Proof, Audience routes, Publish safely.
- Anonymous users should not see private content, social links, media links, file links, publisher tools, or full EPK data.

## Publisher/control posture

- `EPK/public/publisher/publisher-focus-packet.js` currently simplifies publisher chrome.
- Top controls should stay labelled and grouped as `Preview`, `Publish`, and `Tools`.
- Sidebar should keep workflow grouping: Build, Media, Tools/design/advanced, Publish.
- Avoid returning to dense icon-only or mixed-purpose top-level controls.
- Future Music/Career cockpit controls should separate internal visibility/review from public export/publish actions.

## AI boundary

EPK/Music-Career should request AI services through Spectra rather than owning provider/model routing directly.

Implemented examples:

- `career.refine_epk_copy` in publisher Biography, offering description, and credit description fields calls Spectra's `/api/v1/ai/request` with `riskClass: "read-only"`, then returns a reviewable local suggestion.
- `career.check_epk_copy_consistency` sends a minimized public-copy snapshot for read-only findings only; it does not mutate editor state.
- `career.refine_epk_promo_copy` sends the generated Promo Kit Markdown brief for a suggestion-only draft; it does not mutate the generated source brief.

The contact endpoint is not an AI service. It is a server-side message relay using hosting configuration.

## Current operational notes

Cloudflare Pages should use:

```text
Build command: node EPK/scripts/prepare-cloudflare-pages.mjs
Build output directory: EPK/public
```

Contact delivery and owner access both require valid hosting configuration.

Local Spectra-backed AI suggestions/findings require a configured local Spectra URL/token in the browser environment or localStorage. Missing token should fail closed before any request.

## Current export/contact behavior

- Client HTML export keeps hero CTAs and an on-page contact modal.
- `Send message` posts to `/api/contact`; it should not open a visitor's local mail app.
- WhatsApp is a fallback that opens a prefilled WhatsApp/Web message for confirmation.
- PDF export hides hero CTAs and contact modal UI; PDF should show clean contact links only.
- Export CSS is content-adaptive across modes, not tuned only for General EPK.

## Expected AI use cases

- refine copy for review using `career.refine_epk_copy` — implemented for `bio.short`, `bio.acoustic`, `bio.full`, `offerings[n].description`, and `credits[n].description`,
- check public-copy consistency using `career.check_epk_copy_consistency` — implemented for Biography, offerings, and credits as findings only,
- refine generated Promo Kit copy using `career.refine_epk_promo_copy` — implemented as suggestion-only, no Apply/source mutation,
- draft or refine other public copy,
- summarise professional material,
- help prepare media/press-kit text,
- suggest content-batch angles from back-catalogue material,
- propose EPK/press/booking copy updates for review,
- diagnose exact admin/export/contact/access regressions after inspecting source,
- improve public CTA and publisher UX without exposing private content.

## Safety defaults

- No hidden publishing.
- No auto-posting to socials.
- No hidden email or external write from static/browser code.
- Server-side contact sending must stay explicit and spam-aware.
- No private configuration values in public repo files.
- No hardcoded fallback AI token in public browser code.
- No direct cloud-model escalation from EPK.
- AI suggestions must remain reviewable local drafts unless the user explicitly applies them.
- AI findings must remain findings only unless a future approved slice explicitly adds a local editor action.
- Any public-facing content changes should remain reviewable.
- Generated read-only source text must not be mutated unless a future approved slice explicitly adds an editor path.
- Source/content truth should be preserved carefully.
- Social/supporter/platform data must remain internal unless explicitly exported/published.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/MUSIC_CAREER_OPEN_QUESTIONS_2026-07-01.md`
- `docs/progress/EPK_REFINE_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_COPY_CONSISTENCY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_PROMO_COPY_AI_SLICE_2026-07-01.md`
- `docs/progress/EPK_ADMIN_EXPORT_CONTACT_2026-06-26.md`
- `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`

## Source escalation

For EPK/Music-Career implementation, read this mini-pack first, then inspect only exact EPK files needed for the requested change.

Common exact files:

- `EPK/functions/_middleware.js`
- `EPK/public/_headers`
- `EPK/public/_redirects`
- `EPK/public/index.html`
- `EPK/public/public-empty-cta.js`
- `EPK/public/publisher/index.html`
- `EPK/public/publisher/publisher-ai-refine.js`
- `EPK/public/publisher/publisher-ai-consistency.js`
- `EPK/public/publisher/publisher-ai-promo-refine.js`
- `EPK/public/publisher/publisher-focus-packet.js`
- `EPK/admin/admin.html`
- `EPK/public/admin/admin.html`
- `EPK/public/print.html`
- `EPK/public/print.js`
- `EPK/public/print.css`
- `EPK/public/data/epk.json`
- `functions/api/contact.js`
- `EPK/scripts/test-career-refine-epk-copy.mjs`
- `EPK/scripts/test-career-copy-consistency.mjs`
- `EPK/scripts/test-career-promo-refine.mjs`
- `EPK/scripts/prepare-cloudflare-pages.mjs`
- `EPK/scripts/validate-epk-admin-upgrade.mjs`
