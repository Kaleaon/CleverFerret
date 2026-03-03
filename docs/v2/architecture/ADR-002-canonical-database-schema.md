# ADR-002: Canonical Database Schema for `core:database`

- Status: Accepted
- Date: 2026-03-03

## Context

Legacy CleverFerret Room storage grew by feature and integration source, creating overlapping models for identity, format, progress, relationships, and sync.

Representative overlap:

- Identity and file information in `MediaItem`, `AudiobookEntity`, and provider-specific tables.
- Progress spread across `ReadingProgress`, `MetadataBook`, `ListenHistoryEntry`, `PlaybackSession`, and `PlexProgress`.
- Organization spread across `UnifiedCollection`, `ItemCollection`, `UnifiedTag`, `ItemTag`, `TagHierarchy`, and `Series`.

A canonical schema is required in `core:database` so every feature writes to one normalized contract regardless of source/provider.

## Decision

Adopt canonical schema contracts in `core:database`:

1. `MediaItemV1`: common media identity.
2. `MediaVariantV1`: format/storage-specific variant details.
3. `ConsumptionStateV1`: reading/listening/watching position and completion.
4. `CollectionV1`, `TagV1`, `SeriesV1`, `RelationV1`: organizational graph.
5. `SyncStateV1`: reconciliation and conflict status for cloud/device/provider sync.

The canonical mapping source from legacy Room entities is formalized in `LegacyRoomMappingV1`.

## Mapping summary

- `MediaItem` -> `MediaItemV1` + `MediaVariantV1`
- `MetadataBook` -> `MediaVariantV1` + `ConsumptionStateV1` + `RelationV1`
- `AudiobookEntity` -> `MediaItemV1` + `MediaVariantV1` + `ConsumptionStateV1`
- `ReadingProgress` + `ListenHistoryEntry` + `PlaybackSession` + `PlexProgress` -> `ConsumptionStateV1` + `SyncStateV1`
- `UnifiedCollection` + `ItemCollection` + `PlexCollection` -> `CollectionV1` + `RelationV1`
- `UnifiedTag` + `ItemTag` + `PlexTag` + `TagHierarchy` -> `TagV1` + `RelationV1`
- `Series` -> `SeriesV1` + `RelationV1`

## Consequences

- One consistent persistence language across all V2 features.
- Feature modules can reason about identity, progress, and sync without provider-specific tables.
- Enables deterministic import/export and migration pipelines by targeting one schema version.
