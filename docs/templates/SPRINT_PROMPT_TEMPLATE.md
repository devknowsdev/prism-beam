# Codex Sprint Prompt Template

Use this template to start a Prism sprint with the right reading order and
boundaries.

## Repo

- Repository:
- Branch:
- Related repo(s):

## Current Confirmed State

- Current commit:
- What is already true:
- What must not change:

## Read First

- `docs/PRISM_BEAM_ROLE.md`
- `docs/ECOSYSTEM_OVERVIEW.md`
- `docs/REPO_BOUNDARIES.md`
- `docs/SHARED_VOCABULARY.md`
- `docs/CURRENT_SPRINT.md`

## Primary Goal

- Goal:
- Why this sprint exists:
- What success looks like:

## Forbidden Changes

- Runtime behavior changes
- Dependency additions
- Cross-repo refactors
- Hidden execution
- Destructive actions unless explicitly requested

## Required Build

- Required scripts:
- Required docs:
- Required checks:

## Tests

- `npm test`
- `npm run typecheck`
- `npm run build`

## Docs

- Files to create:
- Files to update:
- Links to add:

## Validation Commands

- `git status --short`
- `git diff --stat`
- Any repo-local smoke checks:

## Commit Instructions

- Stage only intentional files.
- Commit message:

## Push Instructions

- Push target:
- Branch name:
- PR target:

## Report Format

- Files added
- Files modified
- Dependencies added
- Runtime behavior changed
- Validation results
- Commit SHA
- Push result

## Beam Extraction Candidates

- What patterns could later live in Beam:
- What should stay repo-specific:

## Commit Message Suggestion

- `docs: ...`
