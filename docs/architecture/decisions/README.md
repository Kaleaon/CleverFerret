# Architecture Decision Records (ADRs)

This directory holds short, append-only records of architecturally
significant decisions made on CleverFerret. Format follows the Michael
Nygard ADR template (Title / Status / Context / Decision / Consequences).

## Lifecycle

- New ADRs use the next sequential four-digit prefix.
- An accepted ADR is **never edited**, only superseded by a new ADR
  that references and replaces it.
- Status values: `Proposed`, `Accepted`, `Superseded by ADR-NNNN`,
  `Deprecated`.

## Index

| ID | Title | Status |
|----|-------|--------|
| [0001](./0001-record-architecture-decisions.md) | Record architecture decisions | Accepted |
| [0002](./0002-trunk-hygiene-baseline-ci-gate.md) | Trunk hygiene baseline & CI gate forensics | Accepted |
| [0003](./0003-v2-module-version-reconciliation.md) | V2 module version reconciliation as Phase 1 prerequisite | Proposed |

## Decomposition design docs

Long-form decomposition plans for oversize files live under
`docs/architecture/decompositions/`. They are not ADRs — they are
mechanical refactor specs with line ranges, file splits, risk register,
and test plans.

| ID | Target file (LOC) | Plan |
|----|-------------------|------|
| 0001 | `ui/media/navigation/MediaAppNavigation.kt` (2,093) | [0001-media-app-navigation.md](../decompositions/0001-media-app-navigation.md) |
| 0002 | `ui/media/screens/MediaHomeScreen.kt` (1,918) | [0002-media-home-screen.md](../decompositions/0002-media-home-screen.md) |

## Authoring

Copy `0001-record-architecture-decisions.md` as a template. Keep ADRs
under ~400 words; link to design docs in `docs/architecture/` for
detail. Reference the originating roadmap phase from
`docs/planning/PREMIERE_ROADMAP.md` where relevant.
