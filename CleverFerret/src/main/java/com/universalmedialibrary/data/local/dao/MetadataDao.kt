package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.*

@Dao
interface MetadataDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataCommon(metadataCommon: MetadataCommon)

    @Update
    suspend fun updateMetadata(metadataCommon: MetadataCommon)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataBook(metadataBook: MetadataBook)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMovie(metadataMovie: MetadataMovie)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataMusicTrack(metadataMusicTrack: MetadataMusicTrack)

    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getMetadataCommonByItemId(itemId: Long): MetadataCommon?

    @Query("SELECT * FROM metadata_book WHERE itemId = :itemId")
    suspend fun getMetadataBookByItemId(itemId: Long): MetadataBook?

    @Query("SELECT * FROM metadata_movie WHERE itemId = :itemId")
    suspend fun getMetadataMovieByItemId(itemId: Long): MetadataMovie?

    @Query("SELECT * FROM metadata_music_track WHERE itemId = :itemId")
    suspend fun getMetadataMusicTrackByItemId(itemId: Long): MetadataMusicTrack?

    // Basic metadata operations
    @Query("UPDATE metadata_common SET title = :title, summary = :summary WHERE itemId = :itemId")
    suspend fun updateMetadataCommon(itemId: Long, title: String, summary: String?)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadata(metadata: MetadataCommon)
}
