# Static Analysis Implementation Plan

## Scope and Objectives
- Centralize Detekt rule configuration in a single root file at `config/detekt/detekt.yml`.
- Ensure Detekt is applied at both required plugin application points:
  - Root build script: `build.gradle.kts`
  - Android/application module build script: `CleverFerret/build.gradle.kts`
- Integrate static analysis checks into CI in `.github/workflows/static-analysis.yml`.
- Define a repeatable baseline generation workflow targeting `CleverFerret/lint-baseline.xml`.
- Document governance decisions for intentionally **non-baselined** rules and baseline freeze sign-off.

## Implementation Steps

### 1) Root Detekt Configuration Consolidation
1. Create or validate root config file at `config/detekt/detekt.yml`.
2. Move all active shared rule settings into this file (formatting, style, performance, potential-bugs, naming).
3. Remove duplicate or conflicting Detekt config declarations from module-level scripts.
4. Ensure path references in Gradle point to this root config explicitly.

**Done criteria**
- All Detekt runs reference `config/detekt/detekt.yml`.
- No divergent Detekt rule config remains in module-level config files.

### 2) Plugin Application at Required Build Scripts
1. In root `build.gradle.kts`, apply Detekt plugin (or alias) and define shared defaults:
   - `toolVersion`
   - `config.setFrom(rootProject.file("config/detekt/detekt.yml"))`
   - optional shared `buildUponDefaultConfig = true` and `allRules = false` policy.
2. In `CleverFerret/build.gradle.kts`, apply/verify Detekt plugin and wire task scope to module sources.
3. Confirm task naming conventions and availability (`detekt`, `detektMain`, `detektTest`, etc.) are consistent.

**Done criteria**
- Both required scripts apply Detekt coherently.
- Running Detekt from root and module scopes produces consistent rule behavior.

### 3) CI Workflow Integration (`.github/workflows/static-analysis.yml`)
1. Add/update workflow trigger strategy:
   - `pull_request` for active branches
   - optional `push` to main/release branches
2. Add Java/Gradle setup and dependency caching.
3. Add explicit static-analysis job steps:
   - Gradle invocation for Detekt tasks
   - Android lint invocation (if part of static analysis gate)
4. Configure fail-fast policy for quality gate violations.
5. Publish artifacts for reports (Detekt XML/HTML/SARIF as available).

**Done criteria**
- Static analysis job runs automatically on PRs.
- CI fails on unapproved violations.
- Reports are retained for diagnostics.

### 4) Baseline Regeneration Flow (`CleverFerret/lint-baseline.xml`)
1. Standardize regeneration command(s) in project docs/CI comments (e.g., `./gradlew :CleverFerret:lint` or dedicated baseline task if configured).
2. Regenerate baseline only during controlled cleanup windows.
3. Require PR labeling/annotation when `CleverFerret/lint-baseline.xml` changes.
4. Enforce that baseline updates do not mask newly introduced violations outside approved categories.

**Done criteria**
- Baseline file path is fixed to `CleverFerret/lint-baseline.xml`.
- Baseline changes are auditable and intentional.

## Decision Notes: Rules Intentionally Not Baselined
These rule categories should remain **non-baselined** by policy (new violations fail CI unless explicitly waived):

1. **Complexity rules** (e.g., excessive method/class complexity)
   - Rationale: Baselining complexity hides architecture debt and allows progressive degradation.
   - Policy: Must be fixed or explicitly waived with technical justification in PR.

2. **Magic number rules**
   - Rationale: These are often quick-fix readability issues and should be corrected in place.
   - Policy: Prefer constant extraction; waivers allowed only where literals are domain-standard and self-evident.

3. **Potential bug rules** (nullability misuse, ignored return values where applicable)
   - Rationale: Safety/correctness issues are poor candidates for baseline suppression.
   - Policy: Must be remediated before merge.

4. **Security-sensitive findings**
   - Rationale: Suppressing security signals in baseline introduces blind spots.
   - Policy: Must be fixed or escalated through security exception process.

## Baseline Freeze Governance
- **First baseline freeze sign-off owners**:
  1. **Mobile Tech Lead** (primary quality owner)
  2. **Repository Maintainer / CODEOWNER for `CleverFerret/`**
  3. **QA or Release Engineering representative** (release risk acknowledgment)
- Freeze is approved only when:
  - CI static analysis is green with agreed rule severities.
  - Baseline diff reviewed and explained.
  - Non-baselined policy categories above remain enforced.

## Rollout and Validation Checklist
1. Confirm local task parity with CI tasks.
2. Open implementation PR with:
   - config changes
   - build script changes
   - CI workflow updates
   - baseline (if regenerated)
3. Conduct one dry-run PR to validate quality gate behavior.
4. Announce baseline freeze date and approvers in team channel.

## Risks and Mitigations
- **Risk:** Unexpected CI failures from stricter shared config.
  - **Mitigation:** Stage rollout with informational run first, then enforce blocking gate.
- **Risk:** Baseline churn obscures real issues.
  - **Mitigation:** Require baseline diff review and owner sign-off.
- **Risk:** Plugin misconfiguration between root and module scripts.
  - **Mitigation:** Verify task graph from both root and module invocations.
