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

    @Query("SELECT * FROM radio_stations WHERE id = :id LIMIT 1")
    suspend fun getStationByIdDirect(id: Long): RadioStation?

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

    /**
     * Records a play for the station by setting its last played timestamp and incrementing its play count.
     *
     * @param id The station's database id.
     * @param timestamp The timestamp to set as the station's last played time (milliseconds since Unix epoch).
     */
    @Query("UPDATE radio_stations SET lastPlayedAt = :timestamp, playCount = playCount + 1 WHERE id = :id")
    suspend fun recordPlay(id: Long, timestamp: Long)

    /**
     * Provides radio stations ordered by most recent play time, with stations that have never been played appearing last.
     *
     * @param limit The maximum number of stations to return (default is 10).
     * @return A list of radio stations limited to the specified count, ordered with most recently played first; stations with no play timestamp appear after played stations.
     */
    @Query("SELECT * FROM radio_stations ORDER BY CASE WHEN lastPlayedAt IS NULL THEN 1 ELSE 0 END, lastPlayedAt DESC LIMIT :limit")
    fun getRecentlyPlayed(limit: Int = 10): Flow<List<RadioStation>>

    /**
     * Retrieves the top radio stations by play count, most-played first.
     *
     * @param limit Maximum number of stations to return; defaults to 10.
     * @return A list of radio stations ordered by `playCount` descending, limited to `limit`.
     */
    @Query("SELECT * FROM radio_stations ORDER BY playCount DESC LIMIT :limit")
    fun getMostPlayed(limit: Int = 10): Flow<List<RadioStation>>
}