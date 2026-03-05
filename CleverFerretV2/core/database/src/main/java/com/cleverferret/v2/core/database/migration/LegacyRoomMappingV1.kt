package com.cleverferret.v2.core.database.migration

object LegacyRoomMappingV1 {
    data class EntityMappingRule(val legacySource: String, val canonicalTarget: String, val mappingNotes: String)
    data class MigrationFlowRule(val legacySource: String, val canonicalStage: String, val migrationNotes: String)

    fun entityMappings(): List<EntityMappingRule> = listOf(
        EntityMappingRule("data/local/entity/MediaItem.kt", "MediaItemV1 + MediaVariantV1", "Split identity metadata from storage/format details (path, extension, mime, file hash)."),
        EntityMappingRule("data/local/entity/MetadataBook.kt", "MediaVariantV1 + ConsumptionStateV1 + RelationV1", "Book format flows to variant.format, reading fields flow to ConsumptionState, series fields become series relations."),
    )

    fun migrationFlowMappings(): List<MigrationFlowRule> = listOf(
        MigrationFlowRule("data/migration/AppUpgradeManager.kt", "Pre-migration safety hooks", "Create backup, trigger Room migration path, and run post-migration integrity verification before enabling canonical schema writes."),
        MigrationFlowRule("data/migration/BackupRestorationManager.kt", "Rollback bridge", "Expose restoration requests whenever canonical migration/import fails so users can recover from generated backups."),
    )
}
