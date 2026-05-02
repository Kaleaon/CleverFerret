# CI Bypass Postmortem: Compile Gate Weakness

## Summary
A CI bypass condition existed in `.github/workflows/main.yml` where the compile step allowed failure without immediately failing the gate.

Two settings created the bypass behavior:
- `continue-on-error: true` on the `Compile project` step.
- `--continue` passed to `./gradlew compileDebugKotlin`.

Together, these allowed the pipeline to continue after compile failures and weakened branch-protection confidence in compile-gate enforcement.

## Remediation Implemented
- Removed `continue-on-error: true` from the `Compile project` step.
- Removed `--continue` from `compileDebugKotlin` invocation.
- Kept existing compile diagnostics, error summaries, and artifact upload/reporting paths so failure visibility remains intact.

## Canary PR Acceptance Criteria (Compile-Failure Merge Block)
A dedicated canary pull request must intentionally introduce a deterministic compile failure and satisfy all criteria below.

1. **Intentional compile failure is introduced**
   - Canary PR includes a minimal change that always fails Kotlin compilation (e.g., unresolved symbol in a compiled source set).

2. **`test` workflow job fails at compile gate**
   - GitHub Actions run for the PR shows `Compile project` step failed.
   - Job result is `failure` (not `neutral`, not `success`).

3. **Failure diagnostics remain visible**
   - `Compilation Errors (last 200 lines)` group is emitted in logs.
   - `Error Summary` group is emitted in logs.
   - Compile log artifact upload step still runs (`if: always()`) and attempts upload.

4. **Downstream behavior remains consistent with current summary/reporting design**
   - Reporting steps with `if: always()` still execute.
   - Final gate step (`Fail workflow if compilation or tests failed`) reports failure.

5. **Merge is blocked by required checks**
   - PR cannot be merged while `test` check is failing.
   - UI shows merge blocked due to failed required status check(s).

6. **Recovery is proven**
   - Reverting/fixing the intentional compile error in the same PR causes compile to pass and unblocks merge eligibility.

## Evidence to Capture in the Canary PR
- Link to failed workflow run.
- Screenshot or copied status-check panel showing merge blocked.
- Link to subsequent passing run after the compile error is fixed.
- Short note confirming compile diagnostics and artifacts were still produced during the failing run.
