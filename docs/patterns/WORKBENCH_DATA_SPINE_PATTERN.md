# Workbench Data Spine Pattern

This pattern describes the read-only spine that feeds the Spectra workbench
shell and similar calm operator surfaces.

## Read-Only Projection Pattern

The data spine should project read models from stable sources rather than
manufacture fake state.

Typical sources include:

- capability manifests
- approval queues
- event ledgers
- checkpoint summaries
- conversation summaries

## Core Surfaces

The workbench should organise itself around a small persistent navigation set:

- Resume
- Approvals
- Changes
- Capabilities
- Settings

## Calm Workbench Principle

- Sparse beats busy.
- Keyboard-friendly beats mouse-only.
- Stable summaries beat noisy dashboards.
- Clear next actions beat overwhelming options.

## Empty-State Discipline

- Empty states are valid states.
- Do not invent fake history just to fill the screen.
- Show what is missing and what the next safe action is instead.

## No Fake-Real Data

- Mock data can help tests.
- Demo data should never look like canonical user history.
- The UI should make real state and fixture state easy to tell apart.

## Read Model Before Write Actions

The spine should help the user understand:

- where they are
- what is pending
- what changed
- what is safe next

Only after that should a separate execution path offer write actions.

## How Other Repos Can Use The Pattern

- A CLI can mirror the same surfaces as compact commands.
- A different dashboard can reuse the same calm read model.
- A support repo can generate templates or cards from the same manifest and
  event shapes.

## Important Rule

The data spine is a projection layer, not an execution layer.
