package com.universalmedialibrary.services.exoplayer

import android.content.Context
import io.mockk.every
import io.mockk.mockk
import org.junit.Assert.*
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class ExoPlayerCacheFactoryTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private val context = mockk<Context>(relaxed = true)
    private lateinit var exoPlayerCacheFactory: ExoPlayerCacheFactory

    @Before
    fun setUp() {
        val cacheDir = tempFolder.newFolder("cache")
        every { context.cacheDir } returns cacheDir
        exoPlayerCacheFactory = ExoPlayerCacheFactory(context)
    }

    @Test
    fun testGetCacheReturnsSimpleCache() {
        val cache = exoPlayerCacheFactory.getCache()
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
