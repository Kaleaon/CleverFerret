package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.LibraryScanSettings
import kotlinx.coroutines.flow.Flow

@Dao
interface LibraryScanSettingsDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsert(settings: LibraryScanSettings)

    @Update
    suspend fun update(settings: LibraryScanSettings)

    @Query("SELECT * FROM library_scan_settings WHERE libraryId = :libraryId LIMIT 1")
    suspend fun getSettings(libraryId: Long): LibraryScanSettings?

    @Query("SELECT * FROM library_scan_settings WHERE libraryId = :libraryId LIMIT 1")
    fun observeSettings(libraryId: Long): Flow<LibraryScanSettings?>

    @Query("DELETE FROM library_scan_settings WHERE libraryId = :libraryId")
    suspend fun deleteForLibrary(libraryId: Long)
}
