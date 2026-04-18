# Branch Protection and Ownership Guidance

This guide defines the minimum GitHub protections needed to prevent accidental overwrite of `main`.

## Protected branches

Configure branch protection rules for:

- `main` (strictest)
- `work` (integration branch)

## Required settings for `main`

1. **Require pull request before merging**
   - Require at least 1 approval.
   - Dismiss stale approvals when new commits are pushed.
   - Require review from Code Owners.
2. **Require status checks to pass before merging**
   - Select all CI checks that validate build/test/lint.
   - Require branches to be up to date before merging.
3. **Restrict who can push to matching branches**
   - Disallow direct pushes for all contributors.
4. **Disallow force pushes**
   - Must remain disabled permanently.
5. **Disallow deletions**
   - Prevent accidental branch deletion.
6. **Require linear history** (recommended)
   - Prefer squash/rebase merge strategies.
7. **Lock branch** (optional for emergency freeze)
   - Enable only during incident response.

## Required settings for `work`

1. Require pull requests.
2. Require at least one passing CI check.
3. Disallow force pushes.
4. Restrict push access to maintainers.

`work` can be less strict than `main`, but still should not accept force pushes.

## CODEOWNERS expectations

`.github/CODEOWNERS` enforces review boundaries for:
- runtime app paths,
- build configuration,
- docs/governance,
- and automation/workflow definitions.

Any change to branch policy or CODEOWNERS should be reviewed by the repository owner/maintainer.

## Recommended rollout sequence

1. Add/merge `.github/CODEOWNERS`.
2. Enable `main` protection with required CODEOWNERS review.
3. Enable `work` protection.
4. Validate with a test PR from a non-owner account.
5. Document final policy state in `docs/POST_RECOVERY_STATE.md`.
