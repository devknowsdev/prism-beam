# EPK Session Start

This is a compact guardrail for EPK work. Verify against the current `EPK` repo
before editing.

## Current Truths

- EPK owns the public EPK site and publisher tooling.
- Public deploy root is `EPK/public`.
- Publisher route is `EPK/public/publisher/`.
- Public pages must not show admin, editor, mode, or toolbar controls.
- Hosted publisher must be protected with real platform auth, such as
  Cloudflare Access, before it is treated as private.
- Do not add fake frontend password gates.
- Page Builder owns route, layout, and template controls.
- Site templates and poster templates are separate.
- Media previews belong on their source cards:
  - videos on video cards
  - audio on release cards
  - images on gallery cards
- Contact remains `mailto:` unless a real backend or form-service sprint is
  explicitly approved.
- Poster generation is browser-only unless explicitly changed.
- Publishing to GitHub or public data is an external write and requires
  explicit user action.

## Use This Guide For

- Session orientation before EPK edits.
- Guarding against old public/admin confusion.
- Keeping publisher, media, template, poster, contact, and publish behavior
  aligned with the latest accepted direction.
