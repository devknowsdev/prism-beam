# Beam Extraction Index

This index tracks reusable candidates extracted from Prism work so far. It is a
map of what is stable enough for Beam documentation, what may become shared
code later, and what should stay repo-specific for now.

## Index

| Candidate | Source repo | Source files / docs | Stability | Extraction mode | Next action |
|---|---|---|---|---|---|
| Capability manifest validation pattern | `prism-spectra` | `docs/CAPABILITY_MANIFEST_SCAFFOLD.md`, `src/capabilities/manifest.ts`, `src/index.ts`, `test/run.ts` | emerging | future shared code | Keep the documented rules in Beam and revisit shared validator helpers only after the manifest shape stops changing. |
| Event ledger contract pattern | `prism-spectra` | `docs/EVENT_LEDGER_AND_APPROVAL_QUEUE.md`, `src/events/ledger.ts`, `test/run.ts` | emerging | documented pattern | Keep the append-only contract in Beam and wait for persistence before extracting code. |
| Approval queue contract pattern | `prism-spectra` | `docs/EVENT_LEDGER_AND_APPROVAL_QUEUE.md`, `src/approvals/queue.ts`, `src/workbench/dataSpine.ts`, `test/run.ts` | emerging | documented pattern | Keep the queue shape and decision model documented in Beam; do not move execution logic. |
| Workbench data spine pattern | `prism-spectra` | `docs/SPECTRA_WORKBENCH_SHELL.md`, `docs/SPECTRA_WORKBENCH_DATA_SPINE.md`, `src/workbench/dataSpine.ts`, `ui/workbench/index.html` | emerging | repo-specific only | Reuse the calm read-model idea in Beam, but keep the actual UI shell in Spectra until it proves stable. |
| Sprint prompt template | `prism-beam` | `docs/templates/SPRINT_PROMPT_TEMPLATE.md`, `docs/prompts/CODEX_*.md` | stable | documented pattern | Use the template as the default starting point for future Codex sprint prompts. |
| Handover report template | `prism-beam` | `docs/templates/HANDOVER_REPORT_TEMPLATE.md` | stable | documented pattern | Use the template for sprint closeouts and preserve the short report structure. |
| Repo hygiene checklist | `prism-beam` | `docs/checklists/REPO_HYGIENE_CHECKLIST.md`, `docs/CHANGE_BOUNDARY_CHECKLIST.md` | stable | documented pattern | Keep the checklist visible in onboarding and handoff docs. |
| Safe capability integration checklist | `prism-beam` | `docs/checklists/SAFE_CAPABILITY_INTEGRATION_CHECKLIST.md`, `docs/contracts/PRISM_SPECTRA_CONTRACT.md` | stable | documented pattern | Keep it as the guardrail for future capability integrations. |
| AI session contracts | `prism-beam` | `docs/AI_SESSION_CONTRACTS.md` | stable | documented pattern | Keep using it to separate documentation, audit, runtime, and cross-repo sessions. |
| Change boundary checklist | `prism-beam` | `docs/CHANGE_BOUNDARY_CHECKLIST.md` | stable | documented pattern | Reuse it in sprint prompts and before-edit checks. |
| Shared vocabulary | `prism-beam` | `docs/SHARED_VOCABULARY.md` | stable | documented pattern | Keep it as the canonical term list for Prism ecosystem docs. |
| Ecosystem and boundary docs | `prism-beam` | `docs/ECOSYSTEM_OVERVIEW.md`, `docs/REPO_BOUNDARIES.md` | stable | documented pattern | Keep Beam as the reference point for repo roles and seams. |

## Notes

- Candidates marked `emerging` should stay in Beam as patterns first.
- Candidates marked `stable` can be referenced freely by future sprints.
- A `future shared code` item should stay documented until at least one more
  repo needs the same logic.
- `repo-specific only` means the pattern is useful, but the implementation
  should remain in the owning runtime repo for now.
