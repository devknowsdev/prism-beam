# EPK -> Spectra Adapter/Read-Order Contract

## Status

Draft reference contract.

## Source App

EPK owns public/promotional content, publisher exports, published snapshots,
and the current implementation seed for Music/Career public/professional
outputs.

## Target App

prism-spectra owns orchestration, adapters, approvals, and safe execution
boundaries.

## Contract Owner

prism-beam owns this reference contract. App implementation stays in EPK or
Spectra.

## Purpose

Define how Spectra should read EPK/Music-Career data without scraping
prematurely, inventing publisher state, exposing private/internal career data,
or turning read operations into hidden writes.

## Read Order

1. `window.EPKAdapter` when running in the public or publisher browser context.
2. `EPK/public/data/epk.json` when working from repo/source files.
3. Published snapshot JSON when working with immutable published versions.
4. DOM scraping only as a last-resort fallback and only for read-only
   inspection.

## Safe Read Examples

- Browser context: call `window.EPKAdapter.getData()` or
  `window.EPKAdapter.buildGigPromoBrief(...)`.
- Repo context: read `EPK/public/data/epk.json` explicitly.
- Published context: read `EPK/public/published/<id>/epk.json` or the matching
  hosted snapshot JSON.

## What Must Not Cross The Boundary

- Unpublished/private publisher state inferred from public HTML.
- Assumed authentication from `/publisher/`.
- External posting, email sending, or GitHub publication without explicit
  approval.
- Social, supporter, mailing-list, contact, or platform visibility into public
  EPK outputs unless deliberately included in an approved export/publish action.
- Beam files as runtime imports.

## Forbidden Assumptions

- Do not infer `/publisher/` is private unless real platform auth is configured.
- Do not scrape public DOM if structured data or `window.EPKAdapter` is
  available.
- Do not assume contact behavior from older Beam docs. Current app source must
  decide whether `/api/contact`, `mailto:`, WhatsApp fallback, or another
  explicit path is active.
- Do not treat any contact path as permission for hidden email sending.
- Do not treat browser-only poster generation as a publishing backend.
- Do not treat the public EPK page as the whole Prism Music/Career interface.

## Review And Approval Rule

Reading EPK structured data is read-only. Publishing, snapshot creation,
external posting, email sending, or GitHub/public-data mutation are external
writes and require explicit approval. Deleting or overwriting canonical public
data is destructive unless protected by backup/rollback.

## Safe Write Path

No write path is implemented by this contract. Future Spectra adapters must
classify actions before execution and route external writes through an approval
request.

## Failure/Rollback Notes

If structured reads fail, stop with a clear error or fall back to read-only DOM
inspection. Do not synthesize missing event facts, platform facts, supporter
facts, or contact facts. For approved writes in future app work, require
preview, checkpoint/backup, and rollback notes.

## Future App-Side Implementation Notes

- Add a Spectra EPK read adapter that prefers `window.EPKAdapter` when a browser
  context exists.
- Add explicit file-read support for `EPK/public/data/epk.json`.
- Treat published snapshot reads as immutable reference reads.
- Keep contact behavior explicit and source-verified. The server-side
  `/api/contact` path exists in current EPK source, but it is not permission for
  hidden sends or external-write bypasses.
- Treat EPK public outputs as outputs of the broader Music/Career domain, not as
  the internal cockpit/dashboard.

## Validation

- Confirm EPK still exposes `window.EPKAdapter` before relying on it.
- Confirm `EPK/public/data/epk.json` parses before using repo data.
- Confirm current contact behavior from app source before editing contact flows.
- Confirm any write-like action maps to `integrations/approval-posture.md`.
- Confirm social/supporter/platform data is not exposed through public EPK reads
  or writes without an explicit approved export/publish action.

## Future prompts can omit

Future prompts can omit the EPK read order, forbidden assumptions about
publisher privacy/contact/poster publishing, the rule that Beam is reference
context rather than a runtime dependency, and the updated warning that older
`mailto:`-only contact assumptions are stale.

## Update Rules

Update this contract when EPK adapter methods change, Spectra implements an EPK
adapter, EPK contact/publish services change, or Music/Career adds explicit
social/supporter/platform visibility adapters.
