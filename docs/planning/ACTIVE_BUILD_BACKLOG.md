# Active Build Backlog

Last refreshed: 2026-04-18 (UTC)

## Reproducibility sweep

- Historical baseline log reviewed: `archive/development-artifacts/compile-log-879e7103-historical.txt`
- Fresh clean build log reviewed: `archive/development-artifacts/clean-build-879e7103-20260418T195556Z.log`
- Scope rule: keep only issues still reproducible in a fresh clean build.

## Active issues (still reproducible)

1. **Gradle/Kotlin toolchain bootstrap fails before module compilation**
   - **Observed in fresh run:** `java.lang.IllegalArgumentException: 25.0.1`
   - **Failure point:** Gradle Kotlin script compilation startup
   - **Impact:** Build exits before reaching `:CleverFerret:kspDebugKotlin`, so downstream compiler diagnostics are currently blocked.
   - **Next action:** align runtime Java version format expected by current Gradle/Kotlin stack (or pin supported JDK for local/CI builders).

## Historical issues removed from active backlog

The following historical failures were **not reproducible in the fresh clean run**, because compilation does not reach KSP stage anymore:

- `InjectProcessingStep ... error.NonExistentClass ... could not be resolved`
- `Error occurred in KSP, check log for detail`
- `Execution failed for task ':CleverFerret:kspDebugKotlin'`

These remain in archived logs for reference and should be re-validated only after toolchain bootstrap is fixed.
