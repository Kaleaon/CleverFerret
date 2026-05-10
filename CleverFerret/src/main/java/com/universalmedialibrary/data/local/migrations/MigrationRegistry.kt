package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration

/**
 * Aggregates every Migration_x_y declared in this package.
 * Add new migrations here when creating a new MIGRATION_<from>_<to>.kt.
 */
object MigrationRegistry {
    val MIGRATION_20_21: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_20_21
    val MIGRATION_21_22: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_21_22
    val MIGRATION_22_23: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_22_23
    val MIGRATION_23_24: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_23_24
    val MIGRATION_24_25: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_24_25
    val MIGRATION_25_26: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_25_26
    val MIGRATION_26_27: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_26_27
    val MIGRATION_27_28: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_27_28
    val MIGRATION_28_29: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_28_29
    val MIGRATION_29_30: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_29_30
    val MIGRATION_30_31: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_30_31
    val MIGRATION_31_32: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_31_32
    val MIGRATION_32_33: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_32_33
    val MIGRATION_33_34: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_33_34
    val MIGRATION_34_35: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_34_35
    val MIGRATION_35_36: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_35_36
    val MIGRATION_36_37: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_36_37
    val MIGRATION_37_38: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_37_38
    val MIGRATION_38_39: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_38_39
    val MIGRATION_42_43: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_42_43
    val MIGRATION_43_44: Migration = com.universalmedialibrary.data.local.migrations.MIGRATION_43_44

    val ALL_MIGRATIONS: Array<Migration> = arrayOf(
        MIGRATION_20_21,
        MIGRATION_21_22,
        MIGRATION_22_23,
        MIGRATION_23_24,
        MIGRATION_24_25,
        MIGRATION_25_26,
        MIGRATION_26_27,
        MIGRATION_27_28,
        MIGRATION_28_29,
        MIGRATION_29_30,
        MIGRATION_30_31,
        MIGRATION_31_32,
        MIGRATION_32_33,
        MIGRATION_33_34,
        MIGRATION_34_35,
        MIGRATION_35_36,
        MIGRATION_36_37,
        MIGRATION_37_38,
        MIGRATION_38_39,
        MIGRATION_42_43,
        MIGRATION_43_44,
    )
}
