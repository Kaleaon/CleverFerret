# Post-Recovery State (April 18, 2026)

This document records the repository operating model after recovery from accidental branch overwrite.

## 1) Branch source of truth

As of **April 18, 2026**, the **`work` branch is the source of truth** for ongoing development and release preparation.

- `work` = canonical integration branch.
- `main` = protected/stable branch that receives reviewed pull requests from `work` (or short-lived feature branches targeting `work`).

If this policy changes, update this document and the branch protection rules in the same pull request.

## 2) Safe contribution workflow

1. **Sync from source branch**
   - Branch from `work`, not from stale local history.
   - Example: `git checkout work && git pull && git checkout -b feat/<topic>`
2. **Open pull request into `work`**
   - Use small, reviewable PRs.
   - Require passing checks and at least one reviewer approval.
3. **Promote from `work` to `main` via PR only**
   - Never force-push `main`.
   - Never merge unreviewed hotfix commits directly to `main`.
4. **Tag release points from protected branch**
   - Create release tags only from commits already merged to protected `main`.
5. **Run widget background-update CI gate before review**
   - Execute `./scripts/ci/validate_android14_widget_background_updates.py`.
   - **Pass criteria:** each widget provider XML sets `android:updatePeriodMillis`;
     value is either `0` or `>= 1800000`; widgets using `0` explicitly declare
     `android:resizeMode`.
   - **Fail criteria:** missing/non-integer `updatePeriodMillis`, values between
     `1` and `1799999`, or missing `resizeMode` for event-driven (`0`) widgets.

## 3) Hard safety rules

- No direct pushes to `main`.
- No force-pushes to `main`.
- No branch deletions of `main`.
- Require CODEOWNERS review for app/runtime and governance files.

See: `docs/governance/BRANCH_PROTECTION.md` and `.github/CODEOWNERS`.

## 4) Ownership summary

Current default owner: **`@Kaleaon`**.

Until teams are established, this account is responsible for:
- approving CODEOWNERS-protected changes,
- validating branch rule updates,
- and coordinating `work` → `main` promotions.

## 5) Recovery checklist for maintainers

When recovering from history accidents in the future:

1. Freeze merges/pushes temporarily.
2. Identify last known-good commit on the source branch.
3. Restore branch pointers using protected admin workflow (never via ad hoc local pushes).
4. Re-run CI on restored heads.
5. Announce final commit SHAs and unfreeze.
6. Document what changed in this file.
