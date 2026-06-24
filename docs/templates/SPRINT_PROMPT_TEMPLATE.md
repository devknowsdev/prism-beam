# Sprint Prompt Template

```text
# Codex Sprint — <sprint name>

## Repository

<owner/repo>

## Branch

codex/<short-sprint-name>

## PR title

<type>: <summary>

## Orientation

- What has already been completed.
- What must not be redone.
- What repo/context files to read first.

## Goal

<single clear goal>

## Repos in scope

Modify only:
- <repo>

Inspect only if needed:
- <other repos>

## Required changes

1. <file or feature>
2. <file or feature>

## Constraints

- One repo per sprint.
- No hidden writes.
- No fake auth.
- No dependency changes unless requested.
- No destructive operations without explicit approval.

## Validation

<commands>

## Expected final report

- branch
- commit SHA
- PR URL
- files created/modified
- validation results
- caveats
- what future prompts can omit

## Acceptance criteria

<clear checklist>
```
