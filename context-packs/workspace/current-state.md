# Workspace Current State

## Scope

Prism suite repo map and AI session orientation.

## Last Verified

2026-06-24 against Beam files from Beam-001 through setup/readiness completion, plus app-specific setup PRs in `EPK`, `prism-focus`, and `prism-spectra`.

Suite-Setup-001 added the first connector-evidence setup/readiness map for app launch, installability, and schema UX. App-specific setup passes have now landed for Focus, Spectra, and EPK.

## Evidence Used

- `README.md`
- `docs/COORDINATION.md`
- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- Local sibling `EPK`, `prism-focus`, and `prism-spectra` README/docs/source entry points.
- `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`
- `docs/setup/APP_SETUP_MATRIX.md`
- `docs/setup/SCHEMA_UX_PLAN.md`
- `docs/setup/SUITE_SETUP_COMPLETION_SUMMARY.md`

## Current Truths

- `EPK` owns structured public/promotional truth.
- `prism-focus` owns daily planning, tasks, and personal execution state.
- `prism-spectra` owns orchestration, adapters, approvals, and safe execution boundaries.
- `prism-beam` owns AI-readable guidance, context packs, integration contracts, schemas, logs, prompt packs, and anti-drift rules.
- Beam is not a monorepo and not a runtime dependency.
- Work one repo per sprint and one PR per sprint unless explicitly approved.
- Suite setup/readiness docs live under `docs/setup/` so future sessions can quickly find app launch paths, setup gaps, and schema UX needs before adding more pattern cards.
- All four active repos now have setup/readiness coverage:
  - Beam: suite readiness audit and setup matrix.
  - Focus: first-run setup guide/modal.
  - Spectra: read-only `doctor`, `setup`, and `workbench` path.
  - EPK: first-run setup guide and publisher checklist.

## Future AI Reading Order

1. `ai-guides/START_HERE.md`
2. Relevant suite or workspace context pack
3. Relevant app guide
4. Relevant setup/readiness doc, pattern, schema, or integration contract
5. Relevant build-method guide

Integration contracts and first schemas now live under `integrations/` and `schemas/`. Setup/readiness docs live under `docs/setup/`. Patterns and build-method guides are still Beam-004+ work.

## Safe Assumptions

- Use Beam for orientation and anti-drift memory.
- Verify target repo source before editing.
- Keep app implementation in the owning app repo.
- Use the setup/readiness docs before starting app setup or schema UX work.
- Treat setup guides as usability and safety surfaces, not as proof of runtime coupling.

## Do Not Infer

- Do not infer shared runtime coupling from shared docs.
- Do not infer private auth, publishing permission, or external-write approval from the existence of a guide.
- Do not let historical names override current repo names.
- Do not infer that schema validation permits hidden imports or app mutation.
- Do not infer that an app-specific setup checklist means browser/manual launch was verified unless that verification is explicitly recorded.

## Useful Entry Points

- `ai-guides/START_HERE.md`
- `ai-guides/REVIEW_FIRST.md`
- `docs/COORDINATION.md`
- App context packs under `context-packs/`
- App guides under `app-guides/`
- Setup/readiness audit at `docs/setup/SUITE_USABILITY_READINESS_AUDIT.md`
- App setup matrix at `docs/setup/APP_SETUP_MATRIX.md`
- Setup completion summary at `docs/setup/SUITE_SETUP_COMPLETION_SUMMARY.md`
- Schema UX plan at `docs/setup/SCHEMA_UX_PLAN.md`
- Contract registry at `integrations/registry.md`
- Schema registry at `schemas/registry.json`

## Validation Hints

- `git diff --check`
- `bash scripts/run-workspace-smoke.sh`
- Search for stale names when changing repo identity or suite topology.
- Run app-local launch/test commands before claiming an app is usable in a browser or shell.

## Future prompts can omit

Future prompts can omit the suite ownership map, Beam's non-runtime role, the one-repo/one-PR sprint rule, the default AI reading order, the location of the first contract/schema registries, and the existence/location of the suite setup/readiness docs.

Future prompts can also assume that first-run setup coverage exists for Beam, Focus, Spectra, and EPK, but must still verify app source before code changes.

## Update Rules

Refresh this pack when repo ownership changes, a new app joins the suite, Beam adds schemas/contracts that change the default reading order, or setup/readiness status changes after app-specific setup PRs.
