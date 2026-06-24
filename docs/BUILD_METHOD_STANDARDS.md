# Build Method Standards

Core rule:

Every sprint should improve the system and, where genuinely useful, improve the way future sprints are run.

But this is stability-first:

Do not add docs, scripts, abstractions, fixtures, prompts, standards, or helper files merely to satisfy the meta-rule.

A build-method improvement is valid only when it clearly does at least one of:

- removes repeated work
- reduces ambiguity
- catches real failure modes
- shortens future prompts
- improves safety
- improves testability
- makes validation more automatic
- reduces maintenance cost
- reduces token cost
- makes future upgrades safer

## No-collage Rule

Do not create multiple new helper files, docs, scripts, fixtures, or abstractions when one focused change will do.

Prefer:

- strengthening an existing file over creating a new one
- one reliable command over several partial commands
- one canonical doc over scattered notes
- tests over repeated manual instructions
- small contracts over broad architecture
- repo-encoded rules over long prompt context

Avoid:

- speculative scaffolding
- duplicate documentation
- vague future architecture
- process artifacts likely to become stale
- abstractions not immediately useful
- placeholder directories without current purpose
- large prompts that repeat what the repo already encodes

## Required Sprint-End Check

At the end of every sprint, report:

- What became easier, safer, or less token-heavy?
- What can future prompts now omit because the repo encodes it?
- Did this sprint add any process artifact?
- If yes, what maintenance cost does it carry?
- Was that cost justified?

## Codex Prompt Clause

Meta-standard:

As you work, prefer changes that make future development safer, faster, and less token-heavy. This does not mean adding process artifacts by default. Only add or update docs, scripts, fixtures, tests, prompts, or standards when they clearly reduce repeated work, ambiguity, or risk. Avoid speculative scaffolding, duplicate documentation, and abstractions that are not immediately useful. At the end, report only concrete reductions in future effort.

No-collage rule:

Do not create multiple new helper files, docs, scripts, or abstractions when one focused change will do. Prefer strengthening an existing file over creating a new one.
