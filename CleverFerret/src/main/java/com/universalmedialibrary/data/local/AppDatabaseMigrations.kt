package com.universalmedialibrary.data.local

import androidx.room.migration.Migration
import com.universalmedialibrary.data.local.migrations.MigrationRegistry

/**
 * Database migrations for AppDatabase.
 *
 * Each MIGRATION_X_Y is defined in its own file under [migrations/].
 * This object re-exports them so existing call sites continue to compile.
 */
object AppDatabaseMigrations {
    val MIGRATION_20_21: Migration = MigrationRegistry.MIGRATION_20_21
    val MIGRATION_21_22: Migration = MigrationRegistry.MIGRATION_21_22
    val MIGRATION_22_23: Migration = MigrationRegistry.MIGRATION_22_23
    val MIGRATION_23_24: Migration = MigrationRegistry.MIGRATION_23_24
    val MIGRATION_24_25: Migration = MigrationRegistry.MIGRATION_24_25
    val MIGRATION_25_26: Migration = MigrationRegistry.MIGRATION_25_26
    val MIGRATION_26_27: Migration = MigrationRegistry.MIGRATION_26_27
    val MIGRATION_27_28: Migration = MigrationRegistry.MIGRATION_27_28
    val MIGRATION_28_29: Migration = MigrationRegistry.MIGRATION_28_29
    val MIGRATION_29_30: Migration = MigrationRegistry.MIGRATION_29_30
    val MIGRATION_30_31: Migration = MigrationRegistry.MIGRATION_30_31
    val MIGRATION_31_32: Migration = MigrationRegistry.MIGRATION_31_32
    val MIGRATION_32_33: Migration = MigrationRegistry.MIGRATION_32_33
    val MIGRATION_33_34: Migration = MigrationRegistry.MIGRATION_33_34
    val MIGRATION_34_35: Migration = MigrationRegistry.MIGRATION_34_35
    val MIGRATION_35_36: Migration = MigrationRegistry.MIGRATION_35_36
    val MIGRATION_36_37: Migration = MigrationRegistry.MIGRATION_36_37
    val MIGRATION_37_38: Migration = MigrationRegistry.MIGRATION_37_38
    val MIGRATION_38_39: Migration = MigrationRegistry.MIGRATION_38_39
    val MIGRATION_42_43: Migration = MigrationRegistry.MIGRATION_42_43
    val MIGRATION_43_44: Migration = MigrationRegistry.MIGRATION_43_44

    val ALL_MIGRATIONS: Array<Migration> = MigrationRegistry.ALL_MIGRATIONS
}
