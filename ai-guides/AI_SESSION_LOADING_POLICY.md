# AI Session Loading Policy

**Purpose:** Keep Prism AI sessions token-efficient, source-grounded, and safe.

**Last verified:** 2026-06-25
**Target budget:** 1,000-1,500 tokens
**Hard max:** 2,000 tokens

## Core rule

Use Beam as the orientation layer, then escalate to exact source files only when needed.

Do not start a session by reading every repo, every doc, or every source file.

## Loading tiers

### Tier 0 — Tiny bootstrap

Read first in every session:

- `ai-guides/TINY_BOOT.md`

Goal: understand Prism roles, repo ownership, and hard no-go assumptions in under 1,000 tokens.

### Tier 1 — Task orientation

Read only the smallest pack relevant to the task:

- `context-packs/workspace/current-state.min.md`
- app-specific mini-pack when available
- relevant session-start guide only for that app

Goal: orient to the current task without broad source reads.

### Tier 2 — Evidence escalation

Read full packs, contracts, or source files only when Tier 1 is insufficient.

Allowed examples:

- a specific source file named by the task
- an API route implementation that must be verified
- a contract relevant to the requested change
- a test file needed for validation

Forbidden as default orientation:

- recursive repo scans
- reading all docs
- reading all source files
- loading long research reports into first context

## Session type rules

### Implementation sessions

Read Beam first. Then read only the files likely to be edited or tested. Source code overrides Beam for implementation facts.

### Research sessions

Read Beam summaries and current-surface packs first. Escalate to repo source only to verify claims or inspect current surfaces.

### Codex / coding-agent sessions

Give Codex the tiny boot, the relevant mini-pack, a tight task prompt, expected files, tests, and safety boundaries. Do not paste long research archives unless required.

### Free / low-context AI sessions

Use `ai-guides/FREE_AI_MODE.md`. Keep first-load context under 5,000 tokens where possible.

## Staleness rule

Every pack should include:

- `Last verified`
- `Verified against`
- owning repo or scope
- source pointers when relevant
- assumptions not to make

Context packs must include a `Verified against` field describing the source state the pack was
checked against (a repo, branch, date range, or "Beam internal"). A pack without this field
should be treated as potentially stale.

When Beam conflicts with source, source wins. Update Beam after verification.

## Compression-back rule

After any significant repo inspection or deep research, compress findings back into Beam as:

- a mini-pack,
- a current-surface update,
- a schema/harvest entry,
- or a handover prompt.

Use `templates/COMPRESSION_BACK_ENTRY.md` as the standard format for recording source findings
back into Beam. A compression note should be added to the relevant context pack or
`docs/progress/` within the same session that performed the source read.

The goal is to avoid paying the same orientation cost twice.
