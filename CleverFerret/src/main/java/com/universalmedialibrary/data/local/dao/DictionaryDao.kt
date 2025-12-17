package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.universalmedialibrary.data.local.entity.DictionaryEntry
import kotlinx.coroutines.flow.Flow

@Dao
interface DictionaryDao {

    @Query("SELECT * FROM dictionary_entries WHERE bookId IS NULL ORDER BY word ASC")
    fun getGlobalDictionary(): Flow<List<DictionaryEntry>>

    @Query("SELECT * FROM dictionary_entries WHERE bookId = :bookId ORDER BY word ASC")
    fun getBookDictionary(bookId: Long): Flow<List<DictionaryEntry>>

    @Query("SELECT * FROM dictionary_entries WHERE bookId IS NULL OR bookId = :bookId")
    suspend fun getAllApplicableEntries(bookId: Long): List<DictionaryEntry>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(entry: DictionaryEntry)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(entries: List<DictionaryEntry>)

    @Delete
    suspend fun delete(entry: DictionaryEntry)

    @Query("DELETE FROM dictionary_entries WHERE bookId = :bookId")
    suspend fun clearBookDictionary(bookId: Long)
    
    @Query("SELECT * FROM dictionary_entries WHERE word = :word LIMIT 1")
    suspend fun getEntry(word: String): DictionaryEntry?
}
