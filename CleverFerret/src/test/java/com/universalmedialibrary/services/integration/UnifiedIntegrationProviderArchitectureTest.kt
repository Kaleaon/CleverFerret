package com.universalmedialibrary.services.integration

import com.universalmedialibrary.data.local.dao.ExternalMediaEntityDao
import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import com.universalmedialibrary.services.integration.calibre.CalibreIntegrationService
import com.universalmedialibrary.services.integration.emby.EmbyIntegrationService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService
import com.universalmedialibrary.services.integration.poweramp.PowerampIntegrationAdapter
import com.universalmedialibrary.services.integration.yaacc.YaaccIntegrationAdapter
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.doAnswer
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever

class UnifiedIntegrationProviderArchitectureTest {

    private lateinit var mockExternalMediaEntityDao: ExternalMediaEntityDao
    private val entityStorage = mutableListOf<ExternalMediaEntity>()

    @Before
    fun setUp() = runBlocking {
        entityStorage.clear()
        mockExternalMediaEntityDao = mock()

        whenever(mockExternalMediaEntityDao.insertEntity(any())).doAnswer { invocation ->
            val entity = invocation.getArgument<ExternalMediaEntity>(0)
            entityStorage.removeAll { it.providerId == entity.providerId && it.externalId == entity.externalId }
            entityStorage.add(entity)
            entityStorage.size.toLong()
        }

        whenever(mockExternalMediaEntityDao.insertEntities(any())).doAnswer { invocation ->
            val list = invocation.getArgument<List<ExternalMediaEntity>>(0)
            list.map { entity ->
                entityStorage.removeAll { it.providerId == entity.providerId && it.externalId == entity.externalId }
                entityStorage.add(entity)
                entityStorage.size.toLong()
            }
        }

        whenever(mockExternalMediaEntityDao.getEntitiesByProvider(any())).doAnswer { invocation ->
            val provider = invocation.getArgument<String>(0)
            entityStorage.filter { it.providerId == provider }
        }

        whenever(mockExternalMediaEntityDao.getByProviderAndExternalId(any(), any())).doAnswer { invocation ->
            val provider = invocation.getArgument<String>(0)
            val extId = invocation.getArgument<String>(1)
            entityStorage.firstOrNull { it.providerId == provider && it.externalId == extId }
        }

        whenever(mockExternalMediaEntityDao.searchEntities(any(), any())).doAnswer { invocation ->
            val q = invocation.getArgument<String>(0)
            entityStorage.filter {
                it.title.contains(q, ignoreCase = true) ||
                (it.creator?.contains(q, ignoreCase = true) == true)
            }
        }
    }

    @Test
    fun `test Calibre bi-directional progress and tag sync`() = runBlocking {
        val calibreService = CalibreIntegrationService(mock(), mock(), mockExternalMediaEntityDao)

        // Connect
        val connected = calibreService.connect(mapOf("serverUrl" to "http://192.168.1.100:8080"))
        assertTrue(connected)

        // Sync
        val syncResult = calibreService.sync()
        assertTrue(syncResult.success)
        assertTrue(syncResult.itemsProcessed > 0)

        // Test bi-directional progress update
        val updated = calibreService.syncReadingProgressToCalibre("calibre_1", 0.55f)
        assertTrue(updated)

        val fetchedProgress = calibreService.syncReadingProgressFromCalibre("calibre_1")
        assertEquals(0.55f, fetchedProgress, 0.01f)

        // Test metadata & tag update
        val metaUpdated = calibreService.syncMetadataAndTags("calibre_1", "New Title", "New Author", listOf("SciFi", "Favorite"))
        assertTrue(metaUpdated)

        val entity = calibreService.fetchEntities().first { it.externalId == "calibre_1" }
        assertEquals("New Title", entity.title)
        assertEquals("New Author", entity.creator)
        assertTrue(entity.tags?.contains("SciFi") == true)
    }

    @Test
    fun `test Jellyfin, Emby, and YAACC providers implementation`() = runBlocking {
        val jellyfinService = JellyfinIntegrationService(mockExternalMediaEntityDao)
        val embyService = EmbyIntegrationService(mockExternalMediaEntityDao)
        val yaaccAdapter = YaaccIntegrationAdapter(mock(), mockExternalMediaEntityDao)

        assertEquals("jellyfin", jellyfinService.providerId)
        assertEquals("emby", embyService.providerId)
        assertEquals("yaacc", yaaccAdapter.providerId)

        assertTrue(jellyfinService.connect(mapOf("serverUrl" to "http://jellyfin.local")))
        assertTrue(embyService.connect(mapOf("serverUrl" to "http://emby.local")))

        val jSync = jellyfinService.sync()
        val eSync = embyService.sync()

        assertTrue(jSync.success)
        assertTrue(eSync.success)

        val jEntities = jellyfinService.fetchEntities()
        val eEntities = embyService.fetchEntities()

        assertEquals(1, jEntities.size)
        assertEquals(1, eEntities.size)
    }

    @Test
    fun `test Poweramp connector fallback behavior when app missing`() = runBlocking {
        val powerampAdapter = PowerampIntegrationAdapter(mock(), mockExternalMediaEntityDao)

        assertEquals("poweramp", powerampAdapter.providerId)
        assertFalse(powerampAdapter.isPowerampInstalled())
        assertFalse(powerampAdapter.playPause())

        val syncResult = powerampAdapter.sync()
        assertFalse(syncResult.success)
        assertTrue(syncResult.message.contains("not installed"))
    }
}
