package com.universalmedialibrary.utils

import android.content.Context
import android.content.ContentResolver
import android.net.Uri
import com.universalmedialibrary.services.deriveMetadataForComicArchive
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever
import java.io.ByteArrayInputStream
import java.io.File

class ComicArchiveUtilsTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private lateinit var context: Context
    private lateinit var contentResolver: ContentResolver
    private lateinit var cacheDir: File

    @Before
    fun setUp() {
        context = mock()
        contentResolver = mock()
        cacheDir = tempFolder.newFolder("cacheDir")

        whenever(context.cacheDir).thenReturn(cacheDir)
        whenever(context.contentResolver).thenReturn(contentResolver)
    }

    @Test
    fun `executeWithTempCacheFile creates temp file and deletes it on success`() {
        val testContent = "Test CBR stream content".toByteArray()
        val uri: Uri = mock()

        whenever(contentResolver.openInputStream(uri)).thenAnswer { ByteArrayInputStream(testContent) }

        var createdFileInBlock: File? = null
        val result = ComicArchiveUtils.executeWithTempCacheFile(context, uri, prefix = "comic", suffix = ".cbr") { tempFile ->
            createdFileInBlock = tempFile
            assertTrue("Temp file should exist during block execution", tempFile.exists())
            assertEquals("Temp file should be in cacheDir", cacheDir.absolutePath, tempFile.parentFile?.absolutePath)
            "success_result"
        }

        assertEquals("success_result", result)
        assertTrue("Created temp file reference should not be null", createdFileInBlock != null)
        assertFalse("Temp file must be deleted after executeWithTempCacheFile finishes", createdFileInBlock!!.exists())
        assertEquals("cacheDir should be empty after block execution", 0, cacheDir.listFiles()?.size ?: 0)
    }

    @Test
    fun `executeWithTempCacheFile deletes temp file when block throws exception`() {
        val testContent = "Corrupt archive content".toByteArray()
        val uri: Uri = mock()

        whenever(contentResolver.openInputStream(uri)).thenAnswer { ByteArrayInputStream(testContent) }

        var createdFileInBlock: File? = null
        try {
            ComicArchiveUtils.executeWithTempCacheFile(context, uri, prefix = "comic", suffix = ".cbr") { tempFile ->
                createdFileInBlock = tempFile
                assertTrue(tempFile.exists())
                throw RuntimeException("Simulated parsing error inside Junrar Archive")
            }
        } catch (e: Exception) {
            assertEquals("Simulated parsing error inside Junrar Archive", e.message)
        }

        assertTrue("Created temp file reference should not be null", createdFileInBlock != null)
        assertFalse("Temp file must be deleted even if block throws exception", createdFileInBlock!!.exists())
        assertEquals("cacheDir should be empty following parsing error", 0, cacheDir.listFiles()?.size ?: 0)
    }

    @Test
    fun `cleanupStaleComicTempFiles deletes stale files and ignores active files`() {
        val now = System.currentTimeMillis()
        val tenMinutesAgo = now - (10 * 60 * 1000L)

        // Stale CBR files (> 5 mins old)
        val staleFile1 = File(cacheDir, "comic_stale1.cbr").apply {
            createNewFile()
            setLastModified(tenMinutesAgo)
        }
        val staleFile2 = File(cacheDir, "cf_tmp_stale2.cbr").apply {
            createNewFile()
            setLastModified(tenMinutesAgo)
        }

        // Active CBR files (< 5 mins old)
        val activeFile1 = File(cacheDir, "comic_active1.cbr").apply {
            createNewFile()
            setLastModified(now)
        }
        val activeFile2 = File(cacheDir, "cf_tmp_active2.cbr").apply {
            createNewFile()
            setLastModified(now)
        }

        // Unrelated cache file (> 5 mins old)
        val unrelatedFile = File(cacheDir, "unrelated_cache.dat").apply {
            createNewFile()
            setLastModified(tenMinutesAgo)
        }

        val deletedCount = ComicArchiveUtils.cleanupStaleComicTempFiles(context, maxAgeMillis = 5 * 60 * 1000L)

        assertEquals(2, deletedCount)
        assertFalse("Stale CBR file 1 should be deleted", staleFile1.exists())
        assertFalse("Stale CBR file 2 should be deleted", staleFile2.exists())
        assertTrue("Active CBR file 1 must remain untouched", activeFile1.exists())
        assertTrue("Active CBR file 2 must remain untouched", activeFile2.exists())
        assertTrue("Unrelated cache file must remain untouched", unrelatedFile.exists())
    }

    @Test
    fun `extractComicInfoFromCbr cleans up temp file when parsing invalid CBR`() {
        val invalidCbrBytes = "Not a valid CBR archive".toByteArray()
        val uri: Uri = mock()

        whenever(contentResolver.openInputStream(uri)).thenAnswer { ByteArrayInputStream(invalidCbrBytes) }

        val comicInfo = ComicArchiveUtils.extractComicInfoFromCbr(context, uri)

        assertNull("Invalid CBR should return null ComicInfo", comicInfo)
        assertEquals("No temporary files should leak in cacheDir after extraction failure", 0, cacheDir.listFiles()?.size ?: 0)
    }

    @Test
    fun `deriveMetadataForComicArchive triggers stale cache cleanup`() {
        val now = System.currentTimeMillis()
        val tenMinutesAgo = now - (10 * 60 * 1000L)

        val staleTempFile = File(cacheDir, "comic_orphaned.cbr").apply {
            createNewFile()
            setLastModified(tenMinutesAgo)
        }

        assertTrue("Orphaned stale temp file should exist before deriving metadata", staleTempFile.exists())

        val uri: Uri = mock()
        whenever(contentResolver.openInputStream(uri)).thenAnswer { ByteArrayInputStream("dummy".toByteArray()) }

        val metadata = deriveMetadataForComicArchive(context, uri, "Batman Year One.cbr")

        assertEquals("Batman Year One", metadata.title)
        assertFalse("Orphaned stale CBR temp file should be cleaned up during deriveMetadataForComicArchive", staleTempFile.exists())
    }
}
