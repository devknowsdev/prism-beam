# Integration Registry

Initial Beam registry for suite contracts. These are reference contracts only;
they do not implement runtime imports, exports, or app-side writes.

| Integration | Status | Files | Source app | Target app | Risk class | Current implementation status | Next app-side implementation step |
|---|---|---|---|---|---|---|---|
| EPK -> Focus event/task packet | Draft contract | `integrations/epk-to-focus.event-packet.md`, `schemas/epk-to-focus.event-packet.schema.json` | EPK | prism-focus | local-write after review | Beam contract/schema only; no Focus import UI yet | Build a Focus review/import screen that validates packets before creating or scheduling tasks |
| EPK -> Spectra adapter/read-order contract | Draft contract | `integrations/epk-to-spectra.adapter-contract.md` | EPK | prism-spectra | read-only by default; external-write if publishing | Beam contract only; EPK already exposes `window.EPKAdapter` and `public/data/epk.json` | Add a Spectra EPK adapter that follows the read order and classifies any writes before execution |
| Suite approval posture | Draft contract | `integrations/approval-posture.md`, `schemas/approval-request.schema.json` | Prism suite | All suite apps | varies by action | Beam contract/schema only; Spectra already has approval/risk scaffolds | Align future app actions to the shared risk classes before adding integrations |

## Future prompts can omit

Future prompts can omit the initial integration list, file locations, default
risk posture, and next app-side implementation steps.
