package com.universalmedialibrary.services.plex

import android.content.Context
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.cache.CacheManager
import com.universalmedialibrary.utils.NetworkObserver
import io.mockk.*
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import java.io.File

class PlexVirtualUriResolverTest {

    private val context = mockk<Context>(relaxed = true)
    private val cacheManager = mockk<CacheManager>(relaxed = true)
    private val networkObserver = mockk<NetworkObserver>(relaxed = true)
    private val plexServerDao = mockk<PlexServerDao>(relaxed = true)
    private val mediaItemDao = mockk<MediaItemDao>(relaxed = true)

    private lateinit var resolver: PlexVirtualUriResolver
    private lateinit var tempCacheDir: File

    @Before
    fun setUp() {
        tempCacheDir = File.createTempFile("test_cache", "").apply {
            delete()
            mkdirs()
        }
        coEvery { cacheManager.getCacheDirectory() } returns tempCacheDir

        resolver = PlexVirtualUriResolver(
            context,
            cacheManager,
            networkObserver,
            plexServerDao,
            mediaItemDao
        )
    }

    @After
    fun tearDown() {
        tempCacheDir.deleteRecursively()
    }

    @Test
    fun `isVirtualUri correctly identifies plex scheme`() {
        assertTrue(resolver.isVirtualUri("plex://server123/10294"))
        assertTrue(resolver.isVirtualUri("PLEX://SERVER123/10294"))
        assertFalse(resolver.isVirtualUri("/sdcard/books/book.epub"))
        assertFalse(resolver.isVirtualUri("file:///storage/emulated/0/book.epub"))
        assertFalse(resolver.isVirtualUri(null))
    }

    @Test
    fun `parseUri extracts machineIdentifier and ratingKey`() {
        val parsed = resolver.parseUri("plex://my_server_id_123/998877")
        assertNotNull(parsed)
        assertEquals("my_server_id_123", parsed?.machineIdentifier)
        assertEquals("998877", parsed?.ratingKey)

        assertNull(resolver.parseUri("invalid_path"))
        assertNull(resolver.parseUri("plex://only_one_part"))
    }

    @Test
    fun `resolveUri with cached file succeeds in offline mode without network calls`() = runBlocking {
        val uri = "plex://server123/10294"
        val cachedFile = File(tempCacheDir, "plex_server123_10294.epub")
        cachedFile.writeText("Dummy EPUB content")

        every { networkObserver.isConnected() } returns false

        val result = resolver.resolveUri(uri)

        assertTrue(result.isSuccess)
        assertEquals(cachedFile.absolutePath, result.getOrNull()?.absolutePath)
        coVerify(exactly = 1) { mediaItemDao.updateAvailability(uri, true) }
        coVerify(exactly = 0) { plexServerDao.getServerByMachineId(any()) }
    }

    @Test
    fun `resolveUri with uncached file in offline mode fails gracefully`() = runBlocking {
        val uri = "plex://server123/10294"
        every { networkObserver.isConnected() } returns false

        val result = resolver.resolveUri(uri)

        assertTrue(result.isFailure)
        assertTrue(result.exceptionOrNull() is PlexUriResolverException.Offline)
        coVerify(exactly = 1) { mediaItemDao.updateAvailability(uri, false) }
    }

    @Test
    fun `resolveUri with uncached file when online enforces cache quota and downloads file`() = runBlocking {
        val uri = "plex://server123/10294"
        val server = PlexServer(
            serverId = 1L,
            name = "Home Server",
            host = "192.168.1.100",
            port = 32400,
            token = "secret-token",
            machineIdentifier = "server123"
        )

        every { networkObserver.isConnected() } returns true
        coEvery { plexServerDao.getServerByMachineId("server123") } returns server
        coEvery { cacheManager.isCacheOverLimit() } returns false

        resolver.customDownloader = { _, _, target ->
            target.writeText("Downloaded content for testing")
            Result.success(target)
        }

        val result = resolver.resolveUri(uri)

        coVerify { cacheManager.cleanCacheIfNeeded() }
        assertTrue(result.isSuccess)
        val file = result.getOrThrow()
        assertTrue(file.exists())
        coVerify { mediaItemDao.updateAvailability(uri, true) }
    }
}
