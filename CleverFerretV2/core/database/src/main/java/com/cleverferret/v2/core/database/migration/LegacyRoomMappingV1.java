package com.cleverferret.v2.core.database.migration;

import java.util.List;

/**
 * Declarative mapping from legacy Room entities/migration services into canonical schema tables.
 */
public final class LegacyRoomMappingV1 {
    private LegacyRoomMappingV1() {}

    public static List<EntityMappingRule> entityMappings() {
        return List.of(
                new EntityMappingRule(
                        "data/local/entity/MediaItem.kt",
                        "MediaItemV1 + MediaVariantV1",
                        "Split identity metadata from storage/format details (path, extension, mime, file hash)."
                ),
                new EntityMappingRule(
                        "data/local/entity/MetadataBook.kt",
                        "MediaVariantV1 + ConsumptionStateV1 + RelationV1",
                        "Book format flows to variant.format, reading fields flow to ConsumptionState, series fields become series relations."
                ),
                new EntityMappingRule(
                        "data/local/entity/AudiobookEntity.kt",
                        "MediaItemV1 + MediaVariantV1 + ConsumptionStateV1",
                        "Audiobook metadata becomes canonical media identity/variant and playback position becomes consumption state."
                ),
                new EntityMappingRule(
                        "data/local/entity/Bookmark.kt (ReadingProgress)",
                        "ConsumptionStateV1",
                        "Per-item locator/page/chapter progress is normalized into mode-specific consumption locator fields."
                ),
                new EntityMappingRule(
                        "data/local/entity/ListenHistoryEntry.kt + PlaybackSession.kt + PlexProgress.kt",
                        "ConsumptionStateV1 + SyncStateV1",
                        "Listening offsets remain in consumption state while Plex/local divergence flags become sync status rows."
                ),
                new EntityMappingRule(
                        "data/local/entity/UnifiedCollection.kt + ItemCollection.kt + PlexCollection.kt",
                        "CollectionV1 + RelationV1",
                        "Collection descriptors map to Collection and membership/order maps to MEDIA_IN_COLLECTION relations."
                ),
                new EntityMappingRule(
                        "data/local/entity/UnifiedTag.kt + ItemTag.kt + PlexTag.kt + TagHierarchy.kt",
                        "TagV1 + RelationV1",
                        "Tag descriptors normalize into Tag and assignment/hierarchy edges become MEDIA_TAGGED/TAG_PARENT_OF relations."
                ),
                new EntityMappingRule(
                        "data/local/entity/Series.kt",
                        "SeriesV1 + RelationV1",
                        "Series metadata maps to Series while series-item ordering maps to MEDIA_IN_SERIES relations."
                )
        );
    }

    public static List<MigrationFlowRule> migrationFlowMappings() {
        return List.of(
                new MigrationFlowRule(
                        "data/migration/AppUpgradeManager.kt",
                        "Pre-migration safety hooks",
                        "Create backup, trigger Room migration path, and run post-migration integrity verification before enabling canonical schema writes."
                ),
                new MigrationFlowRule(
                        "data/migration/BackupRestorationManager.kt",
                        "Rollback bridge",
                        "Expose restoration requests whenever canonical migration/import fails so users can recover from generated backups."
                ),
                new MigrationFlowRule(
                        "data/local/AppDatabaseMigrations.kt",
                        "DDL lineage source",
                        "Use historical table/index evolution as authoritative source for old-version readers feeding the canonical importer."
                )
        );
    }

    public record EntityMappingRule(String legacySource, String canonicalTarget, String mappingNotes) {}

    public record MigrationFlowRule(String legacySource, String canonicalStage, String migrationNotes) {}
}
