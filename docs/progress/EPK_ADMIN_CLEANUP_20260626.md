# EPK Admin Cleanup — 2026-06-26

## Summary

The EPK admin block-canvas upgrade and cleanup were merged into `devknowsdev/EPK` on `main`.

## EPK PRs

- `devknowsdev/EPK#14` — block-canvas admin upgrade.
  - Replaced `EPK/admin/admin.html`.
  - Updated `EPK/public/app.js` gallery rendering to use explicit per-mode `galleryPhotos` arrays.
  - Left `EPK/public/data/epk.json` untouched.
  - Merge commit: `ba0d48cbc333cbf5c45b591de8aead55b165d9d6`.

- `devknowsdev/EPK#15` — admin upgrade docs/package/validator.
  - Added `EPK/docs/ADMIN_BLOCK_CANVAS_UPGRADE.md`.
  - Added `EPK/scripts/validate-epk-admin-upgrade.mjs`.
  - Added `EPK/PACKAGE_MANIFEST.md`.
  - No public data changes.
  - Merge commit: `57bfb0654c476ba72e03fa91c9fc5022a19e5df3`.

## Source-of-truth decision

`devknowsdev/EPK@main` is canonical. Earlier generated ZIPs, pasted handovers, and chat-local files are historical artifacts only.

## Validation

EPK includes this static validator:

```bash
node EPK/scripts/validate-epk-admin-upgrade.mjs
```

The validator checks file presence, parseable `epk.json`, admin gallery migration support, admin `galleryPhotos` support, public app `mode.galleryPhotos` rendering, and no remaining `galleryCount` reference in `EPK/public/app.js`.

## Remaining follow-up

Browser/live verification is still recommended after the public host refreshes.
