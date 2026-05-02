# VM Test Dispatcher Migration Plan

## Goal
Create a minimal, repeatable path for converting ViewModel unit tests to use a coroutine-main dispatcher rule and modern Flow testing, starting with one proof-of-wiring conversion.

## Scope

### 1) Version catalog update (`gradle/libs.versions.toml`)
- Add/confirm version-catalog entries for Turbine (`app.cash.turbine:turbine`).
- Ensure dependency alias is available for module test dependencies used by ViewModel JVM tests.
- Keep existing coroutine test dependencies aligned with Turbine version compatibility.

### 2) Shared test utility addition
- Add new file:
  - `CleverFerret/src/test/java/com/universalmedialibrary/testing/MainDispatcherRule.kt`
- Provide a JUnit rule that swaps `Dispatchers.Main` with a test dispatcher for JVM tests and restores it after test execution.
- Choose `StandardTestDispatcher` as default for deterministic scheduling, with constructor override for flexibility.

### 3) One proof-of-wiring conversion (target VM test)
- Convert one existing ViewModel test class to use the new dispatcher rule (example target: `MediaHomeViewModelTest`).
- Replace ad-hoc coroutine-main setup/teardown with the shared rule.
- Add at least one Turbine-based Flow assertion to validate test wiring and usage pattern.

## Out of Scope
- Bulk migration of all ViewModel tests in this change.
- Refactoring production ViewModel logic unrelated to testability.
- Converting instrumentation tests; this plan targets JVM unit tests only.

## Deliverables
1. Version catalog change for Turbine in `gradle/libs.versions.toml`.
2. New reusable `MainDispatcherRule.kt` utility under `src/test/.../testing`.
3. One converted VM unit test demonstrating:
   - rule installation,
   - coroutine test dispatcher usage,
   - Turbine assertion pattern.

## Acceptance Criteria
- `testDebugUnitTest` executes successfully with the converted VM test included.
- Converted test class serves as a copyable template for subsequent ViewModel test migrations.
- No regression in existing unit test task wiring caused by dispatcher-rule introduction.

## Suggested Implementation Sequence
1. Update version catalog and module test dependencies.
2. Add `MainDispatcherRule` utility.
3. Convert `MediaHomeViewModelTest` (or equivalent) and run `testDebugUnitTest`.
4. Document migration snippet in test class comments (optional) to ease follow-on conversions.
