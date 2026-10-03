# ADR 0002: MediaHomeScreen Decomposition

**Status**: PENDING  
**Date**: 2026-05-02  
**Author**: Architecture Review  
**Target**: Phase 1 Step 7 (PREMIERE_ROADMAP.md)

## 1. Current State

### Overview
**File**: `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/MediaHomeScreen.kt`  
**Lines of Code**: 1918  
**Main Composable**: `MediaHomeScreen()` (lines 80–538, signature: 18 params)

### Visual Layout (Top-to-Bottom in LazyColumn)
1. **Sticky Header** (line 157): `StickyContentLibraryHeader` – non-lazy topbar
2. **Pull-to-Refresh Container** (line 183): wraps all lazy content
3. **Welcome Section** (lines 191–215, conditional): empty library guidance + onboarding tips
4. **Hero Carousel** (lines 218–242, conditional): featured items with pager + indicators
5. **Quick Stats Row** (lines 244–257, conditional): 4 stats cards
6. **Continue Watching Row** (lines 260–288, conditional): metallic-border cards
7. **Recently Added Grid** (lines 291–363, conditional): 2-column grid
8. **Empty Section Hints** (lines 366–402, conditional): guidance for missing categories
9. **Recent Comics Carousel** (lines 405–426, conditional): media carousel row
10. **Web Fiction Carousel** (lines 429–450, conditional): media carousel row
11. **Collections Section** (lines 479–493, conditional): horizontal collection cards
12. **Quick Access Grid** (lines 496–507, conditional): 2/3-column flow grid with reorder mode
13. **Bottom Padding** (lines 518–520): spacer
14. **Floating TopBar** (lines 525–535, conditional): fade-in on scroll

### Per-Composable Inventory

| Composable | Role | Lines | Params | State Scope |
|---|---|---|---|---|
| `MediaHomeScreen` | Main entry point, layout composer | 80–538 | `state: MediaHomeState`, callbacks (8), flags (2) | ViewModel-backed |
| `HeroCarousel` | Featured items pager | 552–623 | `items`, `pagerState`, 2 callbacks | Local (pagerState) |
| `QuickStatsRow` | Stats display | 633–687 | `stats: HomeLibraryStats` | Local (responsive) |
| `StatCard` | Individual stat | 690–741 | `icon, value, label, color` | Stateless |
| `CollectionsSection` | Collections row | 748–777 | `collections`, 1 callback | Local (LazyRow) |
| `CollectionCard` | Individual collection | 780–836 | `collection`, callback | Stateless |
| `QuickAccessGrid` | Category grid with reorder | 843–911 | `items`, 2 callbacks | Local (mutableState for reorderMode/editableItems) |
| `QuickAccessFlowGrid` | Flow layout | 915–955 | `items`, `lastOpenedCategory`, 4 callbacks | Local (FlowRow) |
| `QuickAccessCard` | Individual category | 959–1069 | `item`, `isHighlighted`, `reorderMode`, 5 callbacks | Stateless |
| `StickyContentLibraryHeader` | Top bar | 1073–1152 | 3 callbacks | Stateless |
| `ContinueWatchingRow` | Continue section | 1159–1205 | `title, items`, 2 callbacks | Local (LazyRow) |
| `MetallicBorderCard` | Continue item card | 1211–1336 | `item`, callback | Stateless |
| `RecentlyAddedGridSection` | Recently added section | 1389–1439 | `title, items`, callback | Local (Column grid) |
| `RecentlyAddedGridItem` | Grid item | 1442–1562 | `item`, callback | Stateless |
| `PlexTopBar` | Floating bar | 1569–1612 | 2 callbacks | Stateless |
| `ErrorStateContent` | Error handling | 1688–1753 | `error`, callback | Stateless |
| `LoadingStateContent` | Loading skeleton | 1760–1787 | No params | Stateless |

### State & Configuration
- **Screen-local state** (lines 100–152):
  - `scrollState: LazyListState` – main list scroll position
  - `heroCarouselPagerState: PagerState` – featured items carousel
  - `showFloatingTopBar: Boolean` – derived from scroll position
  - `isPullToRefreshEnabled: Boolean` – derived from scroll + error + hero drag
  - `shouldReduceMotion: Boolean` – platform + parameter-driven
  - `isLibraryEmpty: Boolean` – derived from state fields
- **ViewModel-backed state** (passed in):
  - `state: MediaHomeState` – all content data (featured, continue, recent by type, collections, stats)
  - `state.quickAccessItems: List<QuickAccessItem>` – with local mutation in `QuickAccessGrid`

### Key Dependencies & Side Effects
- **Hero carousel auto-scroll** (lines 144–152): `LaunchedEffect` with 6s interval, respects `shouldReduceMotion`
- **Imports**: `com.universalmedialibrary.ui.media.components.*` (line 52) – includes all card components
- **Callbacks hoisted to parent**: 8 core callbacks + error/refresh handlers
- **Shared scroll state**: `scrollState` drives floating topbar visibility and pull-to-refresh enable/disable
- **No Hilt VM injection**: entire screen is stateless w.r.t ViewModel; parent ViewModel supplies all callbacks

---

## 2. Proposed Split

### Target Files & Allocations

#### `HomeHeroSection.kt`
**Composables**: `HeroCarousel`, related constants  
**Estimated LOC**: 100  
**State Hoisting**:
- Parent must supply `pagerState: PagerState` (created/remembered in parent)
- Parent must supply `isHeroCarouselBeingDragged: Boolean` (read from pagerState.interactionSource in parent)
- Callbacks: `onItemClick`, `onPlayClick`
- Auto-scroll logic stays here (LaunchedEffect with internal timer)

**Dependencies**: `PagerState`, featured items list, theme constants  
**Screen-local vs ViewModel**: ViewModel supplies featured items; parent holds pagerState (screen-local ephemeral state)

---

#### `HomeContinueRow.kt`
**Composables**: `ContinueWatchingRow`, `MetallicBorderCard`, helper functions (`remainingLabel`, `parseDurationToSeconds`, `formatRemainingTime`)  
**Estimated LOC**: 200  
**State Hoisting**:
- Parent must supply `continueItems: List<MediaItem>`
- Callbacks: `onItemClick`, `onSeeAllClick` (via `onSeeAllClick(MediaRoutes.SEARCH)`)
- No internal state mutations

**Dependencies**: MediaItem, theme, duration parsing utilities  
**Screen-local vs ViewModel**: All content from ViewModel; callbacks are screen-level

---

#### `HomeRecentlyAddedRow.kt`
**Composables**: `RecentlyAddedGridSection`, `RecentlyAddedGridItem`  
**Estimated LOC**: 180  
**State Hoisting**:
- Parent must supply pre-filtered `recentlyAddedItems: List<MediaItem>` (computed from state.recent* fields)
- Callback: `onItemClick`
- No reorder mode; stateless

**Dependencies**: MediaItem, theme constants, aspect ratio logic  
**Screen-local vs ViewModel**: Content filtering from ViewModel data; parent computes the combined list once

---

#### `HomeRecommendationsRow.kt`
**Composables**: `CollectionsSection`, `CollectionCard`, `QuickAccessGrid`, `QuickAccessFlowGrid`, `QuickAccessCard`  
**Estimated LOC**: 250  
**State Hoisting**:
- Parent must supply `collections: List<HomeCollection>`
- Parent must supply `quickAccessItems: List<QuickAccessItem>`
- Parent must supply `lastOpenedCategory: String?` (optional, for highlighting)
- Callbacks: `onCategoryClick`, `onPreferencesChange(order, favorites)`
- **Internal local state**: `reorderMode`, `editableItems` mutations in `QuickAccessGrid`

**Dependencies**: HomeCollection, QuickAccessItem, theme, flow layout  
**Screen-local vs ViewModel**: Collections & items from ViewModel; reorder mode is internal UI state; preferences callback is hoisted to parent

---

#### `HomeQuickActionsBar.kt` *(placeholder for future stats/empty guidance)*
**Composables**: `QuickStatsRow`, `StatCard`, `EmptySectionGuidanceRow`, `EmptySectionCard` (from MediaHomeWelcomeSection.kt lines 47–110)  
**Estimated LOC**: 150  
**State Hoisting**:
- Parent must supply `libraryStats: HomeLibraryStats`
- Parent must supply `emptySections: List<EmptySectionHint>` (conditionally computed)
- Callback: `onSectionClick` (wrapped from `onSeeAllClick`)
- No internal state

**Dependencies**: HomeLibraryStats, EmptySectionHint, theme  
**Screen-local vs ViewModel**: Stats from ViewModel; empty sections derived from library state in parent

---

### Exclusions & Placement
- **WelcomeSection** (from MediaHomeWelcomeSection.kt): Already in separate file; parent calls it conditionally. *No move.*
- **StickyContentLibraryHeader**: Stays in parent (Scaffold topBar); is non-lazy.
- **PlexTopBar**: Stays in parent (AnimatedVisibility on scroll).
- **ErrorStateContent, LoadingStateContent**: Remain in parent (conditional at Box level, not in LazyColumn).
- **EmptySectionGuidanceRow, EmptySectionCard**: Currently in MediaHomeWelcomeSection.kt; will move to `HomeQuickActionsBar.kt`.
- **Data models** (`MediaHomeState`, `HomeLibraryStats`, `HomeCollection`, `QuickAccessItem`, `defaultQuickAccessItems`): Move to shared data file (new `MediaHomeData.kt` or keep in parent if <200 LOC).

---

## 3. Thin Parent File

### New MediaHomeScreen.kt (~90 LOC)

```kotlin
package com.universalmedialibrary.ui.media.screens

import android.provider.Settings
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.pulltorefresh.PullToRefreshBox
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import com.universalmedialibrary.ui.media.home.*
import com.universalmedialibrary.ui.media.screens.MediaHomeWelcomeSection
import com.universalmedialibrary.ui.media.theme.MediaSpacing

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun MediaHomeScreen(
    state: MediaHomeState,
    isRefreshing: Boolean,
    onItemClick: (MediaItem) -> Unit,
    onPlayClick: (MediaItem) -> Unit,
    onSeeAllClick: (String) -> Unit,
    onQuickAccessCategoryClick: (String) -> Unit,
    onNavigationClick: () -> Unit = {},
    onSearchClick: () -> Unit,
    onNotificationClick: () -> Unit,
    onAddLocalFilesClick: () -> Unit = {},
    onSubscribePodcastsClick: () -> Unit = {},
    onRefresh: () -> Unit,
    onQuickAccessPreferencesChange: (order: List<String>, favorites: Set<String>) -> Unit = { _, _ -> },
    onDismissWelcomeTips: () -> Unit = {},
    onRetry: () -> Unit,
    reduceMotionEnabled: Boolean = false,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberLazyListState()
    val heroCarouselPagerState = rememberPagerState(pageCount = { state.featuredItems.size })
    val isHeroCarouselBeingDragged by heroCarouselPagerState.interactionSource.collectIsDraggedAsState()
    val showFloatingTopBar by remember {
        derivedStateOf { scrollState.firstVisibleItemIndex > 0 }
    }
    val isPullToRefreshEnabled by remember(scrollState, state.error, state.isLoading, isHeroCarouselBeingDragged) {
        derivedStateOf {
            scrollState.firstVisibleItemIndex == 0 &&
            scrollState.firstVisibleItemScrollOffset == 0 &&
            state.error == null && !state.isLoading && !isHeroCarouselBeingDragged
        }
    }
    
    val context = LocalContext.current
    val shouldReduceMotion = remember(context, reduceMotionEnabled) {
        val platformAnimationsDisabled = Settings.Global.getFloat(
            context.contentResolver,
            Settings.Global.ANIMATOR_DURATION_SCALE, 1f
        ) == 0f
        reduceMotionEnabled || platformAnimationsDisabled
    }

    val isLibraryEmpty = remember(state) {
        state.featuredItems.isEmpty() && state.continueItems.isEmpty() &&
        state.recentBooks.isEmpty() && state.recentMusic.isEmpty() &&
        state.recentVideos.isEmpty() && state.libraryStats.totalBooks == 0
    }

    Scaffold(
        topBar = {
            StickyContentLibraryHeader(
                onNavigationClick = onNavigationClick,
                onSearchClick = onSearchClick,
                onNotificationClick = onNotificationClick
            )
        },
        containerColor = MaterialTheme.colorScheme.background
    ) { paddingValues ->
        Box(modifier = modifier.fillMaxSize().padding(paddingValues).background(MaterialTheme.colorScheme.background)) {
            when {
                state.error != null -> ErrorStateContent(state.error, onRetry, Modifier.align(Alignment.Center))
                state.isLoading -> LoadingStateContent(Modifier.fillMaxSize())
                else -> PullToRefreshBox(
                    isRefreshing = isRefreshing,
                    onRefresh = onRefresh,
                    isEnabled = isPullToRefreshEnabled,
                    modifier = Modifier.fillMaxSize()
                ) {
                    LazyColumn(state = scrollState) {
                        if (isLibraryEmpty) {
                            item { WelcomeSection(...) }
                        }
                        if (state.featuredItems.isNotEmpty()) {
                            item {
                                HomeHeroSection(
                                    items = state.featuredItems,
                                    pagerState = heroCarouselPagerState,
                                    onItemClick = onItemClick,
                                    onPlayClick = onPlayClick
                                )
                            }
                        }
                        item { HomeQuickActionsBar(stats = state.libraryStats, ...) }
                        if (state.continueItems.isNotEmpty()) {
                            item {
                                HomeContinueRow(
                                    items = state.continueItems,
                                    onItemClick = onItemClick,
                                    onSeeAllClick = { onSeeAllClick(MediaRoutes.SEARCH) }
                                )
                            }
                        }
                        item { HomeRecentlyAddedRow(...) }
                        item { HomeRecommendationsRow(...) }
                        item { Spacer(Modifier.height(MediaSpacing.Huge)) }
                    }
                }
            }
            
            AnimatedVisibility(
                visible = showFloatingTopBar,
                enter = fadeIn() + slideInVertically(),
                exit = fadeOut() + slideOutVertically(),
                modifier = Modifier.align(Alignment.TopCenter)
            ) {
                PlexTopBar(onSearchClick, onNotificationClick)
            }
        }
    }
}
```

---

## 4. Risk Register

| Risk | Severity | Mitigation | Verification |
|---|---|---|---|
| **Shared scroll state** breaks recomposition when `pagerState` is re-created | HIGH | Parent must use `rememberPagerState(pageCount = { ... })` with stable pageCount derive logic. Store pagerState as stable field, not recreate on recompose. | Unit test: assert pagerState persists across 10 parent recompositions. |
| **Hero carousel auto-scroll LaunchedEffect** in child references `shouldReduceMotion` from parent; becomes inconsistent if parent recomposes. | MEDIUM | Pass `shouldReduceMotion` as immutable param to `HomeHeroSection`. Child derives internal timer interval but does not re-read parent state. | Integration test: toggle reduce motion at runtime, verify carousel pauses. |
| **QuickAccessGrid local state mutation** (`editableItems`) is lost on parent recomposition if parent re-supplies same data. | MEDIUM | Parent must key the item with `key = "quick-access"` in LazyColumn AND must NOT recreate `quickAccessItems` list on parent recompose. Use `.stateIn()` or memoize in ViewModel. | Test: reorder items, verify order persists across parent scroll (no recompose of that item). |
| **Hilt ViewModel scoping** — if parent uses `@HiltViewModel` and children reference VM via callbacks, changing dependency injection may break lazy loading. | LOW | Parent remains stateless w.r.t Hilt; ViewModel is supplied higher in hierarchy (e.g., route-level). No child calls `hiltViewModel()`. | Code review: grep children for `hiltViewModel()` — must be empty. |
| **Accessibility tree fragmentation** — splitting into 5 files may break semantic heading hierarchy if `semantics { heading() }` is not consistently applied in each section. | MEDIUM | Each section (except stats) must have a heading. Verify `RecentlyAddedGridSection`, `HomeRecommendationsRow` include `semantics { heading() }` on titles. | Accessibility audit: TalkBack traversal should announce all section headers in order. |
| **Screenshot test breakage** — decomposition into separate files changes file paths; snapshot test annotations must be updated. | MEDIUM | Update test annotations to reference new file paths. Add integration test for full screen snapshot. | Run existing snapshot tests post-migration; only re-baseline if visual changes are intentional. |

---

## 5. Test Plan

### Existing Test Coverage
- **No screenshot tests found** in `/home/user/CleverFerret/CleverFerret/src/test/` for `MediaHomeScreen`.
- **No instrumentation tests** located for home screen.

### Test Additions (Post-Decomposition)

1. **Unit Tests** (one per section file):
   - `HomeHeroSectionTest`: verify pagerState persists, auto-scroll stops on `shouldReduceMotion = true`
   - `HomeContinueRowTest`: verify item click callback fires, "See All" routes correctly
   - `HomeRecentlyAddedRowTest`: verify grid layout (2 columns), item click callback
   - `HomeRecommendationsRowTest`: verify reorder mode toggle, preferences callback
   - `HomeQuickActionBarTest`: verify stats display, empty section hint card clicks

2. **Integration Test**:
   - `MediaHomeScreenCompositionTest`: verify all 5 sections render when data is populated, empty states show correctly, scroll state persists across recompose

3. **Regression Test**:
   - Screenshot test (full screen) for main layout after decomposition
   - Scroll performance test (FPS, jank metrics)

---

## 6. Migration Order

### Sequential Strategy (Recommended)
Sections should extract in this order to minimize cascading dependency issues:

1. **HomeQuickActionsBar.kt** (lines 633–687 + 1687–1752)
   - Depends only on data models and theme
   - No cross-section callbacks
   - **Action**: Extract `QuickStatsRow`, `StatCard`, error/loading states

2. **HomeHeroSection.kt** (lines 552–623)
   - Depends on featured items (from state) and pagerState
   - Self-contained auto-scroll logic
   - **Action**: Extract, pass pagerState as param

3. **HomeContinueRow.kt** (lines 1159–1382)
   - Depends on continueItems and callbacks
   - Contains utility functions (duration parsing)
   - **Action**: Extract, include helper functions

4. **HomeRecentlyAddedRow.kt** (lines 1389–1562)
   - Depends on filtered recent items list (computed in parent)
   - No internal state
   - **Action**: Extract, parent computes filter

5. **HomeRecommendationsRow.kt** (lines 748–1069)
   - Most complex; depends on collections + quick access items
   - Contains reorder mode state
   - **Action**: Extract last to avoid circular dependency during parent refactoring

### Parent Refactoring (Last Step)
- Collapse `MediaHomeScreen()` into layout composer
- Import all 5 section files
- Create pagerState, scroll state once
- Remove lazy item() wrapping for each section; replace with single item { SectionComposable(...) } call
- Verify all 18 callback signatures are preserved

### Validation Milestones
- **After steps 1–3**: Parent compiles; sections render independently
- **After step 4**: LazyColumn renders all 4 sections in sequence
- **After step 5**: Quick access reorder mode works end-to-end
- **Final**: Screenshot test passes; all callbacks fire; scroll state persists

---

## 7. References

- **Roadmap**: `docs/planning/PREMIERE_ROADMAP.md` (Phase 1, Step 7)
- **Current file**: `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/MediaHomeScreen.kt` (1918 LOC)
- **Destination**: `/home/user/CleverFerret/CleverFerret/src/main/java/com/universalmedialibrary/ui/home/`
- **Related**: `MediaHomeWelcomeSection.kt`, `MediaCards.kt`, `MediaCommonComponents.kt`

---

**Plan Status**: READY FOR REVIEW  
**Next Action**: Implementer to execute steps 1–5 in sequence; one commit per section file.
