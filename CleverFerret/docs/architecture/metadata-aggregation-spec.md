# Metadata Aggregation Specification

## Overview

This document defines a deterministic metadata aggregation model to replace ad-hoc concatenation-style merge behavior in `ComprehensiveMetadataService`. The goal is to produce a single `AggregatedMetadata` result with per-field provenance, reproducible conflict handling, and explicit confidence scoring.

## `AggregatedMetadata` Model

### Structure

`AggregatedMetadata` is a normalized, field-centric object where each output field is selected (not concatenated) from one or more candidate source values.

```kotlin
data class AggregatedMetadata(
    val title: ProvenancedValue<String>?,
    val author: ProvenancedValue<List<String>>?,
    val cover: ProvenancedValue<CoverAsset>?,
    val series: ProvenancedValue<SeriesInfo>?,
    val description: ProvenancedValue<String>?,
    val identifiers: ProvenancedValue<IdentifierSet>?,
    val alternatives: Map<MetadataField, List<AlternativeValue<*>>> = emptyMap(),
    val aggregateConfidence: Double,
    val aggregatedAtEpochMs: Long,
    val policyVersion: String = "v1"
)
```

### `FieldProvenance` semantics

Each selected field value carries provenance metadata:

```kotlin
data class FieldProvenance(
    val source: MetadataSource,
    val confidence: Double,
    val fetchedAtEpochMs: Long
)
```

Semantics:

- **`source`**: The provider that produced the winning value (for example Google Books, Open Library, TMDB, OMDb, local tags, embedded file metadata).
- **`confidence`**: Final post-resolution confidence in `[0.0, 1.0]` for that specific selected field value, after precedence and conflict rules are applied.
- **`fetchedAt` / `fetchedAtEpochMs`**: Timestamp captured at provider fetch time (not merge time), used for tie-breaking and staleness-aware diagnostics.

Notes:

- `ProvenancedValue<T>` should include both `value: T` and `provenance: FieldProvenance`.
- Confidence is **field-level**, not source-global; the same source may score differently per field.

## Per-field source precedence

When multiple sources provide a candidate for the same field, evaluate candidates in this default precedence order (highest first), then apply confidence and conflict rules.

| Field | Precedence (high → low) | Rationale |
|---|---|---|
| `title` | Embedded file metadata → Google Books/TMDB primary API → Open Library/OMDb fallback → filename-derived text | Embedded/primary APIs usually contain canonical release title. |
| `author` | Embedded metadata contributors → Google Books/Open Library authors → external enrichment from related IDs → filename-derived text | Author from embedded or bibliographic APIs is more reliable than parsed filename hints. |
| `cover` | Embedded cover binary/artwork URI → primary API cover URL (TMDB/Google Books) → fallback API cover URL → generated/placeholder art | Favor directly attached artwork first; placeholders last. |
| `series` | Embedded series tags → bibliographic APIs with sequence support → inferred from title pattern | Explicit tags are preferred over inference heuristics. |
| `description` | Provider long synopsis/blurb with richest content → secondary synopsis → local notes/short summaries | Richer canonical descriptions generally produce better UX/search. |
| `identifiers` | Verifiable standard IDs (ISBN-13, ISBN-10, IMDB, TMDB, MBID) from authoritative API or embedded tags → inferred IDs | Deterministic identity keys should prefer authoritative and verifiable values. |

Implementation recommendation: represent the table as configuration (`Map<MetadataField, List<MetadataSource>>`) rather than hardcoded branching.

## Conflict resolution strategy

For each field:

1. **Normalize** candidates (trim, Unicode normalize, case-fold for comparisons, canonicalize IDs, de-duplicate list entries).
2. **Discard invalid** candidates (malformed IDs, empty strings, unsupported URL schemes, known placeholder tokens).
3. **Score** each candidate.
4. **Select** highest-scoring candidate.
5. **Tie-break** using:
   1. Higher precedence source.
   2. More recent `fetchedAt`.
   3. Longer non-noise content (for textual synopsis fields only).
   4. Stable deterministic source enum order (final safety tie-breaker).
6. **Persist alternatives** in `alternatives` for debugging and future user-override UX.

### Field confidence scoring

Suggested scoring formula:

`finalScore = (sourceBaseWeight * 0.45) + (valueQuality * 0.30) + (crossSourceAgreement * 0.20) + (freshness * 0.05)`

Where:

- **`sourceBaseWeight`**: static reliability prior per source and field.
- **`valueQuality`**: field-aware quality checks:
  - title: non-empty, avoids all-caps/noise.
  - author: valid person/organization tokenization.
  - cover: image dimensions/aspect/content-type if available.
  - series: valid index/sequence coherence.
  - description: length and lexical richness thresholds.
  - identifiers: checksum/pass-format validation.
- **`crossSourceAgreement`**: bonus when independent sources converge on same normalized value.
- **`freshness`**: soft bonus based on recency window and cache TTL policy.

`FieldProvenance.confidence` should use the selected candidate `finalScore` clamped to `[0,1]`.

## Extension hooks

To keep v1 flexible while minimizing churn, include these hooks:

1. **User override layer**
   - `UserMetadataOverrideRepository` queried before source aggregation.
   - override policies:
     - `LOCKED` (always wins),
     - `PREFER_UNTIL_NEWER` (wins unless newer trusted source exceeds threshold),
     - `SUGGESTED` (only used if no confident provider value exists).

2. **Source weighting profiles**
   - injectable `MetadataScoringProfile` defining per-field source base weights.
   - profiles can be switched globally (default, offline-first, privacy-first) or per media type.

3. **Policy versioning**
   - include `policyVersion` in aggregated outputs to allow safe migrations and analytics on behavior changes.

4. **Telemetry hook**
   - emit `MetadataAggregationDecision` event with field, winning source, losing candidates, and scores to support tuning.

## Migration impact: replacing concat behavior in `ComprehensiveMetadataService`

Current `ComprehensiveMetadataService` behavior is composition-oriented and can pass through raw source fields without deterministic per-field winner logic. Migration to `AggregatedMetadata` introduces these impacts:

1. **Contract change**
   - Replace direct primitive fields in complete metadata responses with either:
     - provenanced field wrappers, or
     - parallel `provenance` maps if binary compatibility is required short-term.

2. **Behavioral change**
   - Existing concatenation/first-non-null style outcomes become deterministic winner selection with explicit precedence and confidence.
   - End-user visible values may change for conflicting titles/descriptions/covers.

3. **Storage/cache change**
   - If metadata is cached, extend schema to persist:
     - per-field source,
     - per-field confidence,
     - fetched timestamps,
     - policy version.

4. **API surface and callers**
   - UI and downstream consumers should read `value` plus optional provenance badge/details.
   - Search/indexing pipelines should index winning values, with optional alternative values for recall.

5. **Rollout plan**
   - phase 1: compute aggregated result in shadow mode and log diffs.
   - phase 2: gate with feature flag at service boundary.
   - phase 3: remove legacy concat path after stability threshold and regression checks.

6. **Testing updates**
   - Add deterministic fixture tests for precedence and ties.
   - Add confidence boundary tests (`0`, `1`, malformed input).
   - Add migration snapshots ensuring old/new outputs are explainable via provenance.
