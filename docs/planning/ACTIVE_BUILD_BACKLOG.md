# Active Build Backlog

Last refreshed: 2026-04-18 (UTC)

## Reproducibility sweep

- Historical baseline log reviewed: `archive/development-artifacts/compile-log-879e7103-historical.txt`
- Fresh clean build log reviewed: `archive/development-artifacts/clean-build-879e7103-20260418T195556Z.log`
- Scope rule: keep only issues still reproducible in a fresh clean build.

## Active issues (still reproducible)

1. **Gradle/Kotlin toolchain bootstrap fails before module compilation**
   - **Owner module(s):** `core/build`, `core/toolchain`
   - **Path hint(s):** `CleverFerret/` (Gradle settings, wrapper, toolchain config). Avoid `CleverFerretV2/` for this issue.
   - **Observed in fresh run:** `java.lang.IllegalArgumentException: 25.0.1`
   - **Failure point:** Gradle Kotlin DSL bootstrap while compiling the settings script (`ScriptEvaluatingSettingsProcessor.applySettingsScript` -> `KotlinCompilerKt.compileKotlinScriptModuleTo`), before project/task graph setup
   - **Impact:** Build exits before reaching `:CleverFerret:kspDebugKotlin`, so downstream compiler diagnostics are currently blocked.
   - **Next action:** align runtime Java version format expected by current Gradle/Kotlin stack (or pin supported JDK for local/CI builders).

## Reviewer gate (planning compliance)

- Reviewers must **reject any new feature task** that does not include:
  - `Owner module(s)` mapping, and
  - a `Path hint(s)` entry clarifying `CleverFerret/` vs `CleverFerretV2/`.

## Historical issues removed from active backlog

The following historical failures were **not reproducible in the fresh clean run**, because compilation does not reach KSP stage anymore:

- `InjectProcessingStep ... error.NonExistentClass ... could not be resolved`
- `Error occurred in KSP, check log for detail`
- `Execution failed for task ':CleverFerret:kspDebugKotlin'`

These remain in archived logs for reference and should be re-validated only after toolchain bootstrap is fixed.

## Verification notes

- 2026-04-18T20:12:20Z — Re-checked `archive/development-artifacts/clean-build-879e7103-20260418T195556Z.log`; crash reproduces in Kotlin DSL bootstrap with `java.lang.IllegalArgumentException: 25.0.1` before `:CleverFerret` configuration.
- 2026-04-18T20:12:20Z — Added wrapper-level JDK gate (17..21), Gradle toolchain discovery constraints, and repo default `.java-version` (`21`) so unsupported runtimes now fail fast with an explicit message instead of Kotlin startup stacktrace.
- 2026-04-18T20:12:20Z — Reproducibility status: bootstrap crash is reproducible with unsupported runtime JDK; expected to be replaced by deterministic preflight failure after this fix.
