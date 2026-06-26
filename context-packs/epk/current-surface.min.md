# EPK Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK sessions.

**Last verified:** 2026-06-26  
**Verified against:** `devknowsdev/EPK/main` after admin/export/direct-contact completion plus access-gate, redacted-shell, public-CTA, and publisher-control hardening. See `docs/progress/EPK_ADMIN_EXPORT_CONTACT_2026-06-26.md` and `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`.
**Scope:** `EPK`. Verify source before implementation.

## Role

EPK is the public music/professional presence app for Dave Knowles.

It currently includes:

- public audience pages,
- a Cloudflare-ready admin at `/admin/admin.html`,
- a publisher surface under `/publisher/`,
- branded client HTML/PDF exports via `print.html`,
- a Cloudflare Pages Function contact endpoint at `/api/contact`,
- a Cloudflare Pages middleware access/redaction gate,
- a public redacted CTA shell for anonymous/non-owner users.

## Access model

- `EPK/functions/_middleware.js` gates protected EPK content with Cloudflare Pages middleware.
- Do not commit access secrets to GitHub.
- The access secret must live in Cloudflare Pages environment settings, not source code.
- Anonymous users may open the public shell, but content/social/media/file/publisher surfaces should be protected or redacted.
- `/data/epk.json` returns redacted JSON to anonymous users.
- `/admin`, `/publisher`, `/data`, `/published`, `/downloads`, `/files`, and JSON/private surfaces should remain protected or redacted.

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

## AI boundary

EPK should request AI services through Spectra rather than owning provider/model routing directly.

The direct contact endpoint is not an AI service. It is a server-side email relay using Cloudflare Pages Functions and Resend env vars.

## Current operational notes

Cloudflare Pages should use:

```text
Build command: node EPK/scripts/prepare-cloudflare-pages.mjs
Build output directory: EPK/public
```

Direct contact requires configured Cloudflare environment values for the email relay. The sender address must remain valid for the configured email provider/domain.

Access gating requires a configured Cloudflare environment value for the owner access secret. Optional salt-style configuration may also be used by the middleware.

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
- propose updates for review,
- diagnose exact admin/export/contact/access regressions after inspecting source,
- improve public CTA and publisher UX without exposing private content.

## Safety defaults

- No hidden publishing.
- No hidden email or external write from static/browser code.
- Server-side contact sending must stay explicit, rate/spam aware, and env-var based.
- No secrets in public repo files.
- No direct cloud-model escalation from EPK.
- Any public-facing content changes should remain reviewable.
- Source/content truth should be preserved carefully.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/EPK_ADMIN_EXPORT_CONTACT_2026-06-26.md`
- `docs/progress/FOCUS_EPK_SURFACE_HARDENING_2026-06-26.md`

## Source escalation

For EPK implementation, read this mini-pack first, then inspect only exact EPK files needed for the requested change.

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
