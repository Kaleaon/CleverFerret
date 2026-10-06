package com.universalmedialibrary.data.local

import com.google.common.truth.Truth.assertThat
import io.mockk.every
import io.mockk.just
import io.mockk.mockk
import io.mockk.runs
import io.mockk.verify
import org.junit.Test
import androidx.sqlite.db.SupportSQLiteDatabase

class AppDatabaseMigrationsTest {

    @Test
    fun `no-op migrations do not execute SQL`() {
        val database = mockk<SupportSQLiteDatabase>(relaxed = true)

        AppDatabaseMigrations.MIGRATION_20_21.migrate(database)
        AppDatabaseMigrations.MIGRATION_21_22.migrate(database)

        verify(exactly = 0) { database.execSQL(any()) }
    }

    @Test
    fun `migration 22_23 creates expected tables and indexes`() {
        val database = mockk<SupportSQLiteDatabase>()
        val executedSql = mutableListOf<String>()
        every { database.execSQL(capture(executedSql)) } just runs

        AppDatabaseMigrations.MIGRATION_22_23.migrate(database)

        assertThat(executedSql).hasSize(4)
        assertThat(executedSql.any { it.contains("CREATE TABLE IF NOT EXISTS comic_panels") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE UNIQUE INDEX IF NOT EXISTS index_comic_panels") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TABLE IF NOT EXISTS comic_translations") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TABLE IF NOT EXISTS comic_reading_sessions") }).isTrue()
    }

    @Test(expected = IllegalStateException::class)
    fun `migration 22_23 surfaces SQL failure`() {
        val database = mockk<SupportSQLiteDatabase>()
        every { database.execSQL(any()) } throws IllegalStateException("simulated SQL failure")

        AppDatabaseMigrations.MIGRATION_22_23.migrate(database)
    }

    @Test
    fun `migration 44_45 creates staged_metadata_candidates table and alters metadata_common`() {
        val database = mockk<SupportSQLiteDatabase>()
        val executedSql = mutableListOf<String>()
        every { database.execSQL(capture(executedSql)) } just runs

        AppDatabaseMigrations.MIGRATION_44_45.migrate(database)

        assertThat(executedSql.any { it.contains("staged_metadata_candidates") }).isTrue()
        assertThat(executedSql.any { it.contains("index_staged_metadata_candidates_itemId") }).isTrue()
        assertThat(executedSql.any { it.contains("ALTER TABLE `metadata_common` ADD COLUMN `isVerified`") }).isTrue()
    }

    @Test
    fun `migration 45_46 creates expected indexes on metadata tables`() {
        val database = mockk<SupportSQLiteDatabase>()
        val executedSql = mutableListOf<String>()
        every { database.execSQL(capture(executedSql)) } just runs

        AppDatabaseMigrations.MIGRATION_45_46.migrate(database)

        assertThat(executedSql).hasSize(5)
        assertThat(executedSql.any { it.contains("CREATE INDEX IF NOT EXISTS index_metadata_common_itemId ON metadata_common") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE INDEX IF NOT EXISTS index_metadata_book_itemId ON metadata_book") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE INDEX IF NOT EXISTS index_metadata_movie_itemId ON metadata_movie") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE INDEX IF NOT EXISTS index_metadata_music_track_itemId ON metadata_music_track") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE INDEX IF NOT EXISTS index_extended_metadata_itemId ON extended_metadata") }).isTrue()
    }

    @Test
    fun `migration 46_47 creates media_fts table and triggers`() {
        val database = mockk<SupportSQLiteDatabase>()
        val executedSql = mutableListOf<String>()
        every { database.execSQL(capture(executedSql)) } just runs

        AppDatabaseMigrations.MIGRATION_46_47.migrate(database)

        assertThat(executedSql.any { it.contains("CREATE VIRTUAL TABLE IF NOT EXISTS `media_fts`") }).isTrue()
        assertThat(executedSql.any { it.contains("media_items_ai") }).isTrue()
    }
}
