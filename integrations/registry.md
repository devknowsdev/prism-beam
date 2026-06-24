# Integration Registry

Initial Beam registry for suite contracts. These are reference contracts only;
they do not implement runtime imports, exports, or app-side writes.

| Integration | Status | Files | Source app | Target app | Risk class | Current implementation status | Next app-side implementation step |
|---|---|---|---|---|---|---|---|
| EPK -> Focus event/task packet | Draft contract; app-side manual loop exists | `integrations/epk-to-focus.event-packet.md`, `schemas/epk-to-focus.event-packet.schema.json`, `fixtures/epk-to-focus.sample-event-packet.json`, `docs/integrations/EPK_FOCUS_LOOP_SMOKE.md` | EPK | prism-focus | local-write after review | EPK PR #11 exports packet JSON from the publisher. Focus PR #13 imports selected tasks through a review screen. Beam PR #12 records the smoke fixture/checklist. No direct sync or hidden task creation. | Run the manual smoke loop cleanly, then add lightweight Focus importer tests before considering Spectra automation |
| EPK -> Spectra adapter/read-order contract | Draft contract | `integrations/epk-to-spectra.adapter-contract.md` | EPK | prism-spectra | read-only by default; external-write if publishing | Beam contract only; EPK already exposes `window.EPKAdapter` and `public/data/epk.json` | Add a Spectra EPK adapter that follows the read order and classifies any writes before execution |
| Suite approval posture | Draft contract | `integrations/approval-posture.md`, `schemas/approval-request.schema.json` | Prism suite | All suite apps | varies by action | Beam contract/schema only; Spectra already has approval/risk scaffolds; Focus importer follows review-first local-write posture | Align future app actions to the shared risk classes before adding integrations |

## Future prompts can omit

Future prompts can omit the initial integration list, file locations, default
risk posture, the existence of the manual EPK -> Focus packet loop, and the rule
that EPK proposes while Focus reviews/imports selected tasks.
