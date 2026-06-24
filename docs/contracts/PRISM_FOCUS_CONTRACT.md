# prism-focus Contract

Purpose: define the implementation boundary for the human-facing operations
dashboard.

## Repo Purpose

`prism-focus` owns the human operations UI for planning, budgeting, tracking,
daily execution, task management, review, and widgets.

## Owns

- Dashboard UI
- Widgets and widget layout
- Local browser state
- Planning and task management flows
- Review and daily execution flows
- Optional AI helpers that support the UI

## Does Not Own

- Core model routing
- Provider selection policy
- Adapter internals
- External publishing logic
- Prism Core orchestration
- Music CRM ownership

## Allowed Implementation Work

- Widgets, renderers, actions, and state changes that belong to the dashboard
- Local storage and browser-only persistence changes
- UI-level approval queues and human review surfaces
- Tests that validate dashboard behavior

## Forbidden Implementation Work

- Publishing directly to social platforms
- Owning orchestration or provider routing
- Moving core reasoning into the UI layer
- Changing music CRM ownership
- Editing other runtime repos except by explicit cross-repo coordination

## Canonical State Rules

- The repo may own dashboard canonical state.
- It must not redefine canonical orchestration state.
- Anything derived from Prism Core should be treated as a view or queue, not the
  source of truth for the core engine.

## External Action Rules

- External writes require approval and should flow through the owning core or
  adapter path.
- The dashboard may display approval queues, but it should not bypass the
  approval gate.

## Testing and Validation Expectations

- `node src/test_workflows.js`
- `python3 tools/validate_architecture.py` when architecture changes are made
- any relevant repo-local smoke checks

## Documentation Expectations

- Keep README role notes current.
- Keep orientation docs and handoff docs aligned with the actual widget and
  state layout.

## Correct Changes

- Add or adjust a widget
- Improve planner or task flows
- Add a dashboard approval queue
- Update local browser persistence

## Boundary Violations

- Publishing social posts directly from the dashboard
- Implementing Prism Core routing here
- Moving music CRM logic into the UI
- Making the dashboard the source of truth for orchestration

