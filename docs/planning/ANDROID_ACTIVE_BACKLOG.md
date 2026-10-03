# Scope: ACTIVE_ANDROID

# Android Active Backlog (V2 App Module Scope)

Last updated: 2026-04-19 (UTC)

This backlog includes only active work for the Android app module (`CleverFerret/`) and current V2 scope. PWA and legacy frontend items are intentionally excluded.

---

## P0 — Crashes and core functionality

1. **Fix media open routing for canonical music types**
   - Ensure `MUSIC` and `MUSIC_ALBUM` resolve to the audio viewer/player path.
   - Remove stringly-typed media checks where possible in favor of canonical enum predicates.

2. **Resolve download state desynchronization**
   - Keep DB download flags and `localFilePath` updates transactional.
   - Add startup reconciliation for missing files previously marked as downloaded.
   - Replace hard-fail UX with clear “Re-download” action where appropriate.

3. **Stabilize free-media browsing crash paths**
   - Harden null-safety for free-media card rendering.
   - Improve crash breadcrumbs/logging around data load and render stages.

---

## P1 — High-impact UX defects

4. **Remove artificial browse ceilings from home surfaces**
   - Replace hard `.take(20)` behavior with proper “See all” destinations and paging-backed lists.

5. **Fix state bleed in Compose list/grid items**
   - Enforce stable keys for all dynamic lists in download/story/search flows.
   - Ensure row-local state is keyed by item identity, not position.

6. **Suppress expected coroutine cancellation noise in UX**
   - Prevent `CancellationException` from surfacing as user-facing warning/error toast.

7. **Harden podcast subscription input mapping**
   - Filter invalid search results missing usable feed URLs.
   - Keep validation feedback lightweight and non-blocking where possible.

---

## P2 — Platform reliability

8. **OPDS ingestion hardening**
   - Improve malformed XML/entity handling for real-world catalog feeds.
   - Add safer retry behavior for transient upstream failures.

9. **Build/toolchain reproducibility guardrails**
   - Keep supported JDK/Gradle/Kotlin matrix explicit and enforced.
   - Preserve deterministic preflight failure when runtime is unsupported.

---

## P3 — Navigation and UX coherence (V2)

10. **Consolidate user-facing library entry points**
    - Continue converging toward one primary Library destination with category filtering.
    - Reduce confusion from parallel top-level pathways.

11. **Top app bar cleanup**
    - Complete alignment/polish tasks for modern Material 3 behavior and consistency.

---

## Explicitly out of scope for this backlog

- PWA feature parity work
- React/web frontend planning
- Archived investigations and one-off historical migration notes

See archived planning records under `docs/archive/` for those tracks.
