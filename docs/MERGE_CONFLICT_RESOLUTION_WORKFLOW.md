# Merge Conflict Resolution Workflow

This repository uses a **protected-by-default** conflict workflow.

## Modes

`tooling/scripts/resolve-merge-conflicts.sh` supports:

1. `protected` (default)
   - Reports conflicted files.
   - Exits non-zero when conflicts exist.
   - Makes no file changes.

2. `allowlisted-auto`
   - Only resolves conflicts for explicitly allowlisted low-risk files.
   - Requires `REQUIRE_AUTOMATION_APPROVAL=true`.
   - Requires CI safety gates (PR label + approved review) in the workflow.
   - Runs post-resolution validation before allowing commit/push.

> The old extension-based strategy (`--ours/--theirs` by file extension) is deprecated and disabled.

## CI Safety Gates for Automation

Automated conflict resolution runs only when **all** are true:

- PR has label: `conflict-auto-resolve-ok`
- PR has at least one active `APPROVED` review
- Conflicted files are all in the explicit allowlist

If gates are not satisfied, CI runs in protected report-only mode and fails fast.

## Manual Resolution Workflow (Required for Gradle/Config and other non-allowlisted files)

Use this process for conflicts in files like:
- `*.gradle`, `*.gradle.kts`
- `gradle.properties`, `settings.gradle*`
- `.yml/.yaml` workflows and infra config
- App/runtime configuration files

### Steps

1. Update your branch and reproduce conflicts locally.
   ```bash
   git fetch origin
   git checkout <pr-branch>
   git merge origin/<base-branch>
   ```

2. List unresolved files.
   ```bash
   git diff --name-only --diff-filter=U
   ```

3. Resolve each Gradle/config conflict manually.
   - Keep dependency versions and plugin blocks consistent.
   - Prefer canonical ordering already used in the target file.
   - Remove conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).

4. Stage resolved files.
   ```bash
   git add <file1> <file2> ...
   ```

5. Run validation before push.
   ```bash
   ./gradlew build test
   git diff --cached --stat
   ```

6. Commit and push.
   ```bash
   git commit -m "chore: manually resolve merge conflicts"
   git push
   ```

## Post-Resolution Validation Requirements

Before any push from automation path:

- `./gradlew build test` must pass.
- A staged diff summary (`git diff --cached --stat`) is emitted.
- Staged files must be allowlisted in automation mode.

If any check fails, the script exits non-zero and no push occurs.
