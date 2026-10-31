package com.universalmedialibrary.services.exoplayer

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.universalmedialibrary.services.cache.MediaCacheManager
import io.mockk.coEvery
import io.mockk.mockk
import org.junit.After
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import java.io.File

@RunWith(RobolectricTestRunner::class)
class ExoPlayerCacheFactoryTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private lateinit var context: Context
    private val mediaCacheManager = mockk<MediaCacheManager>(relaxed = true)
    private lateinit var exoPlayerCacheFactory: ExoPlayerCacheFactory

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        val mediaDir = File(context.cacheDir, "media").apply { mkdirs() }
        coEvery { mediaCacheManager.getMediaCacheDirectory() } returns mediaDir
        exoPlayerCacheFactory = ExoPlayerCacheFactory(context, mediaCacheManager)
    }

    @After
    fun tearDown() {
        exoPlayerCacheFactory.release()
    }

    @Test
    fun testGetCacheReturnsSimpleCache() {
        val cache = exoPlayerCacheFactory.getSimpleCache()
        assertNotNull(cache)
        assertTrue(File(context.cacheDir, "media").exists())
    }

    @Test
    fun testCreateCacheDataSourceFactoryWithoutHeaders() {
        val factory = exoPlayerCacheFactory.createCacheDataSourceFactory()
        assertNotNull(factory)
    }

    @Test
    fun testCreateCacheDataSourceFactoryWithHeaders() {
        val headers = mapOf("X-Plex-Token" to "test-token-123")
        val factory = exoPlayerCacheFactory.createCacheDataSourceFactory(headers)
        assertNotNull(factory)
    }
}
