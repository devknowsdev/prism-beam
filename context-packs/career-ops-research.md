# Context Pack: Career-Ops Research

## Title

Career-Ops Research (independent musician content, brand, supporter, and ND-practice findings)

## Scope

Suite-wide reference. Informs future EPK/Music-Career, prism-focus, and prism-spectra sprints that touch content drafting, batch scheduling, brand-voice selection, back-catalogue reuse, social/email/supporter visibility, EPK outputs, or supporter/retention tracking.

This pack is not tied to a single app and is not proof of implementation.

## Last Verified

2026-07-01, against five user-supplied research documents:

- `docs/research/music-career/brand-coherence-artist-development.md`
- `docs/research/music-career/content-creation-workflow.md`
- `docs/research/music-career/neurodivergent-creative-practice.md`
- `docs/research/music-career/supporter-conversion.md`
- `docs/research/music-career/musician-operations-practice.md`

No app source was inspected for the research conclusions in this pack. Beam/Spectra source was inspected separately only for suite placement and AI-boundary correctness.

## Evidence Used

- `brand-coherence-artist-development.md`
- `content-creation-workflow.md`
- `neurodivergent-creative-practice.md`
- `supporter-conversion.md`
- `musician-operations-practice.md`
- `docs/REPO_BOUNDARIES.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `context-packs/prism-spectra/current-surface.min.md`

## Current Truths

- Sustainable ND creator workflows are batch-based (1-2 sessions/week producing multiple pieces), not daily-cadence.
- Templates such as Hook-Story-Lesson-CTA reduce blank-page paralysis more than open-ended prompts.
- Reuse/repurposing of existing material is explicitly sanctioned in ND creator guidance, not a fallback; Dave's content backlog is a first-class asset.
- Authenticity is a hard requirement for Dave's workflow design. Scripted persona or contrived self-promotion is a blocker, not a mild preference.
- Real-name crediting is the norm for commissioned/institutional work such as film, TV, theatre, and composition; alias use is more common for personal/pop-adjacent projects and is a per-project choice.
- Supporter retention is likely a higher-leverage metric than acquisition for a small creator, but exact benchmarks are platform- and audience-dependent.
- Cadence guidance has both a floor and a ceiling: email around 5-8/year is enough to remain present; social posting has burnout risk above a few posts/week even when growth data favors higher frequency.
- Back-catalogue re-releases need a stated rationale, such as why now, what changed, anniversary, new arrangement, context, or audience growth.
- An online EPK is only one public/export output. It is not sufficient as the internal interface for managing a music career with socials, supporter data, back-catalogue planning, and multiple project identities.

## Safe Assumptions

- These findings apply to Dave's own career-ops workflow design; they are not suite architecture facts and should not be treated as current-state truths about EPK/Focus/Spectra.
- Where this pack's guidance overlaps with existing suite policy, suite policy is authoritative. For example, no auto-posting is already covered by `integrations/approval-posture.md` external-write rules.
- The current `EPK` repo may act as the implementation seed for Music/Career public/professional outputs until Beam records a rename or new-repo decision.
- Career/Music AI drafting should route through Spectra's `/api/v1/ai/request` endpoint as read-only suggestion/generation; app-local review surfaces own any draft/write step.

## Do Not Infer

- Do not infer any of this research has been implemented in any app repo.
- Do not infer a specific data model, schema, or repo placement from this pack alone. See `integrations/career-assistant-placement.contract.md` for the current placement decision.
- Do not infer cadence numbers such as 5-8 emails/year or a few posts/week are hard limits Dave has personally confirmed; they are research-informed defaults.
- Do not infer that EPK should remain a static/non-app interface. The current product direction treats the EPK page as one output of a broader Music/Career domain.
- Do not infer a new `prism-career` repo has been approved.
- Do not infer social, supporter, email, or platform data may be publicly exposed.

## Known Stale Areas

- Earlier drafts that proposed a new `prism-career` repo as the default are superseded. A new repo or rename requires a Beam boundary decision.
- Earlier drafts that described Spectra's `/api/v1/ai/request` endpoint as only planned are stale. Beam's current Spectra pack records the endpoint as built, and current Spectra source accepts only `riskClass=read-only` for that endpoint.
- Earlier EPK-only framing is now too narrow. Treat EPK as an output/module/seed surface inside Music/Career direction.

## Useful Entry Points

- `integrations/career-assistant-placement.contract.md` — placement decision for the capabilities this research motivates.
- `docs/REPO_BOUNDARIES.md` — current repo and domain boundaries.
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md` — how any AI drafting capability must route through Spectra.
- `integrations/approval-posture.md` — risk classes; posting/sending/publishing is external-write.
- `context-packs/epk/current-surface.min.md` — current EPK/Music-Career seed surface.
- `docs/research/music-career/README.md` — research index.

## Validation Hints

None for this pack alone. It is reference research, not testable app behavior.

For implementation, validate that:

- no app-local provider/model routing is added to EPK or Focus;
- social/email/publishing actions remain external-write and blocked pending explicit approval;
- drafts remain review-first;
- public EPK output does not expose private social/supporter/contact/platform data;
- app-side source is inspected before any claimed UI or data model decision.

## Future prompts can omit

Future prompts can omit the batch-vs-daily finding, the reuse/repurposing sanction, the authenticity/no-persona requirement, the real-name-for-commissioned-work norm, the retention-over-acquisition finding, the cadence floor/ceiling guidance, and the decision that EPK is now one public output inside a broader Music/Career direction.

## Update Rules

Refresh if Dave supplies newer research, once app-side implementation reveals which findings held up in practice, when real cadence/supporter/social data supersedes generic research guidance, or when Beam accepts/rejects a repo rename/new-repo decision for Prism Music/Career.
