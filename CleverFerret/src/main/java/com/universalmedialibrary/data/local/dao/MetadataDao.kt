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

    // Additional methods expected by MediaRepository
    @Query("SELECT * FROM metadata_common WHERE itemId = :itemId")
    suspend fun getCommonMetadata(itemId: Long): MetadataCommon?

    @Query("SELECT * FROM metadata_common WHERE title LIKE '%' || :query || '%' OR summary LIKE '%' || :query || '%'")
    suspend fun searchByTitle(query: String): List<MetadataCommon>

    // Additional method for MediaRepository
    @Query("UPDATE metadata_common SET title = :title, summary = :summary WHERE itemId = :itemId")
    suspend fun updateCommonMetadata(itemId: Long, title: String, summary: String?)

    // Person operations
    @Query("SELECT personId FROM people WHERE name = :name LIMIT 1")
    suspend fun findPersonByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertPerson(person: People): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemPersonRole(itemPersonRole: ItemPersonRole)

    // Series operations
    @Query("SELECT seriesId FROM series WHERE name = :name LIMIT 1")
    suspend fun findSeriesByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSeries(series: Series): Long

    @Query("UPDATE metadata_book SET series = :seriesId WHERE itemId = :itemId")
    suspend fun updateBookWithSeries(itemId: Long, seriesId: Long)

    // Genre operations
    @Query("SELECT genreId FROM genre WHERE name = :name LIMIT 1")
    suspend fun findGenreByName(name: String): Long?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertGenre(genre: Genre): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertItemGenre(itemGenre: ItemGenre)
}
