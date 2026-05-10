# OPDS Auto-Import Flow

## Scope

This document defines the contracts that connect OPDS acquisition completion to library visibility for the automatic single-file import path.

## `DownloadLifecycleStore` Completion Event Schema

When an OPDS-backed download reaches a terminal success state, `DownloadLifecycleStore` MUST emit a `download.completed` event with the schema below.

| Field | Type | Required | Notes |
|---|---|---:|---|
| `eventName` | string | yes | Constant: `download.completed`. |
| `eventVersion` | integer | yes | Start at `1`; bump only for breaking changes. |
| `eventId` | string (UUID) | yes | Unique per emitted completion event. |
| `occurredAt` | string (RFC 3339 UTC) | yes | Event creation timestamp. |
| `downloadId` | string | yes | Stable lifecycle identifier for this download. |
| `jobId` | string | no | Worker/executor job identifier when available. |
| `source` | object | yes | Acquisition source metadata (see below). |
| `file` | object | yes | Local file metadata for scanner ingestion (see below). |
| `outcome` | object | yes | Terminal status payload (see below). |
| `correlation` | object | no | Optional tracing/context propagation block. |

### `source` object

| Field | Type | Required | Notes |
|---|---|---:|---|
| `kind` | string | yes | For this flow: `opds`. |
| `catalogId` | string | no | OPDS catalog identifier if known. |
| `feedUrl` | string | no | Catalog/feed URL used for acquisition. |
| `publicationId` | string | no | OPDS publication identifier if present. |
| `acquisitionUrl` | string | no | URL actually used for download. |

### `file` object

| Field | Type | Required | Notes |
|---|---|---:|---|
| `path` | string | yes | Absolute canonical path on local storage. |
| `name` | string | yes | File name with extension. |
| `sizeBytes` | integer | yes | Final byte count after completion. |
| `mediaType` | string | no | MIME type if detected. |
| `sha256` | string | yes | Hash used for dedupe/idempotency. |

### `outcome` object

| Field | Type | Required | Notes |
|---|---|---:|---|
| `status` | string | yes | Must be `succeeded` for import trigger eligibility. |
| `completedAt` | string (RFC 3339 UTC) | yes | Time download reached terminal success. |
| `durationMs` | integer | no | End-to-end download duration. |
| `errorCode` | string | no | Null/absent on success; populated on failures not routed to import. |

### Example event

```json
{
  "eventName": "download.completed",
  "eventVersion": 1,
  "eventId": "fd040095-a440-4c10-b7de-7328165c032f",
  "occurredAt": "2026-05-02T12:00:01Z",
  "downloadId": "dl_01JTRQ2A8QG1X",
  "source": {
    "kind": "opds",
    "catalogId": "standardebooks",
    "publicationId": "urn:uuid:book-123",
    "acquisitionUrl": "https://catalog.example.org/get/book.epub"
  },
  "file": {
    "path": "/storage/emulated/0/Download/book.epub",
    "name": "book.epub",
    "sizeBytes": 824321,
    "mediaType": "application/epub+zip",
    "sha256": "a0f8..."
  },
  "outcome": {
    "status": "succeeded",
    "completedAt": "2026-05-02T12:00:00Z",
    "durationMs": 1843
  }
}
```

## `LibraryImportBus` Event Contract and Idempotency Rules

`LibraryImportBus` receives a normalized import request from completion events and guarantees at-least-once delivery to scanner consumers.

### Contract: `library.import.requested`

| Field | Type | Required | Notes |
|---|---|---:|---|
| `eventName` | string | yes | Constant: `library.import.requested`. |
| `eventVersion` | integer | yes | Start at `1`. |
| `eventId` | string (UUID) | yes | Bus event identifier. |
| `requestedAt` | string (RFC 3339 UTC) | yes | Emit time for import request. |
| `importKey` | string | yes | Deterministic idempotency key (rule below). |
| `downloadId` | string | yes | Source download identifier. |
| `filePath` | string | yes | Absolute canonical path to import. |
| `fileSha256` | string | yes | Strong file identity. |
| `sourceKind` | string | yes | `opds` for this flow. |
| `traceId` | string | no | Optional distributed trace id. |

### Idempotency rules

1. **Deterministic key**: `importKey = sha256(downloadId + ":" + fileSha256 + ":" + canonical(filePath))`.
2. **Producer dedupe window**: producer MUST suppress duplicate `library.import.requested` emits for the same `importKey` for at least 24 hours.
3. **Consumer dedupe**: scanner MUST maintain a processed-key store for at least 7 days and treat repeats as no-op acknowledgements.
4. **Upsert semantics**: repeated requests for same key MUST NOT create duplicate library entries.
5. **Re-drive behavior**: if processing fails before terminal import state, the same `importKey` MAY be retried safely.

## Single-File Import Pathway in Scanner Service

The scanner service MUST support a fast path that bypasses broad directory scans for OPDS auto-import:

1. Consume `library.import.requested`.
2. Validate payload (`filePath` exists, readable, and checksum matches if provided).
3. Acquire short-lived import lock on `importKey` to avoid concurrent duplicate processing.
4. Execute **single-file parser pipeline**:
   - infer format from extension/media type,
   - extract metadata,
   - normalize identifiers,
   - map to canonical library record model.
5. Perform dedupe resolution:
   - if matching content hash or canonical book id exists, merge/update metadata only,
   - otherwise insert a new library item.
6. Emit `library.import.completed` with status `{ imported | merged | skipped_duplicate }`.
7. Release lock and persist processing checkpoint for idempotency store.

Implementation constraint: OPDS-triggered imports MUST NOT enqueue full-library scan jobs unless validation fails in a way requiring recovery.

## SLA Target and Test Instrumentation (`visible in library within 5s`)

### SLA definition

- **SLO**: 95th percentile latency ≤ **5.0 seconds** from `download.completed.outcome.completedAt` to first successful library query showing the item.
- **Hard failure budget event**: any completion taking >10 seconds is recorded as an SLA violation candidate.

### Measurement points

Capture the following monotonic timestamps (same clock domain where possible):

- `t0`: `download.completed.outcome.completedAt`
- `t1`: `library.import.requested.requestedAt`
- `t2`: scanner starts processing request
- `t3`: scanner commits library DB transaction
- `t4`: item first visible from repository/query API used by UI

Derived metrics:

- `queue_delay_ms = t2 - t1`
- `import_processing_ms = t3 - t2`
- `index_visibility_ms = t4 - t3`
- `end_to_end_visible_ms = t4 - t0`

### Test instrumentation requirements

1. **Contract test (`DownloadLifecycleStore` → `LibraryImportBus`)**
   - validates schema fields and `importKey` determinism.
2. **Scanner idempotency test**
   - sends same request N times; asserts one insert and N-1 no-op/merge outcomes.
3. **Integration latency test**
   - synthetic single-file acquisition fixture; asserts `end_to_end_visible_ms <= 5000` in controlled CI profile.
4. **Soak/telemetry test**
   - periodic run captures p50/p95/p99 and violation counts, exporting to metrics backend.
5. **Failure-mode test**
   - transient DB or parser failure with retry; verifies same `importKey` recovers without duplicates.

Recommended metric names:

- `opds_auto_import_end_to_end_visible_ms`
- `opds_auto_import_queue_delay_ms`
- `opds_auto_import_processing_ms`
- `opds_auto_import_visibility_ms`
- `opds_auto_import_idempotent_replays_total`
- `opds_auto_import_sla_violations_total`
