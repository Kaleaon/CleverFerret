package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.RadioStation
import kotlinx.coroutines.flow.Flow

/**
 * DAO for radio station operations
 */
@Dao
interface RadioStationDao {
    
    @Query("SELECT * FROM radio_stations ORDER BY customOrder ASC, name ASC")
    fun getAllStations(): Flow<List<RadioStation>>
    
    @Query("SELECT * FROM radio_stations WHERE id = :id")
    fun getStationById(id: Long): Flow<RadioStation?>
    
    @Query("SELECT * FROM radio_stations WHERE isFavorite = 1 ORDER BY name ASC")
    fun getFavoriteStations(): Flow<List<RadioStation>>
    
    @Query("SELECT * FROM radio_stations WHERE genre = :genre ORDER BY name ASC")
    fun getStationsByGenre(genre: String): Flow<List<RadioStation>>
    
    @Query("SELECT DISTINCT genre FROM radio_stations WHERE genre IS NOT NULL ORDER BY genre ASC")
    fun getAllGenres(): Flow<List<String>>
    
    @Query("SELECT * FROM radio_stations WHERE name LIKE '%' || :query || '%' OR description LIKE '%' || :query || '%'")
    fun searchStations(query: String): Flow<List<RadioStation>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStation(station: RadioStation): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertStations(stations: List<RadioStation>)
    
    @Update
    suspend fun updateStation(station: RadioStation)
    
    @Delete
    suspend fun deleteStation(station: RadioStation)
    
    @Query("DELETE FROM radio_stations WHERE id = :id")
    suspend fun deleteStationById(id: Long)
    
    @Query("UPDATE radio_stations SET isFavorite = :favorite WHERE id = :id")
    suspend fun updateFavoriteStatus(id: Long, favorite: Boolean)
    
    @Query("UPDATE radio_stations SET lastPlayedAt = :timestamp, playCount = playCount + 1 WHERE id = :id")
    suspend fun recordPlay(id: Long, timestamp: Long)
    
    @Query("SELECT * FROM radio_stations ORDER BY lastPlayedAt DESC NULLS LAST LIMIT :limit")
    fun getRecentlyPlayed(limit: Int = 10): Flow<List<RadioStation>>
    
    @Query("SELECT * FROM radio_stations ORDER BY playCount DESC LIMIT :limit")
    fun getMostPlayed(limit: Int = 10): Flow<List<RadioStation>>
}