# Capability Manifest Pattern

This pattern describes how Prism records optional capabilities so the UI,
approval logic, and future workers can reason about them without executing
anything automatically.

## Purpose

- Describe a capability with enough structure to show risk, cost, boundary, and
  preview state.
- Keep optional tools governable before they are wired into runtime execution.
- Give the workbench a stable metadata shape it can render directly.

## When To Use It

- When a tool, worker, sidecar, or external binary may be loaded optionally.
- When capability behaviour depends on approval class, boundary state, or
  resource cost.
- When UI screens need to be generated from metadata rather than hard-coded
  per tool.

## Core Fields

Capability manifests usually include:

- Identity: `id`, `title`, `description`, `category`
- Source: package, repository, licence, licence risk, attribution requirement
- Runtime: `loadMode`, `cpuProfile`, `memoryProfile`, `supportsCancellation`,
  `supportsProgress`, `supportsPreview`, `offlineCapable`,
  `appleSiliconFriendly`
- Boundaries: `localOnly`, `remoteOptional`, `remoteRequired`,
  `sendsUserDataOffMachine`, `modelDownloadRequired`
- Safety: `approvalClass`, `reversible`, `checkpointPolicy`, `riskNotes`
- IO: `inputTypes`, `outputTypes`, `sideEffects`
- UI: `surfaces`, `density`
- Provenance: `eventTypes`, `storesArtifacts`, `storesSettings`,
  `storesModelInfo`
- Commands: `cli`, `api`
- Tests: `required`, `fixtureTypes`

## Common Enums

### Load Modes

- `always`
- `lazy`
- `web_worker`
- `daemon_worker`
- `external_binary`
- `optional_sidecar`
- `reference_only`
- `avoid`

### CPU / Memory Profiles

- `tiny`
- `small`
- `medium`
- `heavy`
- `extreme`

### Approval Classes

- `observe`
- `preview`
- `write`
- `destructive`
- `remote`
- `expensive`

### Checkpoint Policies

The exact enum can grow with the product, but the pattern should clearly name
the checkpoint expectation. Current Prism usage includes values such as:

- `none`
- `before_write`
- `before_and_after`

## Validation Rules

A manifest should be rejected if:

- `id` is empty or does not look stable.
- `title` is empty.
- `avoid` or `reference_only` tries to register active CLI or API commands.
- `heavy` or `extreme` uses `loadMode: always`.
- `remoteRequired` or `sendsUserDataOffMachine` does not use approval class
  `remote`.
- `write`, `destructive`, or `expensive` lacks either preview support or a risk
  note that explains why preview is impossible.
- `write` or `destructive` uses `checkpointPolicy: none`.
- `external_binary` has neither a CLI command nor a binary-related risk note.
- `modelDownloadRequired` is true but provenance does not store model info.
- `destructive` is reversible without explicit risk notes.
- `localOnly` and `remoteRequired` are both true.
- Any enum field falls outside the allowed set.

## Example Outline

```ts
const manifest = {
  id: "ffmpeg.video.clip",
  title: "FFmpeg Video Clip",
  description: "Create a short clip from local media files.",
  category: "media",
  source: {
    package: "ffmpeg",
    repository: "https://ffmpeg.org/",
    license: "LGPL/GPL family",
    licenseRisk: "high",
    attributionRequired: true,
  },
  runtime: {
    loadMode: "external_binary",
    cpuProfile: "heavy",
    memoryProfile: "heavy",
    supportsCancellation: true,
    supportsProgress: true,
    supportsPreview: true,
    offlineCapable: true,
    appleSiliconFriendly: "depends on local binary build",
  },
  boundaries: {
    localOnly: true,
    remoteOptional: false,
    remoteRequired: false,
    sendsUserDataOffMachine: false,
    modelDownloadRequired: false,
  },
  safety: {
    approvalClass: "expensive",
    reversible: true,
    checkpointPolicy: "before_and_after",
    riskNotes: ["Long-running media job.", "Keep approval gate visible."],
  },
};
```

## What Stays Spectra-Specific

- The actual manifest validator implementation
- The runtime registry surface
- Product-specific seed manifests
- Runtime approval and checkpoint wiring

## What Could Later Become Beam Shared Library Code

- Shared enum types
- Shared manifest validation helpers
- Shared rendering helpers for approval cards and capability cards
- Shared doc generation helpers for future repos
