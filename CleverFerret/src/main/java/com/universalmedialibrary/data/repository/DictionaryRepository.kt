package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.DictionaryDao
import com.universalmedialibrary.data.local.entity.DictionaryEntry
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class DictionaryRepository @Inject constructor(
    private val dictionaryDao: DictionaryDao
) {

    fun getGlobalDictionary(): Flow<List<DictionaryEntry>> = dictionaryDao.getGlobalDictionary()

    fun getBookDictionary(bookId: Long): Flow<List<DictionaryEntry>> = dictionaryDao.getBookDictionary(bookId)

    suspend fun getApplicableDictionary(bookId: Long): List<DictionaryEntry> {
        return dictionaryDao.getAllApplicableEntries(bookId)
    }

    suspend fun addEntry(word: String, replacement: String? = null, definition: String? = null, bookId: Long? = null) {
        val entry = DictionaryEntry(
            word = word,
            replacement = replacement,
            definition = definition,
            bookId = bookId
        )
        dictionaryDao.insert(entry)
    }

    suspend fun addWhitelistWord(word: String, bookId: Long? = null) {
        addEntry(word = word, replacement = null, bookId = bookId)
    }

    suspend fun addCorrection(typo: String, correct: String, bookId: Long? = null) {
        addEntry(word = typo, replacement = correct, bookId = bookId)
    }
    
    suspend fun importDictionary(entries: List<DictionaryEntry>) {
        dictionaryDao.insertAll(entries)
    }
}
