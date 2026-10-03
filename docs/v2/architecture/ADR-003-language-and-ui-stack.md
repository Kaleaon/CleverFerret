# ADR-003: Language and UI Stack for CleverFerretV2

- Status: Accepted
- Date: 2026-03-05

## Context

CleverFerretV2 needs a stable implementation stack for:

- Feature velocity across a large Android codebase.
- Modern UI composition for media-heavy surfaces.
- Long-term maintainability with existing libraries (Room, Hilt, Coroutines, Media3).

A key open question is whether V2 should be primarily Java or Kotlin, and whether to prefer XML Views or Jetpack Compose for UI.

## Decision

CleverFerretV2 will use:

1. **Kotlin as the primary language** for new app/domain/data code.
2. **Jetpack Compose (Material3) as the primary UI toolkit** for new screens.
3. **Targeted Java interop only when justified**, including:
   - Reusing stable legacy Java utilities that are not yet migration blockers.
   - Interfacing with Java-first third-party SDKs.
   - Performance-sensitive edge cases where profiling proves benefit.

## Why not Java-first for V2

A Java-first strategy is rejected because it would increase delivery cost for current Android standards:

- Most modern Android guidance and samples are Kotlin-first.
- Compose ergonomics are significantly better in Kotlin than in Java.
- Existing project architecture and dependencies already align with Kotlin + coroutines/Flow.

## Compose adoption scope

- New feature UI in V2 should be implemented in Compose.
- Existing XML/View-based flows may remain temporarily behind stable interfaces during migration.
- Interop (`ComposeView` and `AndroidView`) is allowed where incremental migration is required.

## Consequences

- V2 development remains aligned with current Android ecosystem direction.
- Hiring/onboarding is simpler for Android engineers expecting Kotlin + Compose.
- Legacy Java code can be migrated incrementally without forcing risky big-bang rewrites.
- Build tooling and coding standards should prioritize Kotlin linting/static analysis.

## Implementation plan

1. Keep module templates Kotlin-first (`core:*`, `feature:*`, `app`).
2. Gate new UI modules on Compose conventions and preview coverage.
3. Track Java-to-Kotlin migration by package/domain in the V2 migration board.
4. Revisit exceptions quarterly; if Java footprint grows, require explicit ADR addendum.
