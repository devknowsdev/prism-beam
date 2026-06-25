# Repo Source Escalation Policy

**Purpose:** Define when an AI session may move from Beam orientation into repo source inspection.

**Last verified:** 2026-06-25

## Default posture

Beam first. Exact source second. Broad scans last, and only when justified.

## Allowed source escalation

An AI may read repo source when:

- the user asks for implementation,
- Beam is insufficient or stale,
- a specific API/route/type/function must be verified,
- tests or build commands must be confirmed,
- a planned change names likely files,
- safety boundaries require source evidence.

## Required source behavior

When escalating, the AI should name:

- the repo,
- the exact file or directory,
- why it is needed,
- what question it will answer,
- and how the result will be compressed back into Beam.

## Forbidden as default orientation

Do not start with:

- reading every repo,
- reading all docs,
- reading all source files,
- scanning all history,
- or loading full deep-research archives.

## Source overrides Beam

Beam is orientation and memory. Source code is implementation truth.

When they conflict:

1. Trust source.
2. Mark the Beam pack stale.
3. Update or create a compact Beam note.
4. Avoid letting the next AI pay the same verification cost.

## Escalation budget

For free/low-context AI sessions, initial source escalation should be limited to at most 3 files or exact snippets unless the user explicitly expands the scope.

## Broad scan exception

A broad scan is acceptable only for tasks such as:

- repository restructuring,
- security audit,
- stale-pack refresh,
- source-of-truth audit,
- dependency/license audit,
- or explicit user request.

Even then, report partial findings early and compress outputs back into Beam.
