# Architecture & Naming Standards

This document defines the target repository and Kotlin package conventions for **all new work**. Legacy areas should be migrated incrementally to avoid breaking active development.

## 1) Top-Level Repository Structure (Target)

Use the following top-level directories:

- `CleverFerret/` (runtime product code)
- `tooling/` (build/dev scripts and local automation)
- `docs/` (product + engineering docs)
- `infra/` (CI/CD, container, deployment definitions)
- `archive/` (non-runtime historical artifacts)

### Incremental migration policy

- New files must be created in the target folders above.
- Existing legacy locations can remain temporarily if moving them would break active workflows.
- Each move should include path updates for CI, scripts, and docs in the same change.

## 2) Kotlin Package Conventions

Use a **feature-first** layout inside Kotlin source roots:

- `ui/<feature>/...`
- `domain/<feature>/...`
- `data/<feature>/...`

Use `core/` only for code genuinely shared across multiple features.

### Example

```text
com.universalmedialibrary
├── ui/
│   └── library/
│       ├── LibraryScreen.kt
│       └── LibraryViewModel.kt
├── domain/
│   └── library/
│       ├── RefreshLibraryService.kt
│       └── LibraryRepository.kt
├── data/
│   └── library/
│       ├── LibraryBookDto.kt
│       ├── LibraryBookEntity.kt
│       └── LibraryBookModel.kt
└── core/
    ├── logging/
    └── dispatchers/
```

## 3) Naming Conventions

- Services: `<Domain><Action>Service`
  - Example: `LibrarySyncService`
- Repositories: `<Domain>Repository`
  - Example: `LibraryRepository`
- ViewModels: `<Feature><Screen>ViewModel`
  - Example: `LibraryHomeViewModel`
- DTO/entity/model suffixes are explicit and consistent:
  - `Dto`, `Entity`, `Model`

## 4) Migration Checklist

Use this checklist for each incremental migration PR:

- [ ] New files placed under `CleverFerret/`, `tooling/`, `docs/`, `infra/`, or `archive/`
- [ ] Kotlin packages for new code follow `ui/domain/data` feature-first layout
- [ ] New classes follow naming standards (Service/Repository/ViewModel/Dto/Entity/Model)
- [ ] Imports and paths updated after any move
- [ ] CI/workflow references validated after path changes
- [ ] Documentation links and examples updated
