package com.universalmedialibrary.services

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.services.cache.CacheManager
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class FileSafetyGuardrailTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @MockK(relaxed = true)
    lateinit var context: Context

    @MockK(relaxed = true)
    lateinit var cacheManager: CacheManager

    private lateinit var guardrail: FileSafetyGuardrail

    private lateinit var internalCacheDir: File
    private lateinit var externalCacheDir: File
    private lateinit var userMediaDir: File

    @Before
    fun setUp() {
        MockKAnnotations.init(this)

        internalCacheDir = tempFolder.newFolder("internal_cache")
        externalCacheDir = tempFolder.newFolder("external_cache")
        userMediaDir = tempFolder.newFolder("user_media")

        every { context.cacheDir } returns internalCacheDir
        every { context.externalCacheDir } returns externalCacheDir
        every { cacheManager.getCacheDirectoryForLocation(CacheLocation.INTERNAL) } returns internalCacheDir
        every { cacheManager.getCacheDirectoryForLocation(CacheLocation.EXTERNAL) } returns externalCacheDir

        guardrail = FileSafetyGuardrail(context, cacheManager)
    }

    @Test
    fun `isCachePath returns true for file inside internal cache`() {
        val cacheFile = File(internalCacheDir, "thumbnail_123.jpg")
        cacheFile.createNewFile()

        val isCache = guardrail.isCachePath(cacheFile.absolutePath)

        assertThat(isCache).isTrue()
    }

    @Test
    fun `isCachePath returns true for file inside external cache`() {
        val cacheFile = File(externalCacheDir, "artwork_456.jpg")
        cacheFile.createNewFile()

        val isCache = guardrail.isCachePath(cacheFile.absolutePath)

        assertThat(isCache).isTrue()
    }

    @Test
    fun `isCachePath returns false for user media outside cache`() {
        val mediaFile = File(userMediaDir, "my_novel.epub")
        mediaFile.createNewFile()

        val isCache = guardrail.isCachePath(mediaFile.absolutePath)

        assertThat(isCache).isFalse()
    }

    @Test
    fun `isCachePath returns false for directory traversal attempt`() {
        val mediaFile = File(userMediaDir, "protected_video.mp4")
        mediaFile.createNewFile()

        // Directory traversal path attempting to escape cache directory
        val traversalPath = "${internalCacheDir.absolutePath}/../user_media/protected_video.mp4"

        val isCache = guardrail.isCachePath(traversalPath)

        assertThat(isCache).isFalse()
    }

    @Test
    fun `isCachePath returns false for null, empty, or web URIs`() {
        assertThat(guardrail.isCachePath(null as String?)).isFalse()
        assertThat(guardrail.isCachePath("")).isFalse()
        assertThat(guardrail.isCachePath("   ")).isFalse()
        assertThat(guardrail.isCachePath("http://example.com/image.jpg")).isFalse()
        assertThat(guardrail.isCachePath("https://example.com/image.jpg")).isFalse()
        assertThat(guardrail.isCachePath("content://media/external/images/media/1")).isFalse()
    }

    @Test
    fun `safeDeleteCacheFile deletes file inside cache`() {
        val cacheFile = File(internalCacheDir, "stale_thumb.png")
        cacheFile.createNewFile()
        assertThat(cacheFile.exists()).isTrue()

        val deleted = guardrail.safeDeleteCacheFile(cacheFile.absolutePath)

        assertThat(deleted).isTrue()
        assertThat(cacheFile.exists()).isFalse()
    }

    @Test
    fun `safeDeleteCacheFile preserves file outside cache`() {
        val mediaFile = File(userMediaDir, "precious_audio.flac")
        mediaFile.createNewFile()
        assertThat(mediaFile.exists()).isTrue()

        val deleted = guardrail.safeDeleteCacheFile(mediaFile.absolutePath)

        assertThat(deleted).isFalse()
        assertThat(mediaFile.exists()).isTrue()
    }
}
