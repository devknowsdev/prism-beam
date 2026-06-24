# Future prism-music Contract

Purpose: define the intended implementation boundary for the future Prism-named
music management layer.

## Repo Purpose

`prism-music` is the future business/output layer for bookings, mail, social
posts, content creation, publishing, design, website, networking, gigs,
releases, CRM, and broader music business operations.

This contract is forward-looking until a repo or runtime exists to own it.

## Owns

- Music business workflows
- Booking and lead management
- Content and publication planning
- CRM-style records for the music business
- Social and mail operations
- Release and gig coordination

## Does Not Own

- Prism Core execution logic
- Capability routing
- Dashboard UI state
- Workspace coordination docs
- EPK-only public surface behavior

## Allowed Implementation Work

- Planning documents
- Future repo scaffolding when approved
- Business workflow models
- Music-output data contracts

## Forbidden Implementation Work

- Absorbing Prism Core execution logic
- Owning dashboard widgets
- Owning coordination docs as a substitute for runtime
- Taking over EPK public-surface behavior without an explicit migration plan

## Canonical State Rules

- Music management canonical state should stay separate from Prism Core state.
- If EPK is absorbed later, its public surface content should remain a distinct
  surface within the broader music-management model.

## External Action Rules

- Bookings, mail, social, publishing, and CRM actions require human approval.
- The layer should not bypass the approval gate by calling external systems
  directly from unrelated repos.

## Testing and Validation Expectations

- Planning-doc validation only until the repo exists
- Future runtime validation should be local-first and approval-aware

## Documentation Expectations

- Keep this contract as a planning reference until a real `prism-music` repo or
  runtime exists.

## Correct Changes

- Define booking workflows
- Define music-business records
- Describe a social publishing approval flow
- Plan how EPK will be absorbed later

## Boundary Violations

- Copying Prism Core execution code
- Turning the layer into a dashboard repo
- Replacing the EPK public surface contract with a full CRM system too early

