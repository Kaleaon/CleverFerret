# Scan Resumability Design

## Purpose

Define a resilient scan execution model so long-running media/library scans can survive app backgrounding, process death, device restart, and transient storage errors while preserving correctness and user trust.

## 1) `ScanWorkItem` Lifecycle and State Transitions

A `ScanWorkItem` represents one scan unit (for example: a folder segment, provider partition, or page of discovered entries) processed by the scan pipeline.

### Canonical States

- `PENDING`
  - Work item is created and persisted, not yet dequeued by an executor.
- `CLAIMED`
  - Worker has atomically claimed the item with lease metadata (`workerId`, `leaseExpiresAt`).
- `RUNNING`
  - Item processing is actively executing.
- `CHECKPOINTING`
  - Worker is committing partial progress for this item.
- `RETRYABLE_FAILED`
  - Item failed with transient error and has `retryCount`, `nextAttemptAt`.
- `BLOCKED`
  - Item cannot proceed until dependency/constraint is resolved (for example storage unavailable).
- `COMPLETED`
  - Item finished successfully and final outputs are committed.
- `FATAL_FAILED`
  - Item failed permanently (non-retryable schema/content violation).
- `CANCELLED`
  - Scan session was explicitly canceled by user/system policy.
- `ORPHANED`
  - Item was previously `CLAIMED`/`RUNNING`, but lease expired (likely process death).

### Transition Rules

- `PENDING -> CLAIMED`
  - Atomic compare-and-set on status + lease write.
- `CLAIMED -> RUNNING`
  - Worker begins execution after preflight checks.
- `RUNNING -> CHECKPOINTING`
  - Triggered by item boundary, time budget, or progress threshold.
- `CHECKPOINTING -> RUNNING`
  - Checkpoint commit succeeded; continue processing.
- `RUNNING -> COMPLETED`
  - All intended records for item are emitted and committed.
- `RUNNING -> RETRYABLE_FAILED`
  - Transient I/O/network/contention errors.
- `RUNNING -> FATAL_FAILED`
  - Deterministic validation failure or unsupported format marked permanent.
- `RETRYABLE_FAILED -> PENDING`
  - Backoff elapsed and retry budget not exhausted.
- `CLAIMED|RUNNING -> ORPHANED`
  - Lease heartbeat missed past grace period.
- `ORPHANED -> PENDING`
  - Reconciler requeues for replay.
- `ANY_NON_TERMINAL -> CANCELLED`
  - User/system cancellation with best-effort cooperative stop.

### Invariants

- Terminal states: `COMPLETED`, `FATAL_FAILED`, `CANCELLED`.
- Exactly-once *effects* are achieved through idempotent writes keyed by deterministic content identity, even when execution is at-least-once.
- Lease ownership is exclusive; only lease owner can advance `CLAIMED/RUNNING` item except reconciler on expiration.

## 2) Checkpoint Persistence Model and Failure Recovery

### Persistence Entities

- `ScanSession`
  - `sessionId`, `scanRoot`, `startedAt`, `status`, `configVersion`, `targetModelVersion`.
- `ScanCursorCheckpoint`
  - `sessionId`, `cursorType`, `cursorValue`, `highWatermark`, `updatedAt`, `version`.
- `ScanWorkItem`
  - State + lease + retry metadata + content range.
- `ScanMutationJournal`
  - Append-only idempotency keys and mutation receipts for replay safety.

### Checkpoint Write Strategy

- Use transaction bundle (or equivalent atomic batch):
  1. Persist latest cursor/high-watermark.
  2. Persist work item progress (`processedCount`, `lastEntryKey`).
  3. Persist mutation journal sequence number.
- Commit cadence:
  - Every **N records** (for throughput),
  - Every **T seconds** (for bounded replay),
  - On lifecycle signals (`onStop`, service demotion, low-memory callbacks).

### Recovery Paths

1. **Crash during processing before checkpoint commit**
   - Replayer detects stale lease -> marks item `ORPHANED` -> requeues.
   - Replay restarts from last durable cursor; duplicate writes ignored via idempotency keys.

2. **Crash during checkpoint transaction**
   - Atomic batch ensures all-or-nothing visibility.
   - If no commit marker, resume from previous checkpoint.

3. **Storage temporarily unavailable**
   - Transition to `RETRYABLE_FAILED` or `BLOCKED` with reason code.
   - Exponential backoff + jitter; escalate to user-visible warning if SLA threshold exceeded.

4. **Schema/version mismatch on restore**
   - Migration path:
     - if migratable: migrate checkpoint + continue.
     - if non-migratable: terminate session gracefully, keep forensic metadata, request full rescan.

## 3) Foreground Service Resume Sequence (App/Process Restart)

1. **Boot/Process start receiver** triggers scan resume coordinator if resumable session exists.
2. Coordinator loads most recent `ScanSession` in non-terminal state.
3. Validate prerequisites:
   - storage permission & mount state,
   - battery/thermal policy gates,
   - model/version compatibility.
4. Reconcile leases:
   - mark expired `CLAIMED/RUNNING` items as `ORPHANED`, then `PENDING`.
5. Rehydrate execution queue from persisted `PENDING` + eligible `RETRYABLE_FAILED`.
6. Start foreground service with persistent notification and resumed progress summary.
7. Worker pool resumes item execution from durable checkpoints.
8. Progress notifier emits resumed ETA and replay percentage.
9. On drain:
   - set session `COMPLETED` (or terminal failure),
   - publish completion notification and metrics.

## 4) Performance Constraints and Max Replay Window

### Constraints

- Resume startup latency target: **<= 2.0 s** from service start to first dequeued item.
- Checkpoint overhead budget: **<= 5%** of scan wall-clock.
- Foreground notification refresh: max every **1 s**, min every **250 ms** under active UI demand.
- Recovery CPU spike guard: replay should not exceed normal scan CPU by more than **15%** for longer than **10 s**.

### Max Replay Window

Define replay window as amount of work repeated after unclean stop.

- Hard target: **<= 30 s** of work replay at P50 device profile.
- Guardrail: **<= 90 s** replay at P95 worst-case storage latency.
- Achieved by adaptive checkpointing:
  - tighten interval when throughput is high,
  - force checkpoint before lifecycle demotion and after large directory boundaries.

## 5) Acceptance Scenario

### Scenario: Interrupted Scan Resumes and Completes

Given:
- A scan session with at least 10k files and multi-item partitioning.
- Checkpoint cadence configured for <=30 s replay target.

When:
1. Scan enters active `RUNNING` state and processes initial partitions.
2. Process is killed mid-partition (simulated crash).
3. App is relaunched and foreground resume coordinator runs.

Then:
- Stale leases are reconciled and orphaned work is requeued.
- Replay begins from last durable checkpoint with no duplicate persisted entities.
- User sees resumed foreground notification with increasing progress.
- Session reaches `COMPLETED` without manual restart.
- End-to-end completion time remains within roadmap resumability target (including replay overhead).

### Roadmap Target Binding

For roadmap compliance, this scenario passes only if:
- replay window remains within configured max window, and
- resumed completion stays within the release milestone performance budget for large-library scans.
