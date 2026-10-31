package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.CustomFontEntity
import kotlinx.coroutines.flow.Flow

/**
 * Data Access Object for custom imported fonts.
 */
@Dao
interface CustomFontDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCustomFont(font: CustomFontEntity)

    @Query("SELECT * FROM custom_fonts ORDER BY displayName ASC")
    fun getAllCustomFontsFlow(): Flow<List<CustomFontEntity>>

    @Query("SELECT * FROM custom_fonts ORDER BY displayName ASC")
    suspend fun getAllCustomFontsList(): List<CustomFontEntity>

    @Query("SELECT * FROM custom_fonts WHERE id = :id")
    suspend fun getCustomFontById(id: String): CustomFontEntity?

    @Delete
    suspend fun deleteCustomFont(font: CustomFontEntity)

    @Query("DELETE FROM custom_fonts WHERE id = :id")
    suspend fun deleteCustomFontById(id: String)
}
