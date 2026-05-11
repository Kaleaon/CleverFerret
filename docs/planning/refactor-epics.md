# Refactor Epics: Pre-Implementation Planning Tickets

This tracker defines decomposition targets and guardrails before any implementation work starts.

## 1) `ui/media/navigation/MediaAppNavigation.kt`

- **Current scope:** monolithic navigation composition across multiple product areas.
- **Extraction targets (new files):**
  - `ui/media/navigation/graphs/RootNavGraph.kt`
  - `ui/media/navigation/graphs/LibraryNavGraph.kt`
  - `ui/media/navigation/graphs/ReaderNavGraph.kt`
  - `ui/media/navigation/graphs/PlayerNavGraph.kt`
  - `ui/media/navigation/graphs/SettingsNavGraph.kt`
  - `ui/media/navigation/NavigationRoutes.kt` (route constants + argument keys)
- **Invariants to preserve:**
  - All existing route strings and argument names remain backward-compatible.
  - Start destination and deep-link entry behavior remain unchanged.
  - Back-stack behavior (`popUpTo`, inclusive flags, `launchSingleTop`) remains equivalent.
  - Feature-gated destinations remain controlled by the same runtime flags.
  - No change to analytics/event emission points tied to navigation transitions.
- **Verification strategy (before/after smoke):**
  - UI snapshot checks for: app launch, library tab, player screen, settings entry.
  - Navigation unit smoke tests validating route registration and selected argument parsing.
  - Manual deep-link smoke matrix (internal scheme + external intents) for top 10 routes.

## 2) `ui/media/screens/MediaHomeScreen.kt`

- **Current scope:** home surface composition including hero, rows, actions, and state orchestration.
- **Extraction targets (new files):**
  - `ui/media/screens/home/HomeHeroSection.kt`
  - `ui/media/screens/home/HomeContinueWatchingRow.kt`
  - `ui/media/screens/home/HomeRecentlyAddedRow.kt`
  - `ui/media/screens/home/HomeRecommendationsRow.kt`
  - `ui/media/screens/home/HomeQuickActionsBar.kt`
  - `ui/media/screens/home/HomeScreenStateMappers.kt` (UI model mapping helpers)
- **Invariants to preserve:**
  - Section ordering and visibility rules remain exactly the same for equivalent state.
  - Scroll position restoration behavior remains unchanged across recomposition/config changes.
  - Click/action handlers dispatch the same intents with equivalent payloads.
  - Loading/empty/error UI states and copy remain unchanged.
  - Accessibility traversal order and semantics labels are preserved.
- **Verification strategy (before/after smoke):**
  - UI snapshot checks for loading, empty, content-rich, and error states.
  - Compose unit smoke checks asserting visibility rules by mock state.
  - Interaction smoke tests for hero CTA, row item click, quick action buttons.

## 3) `services/StorageAccessService.kt`

- **Current scope:** storage scan/import, dry-run planning, folder layout heuristics, and orchestration.
- **Extraction targets (new files):**
  - `services/storage/StorageAccessImporter.kt`
  - `services/storage/StorageDryRunPlanner.kt`
  - `services/storage/SmartFolderLayoutPlanner.kt`
  - `services/storage/StorageImportProgressReporter.kt`
  - `services/storage/StorageAccessContracts.kt` (interfaces/data contracts)
- **Invariants to preserve:**
  - File discovery inclusion/exclusion behavior remains byte-for-byte equivalent.
  - Transaction boundaries and rollback semantics remain unchanged.
  - Progress and cancellation behavior retain the same callback cadence and terminal states.
  - Duplicate detection decisions are unchanged for the same input corpus.
  - Persisted metadata fields and default values remain stable.
- **Verification strategy (before/after smoke):**
  - Unit smoke checks for scan filters, dry-run outputs, and folder-layout decisions.
  - Service-level smoke tests for cancellation/resume and progress monotonicity.
  - Golden input corpus regression run comparing imported item counts + metadata hashes.

## 4) `ui/filepicker/EnhancedFileBrowser.kt`

- **Current scope:** browser rendering, filtering/search, and batch operations in one Compose file.
- **Extraction targets (new files):**
  - `ui/filepicker/browser/EnhancedFileBrowserScreen.kt`
  - `ui/filepicker/browser/FileBrowserTreePane.kt`
  - `ui/filepicker/browser/FileBrowserFilterBar.kt`
  - `ui/filepicker/browser/FileBrowserBatchActions.kt`
  - `ui/filepicker/browser/FileBrowserSelectionState.kt`
- **Invariants to preserve:**
  - Directory traversal and sort ordering stay identical for same dataset/preferences.
  - Filter chips and search query behavior produce identical result sets.
  - Multi-select semantics (toggle, range/select-all, clear) remain unchanged.
  - Batch operations maintain same preconditions, confirmation flows, and result messaging.
  - Keyboard/back navigation and breadcrumb behavior remain equivalent.
- **Verification strategy (before/after smoke):**
  - UI snapshots for root, nested folder, filtered results, and multi-select states.
  - Compose unit smoke checks on filter predicates and selection-state transitions.
  - Batch operation smoke checks against temp filesystem fixtures.

## 5) `data/local/AppDatabaseMigrations.kt`

- **Current scope:** many version migrations in a single file with tightly coupled sequencing.
- **Extraction targets (new files):**
  - `data/local/migrations/MigrationRegistry.kt`
  - `data/local/migrations/MigrationV1ToV2.kt`
  - `data/local/migrations/MigrationV2ToV3.kt`
  - `data/local/migrations/MigrationV3ToV4.kt`
  - `data/local/migrations/MigrationV4ToV5.kt`
  - `data/local/migrations/AutoMigrationSpecs.kt` (where Room auto-migration is viable)
  - *(Continue one-file-per-version pattern for all remaining versions.)*
- **Invariants to preserve:**
  - Exact migration ordering and coverage for all supported upgrade paths.
  - No schema drift from current canonical schema for latest DB version.
  - Data preservation for non-null and indexed fields, including backfill behavior.
  - Idempotence guarantees for migration steps that may re-run in test harnesses.
  - Existing fallback/destructive migration policy remains unchanged.
- **Verification strategy (before/after smoke):**
  - MigrationTestHelper smoke suite from each historical version to latest.
  - Schema export diff check (JSON schema artifacts) to detect unintended changes.
  - Row-count + critical-column integrity checks on seeded pre-migration datasets.

## Execution gates (apply to all five tickets)

- **Gate A: Baseline capture** — record pre-refactor snapshots/test results and retain as comparison artifacts.
- **Gate B: Incremental extraction** — move logic without behavior edits; no functional changes in extraction PRs.
- **Gate C: Equivalence check** — run defined smoke checks after each extraction chunk.
- **Gate D: Rollout safety** — if any invariant fails, revert chunk and re-scope before continuing.
