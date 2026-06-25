# Spectra Security, Approval, Sandbox, and Rollback Audit Summary

**Purpose:** Compact Beam record of safety requirements before Spectra expands write-capable execution.

**Last verified:** 2026-06-25
**Source:** User-provided Spectra/OpenRouter/safety research output, 2026-06-25.

## Safety decision

Spectra should default to read/preview/propose. Write, destructive, external, expensive, terminal/process, and cloud-boundary actions require visible policy and approval.

## Risk classes

| Risk class | Examples | Approval | Checkpoint | MVP |
|---|---|---|---|---|
| observe/read | read files, inspect status | no | no | yes |
| preview | plan, diff, dry-run | no | no | yes |
| write | file edits, commits | yes | yes | yes, gated |
| destructive | delete/force/format | yes | yes | defer |
| external | API/cloud/webhook | yes | n/a | yes, gated |
| expensive | large model/media compute | warning/approval | n/a | yes, gated |
| terminal/process | shell/test/build | yes | maybe | yes, visible |
| cloud-data-boundary | send context off-device | yes | n/a | yes, gated |
| background-scan | broad file scan/watch | yes | n/a | defer |
| media-transform | ffmpeg/transcription | warning/approval | source backup if writing | later/gated |
| repo-modification | merge/push/rebase | yes | yes | defer or strict |

## Hard rules

- No hidden writes.
- No hidden cloud escalation.
- No external writes without approval.
- No destructive action without approval and rollback note.
- Patch preview before apply.
- Test commands visible before run.
- Checkpoint before risky writes.
- Event/provenance logging required.
- Safe failure should leave files unchanged or clearly revertible.

## UI requirements

Before approval, show:

- action type,
- affected files/data,
- model/provider/tool involved,
- local vs cloud boundary,
- estimated cost when known,
- rollback/checkpoint availability,
- exact command or diff where relevant.

## Beam/Spectra split

Beam stores safety policy and patterns. Spectra enforces approvals, checkpoints, sandboxing, and provenance.
