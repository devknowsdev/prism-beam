# EPK Admin, Export, and Direct Contact Completion — 2026-06-26

**Scope:** `devknowsdev/EPK`

**Status:** Completed and pushed to EPK `main` before this Beam compression-back entry.

## What changed in EPK

The EPK app was hardened from a local/admin export workflow into a Cloudflare-ready admin/export/contact flow.

Implemented or verified:

- New block-canvas admin is the intended admin surface at `/admin/admin.html`.
- Cloudflare Pages build uses `node EPK/scripts/prepare-cloudflare-pages.mjs` with output directory `EPK/public`.
- Admin preview/export pathing was repaired for local repo-root use and Cloudflare public output.
- Video thumbnails render in admin and export, including YouTube thumbnail extraction.
- `EPK/public/print.html`, `print.js`, and `print.css` now produce a branded client HTML export and a compact, dark, professional PDF export.
- PDF print CSS is content-adaptive rather than a one-off General EPK fix:
  - hero CTAs hidden in print,
  - video cards are full-width feature media,
  - title wrapping and card grids are controlled,
  - gallery/contact sections are compact,
  - browser print margins/headers remain a browser setting, not app code.
- Client HTML contact flow now avoids opening a local mail app:
  - `Contact` opens an on-page modal,
  - `Send message` posts to `/api/contact`,
  - `Open WhatsApp` opens a prefilled WhatsApp fallback,
  - `Contact & Links → Email enquiry` opens the modal,
  - raw email is copyable rather than `mailto:` from the UI.
- Cloudflare Pages Function added at `functions/api/contact.js`:
  - validates JSON POST requests,
  - uses a honeypot field,
  - sends through Resend using server-side env vars,
  - supports reply-to when the visitor supplies an email.
- `.gitignore` now excludes local Cloudflare output and exported PDFs:
  - `.wrangler/`
  - `*.pdf`

## Operational requirements

Cloudflare Pages must keep these environment variables configured:

```text
RESEND_API_KEY
CONTACT_TO
CONTACT_FROM
```

`CONTACT_FROM` must remain a sender/domain that Resend is allowed to send from, for example a verified address on `daveknowlesmusic.com`.

## Important routes

```text
https://epk-3k1.pages.dev/
https://epk-3k1.pages.dev/admin/admin.html
https://epk-3k1.pages.dev/print.html?for=default
https://epk-3k1.pages.dev/print.html?for=press
/api/contact
```

## Validation performed during session

Observed/ran in the EPK local workflow:

```text
node EPK/scripts/validate-epk-admin-upgrade.mjs
node EPK/scripts/prepare-cloudflare-pages.mjs
node --check EPK/public/print.js
node --check functions/api/contact.js
npx wrangler pages dev EPK/public
```

GitHub connector verification after final push confirmed:

- `EPK/public/print.js` no longer contains the pasted heredoc duplicate.
- `renderContactBox()` is injected into the client export DOM.
- `sendEmail()` posts to `/api/contact`.
- `sendWhatsApp()` uses the WhatsApp URL flow.
- `functions/api/contact.js` exists on EPK `main`.
- `.gitignore` excludes `.wrangler/` and `*.pdf`.

## Known cautions

- Direct email sending depends on Cloudflare env vars and Resend sender/domain validity.
- WhatsApp cannot send silently; it must open WhatsApp/Web with a prefilled message for user confirmation.
- PDF exports cannot submit live forms; PDF should show contact links only.
- If a future AI edits `print.js`, it must run syntax checks and grep for pasted shell/heredoc residue before pushing.

## Suggested future improvements

- Add Cloudflare Turnstile or equivalent spam protection before wider public promotion of the contact form.
- Add a link-check script for public, social, video, credit, and release URLs.
- Consider export presets later:
  - Premium PDF,
  - Compact one-sheet,
  - Image-heavy press pack.
- Keep EPK data/content changes reviewable; do not add hidden publishing or hidden external writes.
