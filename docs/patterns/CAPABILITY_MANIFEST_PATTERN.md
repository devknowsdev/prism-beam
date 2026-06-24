# Capability Manifest Pattern

A capability manifest describes what a tool/app/adapter can safely do before any
AI session or orchestrator tries to use it.

## Use when

- Adding a new Spectra adapter.
- Describing an app capability for Beam.
- Preparing local-agent tools that need explicit boundaries.

## Include

- capability name
- owner repo
- allowed reads
- allowed writes
- approval requirements
- forbidden actions
- validation command
- rollback notes

## Do not use when

- The capability is still purely speculative.
- The manifest would imply permission to run hidden writes.

## Safety note

A manifest is descriptive, not permission by itself. Runtime execution still must
follow the suite approval posture.
