package com.universalmedialibrary.data.local.migrations

import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase

val MIGRATION_44_45 = object : Migration(44, 45) {
    override fun migrate(db: SupportSQLiteDatabase) {
        db.execSQL(
            """
            CREATE TABLE IF NOT EXISTS `staged_metadata_candidates` (
                `candidateId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                `itemId` INTEGER NOT NULL,
                `title` TEXT,
                `sortTitle` TEXT,
                `originalTitle` TEXT,
                `year` INTEGER,
                `releaseDate` INTEGER,
                `rating` REAL,
                `summary` TEXT,
                `plot` TEXT,
                `tagline` TEXT,
                `coverImagePath` TEXT,
                `backdropImagePath` TEXT,
                `language` TEXT,
                `country` TEXT,
                `tags` TEXT,
                `confidenceScore` REAL NOT NULL,
                `source` TEXT NOT NULL,
                `status` TEXT NOT NULL,
                `createdAt` INTEGER NOT NULL,
                `expiresAt` INTEGER NOT NULL
            )
            """.trimIndent()
        )
        db.execSQL("CREATE INDEX IF NOT EXISTS `index_staged_metadata_candidates_itemId` ON `staged_metadata_candidates` (`itemId`)")
        db.execSQL("CREATE INDEX IF NOT EXISTS `index_staged_metadata_candidates_status` ON `staged_metadata_candidates` (`status`)")
        db.execSQL("CREATE INDEX IF NOT EXISTS `index_staged_metadata_candidates_expiresAt` ON `staged_metadata_candidates` (`expiresAt`)")

        db.execSQL("ALTER TABLE `metadata_common` ADD COLUMN `isVerified` INTEGER NOT NULL DEFAULT 0")
    }
}
