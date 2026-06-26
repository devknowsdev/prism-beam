# Beam Context Budgets

**Purpose:** Keep Beam useful as a context-compression layer instead of allowing it to become another large corpus that every AI session must read.

**Last verified:** 2026-06-25

## Budget table

| File type | Target token budget | Hard maximum | First-load? | Purpose |
|---|---:|---:|---|---|
| Tiny bootstrap | 500-1,000 | 1,500 | yes | fresh session orientation |
| App card / mini-pack | 500-1,500 | 2,000 | task-only | repo role, boundary, key APIs |
| Current-surface pack | 1,500-4,000 | 6,000 | task-only | current implementation state |
| Task prompt pack | 1,000-3,000 | 5,000 | task-only | targeted execution context |
| Contract | 1,000-3,000 | 5,000 | only if relevant | stable cross-repo rule |
| Research summary | 3,000-8,000 | 12,000 | no | durable research result |
| Full research archive | no strict limit | archive only | never by default | raw long-form evidence |
| Handover prompt | 1,000-4,000 | 6,000 | continuation only | session carry-over |
| Repo snapshot | 2,000-6,000 | 10,000 | evidence escalation | verified current facts |

## Enforcement rule

A file above its target budget must gain one of:

- a compact `.min.md` version,
- a summary header,
- a `Read only if...` gate,
- a split into smaller task-specific packs,
- or archive status.

## First-load budget

A normal AI session should orient with under 5k-10k tokens before reading source.

A free/low-context session should start with only:

- `ai-guides/TINY_BOOT.md`
- `context-packs/workspace/current-state.min.md`
- one app mini-pack if needed
- the specific user request

## Measurement targets

Beam should reduce:

- repeated suite explanation,
- broad repo scans,
- stale-doc drift,
- token burn before first useful action,
- and handover loss between AI sessions.

The current audit estimates typical savings around 60%, with narrow continuation or prompt-writing tasks often saving 80%+.

## Enforcement

Run `bash scripts/check-token-budgets.sh` from the repo root to validate key files against
hard maxes. Add this to a pre-commit hook or run it before each Beam structural session.

The script is a character-count proxy (4 chars ≈ 1 token). For precise counts, use tiktoken
or paste individual files into a token counter.
