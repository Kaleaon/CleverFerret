# CleverFerret "Premiere" Implementation Plan

## Context

CleverFerret is an Android-only universal media library at `/home/user/CleverFerret`. The canonical app module `CleverFerret/` is the only module currently in `settings.gradle.kts` (~1,163 Kotlin files, ~288k LOC). A fully-built, fully-tested multi-module incubation tree exists at `CleverFerretV2/` with 7 core + 16 feature modules and real implementations (e.g., `OpdsFeedParser.kt`, contract tests), **but is not wired into the root build**.

Recent work uncovered five hard compile errors in trunk despite `main.yml` defining `compileDebugKotlin`, `testDebugUnitTest`, `jacocoCriticalCoverageVerification`, and `lintDebug -Plint.abortOnError=true` jobs. Forensic check confirmed `main.yml:95` carries `continue-on-error: true` on the compile step plus `--continue` on `compileDebugKotlin`, which masks downstream errors and weakens the gate. Multiple recent code-review docs reference work items (transitional ViewModels, `.take(20)` ceilings) that have already been completed in trunk but the docs are stale.

This plan turns CleverFerret into a "premiere full media library organizer, sorter, and player" measured against:

- 99.5% crash-free; zero compile errors in trunk; modular architecture so each feature builds independently.
- Cold start <1.5s on Pixel 6a; resumable library scans; reader/player first-frame <500ms.
- 7+ media types at `Ready`; ≥40% test coverage on services + ViewModels (currently ~2.5%).
- Real roundtrip-tested integrations for OPDS, Calibre, Plex, Jellyfin, Emby, Audiobookshelf, Komga, Kavita, podcast indexes, cloud sync.
- AA accessibility; dynamic type 200%; Wear OS, Android TV, and Android Auto at MVP.
- Differentiator: universal cross-media (book↔audiobook progress sync, comic motion mode, podcast transcript karaoke), offline-first, encryption-at-rest opt-in.

Assumptions locked with the user: **solo maintainer**, **Wear OS + Android TV + Auto all in scope**, **encryption-at-rest via SQLCipher + Tink as opt-in**. Total elapsed estimate ~15 months at sustained pace.

---

## Phase 0 — Trunk Hygiene & Gate Forensics (BLOCKING)

**Scope.** Determine why compile-broken code reached trunk, fix the CI gate, lock branch protection, install Detekt, freeze a real lint baseline, add Turbine + benchmark scaffolding.

**Duration.** 3 weeks.

**Entry criteria.** None — keystone phase.

**Exit criteria.**
- Branch protection on `main` requires `test`, `static-analysis`, `accessibility-checks` checks; admin bypass disabled; protection JSON committed at `docs/governance/branch-protection.json`.
- A deliberate compile-error canary PR demonstrably blocks merge.
- Detekt configured at root with baseline; reports uploaded as CI artifact.
- `lint-baseline.xml` regenerated and frozen; `-Plint.abortOnError=true` enforced.
- Turbine added; one ViewModel test converted to prove wiring.
- `:benchmark-macro` module assembles (no benchmarks yet).
- `docs/CODEBASE_REVIEW_2026.md` and `docs/REPOSITORY_STATUS_REPORT.md` corrected: "transitional ViewModels" item removed; `SupportingViewModels.kt` now contains 7 real Hilt VMs.

**Ordered actions.**

1. **Forensic audit of recent merges.** Use `gh api repos/Kaleaon/CleverFerret/branches/main/protection` and `gh pr list --state merged --limit 100 --json number,mergedAt,mergeCommit,statusCheckRollup` to catalog PRs merged with non-success checks. Document at `docs/governance/ci-bypass-postmortem.md`. Confirm root cause is `continue-on-error: true` at `.github/workflows/main.yml:95` plus `compileDebugKotlin --continue` at line 77.
2. **Fix `main.yml` compile gate.** Edit `.github/workflows/main.yml`: remove `continue-on-error: true` from the compile step (line 95); change `compileDebugKotlin --continue` (line 77) to `compileDebugKotlin` (no `--continue`); leave the line-151 summary aggregator. Add a deliberate-failure canary PR to verify the gate.
3. **Lock branch protection via API.** Required status checks: `test`, `static-analysis`, `accessibility-checks`. Require linear history; dismiss stale reviews; disable admin bypass. Commit the resulting JSON at `docs/governance/branch-protection.json`.
4. **Add Detekt.** New `config/detekt/detekt.yml`. Apply `io.gitlab.arturbosch.detekt` plugin in `/home/user/CleverFerret/build.gradle.kts` and `/home/user/CleverFerret/CleverFerret/build.gradle.kts`. Generate baseline once. Wire into `.github/workflows/static-analysis.yml`. Explicitly do **not** baseline `complexity` and `style.MagicNumber` rules so they surface as warnings.
5. **Regenerate lint baseline & enforce abort.** Run `./gradlew :CleverFerret:updateLintBaseline`; commit `CleverFerret/lint-baseline.xml`. Verify clean lint with zero new violations.
6. **Test infrastructure: Turbine + dispatcher rule.** Add `app.cash.turbine:turbine` to `gradle/libs.versions.toml`. Create `CleverFerret/src/test/java/com/universalmedialibrary/testing/MainDispatcherRule.kt`. Convert `MediaHomeViewModelTest` (or one existing VM test) to Turbine to prove wiring.
7. **Coverage ratchet.** Update `jacocoCriticalCoverageVerification` to enforce the current floor (~2.5%) as a regression gate. Phases 2/4/5 raise it to 15/30/40%.
8. **Benchmark scaffolding.** Add `:benchmark-macro` to root `settings.gradle.kts` matching the existing `:CleverFerret` include style. Empty placeholder benchmark file. Verify `./gradlew :benchmark-macro:assemble` succeeds.
9. **Stale docs sweep.** Update `docs/CODEBASE_REVIEW_2026.md` to remove the closed transitional-ViewModel item; correct `docs/REPOSITORY_STATUS_REPORT.md` cross-references. Establish ADR home at `docs/architecture/decisions/`.

**Critical files.**
- `/home/user/CleverFerret/.github/workflows/main.yml`
- `/home/user/CleverFerret/build.gradle.kts`
- `/home/user/CleverFerret/CleverFerret/build.gradle.kts`
- `/home/user/CleverFerret/gradle/libs.versions.toml`
- `/home/user/CleverFerret/CleverFerret/lint-baseline.xml`
- `/home/user/CleverFerret/settings.gradle.kts`

**Risks & mitigation.**
- Branch protection can lock out a solo maintainer. Document a break-glass procedure (admin override + audit log) at `docs/governance/break-glass.md`.
- Lint baseline regen may surface 50+ hidden criticals. Budget 2 days; if overflow, file follow-up issues rather than expand P0.
- Existing PRs in flight may break under the new gate. Allow a 3-day grace window after activation.

**Dependencies.** None.

---

## Phase 1 — V2 Module Adoption & Decomposition Foundations

**Scope.** Wire `CleverFerretV2/` modules into the root build, migrate one feature (OPDS) end-to-end as proof, decompose the worst two oversize files, capture the module dependency graph.

**Duration.** 7 weeks.

**Entry criteria.** Phase 0 exit. Compile/lint/Detekt gates active.

**Exit criteria.**
- Root `settings.gradle.kts` includes all 7 V2 core modules and 3 V2 feature modules (`opds`, `library`, `metadata`).
- `:CleverFerret` declares `implementation(project(":CleverFerretV2:feature:opds"))` and one production code path invokes `OpdsFeatureApi`. Legacy `services/opds/OPDSClient.kt` reduced to a thin adapter or deleted.
- `OpdsEndToEndFlowTest` runs in `:CleverFerret` test classpath via the module dependency.
- `ui/media/navigation/MediaAppNavigation.kt` (currently 2093 LOC) decomposed below 500 LOC.
- `ui/media/screens/MediaHomeScreen.kt` (currently 1922 LOC) decomposed below 500 LOC.
- Module dependency graph rendered and committed at `docs/architecture/module-graph.md`.

**Ordered actions.**

1. **Include V2 in root settings.** Edit `/home/user/CleverFerret/settings.gradle.kts` to include `:CleverFerretV2:core:auth`, `:common`, `:data`, `:database`, `:media`, `:network`, `:ui`, plus `:CleverFerretV2:feature:opds`, `:library`, `:metadata`. Reuse the include syntax already in `/home/user/CleverFerret/CleverFerretV2/settings.gradle.kts`. Verify `./gradlew projects` lists them; clean build succeeds.
2. **Reconcile Gradle plugins/versions.** Diff `CleverFerretV2/gradle.properties` against root `gradle.properties` and `gradle/libs.versions.toml`. Promote V2-only versions into the root catalog so there's a single source of truth. Eliminate any duplicate `compose.bom`/`hilt`/`kotlin` declarations.
3. **OPDS migration as the proof.** In `:CleverFerret`, replace direct usages of `services/opds/OPDSClient.kt` and `services/opds/OPDSDownloadService.kt` with calls into `:CleverFerretV2:feature:opds` via `OpdsFeatureApi`. Reuse `CleverFerretV2/feature/opds/src/main/.../OpdsFeedParser.kt`, `OpdsHttpClient.kt`, `DownloadLifecycleStore.kt`, `OpdsUiErrorMapper.kt`. Mark legacy OPDS files `@Deprecated` for removal in Phase 2. `OpdsFeedParserContractTest` and `OpdsEndToEndFlowTest` must run as part of `testDebugUnitTest`.
4. **Migrate `services/metadata` sources to V2 metadata module.** Move (without rewriting) `MetadataSource.kt` and concrete sources `OpenLibraryMetadataSource`, `GoodreadsMetadataSource`, `ComicvineMetadataSource` into `CleverFerretV2/feature/metadata/src/main/...`. Keep canonical package paths via type aliases in `:CleverFerret` to avoid touching ~200 call sites. Delete the aliases in Phase 2.
5. **Library module adoption (read-only first).** Wire `:CleverFerretV2:feature:library` for read APIs; keep writes in legacy until Phase 2 paging retrofit. At least one screen lists library items via the V2 API.
6. **Decompose `MediaAppNavigation.kt` (2093 LOC).** Split into `nav/RootNavGraph.kt`, `nav/LibraryNavGraph.kt`, `nav/ReaderNavGraph.kt`, `nav/PlayerNavGraph.kt`, `nav/SettingsNavGraph.kt` under `CleverFerret/src/main/java/com/universalmedialibrary/ui/nav/`. Use `NavGraphBuilder` extension functions. Each new file <500 LOC; original becomes a 100-LOC composer.
7. **Decompose `MediaHomeScreen.kt` (1922 LOC).** Extract `home/HomeHeroSection.kt`, `home/HomeContinueRow.kt`, `home/HomeRecentlyAddedRow.kt`, `home/HomeRecommendationsRow.kt`, `home/HomeQuickActionsBar.kt`. Verify behavior unchanged via Paparazzi snapshots (added in cross-phase).
8. **Module graph artifact.** Add a Gradle task or use `dot` to render the DAG; commit as `docs/architecture/module-graph.md` with a generated SVG.

**Critical files.**
- `/home/user/CleverFerret/settings.gradle.kts`
- `/home/user/CleverFerret/CleverFerretV2/settings.gradle.kts`
- `/home/user/CleverFerret/CleverFerretV2/feature/opds/src/main/java/com/cleverferret/v2/feature/opds/api/OpdsFeatureApi.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/opds/OPDSClient.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/media/navigation/MediaAppNavigation.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/MediaHomeScreen.kt`

**Risks & mitigation.**
- Hilt component graph collisions when V2 and legacy modules both `@InstallIn` the same scope. One-time audit and `@Replaces` where conflict exists; prefer V2.
- KSP doubles up across modules. Pin a single KSP version in the version catalog; verify `kspDebugKotlin` runs once per module.
- Type-alias fragility for the metadata move can mask import drift. Set a Phase-2 follow-up to delete the aliases.

**Dependencies.** Phase 0 exit.

---

## Phase 2 — Library Excellence

**Scope.** Add metadata aggregation with provenance, plug `IngestionPipeline.kt` into file scanning for resumability, retrofit `PagingSource` across hot DAOs, auto-import OPDS downloads, ship the eight missing readers (MOBI, AZW3, FB2, DJVU, CHM, ODT, RTF, DOC).

**Duration.** 14 weeks.

**Entry criteria.** Phase 1 exit. V2 metadata + library modules included in build.

**Exit criteria.**
- New `MetadataAggregator` produces a single `AggregatedMetadata` per item with per-field `FieldProvenance(source, confidence, fetchedAt)`, replacing parallel-concat in `services/metadata/ComprehensiveMetadataService.kt:61-130`.
- A scan kill-and-restart resumes from the last persisted checkpoint; integration test demonstrates full resumed pass <2× of an uninterrupted scan.
- Top 10 list/grid screens use `Pager`/`PagingSource`; macro-benchmark shows scroll FPS ≥58 and peak heap delta <80 MB on a synthetic 50k-item library.
- OPDS-downloaded files appear in the library within 5 s of download completion without user action.
- All 8 missing readers open at least one real-world sample file each; basic reader UI for text-flow formats; bitmap-only fallback for DJVU/CHM acceptable as MVP.
- Test coverage on services/VMs ≥15%.

**Ordered actions.**

1. **`MetadataAggregator` with provenance.** Create `CleverFerretV2/feature/metadata/src/main/.../MetadataAggregator.kt`. Define `AggregatedMetadata` and `FieldProvenance`. Per-field policy table (e.g., `title`: Goodreads > OpenLibrary; `coverUrl`: ComicVine for comics). Hook into `services/metadata/ComprehensiveMetadataService.kt` so callers see one merged result. New Room entity `MetadataFieldProvenance` (migration in `data/local/migrations/`). Document precedence at `docs/architecture/metadata-precedence.md` with override hooks reserved for Phase 5.
2. **Scan resumability via `IngestionPipeline`.** Refactor `services/MediaScannerService.kt` to emit `ScanWorkItem` events into `services/ingestion/IngestionPipeline.kt`. Reuse `InMemoryIncrementalStateStore` (existing at `IngestionPipeline.kt:12`) and back it via a new Room-backed `ScanCheckpointDao`. On `onCreate()` of the foreground service, query last checkpoint and resume.
3. **Hash storage as queryable schema.** Add `sha256` and `sha1` columns to `MediaItem` (or equivalent) in `AppDatabaseMigrations.kt`. Backfill via a one-shot migration `Worker` constrained to charging + idle, batched 500 rows. Index both columns. `services/duplicates/DuplicateDetectionService.kt` switches from on-the-fly fingerprinting to indexed query lookup.
4. **PagingSource retrofit.** Convert top 10 hot queries (`MediaItemDao`, `BookDao`, `AudiobookDao`, `PodcastEpisodeDao`, `ComicDao`, `MovieDao`, `ShowDao`, `TagDao`, `SmartCollectionCache`, `RecentlyAccessedDao`) to return `PagingSource`. Replace ~263 `.take(n)` calls across repositories with `Pager(PagingConfig(pageSize=50)).flow`. Update Compose screens to `LazyColumn { items(lazyPagingItems) { ... } }`. Verify scroll-restoration via `LazyListState` + `rememberSaveable` smoke tests.
5. **OPDS auto-import wire.** New `CleverFerretV2/feature/opds/src/main/.../OpdsAutoImportBridge.kt`. On `DownloadLifecycleStore` `COMPLETED` event, emit to a new `LibraryImportBus` consumed by `MediaScannerService` in single-file mode (not full scan). End-to-end test: download from a fixture OPDS feed, assert library entry within 5 s.
6. **Decompose `StorageAccessService.kt` (1841 LOC).** Split into `services/storage/StorageAccessImporter.kt`, `services/storage/SmartFolderLayout.kt`, `services/storage/DryRunPlanner.kt`. Each <600 LOC.
7. **Decompose `EnhancedFileBrowser.kt` (1346 LOC).** Split into browser core, filters, batch ops files.
8. **Decompose `AppDatabaseMigrations.kt` (1297 LOC).** Per-version migration files; use Room auto-migrations where possible.
9. **Reader implementations (eight formats).**
   - **MOBI/AZW3/PRC**: integrate a Kotlin port of `mobi-java` or KOReader's parser. Files: `services/reader/formats/MobiReader.kt`, `AzwReader.kt`. Reuse `ui/viewer/MediaViewerManager.kt` `DocumentFormat` enum dispatch.
   - **FB2**: pure XML; `services/reader/formats/Fb2Reader.kt` using kotlinx XML utilities.
   - **DJVU**: bind `djvu-android` AAR for bitmap rendering MVP; full-text behind a feature flag. `services/reader/formats/DjvuReader.kt`.
   - **CHM**: `chmlib-java`; `services/reader/formats/ChmReader.kt`.
   - **ODT/DOC/RTF**: extend the existing minimal DOCX text extractor pattern in `services/reader/`. Use Apache POI `poi-scratchpad` for DOC; `odfdom-java` for ODT. Files: `OdtReader.kt`, `DocReader.kt`, `RtfReader.kt`. Reuse Readium 3.1.2 navigator for text-flow formats where possible.
   - Each format has at least one open-and-scroll instrumentation test.
10. **Duplicate merge UI.** Surface the merge action (already supported by `services/duplicates/`) in `ui/organization/DuplicateDetectionScreen.kt` with a confirm dialog and Snackbar undo. Merging two items keeps progress, annotations, and the highest-quality cover.
11. **Type-alias cleanup.** Delete the metadata-source type aliases introduced in Phase 1.

**Critical files.**
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/ComprehensiveMetadataService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/MediaScannerService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/ingestion/IngestionPipeline.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/StorageAccessService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabaseMigrations.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/viewer/MediaViewerManager.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/filepicker/EnhancedFileBrowser.kt`

**Risks & mitigation.**
- Reader format quality varies; DJVU/CHM Java options are weak. Ship bitmap-only mode and gate full-text behind a feature flag.
- Paging retrofit can break list scroll-restoration. `LazyListState` + `rememberSaveable` smoke tests on every converted screen.
- Schema migration backfill on large libraries can OOM. WorkManager-constrained job, batch size 500.
- Aggregator confidence policy contentious. Document defaults; allow user overrides starting Phase 5.

**Dependencies.** Phase 1 exit.

---

## Phase 3 — Local Player & Reader Experience

**Scope.** Wire ReplayGain and AudioEffects into the playback signal path; complete gapless/crossfade; ship Wear OS, Android TV, and deepen Android Auto; replace mocked dictionary/translation with real on-device backends; harden Chromecast.

**Duration.** 16 weeks.

**Entry criteria.** Phase 2 exit. Library scan and readers stable.

**Exit criteria.**
- ReplayGain track/album mode applied as `Player.setVolume()` per-track in `services/audio/AudioPlaybackManager.kt`; A/B test confirms correct dB delta within 0.5 dB.
- 10-band EQ from `services/music/AudioEffectsService.kt` connected via Media3 `AudioProcessor` chain.
- Gapless playback works on a verified album (e.g., Pink Floyd *Dark Side of the Moon*) with silence <50 ms; crossfade replaces the existing stub.
- Hi-res FLAC 24/96 plays bit-perfect on Pixel 6a via USB-DAC.
- Wear OS companion app at `:wear` with playback control + recent items, Tile + Complication for now-playing.
- Android TV at `:tv` with leanback browse + player; passes Play Store TV checklist.
- Android Auto MediaBrowserService browse tree expanded beyond shallow scaffolding to match Library categories.
- Dictionary returns real definitions from a bundled offline Wiktionary/StarDict dataset.
- Translation routes to ML Kit on-device translator (network-free default).
- Chromecast: queue mirroring, fallback-to-local on disconnect, library-aware (sends library URIs not file paths).
- `MediaBookReader.kt` and `EnhancedPDFReaderScreen.kt` decomposed below 600 LOC each.
- `SettingsScreen.kt` and `SettingsSubPages.kt` decomposed (one file per category).

**Ordered actions.**

1. **ReplayGain wiring.** In `services/audio/AudioPlaybackManager.kt`, after track load, read RG tags via `services/music/ReplayGainService.kt`, compute target gain (track or album mode based on user pref), apply via `ExoPlayer.setVolume()`. Unit test fixtures with known RG values.
2. **AudioEffects via processor chain.** New `services/audio/EqAudioProcessor.kt` inserted into a custom `RenderersFactory`. Persist user EQ presets in DataStore. Instrumentation test sweeps a sine through the chain and asserts spectrum.
3. **Gapless + crossfade.** Replace the `CrossfadeJob` stub with a real implementation using two `ExoPlayer` instances and time-aligned fades; fall back to gapless via `ConcatenatingMediaSource2`.
4. **Hi-res passthrough.** Explicitly enable `FfmpegAudioRenderer` (already a present extension); verify FLAC 24/96 plays without resampling.
5. **Wear OS module (`:wear`).** New top-level module. Files: `WearableListenerService`, MediaController-driven UI, Tile + Complication. Reuse `services/audio/MediaSessionManager.kt`'s session metadata. Paired emulator must control phone playback.
6. **Android TV module (`:tv`).** New module with leanback `BrowseFragment` + Compose-for-TV (1.0 stable). Manifest gets `<intent-filter>` with `LEANBACK_LAUNCHER`; declare `tv_banner`. D-pad navigation works in player.
7. **Android Auto deepening.** Expand `services/auto/AutoMediaBrowserService.kt` browse tree to mirror full library categories (Books, Audiobooks, Music, Podcasts, Continue Listening, Recently Added). Add voice-action handling. Submit for Play Store automotive review.
8. **Replace mocked dictionary.** Bundle StarDict files via Play Asset Delivery (~200 MB on-demand feature). Replace canned returns in `services/dictionary/DictionaryTranslation.kt` with real lookups. 1000-word sample test must achieve >95% hit rate.
9. **Real on-device translation.** Use `com.google.mlkit:translate` with on-device language models, downloaded per language pair on first use. Update `DictionaryTranslation.kt` `translateText()`. Round-trip EN↔ES test in airplane mode after model download.
10. **Chromecast hardening.** In `services/cast/ChromecastManager.kt`, mirror local queue to `RemoteMediaClient`; on `SessionListener.onSessionEnded`, resume on local `ExoPlayer` at the remote position. New `services/cast/LibraryCastHttpServer.kt` (small embedded HTTP server) so Cast device can re-resolve content URIs. End-to-end: play, cast mid-track, disconnect, resume locally within 1 s.
11. **Reader UX decompositions.** Decompose `MediaBookReader.kt` (1420 LOC) and `EnhancedPDFReaderScreen.kt` (1273 LOC) following the Phase 1 pattern: extract toolbars, gestures, settings sheets. Each <600 LOC.
12. **Settings decomposition.** Split `SettingsScreen.kt` (1267 LOC) and `SettingsSubPages.kt` (1258 LOC) into one file per category.

**Critical files.**
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/audio/AudioPlaybackManager.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/music/ReplayGainService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/music/AudioEffectsService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/cast/ChromecastManager.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/auto/AutoMediaBrowserService.kt` (or current path)
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/dictionary/DictionaryTranslation.kt` (or current path; was `ui/reader/DictionaryTranslation.kt`)
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/MediaBookReader.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/EnhancedPDFReaderScreen.kt`

**Risks & mitigation.**
- Wear OS and Android TV are separate Play Store listings. Coordinate metadata; ship behind feature flags; submit after internal QA.
- ML Kit on-device translation languages limited. Document supported pairs; fall back to opt-in cloud provider for the rest.
- `AudioProcessor` insertion is fragile across ExoPlayer renderer pipelines. Budget 2 weeks of buffer.
- StarDict bundle size — Play Asset Delivery as on-demand feature; offer to use the user's Calibre dictionary if present.

**Dependencies.** Phase 2 exit.

---

## Phase 4 — Remote, Server & Sync

**Scope.** Replace the Calibre stub with real backend; build Audiobookshelf, Komga, Kavita greenfield; ship Snapcast TCP transport; complete cloud sync providers.

**Duration.** 14 weeks.

**Entry criteria.** Phase 3 exit. Local experience polished.

**Exit criteria.**
- Calibre integration syncs a real `metadata.db` (read-only library, with covers, tags, series, custom columns); not mock.
- Audiobookshelf: auth, library list, audiobook + podcast sync, progress push, offline download — passes a `testcontainers` roundtrip test.
- Komga + Kavita: similar feature parity for comics/manga.
- Snapcast: TCP/WebSocket transport actually streams audio to a Snapcast server; LAN drift <100 ms.
- Google Drive, Dropbox, OneDrive, WebDAV: real `listFiles()`, `download()`, `upload()`, delta sync; library import end-to-end.
- Test coverage on services/VMs ≥30%.

**Ordered actions.**

1. **Calibre real backend.** Wire the existing `services/CalibreDatabaseReader.kt`. Replace the in-memory map in `services/integration/CalibreIntegrationService.kt` (5 KB stub) with: SAF-mounted `metadata.db` via SQLite read-only; map Calibre book IDs to local `MediaItem`; sync custom columns to `UnifiedTag` with `IMPORTED_CALIBRE` source. Imports a 5k-book Calibre library in <60 s.
2. **Calibre Content Server hand-off (format conversion).** Don't reimplement Calibre converters; new `services/integration/CalibreContentServerClient.kt` that uses Calibre's content-server API for transcoding when configured. Convert EPUB→MOBI roundtrip via a configured Calibre server.
3. **Audiobookshelf greenfield.** New module `:CleverFerretV2:feature:audiobookshelf` mirroring the Plex pattern (`PlexIntegrationService.kt` 757 LOC as reference). Files: `AudiobookshelfApi.kt`, `AudiobookshelfSyncService.kt`, `AudiobookshelfFeatureApi.kt`. API-key auth; progress push every 30 s of playback. Contract test against a Docker Audiobookshelf instance.
4. **Komga + Kavita.** Parallel module structure: `:CleverFerretV2:feature:komga` and `:kavita`. Map to `ComicDao`. Roundtrip read-progress test.
5. **Snapcast TCP transport.** `core/network/SnapcastControlProtocolClient.kt` already builds JSON-RPC; add `SnapcastTcpTransport` using `okio` `Socket` + length-prefixed framing. Stream audio via existing `services/audio/AudioPlaybackManager` PCM tap. Two devices play in sync within 100 ms drift on LAN.
6. **Cloud sync providers.** For each of `services/cloud/{GoogleDriveService, DropboxService, OneDriveService, WebDavService}.kt`: implement `listFiles()`, `download(path, dest)`, `upload(src, path)`, `delta(token)` against the official SDK or REST. Encrypted tokens via existing `EncryptedSharedPreferences`. New `services/cloud/CloudFileSyncCoordinator.kt` schedules WorkManager jobs. Subsequent re-syncs only fetch deltas.
7. **Podcast index integrations.** Verify Podcast Index, iTunes Search, GPodder roundtrips; if missing, add under `services/podcast/` following the OPDS contract pattern. Subscribe + episode-fetch test for each index.
8. **Conflict resolution UI.** Surface server-vs-local progress conflicts using the existing `SERVER_WINS / LOCAL_WINS / NEWER_WINS` policy from `PlexIntegrationService.kt`. New `ui/sync/SyncConflictDialog.kt`.

**Critical files.**
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/integration/CalibreIntegrationService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/integration/PlexIntegrationService.kt` (reference)
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/core/network/SnapcastControlProtocolClient.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/GoogleDriveService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/DropboxService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/OneDriveService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/WebDavService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/audio/AudioPlaybackManager.kt`

**Risks & mitigation.**
- Server integrations need real test instances. Use `testcontainers-java` with Audiobookshelf/Komga/Kavita Docker images in instrumentation CI. Budget 3 days for container plumbing.
- Snapcast PCM tap is invasive. If blocked, fall back to "Snapcast as control plane" mode where Snapcast streams from a separate source.
- OAuth refresh logic must not leak tokens. Add a security review checkpoint before merging each provider.
- Cloud APIs change; pin SDK versions and capture API contract tests.

**Dependencies.** Phase 3 exit.

---

## Phase 5 — Differentiators

**Scope.** Cross-media linking (book↔audiobook progress sync), comic motion mode, podcast transcript karaoke, AI insights on-device, web fiction power features, encryption-at-rest opt-in.

**Duration.** 10 weeks.

**Entry criteria.** Phase 4 exit. All 7+ media types `Ready`.

**Exit criteria.**
- Reading 50% of an EPUB and switching to its audiobook resumes within ±5 s (chapter-aligned). This is THE differentiator.
- Comic→motion comic: panel detection drives auto-pan/zoom Ken Burns mode for any CBR/CBZ.
- Podcast transcript view synced with playback (karaoke-style word highlight).
- AI insights dashboard shows non-trivial recommendations after 20 reads, fully on-device.
- Web fiction: full FanFicFare integration with story update notifications, reading queue auto-fill from AO3/FFNet feeds.
- Library can be encrypted at rest opt-in: SQLCipher for the Room DB, Tink AES-GCM file envelope for media in app-private storage.
- `WebFictionService.kt` (1245 LOC) and `UnifiedFanfictionHubScreen.kt` (1330 LOC) decomposed.
- Test coverage on services/VMs ≥40%.

**Ordered actions.**

1. **Cross-media linking.** New `data/local/entity/MediaCrossLink.kt` with `(itemA, itemB, linkType, alignmentMap)` where alignment is a chapter-level mapping. New `services/crossmedia/CrossMediaProgressSync.kt` listens for progress updates on either side and computes equivalent position. Manual override UI for unaligned sources (e.g., abridged audiobooks).
2. **Comic motion mode.** Extend the panel-detection pipeline (reuse `services/analysis/fingerprint/` infra) with OpenCV-based contour detection. New `services/comic/PanelDetector.kt` and `ui/reader/MotionComicMode.kt`. Reference comic auto-pans correctly.
3. **Podcast transcript sync.** Use Whisper.cpp via JNI for on-device transcription; align word timestamps with playback. Reuse existing TTS infrastructure patterns. Gate the 200 MB+ binary behind opt-in download (Play Asset Delivery).
4. **AI insights.** New `services/ai/ReadingInsightsService.kt` aggregates `ReadingStatisticsDao` data; on-device sentence embeddings via ML Kit or `onnxruntime` for similarity-based recommendations from the user's library. Dashboard surfaces "you read 12 books this month, here are 3 from your library you'd likely enjoy next." All on-device — privacy-preserving.
5. **Web fiction power.** Extend `services/webfiction/WebFictionService.kt` (1245 LOC, also a decomposition target). Story-update polling, auto-download new chapters via FanFicFare, push notifications, queue auto-fill from AO3/FFNet feeds. Subscribe to an AO3 series; new chapter auto-arrives within 24h check.
6. **Encryption-at-rest (opt-in).** SQLCipher for Room DB; Tink AES-GCM envelope for media files in app-private storage (large media stays unencrypted by default but with optional per-folder opt-in). User-initiated migration with backup-first WorkManager job. Settings copy explicitly notes the ~30% read perf hit. Rooted device cannot read DB without passphrase after enable.
7. **Decomposition completion.** `WebFictionService.kt` split into per-source service classes; `UnifiedFanfictionHubScreen.kt` split into sections per source.
8. **Accessibility AA pass.** Run `accessibility-checks.yml` with strict mode; fix all critical findings. Verify dynamic type 200% on the 8 most-used screens. Workflow passes with zero critical violations.

**Critical files.**
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/webfiction/WebFictionService.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/webfiction/UnifiedFanfictionHubScreen.kt`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/services/analysis/fingerprint/`
- `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabase.kt` (or equivalent SQLCipher integration point)

**Risks & mitigation.**
- Whisper.cpp adds 200 MB+ binary. Gate behind opt-in Play Asset Delivery download.
- Cross-media chapter alignment needs heuristics for unaligned sources. Manual override UI.
- SQLCipher migration of an existing DB is risky. Require user-initiated migration with backup-first; default-off.
- AI features must remain offline-only to honor privacy positioning. Be explicit in privacy policy and settings copy.

**Dependencies.** Phases 0-4 exit.

---

## Cross-Phase Concerns

**Testing strategy.**
- *Unit*: JUnit4 + Mockk + Truth + Turbine for ViewModel `StateFlow` assertions; `kotlinx-coroutines-test` `TestScope`.
- *Integration*: Robolectric for DAO/Repository round-trips with a real Room instance.
- *Instrumentation*: Espresso + Compose UI test for navigation and reader/player flows. `testcontainers-java` (Phase 4) for Audiobookshelf/Komga/Kavita/Calibre content server.
- *Benchmark*: `:benchmark-macro` (created in Phase 0) gets cold-start in Phase 1, scroll FPS + paging memory in Phase 2, audio latency + reader first-frame in Phase 3.
- *Snapshot*: Add Paparazzi in Phase 1 for Compose visual-regression coverage on the 12 oversize-file decompositions.

**Coverage ratchet (enforced via `jacocoCriticalCoverageVerification`).** Phase 0 freezes at 2.5%; Phase 2 raises to 15%; Phase 4 to 30%; Phase 5 to 40%.

**Telemetry.** Add a thin abstraction `core/telemetry/TelemetrySink.kt` (no-op default, opt-in only). Capture scan throughput, reader open latency, player buffer underruns, sync conflicts. Structured events; no PII; flushed locally to a rolling log file.

**Accessibility gates.** `accessibility-checks.yml` already exists; Phase 0 enforces it as a required check. Each phase's exit criteria include "no new critical accessibility violations." Phase 5 raises the bar to AA across all reachable screens, dynamic type 200%, color contrast verified.

**Doc updates.** Each phase updates `docs/REPOSITORY_STATUS_REPORT.md`, `docs/CODEBASE_REVIEW_2026.md`, and `docs/architecture/`. Phase 0 establishes a decision log at `docs/architecture/decisions/` (ADR format). Stale references corrected as discovered.

**Decomposition sequencing for the 12 oversize files.**
- Phase 1: `MediaAppNavigation.kt` 2093 → 5 nav graph files; `MediaHomeScreen.kt` 1922 → 5 section files.
- Phase 2: `StorageAccessService.kt` 1841 → 3 service files; `EnhancedFileBrowser.kt` 1346; `AppDatabaseMigrations.kt` 1297.
- Phase 3: `MediaBookReader.kt` 1420; `EnhancedPDFReaderScreen.kt` 1273; `SettingsScreen.kt` 1267 + `SettingsSubPages.kt` 1258.
- Phase 5: `WebFictionService.kt` 1245 → per-source services; `UnifiedFanfictionHubScreen.kt` 1330 → per-source sections.
- Skip: `PhosphorIcons.kt` 2061 (icon registry, declarative).

Pattern in every case: extract leaf composables/services so the parent file becomes a thin orchestrator <300 LOC; Paparazzi snapshot before/after to prove zero visual diff.

---

## Verification

**Phase 0 verification.**
- Open a deliberately compile-broken canary PR. Expectation: `test` job fails, branch protection blocks merge. Document run URL in the postmortem.
- Run `./gradlew detekt lint :CleverFerret:assembleDebug --stacktrace` locally and in CI. Both must succeed.
- Confirm `docs/governance/branch-protection.json` matches `gh api repos/Kaleaon/CleverFerret/branches/main/protection` output.

**Phase 1 verification.**
- `./gradlew projects` lists all included V2 modules.
- `./gradlew :CleverFerret:dependencies | grep CleverFerretV2` shows the OPDS module dependency.
- `./gradlew test` runs `OpdsFeedParserContractTest` and `OpdsEndToEndFlowTest`.
- `find CleverFerret/src/main -name '*.kt' | xargs wc -l | sort -rn | head -5` shows `MediaAppNavigation.kt` and `MediaHomeScreen.kt` below 500 LOC.

**Phase 2 verification.**
- Macro-benchmark on a 50k-item synthetic library: scroll FPS ≥58, peak heap delta <80 MB, cold start <1.5 s.
- Instrumentation test: kill scanner mid-pass via `am kill`; restart; assert no duplicate inserts and full completion within 2× original duration.
- End-to-end: `OpdsAutoImportBridge` integration test downloads from a fixture catalog and asserts the library row exists within 5 s.
- Each of the 8 new readers opens a sample file in an instrumentation test.

**Phase 3 verification.**
- Sine sweep through the EQ chain via `EqAudioProcessor`; FFT result matches expected spectrum within tolerance.
- ReplayGain reference track plays at correct dB delta (measured) within 0.5 dB.
- Dark Side of the Moon transitions silence-free (<50 ms gap measured).
- Wear emulator paired to phone controls playback.
- TV emulator launches via leanback launcher; D-pad navigation works in player.
- Dictionary 1000-word benchmark: hit rate >95%.
- Cast disconnect test: resume locally within 1 s at correct position.

**Phase 4 verification.**
- Calibre import: 5k-book library imports in <60 s; covers, tags, series, custom columns visible.
- `testcontainers` roundtrip tests for Audiobookshelf, Komga, Kavita all green in CI.
- Snapcast LAN test: two devices, drift <100 ms.
- Cloud sync: 50-book Drive folder imports; subsequent run only fetches deltas.
- Coverage: `jacocoCriticalCoverageVerification` passes at 30% threshold.

**Phase 5 verification.**
- Cross-media test: read 50% of `Project Hail Mary` EPUB; switch to its audiobook; resume position within ±5 s of expected chapter.
- Motion comic test: known reference comic auto-pans correctly through panels.
- Whisper transcript test: round-trip alignment within ±300 ms on a 10-minute episode.
- AI insights test: after seeding 20 reads, dashboard surfaces non-trivial recommendations.
- AO3 series subscription delivers a new chapter within 24 h.
- Encryption smoke test: enable encryption opt-in; rooted-device shell cannot read DB without passphrase; perf benchmark shows ~30% read penalty as documented.
- Coverage: 40% threshold met.

**Continuous (every phase).** `accessibility-checks.yml` workflow remains green. `static-analysis.yml` (lint + Detekt) remains green. `:benchmark-macro` regression report uploaded as CI artifact and compared against the prior baseline; >10% regression fails the build.
