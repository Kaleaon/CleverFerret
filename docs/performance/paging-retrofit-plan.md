# Paging Retrofit Plan

## Objective
Retrofit high-impact list screens to modern paging incrementally, while preserving UX behavior and improving performance/memory under realistic scroll loads.

---

## 1) Ranked DAO / Query Retrofit Backlog

Use this priority list to decide migration batch order. Ranking combines **usage frequency**, **UI visibility**, and **render cost**.

> **Scoring model (per query):** `Priority Score = (Usage Frequency x 0.45) + (UI Impact x 0.35) + (Render/Join Cost x 0.20)`
>
> - Usage Frequency: 1-5 (session-level access frequency)
> - UI Impact: 1-5 (primary vs secondary screen)
> - Render/Join Cost: 1-5 (expensive sort/filter/join pressure)

### Tier 0 - Immediate (score >= 4.2)

| Rank | DAO / Query Family | Typical Surface | Why First |
|---|---|---|---|
| 1 | Library feed paged query (`ORDER BY lastRead/updated DESC`) | Home / Library landing | Highest daily exposure + long lists + frequent revisit.
| 2 | Continue Reading / Recent items query | Home continuation rails/lists | Fast-scroll entry path with high return traffic.
| 3 | Catalog / Search results query with filter + sort | Search results | Heavy cardinality and user-perceived latency sensitivity.

### Tier 1 - High (score 3.6-4.19)

| Rank | DAO / Query Family | Typical Surface | Why Next |
|---|---|---|---|
| 4 | Downloads queue/history query | Downloads screen | High churn updates; avoids full-list invalidation.
| 5 | Favorites / Bookmarks list query | Favorites screen | User-curated lists with medium-large list size.
| 6 | Author/Series detail items query | Detail drill-down list | Common navigation target with repeated back/forth.

### Tier 2 - Medium (score 3.0-3.59)

| Rank | DAO / Query Family | Typical Surface | Why Later |
|---|---|---|---|
| 7 | History timeline query | Reading history | Important but less primary than home/library.
| 8 | Tag/Category filtered query | Category views | Moderate traffic; narrower cohorts.
| 9 | Archive/Completed query | Archive screens | Lower frequency and lower responsiveness risk.

### Tier 3 - Low (score < 3.0)

| Rank | DAO / Query Family | Typical Surface | Why Last |
|---|---|---|---|
| 10 | Administrative/debug listing queries | Internal tools screens | Low end-user impact.
| 11 | Rare settings-linked content lists | Settings subflows | Minimal session share.

### Re-ranking rule

Recompute score after each release train using production analytics + ANR/jank dashboards. Any query causing top-10 slow-frame contribution moves to at least Tier 1 for the next batch.

---

## 2) Per-Screen Rollout Order + Rollback Strategy

### Rollout order (screen-first)

1. **Library (primary list)**
2. **Search Results**
3. **Continue Reading / Recent**
4. **Downloads**
5. **Favorites / Bookmarks**
6. **Author/Series detail lists**
7. **History**
8. **Category/Tag views**
9. **Archive/Completed**

### Batch strategy

- **Batch A:** Library + Search
- **Batch B:** Continue Reading + Downloads
- **Batch C:** Favorites + Author/Series
- **Batch D:** History + Category/Tag + Archive

### Rollout gates per batch

- Feature flag defaults to **off** in first integration build.
- Enable for internal dogfood cohort only.
- Expand to 5% -> 25% -> 100% when all checkpoint metrics pass for 48h at each stage.

### Rollback strategy (must be pre-wired before enabling)

1. **Runtime rollback:** remote-config/feature-flag switch to legacy list pipeline.
2. **Build-time rollback:** retain legacy UI adapter/viewmodel path behind compile-time or DI binding toggle until batch N+1 stabilizes.
3. **Hotfix rollback trigger:** any of the following auto-triggers rollback to previous stable path:
   - crash-free sessions drop >0.3 percentage points,
   - p95 frame time regression >15%,
   - median memory increase >12% on target devices,
   - paging boundary load errors exceed agreed SLO.
4. **Data-consistency rollback:** if duplicate/missing item incidence appears, disable retrofit flag immediately and preserve logs for diff replay.

---

## 3) Compose Scroll-State Preservation Checklist

Apply to every paged Compose screen before marking conversion complete.

### State model

- [ ] Use a stable `LazyListState` remembered at screen scope.
- [ ] Persist `firstVisibleItemIndex` and `firstVisibleItemScrollOffset` via `rememberSaveable` (or equivalent retained screen state).
- [ ] Restore scroll position only after initial page is loaded and list keys are available.

### Item identity + keys

- [ ] Supply stable unique keys for all rows in `LazyColumn`/`LazyVerticalGrid`.
- [ ] Avoid index-based keys.
- [ ] Ensure separators/headers also use deterministic keys.

### Navigation lifecycle

- [ ] Returning from detail screen restores prior scroll position exactly.
- [ ] Process death recreation restores position to nearest stable anchor.
- [ ] Back stack replacement/recomposition does not reset list to top unless explicitly requested.

### Paging interaction

- [ ] `LoadState` UI does not force full recomposition of visible rows.
- [ ] Refresh action preserves anchor when dataset identity is unchanged.
- [ ] Append/prepend loading indicators do not shift visible content unexpectedly.

### Mutation scenarios

- [ ] Item insert/remove above viewport keeps logical anchor behavior acceptable (document expected shift policy).
- [ ] Sort/filter change intentionally resets (or preserves) position according to product decision and is tested.
- [ ] Empty->non-empty and non-empty->empty transitions are deterministic and do not leak stale offset.

---

## 4) Benchmark Checkpoints per Conversion Batch

Run benchmarks after each batch (A-D) and compare to prior stable baseline.

## Required checkpoint matrix

For every converted screen in the batch:

1. **Cold open to first contentful frame**
2. **Steady-state scroll (slow + fling)**
3. **Dataset refresh while scrolled mid-list**
4. **Navigation out/back scroll restore**
5. **Memory retention under 3-minute scroll soak**

### Metrics to capture

- Startup: time to first contentful list frame (p50/p95)
- UI smoothness: jank %, missed frame count, p95/p99 frame duration
- Paging behavior: load latency (initial/append), error rate, retry success
- Memory: Java/Kotlin heap, native heap, retained objects after GC
- Stability: crash/ANR rate for converted surfaces

### Pass/fail policy per checkpoint

- **Pass** when all metrics are within agreed budget or improved.
- **Soft fail** (hold rollout expansion) when one non-critical metric regresses beyond tolerance.
- **Hard fail** (immediate rollback) when crash/ANR, severe jank, or memory thresholds are violated.

---

## 5) Per-Screen “Done” Criteria

A screen is “done” only when **all** functional + performance + memory criteria are satisfied.

### Functional done

- [ ] Screen uses paging source path in production code (not test-only).
- [ ] Pull-to-refresh / retry / empty / error states behave per product spec.
- [ ] Scroll position restoration passes navigation and process-death scenarios.
- [ ] Filters/sorts/search terms invalidate and refresh correctly.
- [ ] Analytics events remain parity-compatible with pre-retrofit behavior.

### Performance done

- [ ] No p95 frame-time regression beyond agreed threshold (recommended <= 10% vs baseline).
- [ ] Jank rate stable or improved during 3 representative scroll traces.
- [ ] Initial load and append latency meet SLO targets for that screen class.

### Memory done

- [ ] No sustained heap growth trend during 3-minute scroll soak.
- [ ] Retained object count after leaving screen returns to baseline envelope.
- [ ] No new leak signatures in heap analysis for list/viewmodel/paging pipeline.

### Release done

- [ ] Feature flag at 100% for the screen with no rollback events during observation window.
- [ ] Runbook updated with known limits and mitigation steps.
- [ ] Baseline metrics + post-retrofit metrics archived for future regression checks.

---

## 6) Tracking Template (copy per screen)

```text
Screen:
Owner:
DAO/query:
Batch:
Flag key:

Functional: [ ] pass  [ ] fail
Performance: [ ] pass [ ] fail
Memory: [ ] pass [ ] fail

Checkpoint notes:
- Cold open:
- Scroll:
- Refresh mid-list:
- Nav restore:
- Soak memory:

Decision: [ ] promote rollout [ ] hold [ ] rollback
```
