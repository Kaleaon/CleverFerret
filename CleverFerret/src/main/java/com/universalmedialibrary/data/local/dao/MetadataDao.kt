package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.model.MetadataCommon

@Dao
interface MetadataDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMetadataCommon(metadataCommon: MetadataCommon)

    @Update
    suspend fun updateMetadata(metadataCommon: MetadataCommon)

    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getMetadataCommonByItemId(itemId: Long): MetadataCommon?

    // Methods for updating metadata
    @Query("UPDATE metadata_common SET title = :title, sortTitle = :sortTitle, summary = :summary, rating = :rating WHERE itemId = :itemId")
    suspend fun updateMetadataCommon(itemId: Long, title: String, sortTitle: String?, summary: String?, rating: Float?)
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCommonMetadata(metadata: MetadataCommon)
}
