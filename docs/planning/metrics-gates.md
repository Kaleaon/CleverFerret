# Metrics & Quality Gates

## Purpose

This document defines the canonical metrics, measurement protocols, and release gates for runtime stability, startup performance, test coverage growth, and large-library paging/scaling behavior.

## 1) Crash-Free Sessions (Source of Truth)

### Target

- **Crash-free sessions target:** **99.5% minimum** (rolling 30-day window).

### Source of truth

- **Primary source:** Production crash analytics dashboard (release channel only).
- **Metric definition:**
  - `Crash-free sessions % = (sessions without fatal crash / total sessions) × 100`
  - Measure on **real user sessions**; do not substitute synthetic tests for this KPI.
- **Scope:** Latest production version and aggregate of all active supported versions.

### Gate mapping

- **CI job:** `ci/smoke-release-build` (build/signing + sanity checks only; cannot validate real-world crash-free directly).
- **Release gate (manual):** `release-readiness/crash-free-check`
  - Block release if rolling 30-day crash-free is **< 99.5%** for the current production train unless an explicit risk waiver is approved.

### Review cadence

- **Weekly** trend review in engineering metrics sync.
- **Per release candidate** review during go/no-go.
- **Post-incident** ad hoc review within 1 business day.

---

## 2) Cold Start & First Frame Protocol

### Targets

- **Cold start (P95):** defined per platform performance budget.
- **First frame (P95):** defined per platform performance budget.

> Note: budget numbers should be maintained in the platform performance budget document; this protocol standardizes *how* metrics are measured.

### Measurement protocol

- **Devices (fixed matrix):**
  - Low-tier reference device.
  - Mid-tier reference device.
  - High-tier reference device.
- **Profile:**
  - Fresh install state (no warm cache), battery > 50%, thermal normal.
  - Airplane mode unless network is required by test path.
- **Build variant:**
  - **Release build** with production-equivalent optimizations.
  - Debug/profile builds are non-gating diagnostics only.
- **Run procedure:**
  1. Reboot device (or force-stop + clear app state if reboot unavailable).
  2. Launch app from cold state.
  3. Capture:
     - Time-to-process-start
     - Time-to-first-frame rendered
  4. Repeat **10 runs/device**; report P50/P95.
  5. Archive raw traces and summary in CI artifacts.

### Gate mapping

- **CI job:** `perf/startup-benchmark`
  - Runs automated startup benchmark on device farm/emulator baseline.
- **Release gate (manual):** `release-readiness/startup-signoff`
  - Required review of latest P95 results on the fixed device matrix before ship.

### Review cadence

- **Every merge to main** (automated trend alerting).
- **Weekly** regression review.
- **Per release candidate** explicit signoff.

---

## 3) Coverage Ratchet Milestones

### Policy

Coverage is ratcheted upward by roadmap phase and never allowed to regress below current accepted floor for that phase.

### Milestones

- **Current floor:** maintain current baseline floor (as configured in coverage gate).
- **Roadmap Phase 1:** **15%** minimum.
- **Roadmap Phase 2:** **30%** minimum.
- **Roadmap Phase 3:** **40%** minimum.

### Gate mapping

- **CI job:** `quality/test-coverage-gate`
  - Fails if total coverage drops below active phase floor.
  - Stores per-module coverage report for review.
- **Release gate (manual):** `release-readiness/coverage-waiver-review`
  - Any temporary exception requires documented waiver with owner and expiry date.

### Review cadence

- **Per pull request** (automatic gate).
- **Biweekly** roadmap-phase audit to confirm floor progression.
- **Per phase transition** formal ratchet update.

---

## 4) Paging & Scaling Benchmark Protocol

### Scenario

Validate browsing and paging performance at scale using a synthetic large-library dataset.

### Workload specification

- **Dataset:** **50,000-item synthetic library** (stable seed, reproducible).
- **User flows:**
  - Initial library load.
  - Fast scroll through long list.
  - Filter/search + sort toggle.
  - Open/close item detail repeatedly.

### Thresholds

- **Frame rate:**
  - Sustained scrolling should remain above agreed minimum FPS threshold.
  - 99th percentile frame time tracked as secondary signal.
- **Heap/memory:**
  - Peak heap must remain under agreed platform threshold.
  - No unbounded heap growth after repeated paging cycles.

### Measurement protocol

- Run on low-tier and mid-tier reference devices using release build.
- Execute scripted interaction sequence for reproducibility.
- Capture FPS timeline, frame-time percentiles, heap snapshots, GC activity, and OOM/crash events.
- Perform **3 benchmark passes/device**; use median for gate evaluation.

### Gate mapping

- **CI job:** `perf/paging-scale-benchmark`
  - Runs synthetic dataset benchmark and compares against FPS/heap thresholds.
- **Release gate (manual):** `release-readiness/scale-performance-signoff`
  - Required when paging, virtualization, or data-layer changes are included.

### Review cadence

- **On demand per relevant PR** (tag-triggered).
- **Weekly** performance trend dashboard review.
- **Per release candidate** mandatory signoff if impacted areas changed.

---

## Governance

- Metric owners maintain thresholds and device matrix in version-controlled config.
- Any gate change requires approval from Engineering + QA leads.
- Waivers must include rationale, owner, mitigation plan, and expiration date.
