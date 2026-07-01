# Music/Career Open Questions — 2026-07-01

## Purpose

Track the unresolved product-boundary questions raised by the Music/Career
reframe so they do not remain only as prose inside
`integrations/career-assistant-placement.contract.md`.

This is a Beam backlog note, not app implementation approval.

## Current accepted direction

- Prism Music/Career is the parent product domain.
- `EPK` remains the current implementation seed.
- The online EPK page is one public/export output, not the whole internal
  career-management interface.
- No new `prism-career` repo or repo rename is approved yet.
- No app-side implementation is approved by this note.

## Open questions

### 1. Repo placement / naming

Should the current `EPK` repo eventually be renamed to `prism-music` or
`prism-career`, or should a separate repo be created later?

Current default: keep `EPK` as implementation seed until product shape
stabilizes.

Decision needed before:

- broad app restructure;
- new repo creation;
- public documentation that promises `Prism Career` as a separate app.

### 2. Social/supporter/platform visibility ownership

Where should social, supporter, mailing-list, platform, and back-catalogue
visibility live as canonical state?

Current default: defer. Do not force this into `public/data/epk.json` or Focus
localStorage without a follow-up contract.

Decision needed before:

- social account adapters;
- Patreon/Ko-fi/Bandcamp/email-list data import;
- supporter retention dashboards;
- public exposure of platform status.

### 3. Safe adapter contracts

Which external platforms can be read safely, and through what review/approval
model?

Current default: no adapters. Manual input or source-verified local data only.

Decision needed before:

- read-only platform integrations;
- OAuth/API tokens;
- scraping;
- scheduled checks;
- external drafts/writes.

### 4. Minimal internal cockpit slice

What is the smallest internal Music/Career surface that proves the product
shape without becoming a bloated dashboard?

Current Claude recommendation: start with `career.refine_epk_copy` through the
existing EPK publisher UI and Spectra read-only AI request path.

Decision needed before:

- building a full internal dashboard;
- adding social/supporter/back-catalogue surfaces;
- adding Focus cadence automation.

### 5. Project identity model

How should Dave's public project identities be represented?

Candidate model:

- real-name professional umbrella;
- live-looping mode;
- improvised electronic mode;
- acoustic mode;
- commissioned composition mode.

Current default: support modes without forcing separate public handles/pages or
one flattened brand.

Decision needed before:

- schema changes;
- public navigation restructuring;
- separate output templates per project;
- platform-specific identity sync.

## Do-not-build-yet

- New `prism-career` repo or repo rename.
- Social/email/supporter/platform read or write adapters.
- Internal Music/Career dashboard/cockpit beyond the minimal first slice.
- Focus cadence automation.
- Auto-posting, auto-emailing, or scheduled publishing.
- App-local AI provider wiring in EPK or Focus.
- Supporter/back-catalogue/social canonical schema.

## Related files

- `docs/REPO_BOUNDARIES.md`
- `integrations/career-assistant-placement.contract.md`
- `context-packs/career-ops-research.md`
- `context-packs/epk/current-surface.min.md`
- `integrations/approval-posture.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`

## Update rules

Update this note when any open question is resolved, when a follow-up contract is
created, or when app-side implementation begins.
