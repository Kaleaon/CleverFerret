# Benchmark Readiness Checklist (Phase 2 Paging Performance Prerequisite)

**Status:** Required prerequisite before **Phase 2 paging performance sign-off** can be granted.

This checklist defines the minimum benchmark-readiness bar so the team can safely start and review paging performance work.

## 1) Required module wiring in `settings.gradle.kts`

Verify benchmark modules are explicitly included and resolvable by Gradle sync.

- [ ] `settings.gradle.kts` includes the benchmark module path(s) required for paging performance work.
- [ ] Benchmark include names match on-disk directory/module names exactly (case-sensitive).
- [ ] Benchmark modules are grouped with app-feature modules consistently (no ad-hoc include ordering).
- [ ] A clean Gradle sync succeeds after wiring changes.

**Minimum expectation:** benchmark module wiring must be present on the branch before any Phase 2 perf sign-off review starts.

## 2) Minimal buildable placeholder benchmark class

A buildable placeholder benchmark is required to prove test discovery and packaging are working.

- [ ] Placeholder benchmark class exists under a stable package path:
  - `:benchmark:paging` module path (or agreed equivalent), and
  - source path `src/androidTest/java/<package>/`.
- [ ] Class naming convention is `${Feature}Benchmark` (example: `PagingColdStartBenchmark`).
- [ ] Method naming convention is `benchmark<Scenario>()` (example: `benchmarkColdStart()`).
- [ ] Placeholder class compiles and is discoverable by instrumentation test listing.
- [ ] Placeholder body may be no-op/minimal, but must be executable without custom local hacks.

**Note:** The class can be intentionally lightweight; readiness is about build/execution plumbing, not score quality.

## 3) Device/profile requirements for upcoming cold-start and scroll benchmarks

To avoid noisy baselines, benchmark execution environments must be constrained.

- [ ] Physical Android device required for baseline/perf-sign-off runs (emulator-only runs are non-blocking signal).
- [ ] Device is thermally stable and battery level is sufficient before run start.
- [ ] Background updates/syncs are minimized during benchmark windows.
- [ ] Benchmark profile setup is defined for both scenarios:
  - cold-start scenario profile, and
  - paging/scroll scenario profile.
- [ ] Device/API level used for sign-off is documented in run output.

**Recommendation:** keep one designated "reference device" profile for release-gating comparisons.

## 4) CI/manual execution expectations and artifact retention format

Both automated and manual runs must produce comparable outputs with retained evidence.

- [ ] CI job (or planned CI job stub) exists for benchmark task invocation and result collection.
- [ ] Manual execution command(s) are documented in the benchmark module README or runbook.
- [ ] Each run archives artifacts in a predictable format:
  - `artifacts/benchmarks/<yyyy-mm-dd>/<commit-sha>/`
- [ ] Retained artifacts include at minimum:
  - raw benchmark output,
  - summarized metrics (cold-start and scroll),
  - device/build metadata,
  - run mode marker (`ci` or `manual`).
- [ ] Retention policy keeps enough history for trend comparison during Phase 2 (minimum rolling window agreed by team).

## Phase 2 sign-off gate

Phase 2 paging performance sign-off is **blocked** until every checklist item above is complete and verifiable in-repo and/or in retained artifacts.
