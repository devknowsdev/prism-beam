# EPK Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK sessions.

**Last verified:** 2026-06-26  
**Verified against:** EPK `main` after admin/export/direct-contact completion, plus Beam compression note `docs/progress/EPK_ADMIN_EXPORT_CONTACT_2026-06-26.md`.
**Scope:** `EPK`. Verify source before implementation.

## Role

EPK is the public music/professional presence app for Dave Knowles.

It currently includes:

- public audience pages,
- a Cloudflare-ready admin at `/admin/admin.html`,
- branded client HTML/PDF exports via `print.html`,
- a Cloudflare Pages Function contact endpoint at `/api/contact`.

## AI boundary

EPK should request AI services through Spectra rather than owning provider/model routing directly.

The direct contact endpoint is not an AI service. It is a server-side email relay using Cloudflare Pages Functions and Resend env vars.

## Current operational notes

Cloudflare Pages should use:

```text
Build command: node EPK/scripts/prepare-cloudflare-pages.mjs
Build output directory: EPK/public
```

Direct contact requires Cloudflare environment variables:

```text
RESEND_API_KEY
CONTACT_TO
CONTACT_FROM
```

`CONTACT_FROM` must remain valid for the configured Resend sender/domain.

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
- diagnose exact admin/export/contact regressions after inspecting source.

## Safety defaults

- No hidden publishing.
- No hidden email or external write from static/browser code.
- Server-side contact sending must stay explicit, rate/spam aware, and env-var based.
- No direct cloud-model escalation from EPK.
- Any public-facing content changes should remain reviewable.
- Source/content truth should be preserved carefully.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`
- `docs/progress/EPK_ADMIN_EXPORT_CONTACT_2026-06-26.md`

## Source escalation

For EPK implementation, read this mini-pack first, then inspect only exact EPK files needed for the requested change.

Common exact files:

- `EPK/admin/admin.html`
- `EPK/public/admin/admin.html`
- `EPK/public/print.html`
- `EPK/public/print.js`
- `EPK/public/print.css`
- `EPK/public/data/epk.json`
- `functions/api/contact.js`
- `EPK/scripts/prepare-cloudflare-pages.mjs`
- `EPK/scripts/validate-epk-admin-upgrade.mjs`
