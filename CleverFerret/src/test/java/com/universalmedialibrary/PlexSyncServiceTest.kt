package com.universalmedialibrary

import org.junit.Test
import org.junit.Assert.*

/**
 * Unit tests for Plex sync functionality
 */
class PlexSyncServiceTest {
    
    @Test
    fun `PlexSyncStatus should have correct types`() {
        // Test that our sealed class structure is correct
        val idleStatus = com.universalmedialibrary.services.plex.PlexSyncStatus.Idle
        val syncingStatus = com.universalmedialibrary.services.plex.PlexSyncStatus.Syncing("Test")
        val successStatus = com.universalmedialibrary.services.plex.PlexSyncStatus.Success("Test")
        val errorStatus = com.universalmedialibrary.services.plex.PlexSyncStatus.Error("Test")
        
        assertNotNull(idleStatus)
        assertEquals("Test", syncingStatus.message)
        assertEquals("Test", successStatus.message)
        assertEquals("Test", errorStatus.message)
    }
    
    @Test
    fun `PlexServer entity should have proper default values`() {
        val server = com.universalmedialibrary.data.local.entity.PlexServer(
            name = "Test Server",
            host = "localhost",
            token = "test-token"
        )
        
        assertEquals("Test Server", server.name)
        assertEquals("localhost", server.host)
        assertEquals(32400, server.port) // Default port
        assertEquals("test-token", server.token)
        assertTrue(server.isActive) // Default active state
    }
    
    @Test
    fun `PlexProgress entity should handle progress tracking`() {
        val progress = com.universalmedialibrary.data.local.entity.PlexProgress(
            plexMediaItemId = 1L,
            localProgress = 5000L,
            plexProgress = 3000L,
            needsSync = true
        )
        
        assertEquals(1L, progress.plexMediaItemId)
        assertEquals(5000L, progress.localProgress)
        assertEquals(3000L, progress.plexProgress)
        assertTrue(progress.needsSync)
    }
    
    @Test
    fun `PlexRating entity should handle rating sync`() {
        val rating = com.universalmedialibrary.data.local.entity.PlexRating(
            plexMediaItemId = 1L,
            localRating = 8.5f,
            plexRating = 7.0f,
            needsSync = true
        )
        
        assertEquals(1L, rating.plexMediaItemId)
        assertEquals(8.5f, rating.localRating!!, 0.01f)
        assertEquals(7.0f, rating.plexRating!!, 0.01f)
        assertTrue(rating.needsSync)
    }
}