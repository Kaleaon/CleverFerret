package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import kotlinx.coroutines.flow.Flow

@Dao
interface EmbyServerDao {
    @Query("SELECT * FROM emby_servers ORDER BY name ASC")
    fun getAll(): Flow<List<EmbyServer>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(server: EmbyServer): Long

    @Update
    suspend fun update(server: EmbyServer)

    @Delete
    suspend fun delete(server: EmbyServer)
}

@Dao
interface JellyfinServerDao {
    @Query("SELECT * FROM jellyfin_servers ORDER BY name ASC")
    fun getAll(): Flow<List<JellyfinServer>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(server: JellyfinServer): Long

    @Update
    suspend fun update(server: JellyfinServer)

    @Delete
    suspend fun delete(server: JellyfinServer)
}

