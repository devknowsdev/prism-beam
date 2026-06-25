# Prism Tiny Boot

**Purpose:** Tier-0 orientation for any AI session before reading repo source.

**Last verified:** 2026-06-25
**Target budget:** 500-1,000 tokens
**Hard max:** 1,500 tokens

## What Prism is

Prism is a multi-repo, local-first personal operating system / creative-development suite for Dave Knowles.

## Repo roles

- `prism-beam` — canonical AI-facing reference layer: context packs, contracts, schemas, research memory, prompt packs, harvest notes, anti-drift rules, and handovers. Beam is not runtime code and should not be imported as an app dependency.
- `prism-spectra` — suite AI cockpit and orchestration engine: local-first model routing, workbench/CLI, approvals, provenance, checkpoints, safe execution, and capability palette.
- `prism-focus` — downstream planning/focus app. It should request AI services through Spectra rather than owning model routing.
- `EPK` — downstream public music/professional app. It should request AI services through Spectra rather than owning model routing.

## First-load rule

Start with Beam, not a broad repo scan.

Recommended order:

1. `ai-guides/TINY_BOOT.md`
2. `context-packs/workspace/current-state.min.md`
3. One app mini-pack only if the task names an app.
4. Full current-surface packs only if the mini-pack is insufficient.
5. Repo source files only when directly needed to verify or implement the task.

## Never assume

- Do not assume Beam is newer than source code.
- Do not read all repos just to orient.
- Do not let Focus or EPK call external models directly.
- Do not turn Beam into runtime code.
- Do not allow hidden writes, hidden cloud escalation, broad background scans, publishing, email, deploys, or destructive actions.

## Source escalation

Source code overrides Beam when implementation facts conflict. After source verification, compress the finding back into Beam rather than forcing future AI sessions to rediscover it.
