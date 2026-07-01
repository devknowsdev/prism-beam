# EPK / Music-Career Support-Spine Contract

## Owner

`EPK` owns the current public/professional Music-Career implementation seed:
structured EPK/career data, public site outputs, publisher tooling, published
snapshots, contact handoff/service behavior, media/gallery metadata, and
browser-only poster/export workflows.

The online EPK page is one public/export output inside the broader Prism
Music/Career direction. It is not the whole internal career-management
interface. See `docs/REPO_BOUNDARIES.md` for the canonical product-domain
framing.

## Beam relationship

Beam may store EPK/Music-Career guardrails, schemas, prompt packs, context
packs, contracts, and reusable patterns. Beam does not own EPK runtime code,
public content, app state, supporter data, social data, or product execution.

## Boundary rules

- Public pages must not expose editor/admin controls.
- Hosted publisher must not be treated as private without real platform auth.
- Contact behavior must be checked against current app source before changes;
  recent EPK work added a server-side `/api/contact` endpoint, so older
  `mailto:`-only assumptions are stale.
- Social, supporter, mailing-list, contact, and platform visibility must remain
  internal unless deliberately included in an approved public/export action.
- Publishing to GitHub/public data is an external write requiring explicit user
  action.
- Any repo rename or new `prism-career` repo requires a follow-up Beam boundary
  contract before app-side implementation.
