# CI Bypass Postmortem: Compile-Broken Merges into `main`

## Purpose
This postmortem documents how compile-broken code was able to merge, what CI signals existed at merge time, and the permanent controls now required to prevent recurrence.

Companion governance docs:
- [Branch protection machine-readable baseline](./branch-protection.json)
- [Branch protection human guide](./BRANCH_PROTECTION.md)
- [Governance index](./README.md)

## Incident timeline (compile-broken merges)

> Source of truth used for this timeline in-repo: `docs/planning/PREMIERE_ROADMAP.md` forensic notes. A full PR-by-PR check-rollup table should be periodically refreshed via GitHub API audit (see "Audit process" below).

| Date (UTC) | Event | What checks reported at merge time |
|---|---|---|
| 2026-04-18 | Recovery snapshot captured and branch inventory documented. | No explicit check-rollup data was preserved in the recovery snapshot docs; only branch state and inventory were recorded. |
| 2026-04-xx to 2026-05-xx (forensic window) | Forensic roadmap review identified that trunk had recent compile errors despite CI containing compile/test/lint/coverage steps. | `test` workflow could still complete step graph and summary paths because compile step tolerated failure (`continue-on-error`) and Gradle used `--continue`, weakening hard-fail behavior. |
| 2026-05-02 | Governance postmortem formalized and linked from branch-protection companion docs. | Baseline required checks defined as `test`, `static-analysis`, `accessibility-checks` in `docs/governance/branch-protection.json`; compile-fail canary required for ongoing verification. |

### Forensic statement from roadmap
The roadmap records that "five hard compile errors" were present in trunk while CI still defined compile/test/lint/coverage jobs, and pinpoints the bypass behavior in `main.yml` (compile step error tolerance + Gradle continue mode).

## Exact workflow behavior that allowed bypass

The bypass was enabled by the combination below in `.github/workflows/main.yml`:

1. **Compile command allowed Gradle to continue after failures**
   - `./gradlew compileDebugKotlin --continue --stacktrace --warning-mode all ...`
2. **Compile step allowed failure without immediate job failure**
   - `continue-on-error: true` on the compile step.
3. **Later summary/fail step handled failure only at end**
   - Final guard step `Fail workflow if compilation or tests failed` checked recorded outcomes and exited 1.

Why this was risky:
- It decoupled the first compile fault from immediate gate failure semantics.
- It increased chances of confusing status interpretation in merged PR workflows, especially when branch protection/check-selection drift existed.

## Reproduction steps: deliberate compile-fail canary PR

Run this procedure after any CI/workflow/policy change and at least quarterly.

1. **Create a branch**
   - `git checkout -b canary/compile-fail-<date>`
2. **Introduce deterministic compile failure**
   - Add a single unresolved symbol in a commonly compiled Kotlin source (e.g., `val _canary = MissingTypeForCanary`).
3. **Push and open PR against `main`**
   - Title example: `canary(ci): deliberate compile failure gate validation`.
4. **Verify expected failing signals**
   - `test` job fails.
   - `Compile project` step is marked failed.
   - Diagnostic groups still appear: compilation error tail + error summary.
   - Compile log artifact upload step still runs due to `if: always()`.
5. **Verify merge is blocked**
   - GitHub PR UI must show required-check block; merge button disabled.
6. **Prove recovery path**
   - Remove the intentional compile failure in the same PR.
   - Re-run checks; verify `test` passes and merge can proceed.
7. **Capture evidence in this postmortem (append log)**
   - PR link, failing run link, passing run link, screenshot/status text.

## Permanent controls

### 1) Required checks (policy baseline)
`docs/governance/branch-protection.json` defines minimum required checks for `main`:
- `test`
- `static-analysis`
- `accessibility-checks`

Also required:
- strict up-to-date checks (`strict: true`)
- required linear history
- dismiss stale reviews

### 2) Branch protection policy
Operational policy (human-readable) is defined in:
- `docs/governance/BRANCH_PROTECTION.md`

Minimum enforcement for `main`:
- PR-only merges
- no direct pushes
- no force pushes
- no admin bypass for required checks/policies
- CODEOWNERS review expectations for workflow/governance changes

### 3) Audit process (owner cadence)
Perform this audit monthly and after any governance/CI change:

1. Pull live protection config:
   - `gh api repos/<org>/<repo>/branches/main/protection`
2. List recently merged PRs with check rollups:
   - `gh pr list --state merged --limit 100 --json number,title,mergedAt,mergeCommit,statusCheckRollup`
3. Flag any merged PR where required checks are missing/non-success at merge commit.
4. Compare live protection JSON against `docs/governance/branch-protection.json` and reconcile drift.
5. Record findings and dated evidence links in this document under a new audit entry.

## Audit log template

### Audit entry — YYYY-MM-DD
- Auditor:
- Live protection snapshot link:
- Merged PR sample window:
- Drift found (yes/no):
- Compile-fail canary run link:
- Corrective actions:
