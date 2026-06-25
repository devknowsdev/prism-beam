# EPK Current Surface — Mini

**Purpose:** Tier-1 app card for low-token EPK sessions.

**Last verified:** 2026-06-25
**Scope:** `EPK`. Verify source before implementation.

## Role

EPK is the public music/professional presence app for Dave Knowles.

## AI boundary

EPK should request AI services through Spectra rather than owning provider/model routing directly.

## Expected AI use cases

- draft or refine public copy,
- summarise professional material,
- help prepare media/press-kit text,
- propose updates for review.

## Safety defaults

- No hidden publishing.
- No hidden email or external write.
- No direct cloud-model escalation from EPK.
- Any public-facing content changes should remain reviewable.
- Source/content truth should be preserved carefully.

## Relevant Beam packs

- `context-packs/workspace/current-state.min.md`
- `docs/contracts/SUITE_AI_ENGINE_BOUNDARY.md`
- `integrations/approval-posture.md`
- `ai-guides/AI_SESSION_LOADING_POLICY.md`

## Source escalation

For EPK implementation, read this mini-pack first, then inspect only exact EPK files needed for the requested change.
