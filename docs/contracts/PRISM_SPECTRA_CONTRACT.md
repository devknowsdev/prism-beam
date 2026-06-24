# prism-spectra Support-Spine Contract

## Owner

`prism-spectra` owns local-first orchestration, adapters, approval boundaries,
sidecars, CLI/daemon/workbench surfaces, and safe execution flows.

## Beam relationship

Beam may store Spectra context packs, adapter/read-order contracts, approval
posture, schemas, and reusable pattern notes. Beam does not own Spectra runtime
execution code.

## Boundary rules

- Prefer structured adapters and explicit file references over scraping or
  inference.
- Classify action risk before execution.
- External writes and destructive operations require explicit approval.
- No hidden folder scanning or file watching unless explicitly approved.
- Workbench views should be read-first and calm before any apply/write action.
