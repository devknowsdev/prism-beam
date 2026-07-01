# EPK / Music-Career Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK/Music-Career sessions.

**Last verified:** 2026-07-01
**Verified against:** `devknowsdev/EPK/main` after admin/export/contact completion plus redacted-shell, public-CTA, and publisher-control hardening; Beam Music/Career boundary update branch.
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
- a public redacted CTA shell for anonymous/non-owner users.

## Product-domain direction

Prism Music/Career may eventually need visibility across socials, content queues, back-catalogue reuse, supporter/mailing-list awareness, press/venue contacts, project identities, and public outputs.

Do not force that whole domain into a static EPK page. Do not assume a new repo is approved. Treat the existing `EPK` repo as the current seed until a Beam boundary contract explicitly approves a rename or new `prism-career` repo.

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

The contact endpoint is not an AI service. It is a server-side message relay using hosting configuration.

## Current operational notes

Cloudflare Pages should use:

```text
Build command: node EPK/scripts/prepare-cloudflare-pages.mjs
Build output directory: EPK/public
```

Contact delivery and owner access both require valid hosting configuration.

## Current export/contact behavior

- Client HTML export keeps hero CTAs and an on-page contact modal.
- `Send message` posts to `/api/contact`; it should not open a visitor's local mail app.
- WhatsApp is a fallback that opens a prefilled WhatsApp/Web message for confirmation.
- PDF export hides hero CTAs and contact modal UI; PDF should show clean contact links only.
- Export CSS is content-adaptive across modes, not tuned only for General EPK.

## Expected AI use cases

- draft or refine public copy,
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
- No direct cloud-model escalation from EPK.
- Any public-facing content changes should remain reviewable.
- Source/content truth should be preserved carefully.
- Social/supporter/platform data must remain internal unless explicitly exported/published.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `context-packs/career-ops-research.md`
- `integrations/career-assistant-placement.contract.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
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
- `EPK/public/publisher/publisher-focus-packet.js`
- `EPK/admin/admin.html`
- `EPK/public/admin/admin.html`
- `EPK/public/print.html`
- `EPK/public/print.js`
- `EPK/public/print.css`
- `EPK/public/data/epk.json`
- `functions/api/contact.js`
- `EPK/scripts/prepare-cloudflare-pages.mjs`
- `EPK/scripts/validate-epk-admin-upgrade.mjs`
