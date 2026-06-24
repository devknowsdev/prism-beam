# Repo Hygiene Checklist

Use this checklist before committing or handing off a Prism repo change.

## Workspace Hygiene

- [ ] Remove stray `.DS_Store` files.
- [ ] Avoid committing local zip archives.
- [ ] Avoid nested repo copies or accidental mirror folders.
- [ ] Check `git status --short`.
- [ ] Check `git diff --stat`.

## Safety Checks

- [ ] Verify no forbidden files were staged.
- [ ] Verify generated artifacts are intentionally tracked or intentionally
      ignored.
- [ ] Verify branch state before committing.
- [ ] Verify commit state before pushing.

## Validation Checks

- [ ] Run the repo's relevant tests.
- [ ] Run typecheck if the repo has one.
- [ ] Run build if the repo has one.
- [ ] Make sure validation failures are explained before handoff.

## Final Sanity Check

- [ ] Confirm nothing outside the intended repo was modified.
- [ ] Confirm the change stays within the sprint boundary.
