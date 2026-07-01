# Workspace Current State

## Scope

Prism suite repo map, AI session orientation, and current product-domain boundaries.

## Last Verified

2026-07-01 against Beam files through Spectra PR #33, Focus PR #25, and the Beam Music/Career boundary update branch.

Suite-Setup-001 added the first connector-evidence setup/readiness map for app launch, installability, and schema UX. App-specific setup passes have landed for Focus, Spectra, and EPK. Post-setup integration/stabilization passes also landed for the EPK -> Focus review-first packet loop and Focus browser interaction repair. The current 2026-07-01 update broadens the product-domain interpretation of `EPK`: the repo remains the current implementation seed, but the online EPK page is only one output of a broader Prism Music/Career domain.

## Evidence Used

- `README.md`
- `docs/REPO_BOUNDARIES.md`
- `context-packs/workspace/current-state.min.md`
- `context-packs/epk/current-surface.min.md`
- `integrations/registry.md`
- `integrations/career-assistant-placement.contract.md`
- `context-packs/career-ops-research.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- Prior setup/readiness docs and EPK -> Focus smoke material listed below.

Historical/source entry points still relevant:

- `docs/COORDINATION.md`
- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- Local sibling `EPK`, `prism-focus`, and `prism-spectra` README/docs/source entry points.
- `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`
- `docs/setup/APP_SETUP_MATRIX.md`
- `docs/setup/SCHEMA_UX_PLAN.md`
- `docs/setup/SUITE_SETUP_COMPLETION_SUMMARY.md`
- `docs/setup/SPECTRA_TEST_SURFACE_UPDATE.md`
- `docs/integrations/EPK_FOCUS_LOOP_SMOKE.md`
- `fixtures/epk-to-focus.sample-event-packet.json`
- `docs/app-cards/FOCUS_INTERACTION_STABILIZATION.md`

## Current Truths

- `EPK` is the current repo/implementation seed for Dave's public/professional Music/Career surface.
- The online EPK page is one public/export output inside the broader Music/Career domain, not the whole career app/interface.
- Prism Music/Career is not yet an approved fifth repo. A repo rename or new `prism-career` repo requires explicit approval and a follow-up Beam boundary contract.
- `prism-focus` owns daily planning, tasks, routines, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, safe execution boundaries, and suite AI routing.
- `prism-beam` owns AI-readable guidance, context packs, integration contracts, schemas, logs, prompt packs, anti-drift rules, and product-domain boundary decisions.
- Beam is not a monorepo and not a runtime dependency.
- Work one repo per sprint and one PR per sprint unless explicitly approved.
- Suite setup/readiness docs live under `docs/setup/` so future sessions can quickly find app launch paths, setup gaps, and schema UX needs before adding more pattern cards.
- All four active repos now have setup/readiness coverage:
  - Beam: suite readiness audit, setup matrix, setup landing page, and schema cards.
  - Focus: first-run setup guide/modal plus post-setup EPK import and browser interaction stabilization.
  - Spectra: read-only `doctor`, `setup`, and `workbench` path, plus setup-safe test command split.
  - EPK: first-run setup guide, publisher checklist, and Focus packet export panel.
- EPK can generate an `epk-to-focus.event-packet` JSON payload from the publisher, but it only proposes tasks; it does not send, sync, publish, or directly create Focus tasks.
- Focus has a review-first EPK packet importer: paste JSON, review packet, select proposed tasks, and import selected tasks only.
- Focus skips already-imported EPK task source IDs instead of creating duplicate task rows.
- Focus has a browser interaction repair layer for task-row drag grip behavior, planner month hover previews, planner no-clobber repaint traps, robust delete, and robust timer save.
- Focus has a keyboard command runtime for visible-task navigation, selected-task activation/timer actions, confirmed delete, and in-memory undo/redo snapshots. It must not run while the user is typing in inputs, textareas, selects, or contenteditable areas.

## Music/Career Direction

The Music/Career domain should eventually provide visibility and review-first operations across:

- artist/project identities and public modes;
- EPK, press, booking, one-sheet, and show-specific promo outputs;
- socials visibility and publishing queues;
- email/mailing-list and supporter awareness;
- back-catalogue reuse and content-batch planning;
- press, venue, presenter, and collaborator contacts;
- low-overwhelm scheduling and cadence guardrails.

This does not mean all of that belongs in the current EPK UI immediately. It means future work should stop treating a static EPK page as the conceptual parent. EPK/public outputs should be generated from or managed by a broader internal career surface.

## Future AI Reading Order

1. `ai-guides/START_HERE.md`
2. Relevant suite or workspace context pack
3. Relevant app guide
4. Relevant setup/readiness doc, app card, pattern, schema, or integration contract
5. Relevant build-method guide

Integration contracts and first schemas now live under `integrations/` and `schemas/`. Setup/readiness docs live under `docs/setup/`. App cards live under `docs/app-cards/`. Patterns and build-method guides are still Beam-004+ work. Music/Career research now lives under `docs/research/music-career/`, with a compressed suite pack at `context-packs/career-ops-research.md`.

## Safe Assumptions

- Use Beam for orientation and anti-drift memory.
- Verify target repo source before editing.
- Keep app implementation in the owning app repo.
- Use the setup/readiness docs before starting app setup or schema UX work.
- Treat setup guides as usability and safety surfaces, not as proof of runtime coupling.
- Treat the EPK -> Focus packet loop as manual and review-first until Beam records a later explicit automation contract.
- Treat Focus keyboard undo/redo as a local in-memory session safety net, not a persistent event log.
- Treat current `EPK` as the implementation seed for Music/Career public/professional outputs until Beam records a rename or new-repo decision.

## Do Not Infer

- Do not infer shared runtime coupling from shared docs.
- Do not infer private auth, publishing permission, or external-write approval from the existence of a guide.
- Do not let historical names override current repo names.
- Do not infer that schema validation permits hidden imports or app mutation.
- Do not infer that an app-specific setup checklist means browser/manual launch was verified unless that verification is explicitly recorded.
- Do not infer that the EPK -> Focus smoke fixture means Spectra should automate the loop.
- Do not infer that Focus keyboard commands are allowed to override typing targets.
- Do not infer that the Music/Career domain has already been implemented app-side.
- Do not infer that EPK public output can safely expose social/account/supporter/contact data.

## Useful Entry Points

- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- `docs/COORDINATION.md`
- App context packs under `context-packs/`
- App guides under `app-guides/`
- Setup/readiness audit at `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`
- App setup matrix at `docs/setup/APP_SETUP_MATRIX.md`
- Setup completion summary at `docs/setup/SUITE_SETUP_COMPLETION_SUMMARY.md`
- Spectra test surface update at `docs/setup/SPECTRA_TEST_SURFACE_UPDATE.md`
- Focus interaction stabilization card at `docs/app-cards/FOCUS_INTERACTION_STABILIZATION.md`
- EPK -> Focus loop smoke test at `docs/integrations/EPK_FOCUS_LOOP_SMOKE.md`
- Schema UX plan at `docs/setup/SCHEMA_UX_PLAN.md`
- Contract registry at `integrations/registry.md`
- Schema registry at `schemas/registry.json`
- Career-Ops context pack at `context-packs/career-ops-research.md`
- Career Assistant placement contract at `integrations/career-assistant-placement.contract.md`
- Music/Career research index at `docs/research/music-career/README.md`

## Validation Hints

- `git diff --check`
- `bash scripts/run-workspace-smoke.sh`
- Search for stale names when changing repo identity or suite topology.
- Run app-local launch/test commands before claiming an app is usable in a browser or shell.
- For EPK -> Focus, use `fixtures/epk-to-focus.sample-event-packet.json` and the manual smoke checklist before adding automation.
- For Music/Career implementation, have Claude or another reviewer check the boundary contract before writing app source.

## Future prompts can omit

Future prompts can omit the suite ownership map, Beam's non-runtime role, the one-repo/one-PR sprint rule, the default AI reading order, the location of the first contract/schema registries, the existence/location of the suite setup/readiness docs, and the review-first EPK -> Focus packet safety boundary.

Future prompts can also assume that first-run setup coverage exists for Beam, Focus, Spectra, and EPK, that EPK packet export and Focus packet import exist, that Focus has the browser interaction/keyboard command stabilization layer, and that EPK is now treated as the current implementation seed for a broader Music/Career domain. They must still verify app source before code changes.

## Update Rules

Refresh this pack when repo ownership changes, a new app joins the suite, Beam adds schemas/contracts that change the default reading order, app-specific setup/readiness status changes, an app stabilization pass changes safety-critical operating assumptions, or the Music/Career boundary is accepted, rejected, renamed, or implemented app-side.
