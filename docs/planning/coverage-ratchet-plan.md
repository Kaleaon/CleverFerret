# Coverage Ratchet Plan

## Purpose

Define a phased, enforceable coverage floor strategy that:

- Locks the current baseline immediately (Phase 0).
- Raises the floor at planned roadmap milestones (Phases 2, 4, and 5).
- Constrains measurement scope to the most critical production code paths first.
- Defines a strict exception process so waivers do not silently become permanent.

## 1) Phase 0 Floor Lock (Current Baseline)

### Policy

Phase 0 is a **floor lock** of the currently accepted baseline. The baseline is enforced via `jacocoCriticalCoverageVerification` and should be treated as non-regression protection while test investments are still ramping.

### Enforcement mechanism

- Gate task: `jacocoCriticalCoverageVerification`
- CI behavior: task failure blocks the quality gate job.
- Merge behavior: PRs that fail this task are not merged without an approved temporary waiver (see section 4).

### Phase 0 baseline value

- Use the **current accepted baseline value already present in Gradle configuration** as the Phase 0 floor.
- Do not lower this value during routine feature delivery.

## 2) Planned Threshold Increases

Threshold increases are milestone-driven and become the new minimum once each phase is activated.

| Roadmap phase | Minimum coverage floor | Intent |
|---|---:|---|
| Phase 0 | Current baseline (locked) | Prevent regression while test suites stabilize |
| Phase 2 | 30% | Establish broad safety net across critical units |
| Phase 4 | 40% | Raise confidence for sustained feature velocity |
| Phase 5 | 50% | Mature quality bar for long-term maintenance |

### Activation rules

- Each phase transition updates the configured threshold in Gradle and CI in the same change.
- Once raised, a floor is not reduced except under formal leadership-approved rollback with documented incident context.

## 3) Scope Definitions and Exclusion Policy

### In-scope code (for critical coverage gate)

Coverage gating in this plan applies to:

- **Service-layer classes** (business/domain and data orchestration services).
- **ViewModel classes** (presentation-layer state and action coordination).

This scope intentionally prioritizes logic-heavy components where regressions are high impact.

### Out-of-scope code (default exclusions)

Exclude from this ratchet unless explicitly added later:

- Pure UI rendering classes (Activities/Fragments/Composables/Views) unless they contain non-trivial business logic.
- Generated sources (e.g., DI factories, databinding/viewbinding, generated serializers).
- Build-config and manifest-generated artifacts.
- Temporary migration shims marked for removal.

### Exclusion governance

- Exclusions must be explicit, narrow, and pattern-based (no broad package-wide bypass unless justified).
- New exclusions require rationale in PR description.
- Exclusions are reviewed at every phase transition and pruned when no longer needed.

## 4) Failure-Handling Protocol

### Default behavior (block merge)

If `jacocoCriticalCoverageVerification` fails:

1. CI marks the quality gate as failed.
2. PR is blocked from merge.
3. Author either adds tests or reduces untested scope before re-run.

### Temporary waiver process (time-boxed exception)

A temporary waiver is allowed only when shipping risk is lower than delay risk.

Required waiver contents:

- Reason coverage target cannot be met in current PR.
- Owner responsible for remediation.
- Follow-up issue link.
- Expiration date (hard deadline).
- Expected phase impact (must not invalidate ratchet milestone commitments).

Approval requirements:

- Engineering lead + QA lead approval.
- Waiver recorded in PR and tracked issue.

Expiration behavior:

- On expiry, merge-blocking behavior is automatically reinstated.
- Renewal requires fresh approval with updated rationale.

## 5) Gradle Configuration Mapping (Where to Edit Later)

Use this mapping whenever thresholds are updated at phase milestones.

| What changes | Gradle task / setting | Exact file(s) to edit |
|---|---|---|
| Critical gate threshold floor (Phase 0/2/4/5 values) | `jacocoCriticalCoverageVerification` → `violationRules { rule { limit { minimum = ... }}}` | `CleverFerret/build.gradle.kts` |
| Scope includes (services + ViewModels) | `jacocoCriticalCoverageVerification` → `violationRules { rule { includes = ... }}` | `CleverFerret/build.gradle.kts` |
| Exclusion policy patterns | `jacocoDebugReport` class directory excludes (consumed by verification task) | `CleverFerret/build.gradle.kts` |
| CI invocation (if/when coverage workflow is added) | Gradle command must include `jacocoCriticalCoverageVerification` | CI workflow file that invokes Gradle (to be added if absent) |

> Current repository state: the ratchet gate and thresholds are defined in `CleverFerret/build.gradle.kts`, and no `.github/workflows/*` file is currently present in this repo snapshot.

## 6) Phase Change Checklist

For each phase milestone (2/4/5):

1. Update threshold value in Gradle config.
2. Confirm CI workflow runs the same gate task.
3. Run coverage gate locally and in CI.
4. Remove stale exclusions or waivers.
5. Announce new floor in release/engineering notes.
