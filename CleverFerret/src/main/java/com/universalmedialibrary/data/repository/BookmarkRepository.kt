package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.BookmarkDao
import com.universalmedialibrary.data.local.entity.Bookmark
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for bookmark-related data operations
 */
@Singleton
class BookmarkRepository @Inject constructor(
    private val bookmarkDao: BookmarkDao
) {
    suspend fun getBookmarksForItem(itemId: Long): List<Bookmark> =
        bookmarkDao.getBookmarksByMediaItem(itemId)
    
    suspend fun getAllBookmarks(): List<Bookmark> =
        bookmarkDao.getAllBookmarks()
    
    suspend fun insertBookmark(bookmark: Bookmark): Long =
        bookmarkDao.insertBookmark(bookmark)
    
    suspend fun deleteBookmark(bookmarkId: Long) =
        bookmarkDao.deleteBookmark(bookmarkId)
    
    suspend fun deleteAllBookmarksForItem(itemId: Long) =
        bookmarkDao.deleteAllBookmarksForItem(itemId)
}
