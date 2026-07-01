# Integration Registry

Initial Beam registry for suite contracts. These are reference contracts only;
they do not implement runtime imports, exports, or app-side writes.

| Integration | Status | Files | Source app | Target app | Risk class | Current implementation status | Next app-side implementation step |
|---|---|---|---|---|---|---|---|
| EPK -> Focus event/task packet | Draft contract; app-side manual loop exists | `integrations/epk-to-focus.event-packet.md`, `schemas/epk-to-focus.event-packet.schema.json`, `fixtures/epk-to-focus.sample-event-packet.json`, `docs/integrations/EPK_FOCUS_LOOP_SMOKE.md` | EPK | prism-focus | local-write after review | EPK PR #11 exports packet JSON from the publisher. Focus PR #13 imports selected tasks through a review screen. Beam PR #12 records the smoke fixture/checklist. No direct sync or hidden task creation. | Run the manual smoke loop cleanly, then add lightweight Focus importer tests before considering Spectra automation |
| EPK -> Spectra adapter/read-order contract | Draft contract | `integrations/epk-to-spectra.adapter-contract.md` | EPK | prism-spectra | read-only by default; external-write if publishing | Beam contract only; EPK already exposes `window.EPKAdapter` and `public/data/epk.json` | Add a Spectra EPK adapter that follows the read order and classifies any writes before execution |
| Suite approval posture | Draft contract | `integrations/approval-posture.md`, `schemas/approval-request.schema.json` | Prism suite | All suite apps | varies by action | Beam contract/schema only; Spectra already has approval/risk scaffolds; Focus importer follows review-first local-write posture | Align future app actions to the shared risk classes before adding integrations |
| Career Assistant / Music-Career placement | Draft contract; Claude review requested before implementation | `context-packs/career-ops-research.md`, `integrations/career-assistant-placement.contract.md`, `docs/research/music-career/README.md` | EPK as Music/Career seed, prism-focus, prism-spectra | EPK as Music/Career seed, prism-focus, prism-spectra | Spectra AI request is read-only; local-draft/local-write only after app review; external-write blocked | Beam contract/research only. EPK is now framed as current implementation seed for a broader Music/Career domain; the EPK page is one public/export output, not the whole app. No app-side implementation assumed. | Have Claude vet the boundary, data ownership, privacy, and minimal implementation slice before any app-source PR |

## Future prompts can omit

Future prompts can omit the initial integration list, file locations, default
risk posture, the existence of the manual EPK -> Focus packet loop, the rule
that EPK proposes while Focus reviews/imports selected tasks, and the draft
Career Assistant / Music-Career placement row.
