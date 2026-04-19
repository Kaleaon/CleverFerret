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
}
