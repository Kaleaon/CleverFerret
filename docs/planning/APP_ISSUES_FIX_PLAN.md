# CleverFerret — App Issues Review & Fix Plan

**Date:** 2026-04-19
**Branch:** `claude/review-app-issues-DcXit`
**Scope:** Triage of all currently-open GitHub issues plus cross-referenced code
review. This plan is a proposal — no source code has been changed yet.

---

## 1. Inventory of Open Issues

### 1.1 Auto-reported bug reports (app v1.6.5 debug, build 9, Android 13)

| # | Summary | Severity | Area |
|---|---------|----------|------|
| 487 | Error when opening Internet Archive (OPDS) for books | High | OPDS / Networking |
| 486 | Error loading catalogue (OPDS root) | High | OPDS |
| 485 | "Multiple libraries" UX complaint — wants ONE library with categories | High | Home / IA |
| 483 | Selecting "National Screening Room" crashes the app | High | Free Media |
| 482 | Tapping "Download" crashes with "download not found" | High | Podcast / Downloads |
| 481 | Tapping music says "no viewer" and refuses to play | High | Media Open |
| 480 | Book covers not loading; cannot browse beyond 20 items | High | Library / Coil / Paging |
| 479 | Clicking one story-download marks all items as clicked | High | List state |
| 478 | Searching for books shows "standalone coroutine cancelled" | Medium | Search |
| 477 | Subscribing to podcast shows warning popup instead | Medium | Podcast |
| 476 | TopAppBar — remove "Clever Ferret Media Library" text, center search, align menu, show covers | Medium | UI polish |

### 1.2 Process / meta issues
| # | Summary |
|---|---------|
| 138, 137 | Split Unified Library Model PR (#129) into smaller reviewable units |
| 136 | Widget Android 14 background-update compliance validation |
| 135 | Plex auth + security test plan (reduce scope of PR #123) |
| 134 | Copilot review note: widget should live as `widget/MediaLibraryWidget.kt`, not directory |

---

## 2. Root-Cause Notes from Code Review

| Issue | File(s) / Line(s) | Root cause hypothesis |
|-------|-------------------|------------------------|
| #481 "no viewer" on music | `ui/open/MediaOpenScreen.kt:48` | `isAudioByType` set contains `"MUSIC_TRACK"` but NOT plain `"MUSIC"`. Items stored with canonical `MediaType.MUSIC` fall through to the "No viewer" branch. |
| #480 "20-item ceiling" | `ui/media/viewmodels/MediaHomeViewModel.kt:261,280,299,321,346` | Each `loadRecent*` helper hard-codes `.take(20)`. The home screen is the only entry point, so users have no "see all / browse" path beyond it. Covers not loading is likely a separate Coil/URI issue (see #3.4). |
| #479 "click one, all appear clicked" | Likely `LazyColumn`/`LazyVerticalGrid` item lacking a stable `key = ` in a downloads/story list (need to locate). | Compose item state keyed by position instead of ID, so download-button state is shared across recomposed rows. |
| #478 "standalone coroutine cancelled" toast | `ui/media/viewmodels/SearchViewModel.kt:52–65` | Each `updateQuery` call cancels the previous debounce job. The `CancellationException` is correctly re-thrown at line 155, but something downstream (likely a shared `CoroutineExceptionHandler` or the `DebugBugReport` hook) is surfacing cancellation as a user-visible error. |
| #477 podcast subscribe popup | `ui/podcast/PodcastViewModel.kt:63–74` | When `feedUrl` is blank, a validation error is written to `uiState.error`. The UI surfaces this as a warning popup on any tap where the result's `feedUrl` was not populated. Root cause is likely upstream in the podcast search result mapper returning blank `feedUrl`. |
| #483 National Screening Room crash | `ui/media/FreeMediaViewModel.kt:70–76` + `services/media/free/FreeMediaService.kt:59–78` | The ViewModel itself handles exceptions, so the crash is almost certainly in the UI layer (rendering an item with a null/missing field, e.g. thumbnail or duration) rather than the query. Need stack trace — not currently attached. |
| #482 download crash | `services/ambient/AmbientSoundService.kt:226–247` + `ui/podcast/PodcastViewModel.kt:386` | Download flow itself is wrapped in try/catch. The user message "download not found" comes from `PodcastViewModel:386` (`episode.downloaded && !localFileExists`). This is a **data consistency bug** — the DB flag is out of sync with the filesystem (file was deleted or never actually downloaded). |
| #487 / #486 OPDS catalog errors | `services/opds/OPDSClient.kt:33–60` | Client throws typed `IllegalStateException` on HTTP/IO failures. The Internet Archive feed has malformed XML entities; the `sanitizeXmlEntities` workaround at line 276 covers `&` but may not cover all cases (e.g., orphaned numeric refs, CDATA boundaries). Error is user-reported with no attached log, so confirmation required. |
| #476 TopBar layout | `ui/media/screens/MediaHomeScreen.kt:149–185` + `StickyContentLibraryHeader` | TopAppBar currently prints "Content Library" (split styling). User wants branding removed, search centered, hamburger aligned. Pure Compose layout refactor. |
| #485 "multiple libraries" UX | `MediaHomeScreen` + library/home architecture | Code already presents a single unified library with per-type "Recent" sections, but the presence of both a home hub, a separate "My Library" surface, plus per-media-type screens is confusing users. UX consolidation is the fix, not code deletion. |

---

## 3. Prioritized Fix Plan

### Priority P0 — Crashes & data-loss (ship first)

1. **#483 National Screening Room crash**
   - Add crash breadcrumbs to `FreeMediaViewModel.loadMedia` catch block and
     surface the full stack trace via `AppLogger` before rethrowing.
   - Audit the screen that renders `FreeMediaItem` (likely
     `ui/media/FreeMediaScreen.kt`) for null-unsafe field access
     (`duration`, `thumbnailUrl`, `year`).
   - Wrap per-item composables in `key()` to prevent a bad record from taking
     the whole list down.

2. **#482 download "not found" crash**
   - Fix the inconsistency source: when a podcast/book download completes,
     the DB `downloaded=true` must be written in the same transaction as the
     `localFilePath` update. Audit `services/podcast/DownloadManager` and
     `services/opds/OPDSDownloadService`.
   - On app start, run a reconciliation pass that flips `downloaded=false`
     for rows whose `localFilePath` no longer resolves on disk.
   - In the UI, stop treating "not found" as a hard error — offer a
     **"Re-download"** affordance instead.

3. **#481 "no viewer" for music**
   - `ui/open/MediaOpenScreen.kt:48` — add `"MUSIC"` (and `"MUSIC_ALBUM"`) to
     the `isAudioByType` set, and switch the check from a hand-rolled string
     set to `MediaType.valueOf(...)` with a proper audio predicate on the
     canonical enum.

### Priority P1 — UX-breaking bugs

4. **#480 "can't browse past 20 books"**
   - Introduce a proper "See all" destination per section, backed by a Paging 3
     `PagingSource` from the existing Room DAOs.
   - Remove the `.take(20)` literals in `MediaHomeViewModel` — keep them only
     as UI preview caps, not DB caps.
   - Fix covers: verify `imageUrl` is an absolute URI that Coil can resolve
     (`file://`, `content://`, or `https://`). Add an `error` and
     `placeholder` to every `AsyncImage`.

5. **#479 "click one, mark all" in downloads**
   - Grep for all `LazyColumn`/`LazyVerticalGrid`/`HorizontalPager` usages in
     `ui/**/download*.kt` and `ui/reddit/*`, `ui/webfiction/*`.
   - Every `items(...)` block must pass `key = { it.id }` (stable, unique).
   - For Compose state per row, use `rememberSaveable(key = it.id)` not
     `remember { mutableStateOf(...) }` bound to list position.

6. **#478 "standalone coroutine cancelled" toast**
   - Find the global `CoroutineExceptionHandler` (likely in
     `CleverFerretApplication.kt` or a Hilt module) and filter out
     `CancellationException` before forwarding to the bug reporter / toast.
   - Confirm `SearchViewModel.performSearch` is not the source; it already
     re-throws correctly (line 155).

7. **#477 podcast subscribe popup**
   - Trace `PodcastSearchResult.feedUrl` population from the iTunes/Podcast
     Index search path. When upstream has no feed URL, skip the result
     instead of surfacing as a subscribable item.
   - When validation *does* fail, downgrade the message from a modal warning
     to an inline snackbar.

### Priority P2 — OPDS reliability

8. **#487 / #486 OPDS errors**
   - Harden `OPDSClient.sanitizeXmlEntities` with additional fixtures
     (captured real Internet Archive feeds).
   - Surface a **"Report feed"** affordance alongside the user-facing error
     so we can collect the failing URL.
   - Add a retry-with-backoff wrapper around `fetchFeed` for transient 5xx
     responses.

### Priority P3 — UI polish (#476)

9. **Top app bar**
   - Remove the "Clever Ferret Media Library" brand text from the sticky
     header (`StickyContentLibraryHeader`).
   - Convert the current row layout into a `CenterAlignedTopAppBar` with the
     search bar as the centered title composable.
   - Align the navigation icon (hamburger) at the leading slot with
     `NavigationIcon` + consistent 8dp start padding.

### Priority P4 — Architecture / UX consolidation (#485)

10. **Unify "libraries"**
    - Document the current surfaces: Home, My Library, per-type (Books/Music/
      etc.) — clarify which are destinations vs. filters.
    - Replace the per-type top-level destinations with a single **Library**
      screen that hosts category chips (Books · Audiobooks · Music · ...).
    - Phase-one change only touches navigation graph + bottom bar; no data
      layer changes.

### Priority P5 — Process / meta

11. **PR hygiene** (issues 134–138)
    - Land the widget file move called out in #134.
    - Split PR #129 along DB migration / domain / artwork pipeline seams
      (issues 137 & 138).
    - Scope PR #123 down to Plex auth + tests (issue 135).
    - Add CI check for Android 14 widget background constraints (issue 136).

---

## 4. Missing Information / Follow-ups

To close several of these issues with confidence we need to retrieve from the
user / DebugBugReport system:

- Full stack trace for **#483** (National Screening Room crash).
- Exception class / stack for **#482** (download crash) beyond the single
  line at `AmbientSoundService.kt:227`.
- Screenshots attached to **#476**, **#480**, **#485** — they are captured at
  report time but not uploaded.
- Network capture of the failing Internet Archive OPDS feed for **#487 / #486**.

Recommend wiring the auto bug-report flow to attach `logcat` + a screenshot
to the created GitHub issue via the GitHub API instead of noting "cannot be
auto-uploaded".

---

## 5. Suggested Sequence of PRs

1. **PR A — P0 fixes:** MediaType audio mapping (#481), download
   reconciliation + "re-download" UX (#482), crash guard for Free Media list
   (#483).
2. **PR B — P1 bugs:** global cancellation filter (#478), list `key=`
   stability (#479), home-screen paging & cover placeholders (#480),
   podcast subscribe UX (#477).
3. **PR C — P2 OPDS hardening:** entity sanitizer fixtures + retry (#486,
   #487).
4. **PR D — P3 top bar polish** (#476).
5. **PR E — P4 library consolidation** (#485) — larger, gated behind a
   feature flag.

Each PR should be < 500 LOC changed where possible, per the repo's
contribution guardrails (`README.md` §Contribution Guardrails).
