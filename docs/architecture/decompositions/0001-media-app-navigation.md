# Navigation Graph Decomposition: MediaAppNavigation.kt

**Status:** Design (Ready for Implementation)  
**Date:** 2026-05-02  
**Phase:** Roadmap Phase 1, Step 6

---

## 1. Current State

### File Metrics
- **Path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/navigation/MediaAppNavigation.kt`
- **Total LOC:** 2,093
- **Top-level composable:** `MediaAppNavHost(navController, onShowSnackbar, modifier)`
- **Start destination:** `MediaRoutes.HOME`
- **Transition strategy:** Fade + slide (horizontal 1/4 offset)

### Route Inventory (Grouped)

#### MAIN SECTIONS (Lines 383–551)
1. `HOME` (L387–455) → `MediaHomeScreen`
2. `NOT_FOUND` (L457–477) → `NotFoundRouteScreen`
3. `DISCOVER` (L479–489) → `MediaDiscoverScreen`
4. `PODCAST_DISCOVER` (L493–498) → `MediaDiscoverScreen` (alias)
5. `SEARCH` (L500–533) → `MediaSearchScreen`
6. `ACTIVITY` (L534–539) → `ActivityScreen`
7. `ROOM_CHAT` (L540–551) → `RoomChatScreen`

#### SETTINGS (All via extension function `addSettingsRoutes`, L553)
- Delegates to `MediaSettingsNavigationGraph.kt` (lines 1–262)
- Includes: SETTINGS (main), SETTINGS_API, SETTINGS_APPEARANCE, SETTINGS_PLAYBACK, SETTINGS_READER, SETTINGS_STORAGE, SETTINGS_SECURITY, SETTINGS_ABOUT, plus 20+ sub-routes
- Managed separately; will remain in dedicated file

#### LIBRARY SCREENS (Lines 555–674)
1. `LIBRARY_ROOT` (L559–565) → redirect to BOOKS
2. `SEE_ALL` (L567–582) → dynamic redirect
3. `LIBRARY` parameterized (L585–618) → `MediaLibraryScreen`
4. `MUSIC` (L620–639) → `MusicLibraryScreen`
5. `PODCASTS` (L641–661) → `PodcastScreen`
6. `WEB_FICTION` (L663–668) → `WebFictionBrowseScreen`
7. `RADIO` (L670–674) → `RadioScreen`

#### DETAIL SCREENS (Lines 676–737)
1. `MEDIA_DETAIL` (L680–737) → `MediaDetailScreen` (supports all media types)

#### PLAYER SCREENS (Lines 740–844)
1. `READER` with optional chapter param (L743–815) → `MediaReaderScreen`
2. `AUDIO_PLAYER` (L816–844) → `MediaAudioPlayerScreen`
3. (VIDEO_PLAYER to be added at lines ~1234–1259 in legacy section)

#### DISCOVERY & BROWSE (Lines 846–986)
1. `OPDS_BROWSER` (L849–874) → `OPDSBrowserScreen`
2. `WEB_FICTION_BROWSE` (L886–957) → `WebFictionSourceBrowserScreen`
3. `AMBIENT_SOUNDS` (L958–971) → `MediaAmbientScreen`
4. `NEWS` (L972–980) → `NewsScreen`
5. `VISUALIZER` (L981–990) → `MediaVisualizerScreen`

#### COLLECTIONS & ORGANIZATION (Lines 987–1089)
1. `COLLECTIONS` (L991–1004) → `MediaCollectionsScreen`
2. `COLLECTION_DETAIL` (L1005–1022) → `CollectionDetailScreen`
3. `TAG_MANAGER` (L1024–1030) → `TagManagerScreen`
4. `TAG_EXPLORER` (L1031–1037) → `TagExplorerScreen`
5. `SMART_COLLECTIONS` (L1038–1044) → `SmartCollectionsScreen`
6. `SMART_COLLECTION_DETAIL` (L1045–1056) → `SmartCollectionDetailScreen`
7. `ENHANCED_SEARCH` (L1058–1082) → `EnhancedSearchScreen`
8. `UNIVERSAL_SEARCH` (L1084–1089) → `UniversalSearchScreen`

#### SYNC & IMPORT/EXPORT (Lines 1091–1225)
1. `SYNC` (L1094–1104) → `SyncScreen`
2. `IMPORT_EXPORT` (L1106–1116) → `ImportExportScreen`
3. `FOLDER_IMPORT` (L1119–1127) → `FolderImportScreen`
4. `FILE_BROWSER` (L1129–1180) → `EnhancedFileBrowser`
5. `ONBOARDING` (L1186–1194) → `OnboardingScreen`
6. `LANDSEEK` (L1200–1211) → external intent
7. `ENHANCED_FILE_BROWSER` (L1213–1225) → `EnhancedStorageBrowserScreen`

#### LEGACY COMPATIBILITY (Lines 1227–2062)
- ~835 LOC of legacy routes (old naming patterns, redirects, deprecated screens)
- Will remain in MediaAppNavigation.kt to preserve deep-link compatibility

#### DEBUG MENU (Lines 2064–2074)
- Conditional on `BuildConfig.SHOW_DEBUG_MENU`
- `DEBUG_MENU` → `DebugMenuScreen`

---

## 2. Proposed Split

### 2.1 RootNavGraph.kt (≤100 LOC)
**Purpose:** Top-level composition; orchestrates all sub-graphs.

**Routes assigned:**
- HOME (L387–455)
- NOT_FOUND (L457–477)
- SEARCH (L500–533)
- ACTIVITY (L534–539)
- ROOM_CHAT (L540–551)

**Extension function:** `NavGraphBuilder.addRootRoutes(navController, onShowSnackbar)`

**Imports needed:**
```kotlin
import androidx.compose.animation.*
import androidx.navigation.*
import androidx.navigation.compose.*
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
```

**Est. final LOC:** 85

---

### 2.2 LibraryNavGraph.kt (≤400 LOC)
**Purpose:** All library browsing, multi-media type selection, filtering.

**Routes assigned:**
- LIBRARY_ROOT (L559–565)
- SEE_ALL (L567–582)
- LIBRARY (parameterized, L585–618)
- BOOKS (implicit via LIBRARY)
- MUSIC (L620–639)
- PODCASTS (L641–661)
- WEB_FICTION (L663–668)
- RADIO (L670–674)
- DISCOVER (L479–489)
- PODCAST_DISCOVER (L493–498)

**Extension function:** `NavGraphBuilder.addLibraryRoutes(navController)`

**Imports needed:**
```kotlin
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import androidx.compose.runtime.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.ui.components.UiErrorBoundary
```

**Est. final LOC:** 180

---

### 2.3 ReaderNavGraph.kt (≤350 LOC)
**Purpose:** All reading & playback experiences (e-readers, PDF viewers, audiobooks, video).

**Routes assigned:**
- MEDIA_DETAIL (L680–737)
- READER with chapter param (L743–815)
- AUDIO_PLAYER (L816–844)
- Legacy reader routes (L1485–1634)
- Legacy player routes (L1234–1345)

**Extension function:** `NavGraphBuilder.addReaderRoutes(navController)`

**Imports needed:**
```kotlin
import androidx.compose.runtime.*
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.ui.media.player.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.ui.components.UiErrorBoundary
```

**Est. final LOC:** 220

---

### 2.4 DiscoveryNavGraph.kt (≤300 LOC)
**Purpose:** Discovery features, browsing catalogs, special screens.

**Routes assigned:**
- OPDS_BROWSER (L849–874)
- WEB_FICTION_BROWSE (L886–957)
- AMBIENT_SOUNDS (L958–971)
- NEWS (L972–980)
- VISUALIZER (L981–990)

**Extension function:** `NavGraphBuilder.addDiscoveryRoutes(navController)`

**Imports needed:**
```kotlin
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import androidx.compose.runtime.*
import androidx.compose.foundation.*
import androidx.compose.material3.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
```

**Est. final LOC:** 180

---

### 2.5 OrganizationNavGraph.kt (≤400 LOC)
**Purpose:** Collections, tags, smart collections, search variants, sync, import/export.

**Routes assigned:**
- COLLECTIONS (L991–1004)
- COLLECTION_DETAIL (L1005–1022)
- TAG_MANAGER (L1024–1030)
- TAG_EXPLORER (L1031–1037)
- SMART_COLLECTIONS (L1038–1044)
- SMART_COLLECTION_DETAIL (L1045–1056)
- ENHANCED_SEARCH (L1058–1082)
- UNIVERSAL_SEARCH (L1084–1089)
- SYNC (L1094–1104)
- IMPORT_EXPORT (L1106–1116)
- FOLDER_IMPORT (L1119–1127)
- FILE_BROWSER (L1129–1180)
- ONBOARDING (L1186–1194)
- LANDSEEK (L1200–1211)
- ENHANCED_FILE_BROWSER (L1213–1225)

**Extension function:** `NavGraphBuilder.addOrganizationRoutes(navController, onShowSnackbar)`

**Imports needed:**
```kotlin
import android.net.Uri
import androidx.compose.runtime.*
import androidx.compose.ui.platform.LocalContext
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import kotlinx.coroutines.launch
import com.universalmedialibrary.ui.filepicker.*
import com.universalmedialibrary.ui.folderimport.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
```

**Est. final LOC:** 280

---

## 3. Thin Parent File

**New MediaAppNavigation.kt** (~100 LOC, retains legacy routes + debug):

```kotlin
package com.universalmedialibrary.ui.media.navigation

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.debug.ui.DebugMenuScreen
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*

/**
 * Main App Navigation Host - composes sub-graphs
 */
@Composable
fun MediaAppNavHost(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    NavHost(
        navController = navController,
        startDestination = MediaRoutes.HOME,
        modifier = modifier,
        enterTransition = { fadeIn() + slideInHorizontally { it / 4 } },
        exitTransition = { fadeOut() + slideOutHorizontally { -it / 4 } },
        popEnterTransition = { fadeIn() + slideInHorizontally { -it / 4 } },
        popExitTransition = { fadeOut() + slideOutHorizontally { it / 4 } }
    ) {
        // Add each sub-graph
        addRootRoutes(navController, onShowSnackbar)
        addLibraryRoutes(navController)
        addReaderRoutes(navController)
        addDiscoveryRoutes(navController)
        addOrganizationRoutes(navController, onShowSnackbar)
        addSettingsRoutes(navController)
        
        // Legacy compatibility block (preserved)
        // ... legacy routes remain here for deep-link support ...
        
        // Debug menu (conditional)
        if (BuildConfig.SHOW_DEBUG_MENU) {
            composable(MediaRoutes.DEBUG_MENU) {
                DebugMenuScreen(
                    onBack = { navController.popBackStack() }
                )
            }
        }
    }
}

// Extension to get route name from MediaType
private val MediaType.routeName: String
    get() = when (this) {
        MediaType.BOOK -> "book"
        MediaType.AUDIOBOOK -> "audiobook"
        MediaType.MUSIC -> "music"
        MediaType.PODCAST -> "podcast"
        MediaType.COMIC -> "comic"
        MediaType.MOVIE -> "movie"
        MediaType.TV_SHOW -> "tv_show"
        MediaType.FANFICTION -> "webfiction"
        MediaType.DOCUMENT -> "document"
        MediaType.RADIO -> "radio"
        MediaType.NEWS -> "news"
        MediaType.UNKNOWN -> "unknown"
    }
```

---

## 4. Risk Register

### Risk 1: Dialog vs. Screen Handling
**Description:** Routes like `ENHANCED_SEARCH` and `COLLECTION_DETAIL` may be triggered from dialogs in parent screens; navigating away may break state synchronization.

**Mitigation:**
- Review all callback handlers for `onEditCollection`, `onShowSearchDialog` in source composables
- Test that dialogs properly close when their target route is navigated
- Verify `navController.popBackStack()` correctly returns focus to parent

**Verification step:** 
- [ ] Run LibraryNavigationFlowTest.kt; confirm no "unexpected destination" failures
- [ ] Manually test: open collection dialog, navigate to detail, pop back → verify parent state is restored

### Risk 2: Deep Link Resolution
**Description:** Multiple legacy routes (1227–2062 LOC) may not correctly resolve parameters after split. Deep links to `player/audio/{playerType}` and old paths like `reader/{mediaId}` could 404.

**Mitigation:**
- Keep ALL legacy routes in the parent `MediaAppNavigation.kt` file
- Ensure legacy routes call into new sub-graphs when appropriate (e.g., legacy `reader/{mediaId}` → calls `READER` route builder)
- Use `resolveRouteOrFallback()` for unknown paths

**Verification step:**
- [ ] Test deep links: `cleverferret://reader/book/123`, `cleverferret://player/audio/audiobook`
- [ ] Confirm all 40+ legacy routes still resolve without crashes

### Risk 3: Saved State & ViewModel Scoping
**Description:** Extracting routes into separate NavGraphBuilder extensions may break ViewModel injection if `hiltViewModel()` scoping is not explicitly tied to the correct NavBackStackEntry.

**Mitigation:**
- Each sub-graph uses `hiltViewModel<T>()` without explicit `viewModelStoreOwner` (relies on Compose navigation scoping)
- Test that ViewModels are correctly scoped to their destination and shared across multiple composables within the same back stack entry
- For shared state (e.g., `MainViewModel`), use explicit scoping at NavHost level

**Verification step:**
- [ ] Add ViewModel lifecycle logging to key screens (HOME, LIBRARY, READER)
- [ ] Confirm ViewModel instances are created once per destination and reused
- [ ] Verify on-death callbacks are called when screen is popped

### Risk 4: Settings Graph Integration
**Description:** `addSettingsRoutes()` already exists in `MediaSettingsNavigationGraph.kt` and is a large, complex extension. Ensure it doesn't conflict with new sub-graphs or cause duplication.

**Mitigation:**
- Leave Settings routes in `MediaSettingsNavigationGraph.kt` unchanged
- Call `addSettingsRoutes(navController)` from the parent file, not individual sub-graphs
- No new Settings routes should be added to other sub-graphs

**Verification step:**
- [ ] Grep for any Settings routes in other files; confirm no duplication
- [ ] Test navigating to all SETTINGS_* routes from parent file
- [ ] Confirm Settings screens can navigate to each other via navController

---

## 5. Test Plan

### Existing Tests to Update
1. **LibraryNavigationFlowTest.kt**
   - Add assertions for each LIBRARY_* route destination
   - Verify `onMediaTypeSelected` callback triggers correct navigation to `addLibraryRoutes` destination
   - Test SEE_ALL dynamic redirect logic

2. **MediaNavDestinationsContractTest.kt**
   - Verify all route strings still resolve (no 404s)
   - Add specific tests for parameterized routes (LIBRARY, MEDIA_DETAIL, READER, etc.)

3. **MediaRouteFallbackTest.kt**
   - Ensure unknown routes still resolve to NOT_FOUND
   - Test that legacy routes are correctly mapped to new destinations

### New Assertions to Add
- [ ] **Navigation state preservation:** Assert that navigating between LIBRARY routes preserves scroll position, filter state
- [ ] **Sub-graph boundary crossing:** Assert that crossing from LIBRARY → READER works without ViewModel loss
- [ ] **Transition animations:** Assert that transition times (fadeIn + slideIn) are applied consistently
- [ ] **Back stack management:** Assert that back stack is correctly ordered for nested routes
  - Example: HOME → LIBRARY_ROOT → LIBRARY(book) → MEDIA_DETAIL → READER
  - Pop from READER should return to MEDIA_DETAIL, not LIBRARY
- [ ] **ViewModel scoping:** Assert that ViewModel instances persist across route changes within the same sub-graph, but are destroyed when exiting the sub-graph
- [ ] **Deep link handling:** Assert that navigating via intent + URI works for all major routes

---

## 6. Migration Order

### Strategy: Extract in Dependency Order (All at Once)

**Rationale:**
1. Settings graph is already extracted; dependency flow is clear
2. RootNavGraph has no dependencies on other sub-graphs (only provides entry points)
3. LibraryNavGraph and OrganizationNavGraph depend on each other minimally (only cross-navigation callbacks)
4. ReaderNavGraph depends on LibraryNavGraph (MEDIA_DETAIL navigates to READER)
5. DiscoveryNavGraph is independent

**Execution order (parallel where possible):**
1. Create all 5 new files and extensions in parallel
2. Keep all route definitions (object MediaRoutes) in existing location
3. Update parent MediaAppNavigation.kt to call all extensions
4. Run full test suite
5. Confirm legacy routes still work
6. Merge PR

**Advantages:**
- Single, atomic refactor (avoid multiple incomplete states in main branch)
- All developers see complete picture in one PR
- Tests run once against final state
- Easier to revert if issues arise

**Timeline estimate:** 2–3 hours for extraction; 1–2 hours for testing

---

## 7. Implementation Checklist

- [ ] Create `/home/user/CleverFerret/docs/architecture/decompositions/` directory
- [ ] Create `RootNavGraph.kt` with `addRootRoutes()` extension
- [ ] Create `LibraryNavGraph.kt` with `addLibraryRoutes()` extension
- [ ] Create `ReaderNavGraph.kt` with `addReaderRoutes()` extension
- [ ] Create `DiscoveryNavGraph.kt` with `addDiscoveryRoutes()` extension
- [ ] Create `OrganizationNavGraph.kt` with `addOrganizationRoutes()` extension
- [ ] Update `MediaAppNavigation.kt` to call all extensions + preserve legacy routes
- [ ] Run all unit + instrumentation tests
- [ ] Verify all deep links work
- [ ] Test Settings graph still accessible
- [ ] Code review for import cleanliness, ViewModel scoping
- [ ] Update CLAUDE.md navigation section
- [ ] Merge to main

---

**Next step:** Review and approve design. Upon sign-off, implementer can mechanically apply this plan.
