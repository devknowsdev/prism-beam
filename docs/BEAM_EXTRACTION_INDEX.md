# Beam Extraction Index

This index tracks reusable candidates extracted from Prism work. It distinguishes
between material that belongs in Beam as reference and material that should stay
inside an app repo.

## Current extraction candidates

| Candidate | Source repo | Stability | Extraction mode | Next action |
|---|---|---|---|---|
| EPK public/admin separation | `EPK` | stable | Beam pattern card | Preserve as reusable public-surface rule. |
| EPK browser-only poster export | `EPK` | emerging | Beam pattern card | Keep export-only safety notes; app code stays in EPK. |
| EPK site vs poster template separation | `EPK` | emerging | Beam pattern card | Preserve as UX decision and app guide rule. |
| Focus local-first browser state | `prism-focus` | stable | Beam pattern card | Document backup/import cautions. |
| Focus AI whitelist/audit | `prism-focus` | stable | Beam pattern card/schema reference | Keep command whitelist rules visible. |
| Spectra approval queue | `prism-spectra` | emerging | Beam pattern and approval contract | Keep risk classes and approval flow in Beam. |
| Spectra explicit-file sidecar | `prism-spectra` | emerging | Beam pattern/schema reference | Preserve no-hidden-scan rule. |
| Spectra workbench data spine | `prism-spectra` | emerging | Beam pattern note | Keep implementation in Spectra until stable. |

## Extraction rule

Stable, cross-app, AI-consumable knowledge belongs in Beam. Rapidly changing
runtime implementation stays in the app repo.

## What future prompts can omit

Future prompts can point to this index instead of relisting the first extraction
candidates and their copy-vs-reference status.
