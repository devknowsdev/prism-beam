# Approval Queue Pattern

An approval queue turns proposed risky actions into reviewable items before they
execute.

## Use when

- An action would publish, send, push, delete, overwrite, or mutate important
  state.
- A local agent or adapter needs human permission before execution.
- A workflow should separate proposal from application.

## Pattern

1. classify the risk class
2. create an approval request
3. show expected effects and rollback notes
4. wait for explicit human decision
5. execute only approved actions
6. log the result

## Do not use when

- The action is purely read-only and has no side effects.
- The user has explicitly requested an immediate manual action and the tool still
  has its own confirmation/guard.

## Related Beam files

- `integrations/approval-posture.md`
- `schemas/approval-request.schema.json`
