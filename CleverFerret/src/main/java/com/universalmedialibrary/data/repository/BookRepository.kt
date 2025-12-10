package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for book-related data operations
 * Uses the unified MediaItem entity with mediaType filtering
 */
@Singleton
class BookRepository @Inject constructor(
    private val mediaItemDao: MediaItemDao
) {
    companion object {
        const val MEDIA_TYPE_BOOK = "BOOK"
        const val MEDIA_TYPE_EBOOK = "EBOOK"
    }
    
    fun getAllBooks(): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_BOOK)
    
    suspend fun getBookById(id: Long): MediaItem? = 
        mediaItemDao.getMediaItemById(id)
    
    fun getRecentlyAddedBooks(limit: Int = 10): Flow<List<MediaItem>> = 
        mediaItemDao.getMediaItemsByType(MEDIA_TYPE_BOOK).map { it.take(limit) }
    
    suspend fun searchBooks(query: String): List<MediaItem> = 
        mediaItemDao.searchMediaItems(query, 100)
            .filter { it.mediaType == MEDIA_TYPE_BOOK || it.mediaType == MEDIA_TYPE_EBOOK }
    
    suspend fun insertBook(book: MediaItem) = mediaItemDao.insertMediaItem(book)
    
    suspend fun updateBook(book: MediaItem) = mediaItemDao.updateMediaItem(book)
    
    suspend fun deleteBook(book: MediaItem) = mediaItemDao.deleteMediaItem(book)
    
    suspend fun getBookCount(): Int = mediaItemDao.getItemCountByType(MEDIA_TYPE_BOOK)
}
