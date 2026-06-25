# Compression-Back Entry Template

Use this when you have inspected a source file and want to record the finding
in Beam so a future AI does not pay the same read cost.

Paste this block into the relevant context pack or create a note under `docs/progress/`.

---

**Source inspected:** [repo/path — e.g. `prism-spectra/src/router/index.ts`]  
**Session:** [YYYY-MM-DD — AI type]  
**Question answered:** [The specific question this file was read to answer — one sentence.]

**Finding:**  
[2–4 sentences. The key fact discovered. State only what was confirmed in the file, not inferences.]

**Pack impact:**  
[Which Beam pack(s) this affects, and how:]
- `[pack path]` — confirms current / contradicts current / update needed / no change needed

**Beam file updated:**  
[Path of Beam file updated, OR: "Not yet updated — next AI should update `[path]` based on the finding above."]

**Verification method:**  
[What a future AI would need to check to confirm this is still current — e.g. "Run `grep -n routeTask src/router/index.ts` and confirm function still exists at line ~42."]

---
