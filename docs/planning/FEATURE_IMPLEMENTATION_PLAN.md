# CleverFerret — Feature Implementation Plan

**Branch:** `claude/plan-features-design-OpsKN`
**Last updated:** 2026-05-11
**Scope:** Concrete implementation strategy for every missing or partially
implemented feature in CleverFerret, with consistent UI design grounded in the
Ktheme design system.

---

## 0. Context

CleverFerret is a Kotlin / Jetpack Compose Android universal media library
(~1,004 KT files, ~288k LOC). Per `docs/FEATURES_STATUS.md`,
`docs/ROADMAP.md`, `docs/CODE_REVIEW.md`,
`docs/planning/APP_ISSUES_FIX_PLAN.md`, `docs/v2/reader-pipeline.md`,
`docs/THEMING.md`, and the V2 `CleverFerretV2/core/ui/DESIGN_SYSTEM_SPEC.md`,
the app is **production-ready for core features** (reading, audio playback,
library management, widgets) but has many partially-wired or stubbed
surfaces, and a meaningful set of recurring UX bugs.

A code survey (Appendix A) confirmed:

- Cloud sync OAuth UI is missing.
- AI features lack a key-management UI and Mind Map generation.
- OPDS and Plex are partially wired; Snapcast is UI-only.
- FB2 parser is missing; DJVU is limited.
- Several reader/home bugs from open issues remain (`MediaOpenScreen` audio
  routing, `.take(20)` cap, missing `key=` on lazy lists).
- ~541 raw `MaterialTheme.colorScheme.*` usages bypass `KthemeBridge`, and
  some screens hardcode `Color(0xFF...)` literals.

This document supersedes informal task lists in
`docs/APK_TODO_FIXES.md` and `docs/planning/IMPROVEMENTS_NEEDED.md` for the
Android app. It is decomposed into PR-sized work units that respect the
README guardrails: hard 800 LOC ceiling per Kotlin file, extract a unit on
edit when a file is already >500 LOC, decomposition note in the PR body for
files >500 LOC.

---

## 1. Current Progress Snapshot

| Area | State | Evidence |
|------|-------|----------|
| Reader engine pipeline (Readium EPUB/PDF, Gemini Comic, MOBI family, DJVU limited, fallback) | ✅ Wired via `PublicationEngineRegistry` | `docs/v2/reader-pipeline.md` |
| KthemeBridge ↔ legacy palettes | ✅ Bridge complete; 22 themes registered | `KthemeBridge.kt` |
| 13 widgets in manifest | ✅ Present | `docs/FEATURES_STATUS.md` |
| Reddit HFY downloader (Jsoup) | ✅ Implemented | `RedditFanficDownloader.kt` |
| Fanfiction → EPUB unified service | ✅ FicHub primary + scraper fallback | `docs/implementation/FANFICTION_EPUB_CONVERSION_ARCHITECTURE.md` |
| OldTimeRadio series/episode nav | ✅ Done | `docs/ROADMAP.md` |
| Cloud `Service` classes (Drive/Dropbox/OneDrive/WebDav) | ⚠️ Upload/download done; OAuth UI + sync reconciliation missing | `services/cloud/*` |
| `AIServiceManager` + Gemini provider | ⚠️ Provider plumbing done; OpenAI/Local stub; no key-mgmt UI; no MindMap | `services/ai/*` |
| OPDS client + sanitizer | ⚠️ Parsing + retry done; download path / UI not fully traced | `services/opds/OPDSClient.kt` |
| Plex auth | ⚠️ PIN flow scaffolded; library browse untested | `services/integration/plex/*` |
| Multi-Room Audio | ❌ DB/UI only; Snapcast protocol not implemented | `MultiRoomAudioService.kt` |
| FB2 parser | ❌ Missing | `parsers/impl/` |
| `MediaOpenScreen` `MUSIC` audio routing | ❌ Bug — extension list lacks MUSIC media-type predicate | `ui/open/MediaOpenScreen.kt:19-54` |
| Home `.take(20)` paging cap | ❌ Bug — multiple hardcoded caps | `ui/media/viewmodels/MediaHomeViewModel.kt:159-200` |
| Lazy list `key=` stability | ❌ Bug — missing on home + downloads / Reddit lists | `MediaHomeScreen.kt:770,1200` |
| Ktheme adoption | ⚠️ 541 raw `MaterialTheme.colorScheme.*` callsites; hardcoded literals in `ThemeManagerScreen.kt`, `BookshelfComponents.kt` |

---

## 2. Ktheme Design Conventions

**Source of truth:** `KthemeBridge.kt`, `UnifiedThemeSystem.kt`,
`MetallicComponents.kt`, V2 `KthemeThemeAdapterV1`, and
`CleverFerretV2/core/ui/DESIGN_SYSTEM_SPEC.md`.

### 2.1 Token discipline — read tokens, never literals

| Use case | Token / API | Forbidden |
|---|---|---|
| Surface bg | `MaterialTheme.colorScheme.background` / `surface` | `Color(0xFF…)` |
| On-surface text | `colorScheme.onSurface` / `onSurfaceVariant` | hex literal |
| Accent / brand fill | `metallicColors().base` | raw `primary` on premium surfaces |
| Premium / hero CTA | `MetallicButton`, `MetallicCard` (`MetallicComponents.kt`) | bare `Button` with hex |
| Dividers / outline | `colorScheme.outline` / `outlineVariant` | `Color.Gray` |
| Reader background | `ReaderTheme` overlay (`EnhancedEReaderScreen`) — Day / Sepia / Night / Paper | global theme |
| Geometric / glow effects | `LocalEnableGeometricPatterns`, `LocalEnableMetallicShimmer`, `LocalEnableCrystalGlow` | always-on |
| Spacing | 4dp scale: `space.1..16` (V2 §1.3) | arbitrary dp |
| Radius | `radius.s/m/l/xl/full` | arbitrary corner |
| Type | role tokens `type.headline.l`, `type.body.m`, `type.label.s` | size literal |
| Motion | `motion.duration.fast/normal/slow` | numeric ms literal |

### 2.2 Component catalog (V2 §3) — use, don't reinvent

- **Cards:** `MediaCard`, `CollectionCard`, `StatCard`, `ActionCard`, plus
  metallic variants `MetallicCard`.
- **Players:** `MiniPlayerBar`, `NowPlayingPanel`, `QueueSheet`,
  `TransportControls`.
- **Reader:** `ReaderTopBar`, `ReaderBottomBar`, `ReaderProgressScrubber`,
  `ReaderDisplaySettingsSheet`.
- **Chips:** `FilterChip`, `SelectableChip`, `TagChip`, `StatusChip`.
- **Dialogs:** `ConfirmationDialog`, `FormDialog`, `ErrorDialog`,
  `BottomSheetDialog`.

### 2.3 Accessibility — release-blocking

1. TalkBack labels and roles on every interactive component.
2. Dynamic type 100→200% without overlap or horizontal scrolling for
   primary controls.
3. Contrast: 4.5:1 body, 3.0:1 large text / icons / focus rings.
4. Focus order matches visual order; dialogs trap focus and restore it.

### 2.4 Per-screen UI rule of thumb

1. Wrap routed composable in `UiErrorBoundary` (`docs/ARCHITECTURE.md`).
2. Top of screen: `CenterAlignedTopAppBar` themed by `colorScheme.surface`,
   leading nav icon at 8dp start padding, no brand text in chrome.
3. Hero / CTA: `MetallicButton` / `MetallicCard` with
   `metallicColors().shadow` ambient + `.highlight` spot.
4. Lists: `LazyColumn` / `LazyVerticalGrid` with stable
   `key = { it.id }` on every `items()` block; use
   `rememberSaveable(key = it.id)` for per-row state.
5. Empty / loading / error: provide all three states. Use `StatusChip` for
   inline state pills.
6. Reader / player surfaces theme overlay independent of app theme.

---

## 3. Prioritized Implementation Plan

PR sequencing matches `docs/planning/APP_ISSUES_FIX_PLAN.md` §5; each PR
should target <500 LOC unless explicitly noted.

### Priority Tier Summary

| Tier | Theme | PR count | Notes |
|------|-------|---------:|-------|
| P0 | Crashes & audio routing | 1 | Ship first |
| P1 | UX bugs (paging, key=, podcast, cancellation) | 1 | Bundled |
| P2 | OPDS hardening | 1 | Self-contained |
| P3 | TopBar polish #476 | 1 | Pure UI refactor |
| P4 | Library consolidation #485 | 1 | Feature-flagged |
| P5 | Cloud sync UI + reconciliation | 2 | A=UI, B=engine |
| P6 | AI: key manager + Mind Map | 2 | A=settings, B=feature |
| P7 | Plex: library browse | 1 | |
| P8 | Multi-room audio (Snapcast) | 1 spike + 1 | Decomposition note required |
| P9 | Web fiction: tag browsing + source builder | 1 | |
| P10 | Parser & format gaps (FB2, DJVU eval) | 1 | |
| P11 | Ktheme adoption sweep | rolling | Module-by-module |
| P12 | Widget compliance sweep | 1 | CI gate already exists |

---

### P0 — Crashes & Audio Routing (1 PR, <300 LOC)

#### P0-1 `MediaOpenScreen` — music never opens

- **File:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/open/MediaOpenScreen.kt:19-54`
- **Symptom:** items with canonical `MediaType.MUSIC` fall through to a
  "No viewer" branch.
- **Fix:** replace the hand-rolled `AUDIO_EXTENSIONS` set with a single
  `MediaType.isAudioPlayable()` extension on the canonical enum at
  `data/MediaType.kt`. Recognise `MUSIC`, `MUSIC_TRACK`, `MUSIC_ALBUM`,
  `AUDIOBOOK`, `AUDIOBOOK_CHAPTER`, `PODCAST`, `PODCAST_EPISODE`, `RADIO`,
  `AUDIO`.
- **Test:** `MediaTypeAudioRoutingTest` covering every enum value.
- **UI:** none — pure routing.

#### P0-2 Free Media `National Screening Room` crash

- **Files:** `ui/media/FreeMediaViewModel.kt:70-76`,
  `services/media/free/FreeMediaService.kt:59-78`,
  `ui/media/FreeMediaScreen.kt`.
- **Fix:** `AppLogger.error` breadcrumb in catch; null-guard `duration`,
  `thumbnailUrl`, `year`; wrap each per-item composable in
  `key(item.id) { … }` inside the `LazyColumn`.
- **UI:** when `thumbnailUrl == null`, fall back to a `MediaCard`
  placeholder generated via `coverGenerator` using
  `metallicColors().base → .highlight` linear gradient.

#### P0-3 Podcast download "not found"

- **Files:** `services/podcast/DownloadManager.kt`,
  `services/opds/OPDSDownloadService.kt`,
  `ui/podcast/PodcastViewModel.kt:386`.
- **Fix:** write `downloaded = true` and `localFilePath` in the **same
  transaction**; add a startup reconciliation that flips
  `downloaded = false` when `File(localFilePath).exists()` returns false;
  drop the modal error and surface an inline `Re-download` action.
- **UI:** trailing slot in podcast row becomes a `FilledTonalIconButton`
  with `Icons.Outlined.Refresh`; on completion, swap to
  `Icons.Outlined.PlayArrow`.

---

### P1 — UX Bugs (1 PR, <500 LOC)

#### P1-1 Home "20-item ceiling" + cover loading

- **File:** `ui/media/viewmodels/MediaHomeViewModel.kt:159-200` — every
  `.take(N)` literal.
- **Fix:** retain `.take()` only as a *preview* cap; back each section with
  a Paging 3 `PagingSource` from existing Room DAOs; add a
  `SeeAllSectionScreen(section: HomeSection)` route in
  `MediaAppNavigation.kt`.
- **UI design:**
  - Section header gains a trailing `TextButton("See all")` styled with
    `colorScheme.primary`.
  - Destination uses V2 `MediaCard` in `LazyVerticalGrid(GridCells.Adaptive(160.dp))`.
  - Every `AsyncImage` declares `placeholder` and `error` painters; both
    fall back to `coverGenerator` with the metallic gradient.

#### P1-2 List `key=` stability

- **Files:** every `LazyColumn` / `LazyVerticalGrid` / `HorizontalPager`
  under `ui/reddit/`, `ui/webfiction/`, `ui/**/download*.kt`, plus
  `MediaHomeScreen.kt:770,1200`.
- **Fix:** every `items(...)` block must declare
  `key = { it.id }`; row state via `rememberSaveable(key = it.id)`.

#### P1-3 Global `CancellationException` toast leak

- **File:** the Hilt-installed global `CoroutineExceptionHandler` (likely
  `CleverFerretApplication.kt` or `di/CoroutineModule.kt`).
- **Fix:** filter `CancellationException` before forwarding to the bug
  reporter or snackbar.

#### P1-4 Podcast "subscribe" warning popup

- **File:** `ui/podcast/PodcastViewModel.kt:63-74`.
- **Fix:** drop search results with blank `feedUrl`; demote validation
  failure from modal `Dialog` to inline `Snackbar` per
  `docs/development/NOTIFICATION_PATTERNS.md`.

---

### P2 — OPDS Hardening (1 PR, <300 LOC)

- **File:** `services/opds/OPDSClient.kt:33-60,116-126,276`.
- **Fix:** expand `sanitizeXmlEntities` fixtures with captured Internet
  Archive feeds; add retry-with-backoff for 5xx; surface a "Report feed"
  affordance.
- **UI design:**
  - Error state uses `ErrorDialog` (V2 §3.5).
  - Actions: `MetallicButton("Retry")` primary, `TextButton("Report feed")`
    secondary.
  - Loading state uses `LinearProgressIndicator` themed with
    `metallicColors().highlight`.

---

### P3 — TopBar Polish — Issue #476 (1 PR, <200 LOC)

- **Files:** `ui/media/screens/MediaHomeScreen.kt:149-185`,
  `StickyContentLibraryHeader`.
- **Fix:** replace the row layout with `CenterAlignedTopAppBar`.
- **UI design:**
  - Title slot = embedded `SearchBar` centered.
  - Leading slot = hamburger `IconButton`.
  - Trailing slot = overflow menu.
  - Container `colorScheme.surface`; on scroll, `surfaceColorAtElevation(3.dp)`.
  - Search field outlined with `colorScheme.outlineVariant`.
  - Apply a metallic shimmer brush only when
    `LocalEnableMetallicShimmer.current == true`.

---

### P4 — Library Consolidation — Issue #485 (1 PR, <500 LOC, feature-flagged)

- **Files:** `MediaAppNavigation.kt`,
  `MediaNavDestinations.primaryDestinations`.
- **Fix:** keep typed routes (`library/{mediaType}`) as data contracts;
  expose **one** `library` destination on the bottom bar plus media-type
  chips in-screen (per `docs/navigation/NAVIGATION_SURFACE_AUDIT_PHASE1.md`).
- **UI design:**
  - `LibraryScreen` displays a horizontally-scrolling `FilterChip` row
    just below the top app bar — one chip per `MediaType`.
  - Selected chip uses `colorScheme.secondaryContainer` background,
    `onSecondaryContainer` text; unselected uses `colorScheme.surface` with
    `outline` border.
  - Selecting a chip swaps section content via `crossfade(motion.duration.normal)`
    — no full navigation transition.
  - Empty state per chip: `ActionCard` "Import {MediaType}" pointing at
    `StorageAccessService` import flow.

---

### P5 — Cloud Sync UI + Reconciliation (2 PRs)

#### P5-A OAuth + key store (PR <400 LOC)

- **Files:** new `ui/cloud/CloudAccountsScreen.kt` +
  `CloudAccountsViewModel.kt`; wire `GoogleDriveService.signIn()`,
  `DropboxService` token capture, `OneDriveService` MSAL flow,
  `WebDavService` URL / credential form.
- **Process:**
  1. Tap **Connect** → start `CustomTabsIntent` OAuth (or PIN flow for
     WebDAV).
  2. On callback intent, hand the token to the provider's
     `authenticate(token)`; persist to encrypted SharedPreferences via
     `APIKeyRepository`.
  3. Update `_isAuthenticated` flow; the provider row recomposes to
     "Connected".
- **UI design:**
  - Entry: Settings → "Cloud accounts".
  - Layout: `LazyColumn` of `ProviderRow` cards
    (Drive · Dropbox · OneDrive · WebDAV).
  - Row anatomy: provider icon (24dp leading), name (`type.title.m`),
    `StatusChip` ("Connected" — `colorScheme.primary` / "Not connected" —
    `colorScheme.outline`), trailing `MetallicButton("Connect")` or
    `OutlinedButton("Disconnect")`.
  - Footer card: "Last sync · {timestamp}" with `MetallicButton("Sync now")`.

#### P5-B Sync reconciliation (PR <400 LOC)

- **Files:** `services/cloud/CloudSyncManager.kt:117-121` (replace
  `getLocalMediaFiles()` stub); wire `EnhancedSyncService` to the manager.
- **Fix:** implement local manifest via existing `StorageAccessService`;
  conflict resolution rule = newest-wins by `lastModified`; log conflicts
  to a sync journal Room table.
- **UI design:**
  - In-flight: `LinearProgressIndicator` at top of `CloudAccountsScreen` +
    persistent `MediaNotificationService` channel.
  - Completion: snackbar "Synced N items, M conflicts resolved".
  - Conflict detail: secondary `SyncJournalScreen` (small `LazyColumn`
    using `StatCard` per conflict, with "Use local" / "Use remote"
    `OutlinedButton`s).

---

### P6 — AI: API Key Manager + Mind Map (2 PRs)

#### P6-A API key manager UI (PR <300 LOC)

- **Files:** new `ui/settings/ai/AiKeysScreen.kt` + ViewModel; wire
  `AIServiceManager` + `APIKeyRepository`.
- **Process:**
  1. Debounced save → `APIKeyRepository.setKey(provider, value)`.
  2. `AIServiceManager.refreshProvider(provider)`.
  3. **Validate** → call provider's `validateKey()`; show snackbar
     "Key validated" / "Validation failed".
- **UI design:**
  - Sectioned list: `Cloud LLMs` (Gemini · OpenAI · OpenRouter) and
    `Local LLMs` (Ollama).
  - Per provider:
    - `OutlinedTextField` with `PasswordVisualTransformation`, trailing
      eye toggle.
    - `StatusChip` — `Validated` (primary) / `Pending` (tertiary) /
      `Invalid` (error) / `Empty` (outline).
    - `TextButton("Validate")`.
  - Sticky bottom CTA: `MetallicButton("Save & Validate")`.

#### P6-B Mind Map generation (PR <500 LOC; decomposition note)

- **Files:** new `services/ai/MindMapService.kt`,
  `ui/reader/insights/MindMapScreen.kt`; integrates
  `ReadingAnalyticsService` + `AIServiceManager`.
- **Process:**
  1. From book detail → `Insights` tab → `Generate mind map`.
  2. Build prompt from chapter titles + cached chapter summaries + entity
     extraction.
  3. Call active `AIProvider.generateInsight(prompt)`.
  4. Parse JSON `{ nodes: [{id,label,type}], edges: [{from,to,kind}] }`.
  5. Render via Compose `Canvas` with force-directed layout. Prefer
     existing `ui/visualization/` utilities; do not add a native lib.
- **UI design:**
  - Background `colorScheme.background`; nodes filled with
    `metallicColors().base`, bordered with `.highlight`; when
    `LocalEnableCrystalGlow.current`, add a 12dp glow via
    `shadow(elevation, spotColor = metallicColors().shimmer)`.
  - Toolbar styled like `ReaderTopBar`: zoom +/-, recenter, regenerate,
    export PNG (`ShareSheet`).
  - Empty state: `ActionCard("Generate mind map")` with metallic CTA;
    error state: `ErrorDialog` with retry.

---

### P7 — Plex: Library Browse & Test (PR <400 LOC)

- **Files:** finish `services/integration/plex/PlexAuthService` and
  `PlexIntegrationService`; new `ui/plex/PlexLibraryBrowserScreen.kt`.
- **Process:** PIN already wired → poll → token exchange (per
  `docs/planning/APP_ISSUES_FIX_PLAN.md` §6.3); after token, enumerate
  Servers → Libraries → Sections and route media playback through existing
  `AudioPlaybackManager` / `UnifiedReaderService`.
- **UI design:**
  - Three-pane drilldown via Material3 adaptive
    `ListDetailPaneScaffold`.
  - Server cards: `MediaCard` with metallic border
    (`metallicColors().shadow` outline).
  - Library categories: `FilterChip` row across the top of the detail
    pane.
  - Items grid: V2 `MediaCard` with cover (`AsyncImage` with placeholder /
    error), title (`type.title.s`), subtitle
    (`type.label.s` `onSurfaceVariant`).

---

### P8 — Multi-Room Audio (Snapcast) (spike + ~600 LOC PR; decomposition note)

- **Files:** `services/audio/MultiRoomAudioService.kt` + new
  `services/audio/snapcast/` subpackage.
- **Process:**
  1. mDNS discovery (`_snapcast._tcp`) via `NsdManager`.
  2. JSON-RPC over TCP (port 1705) for control plane.
  3. Audio stream consumed via existing `ExoPlayer` `MediaSource` pointed
     at `tcp://server:1704`.
- **UI design:**
  - Devices grid: `MediaCard` per device with `StatusChip` showing latency
    (`onlineMs <100 ms = success`, `<300 ms = warning`, otherwise
    `error`).
  - Group composer: `SelectableChip` per device; selected devices joined
    to the active group on confirmation.
  - Per-device volume slider: thumb tinted `metallicColors().base`, track
    `colorScheme.primary`, on hover/focus shows `type.label.s` dB value.

---

### P9 — Web Fiction: Tag Browsing & Source Builder (PR <500 LOC)

- **Files:** `ui/webfiction/TagBrowserScreen.kt`,
  `ui/webfiction/SourceBuilderDialog.kt`; expand
  `services/webfiction/` source registry.
- **Process:**
  - Source builder: `FormDialog` containing URL, list selector, item
    selector, title selector, content selector — each with a "Test"
    button that fetches a sample page and previews the matched fragment.
  - Tag browser: faceted by fandom / character / relationship; selecting
    facet filters the underlying repository query.
- **UI design:**
  - `LazyVerticalGrid(GridCells.Adaptive(96.dp))` of `TagChip`s with
    counts.
  - Chip color: `colorScheme.tertiaryContainer` background,
    `onTertiaryContainer` text.
  - Long-press chip → `BottomSheetDialog` showing usage count, top
    stories, "Open in source" action.

---

### P10 — Parser & Format Gaps (PR <400 LOC)

- **Files:** new `parsers/impl/Fb2Parser.kt`; register in `ParserFactory`
  alongside existing parsers (line 21–42).
- **Process:**
  1. Pure-Kotlin XML parsing (`XmlPullParser`) of `<FictionBook>` payload
     into `ParsedDocument`.
  2. Extract `<description>` → metadata; `<body>` paragraphs → ordered
     text content; cover from `<binary id="cover.jpg">`.
- **DJVU:** keep `LIMITED` until a maintained pure-Kotlin reader is
  identified; do not pull a native library in this plan.
- **UI:** none — engine-only. The file browser's format filters
  automatically pick up new extensions through the canonical
  `MediaType` enum.

---

### P11 — Ktheme Adoption Sweep (rolling PR series, <400 LOC each)

- **Symptom:** 541 raw `MaterialTheme.colorScheme.*` usages and hardcoded
  `Color(0xFF…)` literals in `ThemeManagerScreen.kt`,
  `BookshelfComponents.kt`, and others.
- **Approach:** sweep one feature module per PR. For each touched file:
  1. Replace literal hex with `metallicColors().*` or `colorScheme.*`
     tokens.
  2. Replace bare `Button` with `MetallicButton` *only* on hero / primary
     CTAs; keep secondary actions on standard Material `Button` /
     `OutlinedButton`.
  3. Replace bare `Card` with `MetallicCard` for collection / featured
     surfaces.
  4. Gate effects behind `LocalEnableGeometricPatterns`,
     `LocalEnableMetallicShimmer`, `LocalEnableCrystalGlow`.
- **CI gate:** add `scripts/ci/audit_ktheme_usage.py` that fails when a
  new file introduces `Color(0xFF` outside `ui/theme/` or uses
  `colorScheme.primary` in a screen tagged `@HeroSurface`. Host on the
  existing static-analysis workflow.

---

### P12 — Widget Compliance Sweep (PR <300 LOC)

- **Files:** every `res/xml/*widget_info.xml`.
- **Fix:** assert each provider has `android:updatePeriodMillis` of
  either `0` (event-driven; must also declare `android:resizeMode`) or
  `>=1800000`. Extend
  `scripts/ci/validate_android14_widget_background_updates.py` to cover
  all 13 widgets.
- **Path correction (#134):** ensure V2 widget lives at
  `CleverFerretV2/feature/widgets/src/main/java/com/cleverferret/v2/feature/widgets/widget/MediaLibraryWidget.kt`.

---

## 4. UI Design Reference Sheet

Apply this anatomy to every new screen.

```
┌──────────────────────────────────────────────────────────┐
│ CenterAlignedTopAppBar                                   │
│   leading: IconButton(Menu)  trailing: IconButton(More) │
│   title slot: feature-specific                           │
│   container: colorScheme.surface                         │
│   onScroll: surfaceColorAtElevation(3.dp)                │
├──────────────────────────────────────────────────────────┤
│ optional FilterChip row                                  │
│   selected: secondaryContainer  unselected: outline      │
├──────────────────────────────────────────────────────────┤
│ Content surface (UiErrorBoundary)                        │
│   - Loading: LinearProgressIndicator + skeletons         │
│   - Empty:   ActionCard with MetallicButton CTA          │
│   - Loaded: LazyColumn / LazyVerticalGrid with key=      │
│   - Error:  ErrorDialog (retry primary, report secondary)│
├──────────────────────────────────────────────────────────┤
│ Optional MiniPlayerBar / NowPlayingPanel                 │
│   container: metallicColors().base                       │
│   onContainer: colorScheme.onPrimary                     │
└──────────────────────────────────────────────────────────┘
```

### 4.1 Recurring components

- **Hero CTA:** `MetallicButton(text, onClick)` — shadow
  `metallicColors().shadow`, spot `metallicColors().highlight`,
  `RoundedCornerShape(radius.m)`.
- **Premium card:** `MetallicCard { … }` — same shadow recipe, optional
  shimmer overlay when `LocalEnableMetallicShimmer.current`.
- **State pill:** `StatusChip(label, tone)` — `tone` maps to a
  `colorScheme` slot (primary / tertiary / error / outline).
- **Search input:** `OutlinedTextField` with leading
  `Icons.Outlined.Search`; trailing clear button only when text is
  non-empty.
- **Dialogs:** all confirmation flows use `ConfirmationDialog`; all input
  flows use `FormDialog`; destructive flows must call out the action with
  `colorScheme.error` and require explicit confirmation text.

### 4.2 Motion & elevation

- Standard transitions: `motion.duration.normal` (200ms) with
  `motion.easing.standard`.
- Hero / shared-element: `motion.easing.emphasized` over
  `motion.duration.slow` (320ms).
- Reduced motion: respect `Settings.Global.ANIMATOR_DURATION_SCALE` —
  collapse non-essential transitions to `motion.duration.fast` (100ms).

---

## 5. Verification

For every PR:

1. **Build gate:** `./gradlew :CleverFerret:assembleDebug --no-daemon`
   — uses the wrapper-level JDK preflight added 2026-04-18 (see
   `docs/planning/ACTIVE_BUILD_BACKLOG.md`).
2. **Static analysis:** `.github/workflows/static-analysis.yml`
   (lint, widget gate, new Ktheme audit).
3. **Unit tests** colocated with the fix:
   - `MediaTypeAudioRoutingTest` (P0-1).
   - `MediaHomePagingSourceTest` (P1-1).
   - `OpdsSanitizerTest` with archived feeds (P2).
   - `MindMapPromptBuilderTest` (P6-B).
   - `SnapcastDiscoveryTest` (P8 — instrumented).
4. **UI smoke + Compose previews:** every new screen ships with at
   least one `@Preview` per state (loading / empty / error / loaded).
   UI tests under `androidx.compose.ui.test.junit4` for new routes.
5. **Accessibility checks:**
   - TalkBack walkthrough — every interactive control announces label
     and role.
   - Font scaling at 200% without clipping.
   - Compose `LocalContentColor` inspector spot-check.
6. **PR hygiene:** if any touched file is >500 LOC, include a
   decomposition note describing what was extracted and why
   (README §Contribution Guardrails).

---

## 6. Critical Files

**Theming (do not regress):**

- `CleverFerret/src/main/java/com/universalmedialibrary/ui/theme/UnifiedThemeSystem.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/theme/KthemeBridge.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/theme/MetallicComponents.kt`
- `CleverFerret/src/main/java/com/ktheme/core/ThemeEngine.kt`
- `CleverFerret/src/main/java/com/ktheme/models/Theme.kt`
- `CleverFerretV2/core/ui/src/main/java/com/cleverferret/v2/core/ui/theme/KthemeThemeAdapterV1.kt`
- `CleverFerretV2/core/ui/DESIGN_SYSTEM_SPEC.md`

**Screens to fix first (P0–P3):**

- `CleverFerret/src/main/java/com/universalmedialibrary/ui/open/MediaOpenScreen.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/viewmodels/MediaHomeViewModel.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/MediaHomeScreen.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/podcast/PodcastViewModel.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/FreeMediaScreen.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/FreeMediaViewModel.kt`

**Services to extend (P5–P10):**

- `CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/{Google,Dropbox,OneDrive,WebDav}Service.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/services/cloud/CloudSyncManager.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/services/ai/{AIServiceManager,GeminiAIProvider,OpenAIProvider,LocalLLMProvider}.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/*`
- `CleverFerret/src/main/java/com/universalmedialibrary/services/audio/MultiRoomAudioService.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/services/opds/OPDSClient.kt`
- `CleverFerret/src/main/java/com/universalmedialibrary/parsers/impl/` (add `Fb2Parser.kt`)
- `CleverFerret/src/main/java/com/universalmedialibrary/parsers/ParserFactory.kt`

**New screens (P5–P9):**

- `ui/cloud/CloudAccountsScreen.kt` + ViewModel
- `ui/settings/ai/AiKeysScreen.kt` + ViewModel
- `ui/reader/insights/MindMapScreen.kt`
- `ui/plex/PlexLibraryBrowserScreen.kt`
- `ui/webfiction/TagBrowserScreen.kt`, `SourceBuilderDialog.kt`
- `ui/library/SeeAllSectionScreen.kt`

---

## Appendix A — Code Survey Snapshot

| # | Finding | File : Line |
|---|---------|-------------|
| 1 | `GoogleDriveService.signIn()` empty | `services/cloud/GoogleDriveService.kt:78` |
| 2 | `CloudSyncManager.getLocalMediaFiles()` returns `emptyList()` | `services/cloud/CloudSyncManager.kt:117-121` |
| 3 | `OneDriveService.listFiles` uses `hashCode()` for modifiedTime | `services/cloud/OneDriveService.kt:177` |
| 4 | `LocalLLMProvider.kt` not present | `services/ai/` |
| 5 | `MindMapService.kt` not present | `services/ai/` |
| 6 | `RedditFanficDownloader` complete (no FicHub fallback wired) | `services/webfiction/RedditFanficDownloader.kt:32-100` |
| 7 | `Fb2Parser` not present | `parsers/impl/` |
| 8 | `MediaOpenScreen.AUDIO_EXTENSIONS` lacks MUSIC media-type predicate | `ui/open/MediaOpenScreen.kt:19-54` |
| 9 | `MediaHomeViewModel` hardcoded `.take(N)` ×5 | `ui/media/viewmodels/MediaHomeViewModel.kt:159-200` |
| 10 | `MediaHomeScreen` `items()` lacks `key=` | `ui/media/screens/MediaHomeScreen.kt:770,1200` |
| 11 | 541 `MaterialTheme.colorScheme.*` raw usages | repo-wide |
| 12 | Hardcoded color literals | `ui/theme/ThemeManagerScreen.kt`, `ui/components/BookshelfComponents.kt` |
| 13 | `MultiRoomAudioService` is DB / UI only | `services/audio/MultiRoomAudioService.kt` |
| 14 | `OPDSClient.sanitizeXmlEntities` workaround live | `services/opds/OPDSClient.kt:276` |
| 15 | Plex PIN flow scaffolded | `services/integration/plex/PlexIntegrationService.kt:55-107` |

---

## Appendix B — Cross-References

- `README.md` — Contribution Guardrails (file size limits, decomposition
  notes).
- `docs/INDEX.md` — full documentation index.
- `docs/THEMING.md` — theming concepts (Unified, Metallic, Ancient
  Architect).
- `docs/ARCHITECTURE.md` — service layering and UI error boundary
  conventions.
- `CleverFerretV2/core/ui/DESIGN_SYSTEM_SPEC.md` — V2 token + component +
  accessibility spec.
- `docs/v2/reader-pipeline.md` — reader engine registry contract.
- `docs/navigation/NAVIGATION_SURFACE_AUDIT_PHASE1.md` — library
  consolidation prior art.
- `docs/planning/APP_ISSUES_FIX_PLAN.md` — open-issue triage and PR
  sequencing.
- `docs/development/NOTIFICATION_PATTERNS.md` — Snackbar vs Dialog
  guidance.
