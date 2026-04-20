# TODO Register (Master, Deduplicated)

This file is the single source of truth for TODO items discovered in review documentation.

## Open Items

### TDR-001 — Notifications action from app navigation
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/navigation/MediaAppNavigation.kt`
- **Priority:** P1
- **Owner:** `@unassigned`
- **Definition of done:** Tapping notification entry opens an implemented notifications surface, or the navigation affordance is removed until implementation exists; include UI test coverage for tap behavior.

### TDR-002 — Search category-filtered results navigation
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/screens/SearchScreen.kt`
- **Priority:** P1
- **Owner:** `@unassigned`
- **Definition of done:** Category filter interactions navigate to a real results destination with correct query/category state and back-stack behavior validated in UI tests.

### TDR-003 — Document import details action
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/document/DocumentImportScreen.kt`
- **Priority:** P2
- **Owner:** `@unassigned`
- **Definition of done:** "View import" opens an implemented import-details experience (screen/dialog) and handles loading/error states; add test coverage for action wiring.

### TDR-004 — Rooms screen chat navigation
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/rooms/RoomsScreen.kt`
- **Priority:** P2
- **Owner:** `@unassigned`
- **Definition of done:** Room item tap reliably routes to room chat (or detail) destination with argument passing and route tests; remove dead click handlers.

### TDR-005 — Enhanced file browser copy flow
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/filebrowser/EnhancedFileBrowser.kt`
- **Priority:** P1
- **Owner:** `@unassigned`
- **Definition of done:** Copy action supports destination selection, conflict handling, and success/error feedback; non-functional copy UI is removed if implementation is deferred.

### TDR-006 — Enhanced file browser move flow
- **Source doc and line context:**
  - [`docs/reviews/ui_design_review.md` — “7. TODO Comments Indicating Incomplete Features”](../reviews/ui_design_review.md#7-todo-comments-indicating-incomplete-features)
  - [`docs/reviews/recommendations.md` — “3. Complete or Remove TODO Features”](../reviews/recommendations.md#3-complete-or-remove-todo-features)
- **Affected module/path:** `CleverFerret/src/main/java/com/universalmedialibrary/ui/filebrowser/EnhancedFileBrowser.kt`
- **Priority:** P1
- **Owner:** `@unassigned`
- **Definition of done:** Move action supports destination selection, conflict handling, rollback on failure, and success/error feedback; non-functional move UI is removed if deferred.

## Closed Items

| Register ID | Closed item | Closure date | PR reference |
|---|---|---|---|
| TDR-C001 | Consolidated duplicated review-doc TODO prose into this register and linked review docs to canonical entries. | 2026-04-19 | _TBD (this PR)_ |
