package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.EmbyServerDao
import com.universalmedialibrary.data.local.dao.JellyfinServerDao
import com.universalmedialibrary.data.local.dao.PlexServerDao
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.services.integration.api.ApiManager
import com.universalmedialibrary.services.integration.jellyfin.JellyfinClient
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for managing media server configurations and operations
 * Provides unified access to Jellyfin, Plex, and Emby servers
 */
@Singleton
class MediaServerRepository @Inject constructor(
    private val jellyfinServerDao: JellyfinServerDao,
    private val plexServerDao: PlexServerDao,
    private val embyServerDao: EmbyServerDao,
    private val jellyfinClient: JellyfinClient,
    private val apiManager: ApiManager
) {
    
    // Jellyfin Operations
    
    fun getAllJellyfinServers(): Flow<List<JellyfinServer>> {
        return jellyfinServerDao.getAll()
    }
    
    suspend fun getJellyfinServerById(id: Long): JellyfinServer? {
        return jellyfinServerDao.getById(id)
    }
    
    suspend fun insertJellyfinServer(server: JellyfinServer): Long {
        return jellyfinServerDao.insert(server)
    }
    
    suspend fun updateJellyfinServer(server: JellyfinServer) {
        jellyfinServerDao.update(server)
    }
    
    suspend fun deleteJellyfinServer(server: JellyfinServer) {
        jellyfinServerDao.delete(server)
    }
    
    suspend fun deleteJellyfinServerById(id: Long) {
        jellyfinServerDao.deleteById(id)
    }
    
    suspend fun testJellyfinConnection(server: JellyfinServer): Result<String> {
        return jellyfinClient.authenticate(server.url, server.username, server.password)
    }
    
    // Plex Operations
    
    fun getAllPlexServers(): Flow<List<PlexServer>> {
        return plexServerDao.getAll()
    }
    
    suspend fun getPlexServerById(id: Long): PlexServer? {
        return plexServerDao.getById(id)
    }
    
    suspend fun insertPlexServer(server: PlexServer): Long {
        return plexServerDao.insert(server)
    }
    
    suspend fun updatePlexServer(server: PlexServer) {
        plexServerDao.update(server)
    }
    
    suspend fun deletePlexServer(server: PlexServer) {
        plexServerDao.delete(server)
    }
    
    suspend fun deletePlexServerById(id: Long) {
        plexServerDao.deleteById(id)
    }
    
    suspend fun testPlexConnection(server: PlexServer): Result<Unit> {
        return try {
            val api = apiManager.createPlexApi(server.url, server.token)
            api.getServerInfo()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    // Emby Operations
    
    fun getAllEmbyServers(): Flow<List<EmbyServer>> {
        return embyServerDao.getAll()
    }
    
    suspend fun getEmbyServerById(id: Long): EmbyServer? {
        return embyServerDao.getById(id)
    }
    
    suspend fun insertEmbyServer(server: EmbyServer): Long {
        return embyServerDao.insert(server)
    }
    
    suspend fun updateEmbyServer(server: EmbyServer) {
        embyServerDao.update(server)
    }
    
    suspend fun deleteEmbyServer(server: EmbyServer) {
        embyServerDao.delete(server)
    }
    
    suspend fun deleteEmbyServerById(id: Long) {
        embyServerDao.deleteById(id)
    }
    
    suspend fun testEmbyConnection(server: EmbyServer): Result<Unit> {
        return try {
            val api = apiManager.createEmbyApi(server.url, server.apiKey ?: "")
            api.getServerInfo()
            Result.success(Unit)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    // Unified Operations
    
    suspend fun getServerCount(): Int {
        return jellyfinServerDao.getServerCount() +
               plexServerDao.getServerCount() +
               embyServerDao.getServerCount()
    }
}