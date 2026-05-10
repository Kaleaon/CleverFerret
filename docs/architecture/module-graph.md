# Module Graph

This document captures the current module topology of the CleverFerret
build tree. It is referenced by ADR-0003 and roadmap Phase 1 step 8.

## Status (Phase 0 / pre-V2 inclusion)

The root `settings.gradle.kts` currently includes a single application
module:

```
:CleverFerret                (com.android.application, Kotlin 2.1.0)
└── apps the entire single-module monolith
    ~1,163 .kt files / ~288k LOC
```

The incubating V2 tree lives at `CleverFerretV2/` as a **separate
Gradle subproject** (its own `settings.gradle.kts`,
`build.gradle.kts`, and `gradle.properties`). It is **not** wired into
the root build today. That subproject declares:

```
:app                         (CleverFerretV2 incubator harness)

core/
  :core:common               kotlin("jvm") 1.9.24
  :core:data                 kotlin("jvm")
  :core:network              kotlin("jvm")
  :core:database             kotlin("jvm")
  :core:media                kotlin("jvm")
  :core:auth                 kotlin("jvm")
  :core:ui                   kotlin("jvm")

feature/
  :feature:opds              tests: OpdsFeedParserContractTest, OpdsEndToEndFlowTest
  :feature:metadata          AI-focused (lookup, prompt, privacy filter)
  :feature:library
  :feature:reader
  :feature:audio
  :feature:radio
  :feature:podcast
  :feature:webfiction
  :feature:sync
  :feature:plex
  :feature:settings
  :feature:search
  :feature:collections
  :feature:stats
  :feature:widgets
  :feature:ai
```

## Phase 1 target topology (post-reconciliation)

After ADR-0003's reconciliation work completes, root
`settings.gradle.kts` will include:

```
:CleverFerret                (existing app)
:benchmark-macro             (Phase 0 placeholder)

:CleverFerretV2:core:auth
:CleverFerretV2:core:common
:CleverFerretV2:core:data
:CleverFerretV2:core:database
:CleverFerretV2:core:media
:CleverFerretV2:core:network
:CleverFerretV2:core:ui

:CleverFerretV2:feature:opds       ← consumed by :CleverFerret
:CleverFerretV2:feature:library
:CleverFerretV2:feature:metadata
```

Dependency direction (allowed edges only):

```
:CleverFerret
  └── :CleverFerretV2:feature:opds
        ├── :CleverFerretV2:core:common
        ├── :CleverFerretV2:core:data
        └── :CleverFerretV2:core:network
              └── :CleverFerretV2:core:common
```

Feature modules **must not** depend on each other. Cross-feature
collaboration goes through `core:data` contracts.

## Generation

A `./gradlew :renderModuleGraph` task is planned (Phase 1 step 8) to
produce `module-graph.svg` from the live `Project.allprojects` view.
Until then this document is hand-curated.

## See also

- `docs/architecture/module-adoption-plan.md` — sequencing & rationale.
- `docs/architecture/decisions/0003-v2-module-version-reconciliation.md`
  — why inclusion is gated on a reconciliation step.
- `docs/planning/PREMIERE_ROADMAP.md` — Phase 1 exit criteria.
