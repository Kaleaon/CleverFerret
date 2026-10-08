package com.universalmedialibrary.services.calibre

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.CalibreDatabaseReader
import com.universalmedialibrary.services.CalibreImportService
import com.universalmedialibrary.services.RawCalibreBook
import com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService
import io.mockk.*
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.File
import java.security.MessageDigest

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [34])
class CalibreSafSyncTest {

    private lateinit var context: Context
    private lateinit var tempDbFile: File
    private lateinit var calibreReader: CalibreDatabaseReader

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        tempDbFile = File.createTempFile("calibre_test_", ".db", context.cacheDir)
        setupCalibreDatabase(tempDbFile)
        calibreReader = CalibreDatabaseReader(context)
    }

    @After
    fun tearDown() {
        if (tempDbFile.exists()) {
            tempDbFile.delete()
        }
    }

    private fun setupCalibreDatabase(dbFile: File) {
        SQLiteDatabase.openOrCreateDatabase(dbFile, null).use { db ->
            db.execSQL("""
                CREATE TABLE books (
                    id INTEGER PRIMARY KEY,
                    title TEXT NOT NULL,
                    path TEXT NOT NULL,
                    series_index REAL
                );
            """)
            db.execSQL("CREATE TABLE authors (id INTEGER PRIMARY KEY, name TEXT NOT NULL);")
            db.execSQL("CREATE TABLE books_authors_link (id INTEGER PRIMARY KEY, book INTEGER, author INTEGER);")
            db.execSQL("CREATE TABLE series (id INTEGER PRIMARY KEY, name TEXT NOT NULL);")
            db.execSQL("CREATE TABLE books_series_link (id INTEGER PRIMARY KEY, book INTEGER, series INTEGER);")
            db.execSQL("CREATE TABLE tags (id INTEGER PRIMARY KEY, name TEXT NOT NULL);")
            db.execSQL("CREATE TABLE books_tags_link (id INTEGER PRIMARY KEY, book INTEGER, tag INTEGER);")
            db.execSQL("CREATE TABLE publishers (id INTEGER PRIMARY KEY, name TEXT NOT NULL);")
            db.execSQL("CREATE TABLE books_publishers_link (id INTEGER PRIMARY KEY, book INTEGER, publisher INTEGER);")
            db.execSQL("CREATE TABLE identifiers (id INTEGER PRIMARY KEY, book INTEGER, type TEXT, val TEXT);")
            db.execSQL("CREATE TABLE comments (id INTEGER PRIMARY KEY, book INTEGER, text TEXT);")

            // Insert Books
            db.execSQL("INSERT INTO books VALUES (1, 'Dune', 'Frank Herbert/Dune', 1.0);")
            db.execSQL("INSERT INTO books VALUES (2, 'Dune Messiah', 'Frank Herbert/Dune Messiah', 2.0);")
            db.execSQL("INSERT INTO books VALUES (3, 'Children of Dune', 'Frank Herbert/Children of Dune', 3.0);")

            // Insert Authors
            db.execSQL("INSERT INTO authors VALUES (101, 'Frank Herbert');")
            db.execSQL("INSERT INTO books_authors_link VALUES (1, 1, 101);")
            db.execSQL("INSERT INTO books_authors_link VALUES (2, 2, 101);")
            db.execSQL("INSERT INTO books_authors_link VALUES (3, 3, 101);")

            // Insert Series
            db.execSQL("INSERT INTO series VALUES (201, 'Dune Chronicles');")
            db.execSQL("INSERT INTO books_series_link VALUES (1, 1, 201);")
            db.execSQL("INSERT INTO books_series_link VALUES (2, 2, 201);")
            db.execSQL("INSERT INTO books_series_link VALUES (3, 3, 201);")

            // Insert Custom Tags
            db.execSQL("INSERT INTO tags VALUES (301, 'Sci-Fi');")
            db.execSQL("INSERT INTO tags VALUES (302, 'Classics');")
            db.execSQL("INSERT INTO books_tags_link VALUES (1, 1, 301);")
            db.execSQL("INSERT INTO books_tags_link VALUES (2, 1, 302);")
            db.execSQL("INSERT INTO books_tags_link VALUES (3, 2, 301);")

            // Comments & Publishers
            db.execSQL("INSERT INTO publishers VALUES (401, 'Chilton Books');")
            db.execSQL("INSERT INTO books_publishers_link VALUES (1, 1, 401);")
            db.execSQL("INSERT INTO comments VALUES (501, 1, 'Epic science fiction masterpiece.');")
        }
    }

    @Test
    fun `readBooks extracts metadata, custom tags, and series ordering from local Calibre database`() {
        val booksMap = calibreReader.readBooks(tempDbFile.absolutePath)

        assertThat(booksMap).hasSize(3)

        val dune = booksMap[1L]
        assertThat(dune).isNotNull()
        assertThat(dune?.title).isEqualTo("Dune")
        assertThat(dune?.seriesName).isEqualTo("Dune Chronicles")
        assertThat(dune?.seriesIndex).isEqualTo(1.0)
        assertThat(dune?.authorNames).containsExactly("Frank Herbert")
        assertThat(dune?.tags).containsExactly("Sci-Fi", "Classics")
        assertThat(dune?.publisher).isEqualTo("Chilton Books")
        assertThat(dune?.comments).isEqualTo("Epic science fiction masterpiece.")

        val duneMessiah = booksMap[2L]
        assertThat(duneMessiah?.seriesIndex).isEqualTo(2.0)
    }

    @Test
    fun `readLibraryStats returns dynamic counts directly from local database records`() {
        val stats = calibreReader.readLibraryStats(tempDbFile.absolutePath)

        assertThat(stats.bookCount).isEqualTo(3)
        assertThat(stats.authorCount).isEqualTo(1)
        assertThat(stats.seriesCount).isEqualTo(1)
        assertThat(stats.tagCount).isEqualTo(2)
    }

    @Test
    fun `read-only safety guardrails preserve source Calibre database file integrity`() {
        val initialHash = calculateFileHash(tempDbFile)
        val initialLastModified = tempDbFile.lastModified()

        // Perform multiple reads
        calibreReader.readBooks(tempDbFile.absolutePath)
        calibreReader.readLibraryStats(tempDbFile.absolutePath)

        val postHash = calculateFileHash(tempDbFile)
        val postLastModified = tempDbFile.lastModified()

        assertThat(postHash).isEqualTo(initialHash)
        assertThat(postLastModified).isEqualTo(initialLastModified)
    }

    @Test
    fun `CalibreIntegrationService calculates real statistics and syncs without static stubs`() = kotlinx.coroutines.test.runTest {
        val apiKeyRepo = mockk<APIKeyRepository>(relaxed = true)
        val integrationService = CalibreIntegrationService(context, apiKeyRepo, calibreReader)

        val connectResult = integrationService.connectToLocalLibrary("Local Test Library", tempDbFile.absolutePath)
        assertThat(connectResult).isInstanceOf(CalibreConnectionResult.Success::class.java)

        val syncResult = integrationService.syncLibraries()
        assertThat(syncResult.successful).isTrue()
        assertThat(syncResult.itemsProcessed).isEqualTo(3)

        val stats = integrationService.getLibraryStats()
        assertThat(stats).isNotNull()
        assertThat(stats?.books).isEqualTo(3)
        assertThat(stats?.authors).isEqualTo(1)
        assertThat(stats?.series).isEqualTo(1)
        assertThat(stats?.tags).isEqualTo(2)
    }

    @Test
    fun `CalibreImportService processes items in batch chunks and preserves custom tags and series index`() = kotlinx.coroutines.test.runTest {
        val mockDatabase = mockk<AppDatabase>(relaxed = true)
        val mockMediaItemDao = mockk<MediaItemDao>(relaxed = true)
        val mockMetadataDao = mockk<MetadataDao>(relaxed = true)

        coEvery { mockMediaItemDao.getExistingFilePaths(any()) } returns emptyList()
        coEvery { mockMediaItemDao.insertMediaItem(any()) } returns 101L

        val slotCommon = slot<MetadataCommon>()
        val slotBook = slot<MetadataBook>()
        coEvery { mockMetadataDao.insertMetadataCommon(capture(slotCommon)) } returns 101L
        coEvery { mockMetadataDao.insertMetadataBook(capture(slotBook)) } returns 101L

        val importService = CalibreImportService(
            database = mockDatabase,
            mediaItemDao = mockMediaItemDao,
            metadataDao = mockMetadataDao,
            calibreReader = calibreReader
        )

        var progressCalls = 0
        var lastImported = 0
        var lastTotal = 0

        importService.importCalibreDatabase(
            calibreDbPath = tempDbFile.absolutePath,
            libraryRootPath = tempDbFile.parentFile!!.absolutePath,
            libraryId = 1L,
            chunkSize = 2,
            onProgress = { imported, total ->
                progressCalls++
                lastImported = imported
                lastTotal = total
            }
        )

        assertThat(progressCalls).isGreaterThan(0)
        assertThat(lastImported).isEqualTo(3)
        assertThat(lastTotal).isEqualTo(3)

        verify(atLeast = 3) { mockMetadataDao.insertMetadataBook(any()) }
        assertThat(slotBook.isCaptured).isTrue()
        assertThat(slotBook.captured.series).isEqualTo("Dune Chronicles")
    }

    private fun calculateFileHash(file: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        file.inputStream().use { input ->
            val buffer = ByteArray(8192)
            var bytesRead: Int
            while (input.read(buffer).also { bytesRead = it } > 0) {
                digest.update(buffer, 0, bytesRead)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }
}
