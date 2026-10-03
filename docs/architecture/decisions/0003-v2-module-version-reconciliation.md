# ADR 0003 — V2 module version reconciliation as Phase 1 prerequisite

## Status

Proposed (2026-05-02)

## Context

The roadmap Phase 1 says: "Edit `settings.gradle.kts` to include
`:CleverFerretV2:core:auth`, `:common`, `:data`, `:database`, `:media`,
`:network`, `:ui`, plus `:CleverFerretV2:feature:opds`, `:library`,
`:metadata`. Reuse the include syntax already in
`CleverFerretV2/settings.gradle.kts`."

Audit of the on-disk state shows this is **not** a single-line edit:

- `CleverFerretV2/build.gradle.kts` declares
  `kotlin("jvm") version "1.9.24"`, applies `java-library`, and uses
  JVM toolchain 17 only.
- The root build uses Kotlin **2.1.0** (`gradle/libs.versions.toml`
  `kotlin = "2.1.0"`), AGP 8.13.1, KSP 2.1.0-1.0.29, Hilt 2.53,
  Compose BOM, and Android plugins.
- V2's `gradle.properties` and own `pluginManagement` block live at
  `CleverFerretV2/`.

If the root `settings.gradle.kts` simply does
`include(":CleverFerretV2:feature:opds")`, Gradle attempts to load V2
modules under the **root** plugin/version graph. That fails because:

1. V2 modules apply `kotlin("jvm")` directly at version 1.9.24 instead
   of via `alias(libs.plugins.kotlin.android)` from the root catalog.
2. Multiple `pluginManagement` and `dependencyResolutionManagement`
   blocks collide when settings files are nested.
3. V2 modules depend on `core/common`, `core/data`, `core/network`
   internally with relative paths (`project(":core:common")`),
   which become `:CleverFerretV2:core:common` from the root view.

## Decision

Treat V2 inclusion as a two-step process:

1. **Reconciliation (this phase, prerequisite):**
   - Promote all V2 plugin/library versions into the root
     `gradle/libs.versions.toml`.
   - Rewrite each V2 module's `build.gradle.kts` to use `alias(libs...)`
     references from the root catalog.
   - Update internal `project(":core:foo")` paths to absolute
     `project(":CleverFerretV2:core:foo")` once included from root.
   - Delete `CleverFerretV2/build.gradle.kts` subproject configuration
     and `CleverFerretV2/settings.gradle.kts` once root absorbs them.
2. **Inclusion + OPDS proof (Phase 1 main work):**
   - Add the `include(":CleverFerretV2:...")` lines to the root
     `settings.gradle.kts`.
   - Add `implementation(project(":CleverFerretV2:feature:opds"))` to
     `CleverFerret/build.gradle.kts`.
   - Migrate one production call site from
     `services/opds/OPDSClient.kt` to `OpdsFeatureApi`.

## Consequences

- Phase 1 step 1 ("Include V2 in root settings") is blocked on the
  reconciliation work and must be sequenced after it.
- A throwaway "smoke include" of a single leaf module
  (`:CleverFerretV2:core:common`) can be used to validate the
  reconciliation before fanning out to all 10 modules.
- A future ADR will record the chosen Kotlin/JVM-vs-Android target
  policy for each V2 module (data/network/common are JVM-pure;
  ui/media may need Android library plugin).

## Supersedes

None.
