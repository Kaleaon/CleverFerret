# Module Adoption Plan: CleverFerretV2 → CleverFerret

## Scope and Goal
This plan defines which `CleverFerretV2` modules should be adopted first into the current root build, establishes build-configuration compatibility, and sequences migration work so OPDS lands before metadata/library.

## Target modules to include from CleverFerretV2

### Core modules (foundation)
1. `:core:common` — shared error/result contracts and versioned interfaces.
2. `:core:data` — cross-feature media/data contracts.
3. `:core:network` — retry/circuit-breaker and network orchestration utilities.
4. `:core:database` — schema/migration abstractions needed by feature persistence.
5. `:core:media` — media-domain abstractions reused by catalog/library flows.
6. `:core:auth` — authentication contracts used by networked catalog providers.
7. `:core:ui` — UI contracts/components needed only when feature UIs are migrated.

### Feature modules (requested set)
1. `:feature:opds` (phase 1, first migration target).
2. `:feature:metadata` (phase 2).
3. `:feature:library` (phase 2, after metadata foundation stabilizes).

## Compatibility matrix (root vs CleverFerretV2)

| Area | Root project (`/`) | `CleverFerretV2` | Compatibility assessment | Required action |
|---|---|---|---|---|
| Version catalog file | `gradle/libs.versions.toml` exists and is extensive (Android + Compose + Readium + feature deps). | No `CleverFerretV2/gradle/libs.versions.toml` present. | **Partial / missing direct equivalent.** V2 relies on per-module Gradle declarations + root plugin version in `build.gradle.kts`. | Keep root catalog as source of truth; map V2 dependency coordinates into root aliases before module inclusion. |
| Kotlin version | Root catalog: Kotlin `2.1.0`. | V2 root plugin: Kotlin JVM `1.9.24` (apply false). | **Incompatible as-is.** | Upgrade V2 module scripts to consume root Kotlin/toolchain conventions (17 + Kotlin 2.1 toolchain behavior). |
| Android Gradle Plugin (AGP) | Root catalog includes AGP `8.13.1`; Android build already configured. | V2 root currently JVM-oriented build file (no AGP declaration at V2 root). | **Model mismatch.** | Adopt modules inside root Android build; avoid importing V2 root build wholesale. |
| Java toolchain | Root comments/policy indicate JDK 17–21 runtime for Gradle/AGP. | V2 enforces Java/Kotlin toolchain 17 in subprojects. | **Compatible.** | Retain toolchain 17 baseline for adopted modules. |
| Repositories | Root uses `google()`, `mavenCentral()`, `jitpack` in settings. | V2 subprojects use `mavenCentral()` only. | **Mostly compatible.** | Use root repository policy; verify OPDS/metadata deps resolve without per-project repos. |
| `gradle.properties` memory/perf flags | Root has extensive Gradle/Android optimization and strict dependency verification. | V2 has minimal `org.gradle.jvmargs=-Xmx2g`. | **Compatible but divergent defaults.** | Keep root `gradle.properties` authoritative; do not downshift to V2 minimal profile. |
| AndroidX flags | Root explicitly sets `android.useAndroidX=true` and `android.enableJetifier=true`. | V2 file does not define Android flags. | **Compatible (root stronger).** | No change needed; inherited root behavior covers adopted modules. |
| Dependency verification | Root sets `org.gradle.dependency.verification=strict`. | V2 does not define verification mode. | **Potential friction during adoption.** | Pre-register checksums/metadata for new artifacts before enabling module builds in CI gates. |

## Sequenced migration path

### Phase 0 — Pre-migration setup (no feature behavior changes)
1. Create `docs/architecture/module-graph.md` that captures intended module dependency graph for adopted V2 modules in root build.
2. Add initial Gradle includes for selected core modules + `feature:opds` behind a feature flag/build toggle if needed.
3. Normalize dependency aliases in root `libs.versions.toml` for all OPDS/core requirements.
4. Ensure strict dependency verification inputs are updated for any newly introduced artifacts.

### Phase 1 — OPDS first (primary migration)
1. Migrate core prerequisites used by OPDS (`core:common`, `core:data`, `core:network`, and any additional directly required core modules).
2. Integrate `feature:opds` domain/services first (parser, orchestrator, contracts).
3. Integrate OPDS API facade and adapt callers in existing app module.
4. Add/port OPDS contract + end-to-end tests in root test pipeline.
5. Exit criteria: OPDS catalog retrieval/parsing passes contract tests and no regressions in existing catalog flows.

### Phase 2 — Metadata, then Library
1. Adopt `feature:metadata` next, reusing already-migrated core modules and OPDS data contracts where applicable.
2. Validate metadata enrichment pipeline and AI/privacy-related safeguards in root environment.
3. Adopt `feature:library` after metadata contracts stabilize.
4. Wire library feature to metadata outputs and existing persistence/services.
5. Exit criteria: metadata + library modules build, pass tests, and interoperate with OPDS-ingested items.

## Required output artifact
Before coding migration begins, publish:
- `docs/architecture/module-graph.md`

Minimum contents:
- Module nodes (root app + adopted core + OPDS/metadata/library).
- Directional dependencies.
- External dependency clusters (network, persistence, UI).
- Explicit note of temporary adapters/shims.

## Success checks required before coding starts
1. **Dependency baseline check**: every planned V2 dependency is represented in root version catalog or explicitly justified as inline.
2. **Build-config check**: Kotlin/Java toolchains and plugin strategy are unified under root build conventions.
3. **Verification check**: strict dependency verification entries prepared for all new artifacts.
4. **Graph check**: `docs/architecture/module-graph.md` exists and is reviewed.
5. **Phase-gate check**: OPDS-first sequencing accepted (metadata/library explicitly deferred until OPDS exit criteria pass).
6. **Test-plan check**: migration test list exists for OPDS contracts/e2e and later metadata/library integration.
