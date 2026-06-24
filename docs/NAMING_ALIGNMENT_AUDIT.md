# Naming Alignment Audit

Purpose: track legacy and current names so the ecosystem can move toward a
consistent Prism vocabulary without mass renaming.

Legend:
- `current` = actively appropriate today
- `legacy` = historically useful, but should stay mostly in historical or
  compatibility contexts
- `ambiguous` = can mean different things depending on context

| Term | Representative locations | Status | Should remain? | Update later? |
|---|---|---|---|---|
| `ADHDashboard` | `prism-focus/README.md`, `prism-focus/PROJECT_INDEX.md`, `prism-focus/src/state.js`, `prism-focus/docs/archived/*`, `prism-beam/deploy/ADHDashboard-cloudflare.md`, `prism-spectra/PERSONAL_SYSTEMS_CONSTITUTION.md` | legacy | Yes, in migration keys and historical docs | Yes, reduce in new user-facing docs |
| `AI-Forge` | `prism-spectra/README.md`, `prism-spectra/package.json`, `prism-spectra/PROJECT_BRIEF.md`, `prism-spectra/docs/PROJECT_PORTAL.md`, `prism-spectra/src/cli.ts`, `prism-beam/deploy/AI-Forge-deploy.md` | current alias | Yes | Optional: prefer `Prism Core` in cross-repo prose |
| `Spectra` | `prism-spectra` docs and code comments, `EPK/EPK/README.md` section `Spectra Bridge`, `prism-beam` docs when referring to the bridge or repo | ambiguous | Yes, when it clearly means the orchestrator or bridge | Yes, avoid bare shorthand where `prism-spectra` is clearer |
| `Focus` | `prism-focus` product name, `focusboard`, `focus timer`, `focus mode` in source and docs, `prism-beam` architecture docs when describing the dashboard layer | current but context-sensitive | Yes | Maybe, only if future product naming needs more specificity |
| `Beam` | `prism-beam` repo name, README, coordination docs, scripts and templates | current | Yes | No immediate change needed |
| `EPK` | `EPK/README.md`, `EPK/public/index.html`, `EPK/public/data/epk.json`, `prism-beam/docs/*` | current surface | Yes | Yes, if absorbed into `prism-music` later |
| `Prism` | `prism-beam/docs/*`, `prism-spectra` docs, `prism-focus` README pointer, EPK README pointer | current umbrella brand | Yes | No immediate change needed |
| `Personal OS` | `prism-spectra/docs/PERSONAL_OS_OVERVIEW.md`, `prism-spectra/PERSONAL_SYSTEMS_CONSTITUTION.md`, `prism-focus/docs/ORIENTATION.md`, `prism-beam/docs/ECOSYSTEM_OVERVIEW.md` | current architecture umbrella | Yes, in architecture docs | Maybe, keep only where the architecture model is the topic |
| `orchestration` | `prism-spectra/README.md`, `prism-spectra/docs/*`, `prism-beam/docs/*`, `prism-focus` docs where it is excluded from ownership | current | Yes | No immediate change needed |
| `executive` | `prism-beam/docs/ECOSYSTEM_OVERVIEW.md`, `prism-beam/docs/REPO_BOUNDARIES.md`, `prism-spectra` architecture docs | current layer term | Yes | No immediate change needed |
| `capability` | `prism-spectra/src/capabilities/*`, `prism-spectra/README.md`, `prism-spectra/docs/*`, `prism-beam/docs/SHARED_VOCABULARY.md` | current core term | Yes | No immediate change needed |
| `Music Management` | `prism-beam/docs/ECOSYSTEM_OVERVIEW.md`, `prism-beam/docs/REPO_BOUNDARIES.md`, `prism-beam/docs/SHARED_VOCABULARY.md`, `prism-spectra/PERSONAL_SYSTEMS_CONSTITUTION.md` | current architectural phrase | Yes | Yes, prefer `prism-music` as the concrete layer name |
| `music layer` | `prism-spectra/PERSONAL_SYSTEMS_CONSTITUTION.md`, `prism-focus/docs/archived/PERSONAL_SYSTEMS_CONSTITUTION.md` | ambiguous / legacy shorthand | Sometimes, only as shorthand in historical docs | Yes, update later to `prism-music` |

## Notes

- `ADHDashboard` is still present where it helps migration, history, or storage
  compatibility.
- `AI-Forge` remains the package and project lineage name for `prism-spectra`.
- `EPK` is now documented as a surface that can be absorbed into `prism-music`.
- `Prism` is the umbrella brand and should remain the preferred current name in
  ecosystem-wide docs.

