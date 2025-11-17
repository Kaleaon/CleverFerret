package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.BookChapter
import kotlinx.coroutines.flow.Flow

@Dao
interface BookChapterDao {
    
    @Query("SELECT * FROM book_chapters WHERE bookId = :bookId ORDER BY chapterIndex ASC")
    fun getChaptersByBookId(bookId: Long): Flow<List<BookChapter>>
    
    @Query("SELECT * FROM book_chapters WHERE chapterId = :chapterId")
    suspend fun getChapterById(chapterId: Long): BookChapter?
    
    @Query("SELECT * FROM book_chapters WHERE bookId = :bookId AND chapterIndex = :index")
    suspend fun getChapterByIndex(bookId: Long, index: Int): BookChapter?
    
    @Query("SELECT * FROM book_chapters WHERE bookId = :bookId AND isRead = 0 ORDER BY chapterIndex ASC LIMIT 1")
    suspend fun getNextUnreadChapter(bookId: Long): BookChapter?
    
    @Query("SELECT * FROM book_chapters WHERE bookId = :bookId AND lastReadTime IS NOT NULL ORDER BY lastReadTime DESC LIMIT 1")
    suspend fun getLastReadChapter(bookId: Long): BookChapter?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertChapter(chapter: BookChapter): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertChapters(chapters: List<BookChapter>)
    
    @Update
    suspend fun updateChapter(chapter: BookChapter)
    
    @Delete
    suspend fun deleteChapter(chapter: BookChapter)
    
    @Query("DELETE FROM book_chapters WHERE bookId = :bookId")
    suspend fun deleteChaptersByBookId(bookId: Long)
    
    @Query("UPDATE book_chapters SET isRead = :isRead WHERE chapterId = :chapterId")
    suspend fun markChapterAsRead(chapterId: Long, isRead: Boolean)
    
    @Query("UPDATE book_chapters SET readProgress = :progress WHERE chapterId = :chapterId")
    suspend fun updateChapterProgress(chapterId: Long, progress: Float)
    
    @Query("UPDATE book_chapters SET content = :content, contentCached = 1 WHERE chapterId = :chapterId")
    suspend fun cacheChapterContent(chapterId: Long, content: String)
    
    @Query("SELECT COUNT(*) FROM book_chapters WHERE bookId = :bookId")
    suspend fun getChapterCount(bookId: Long): Int
    
    @Query("SELECT COUNT(*) FROM book_chapters WHERE bookId = :bookId AND isRead = 1")
    suspend fun getReadChapterCount(bookId: Long): Int
    
    @Query("SELECT SUM(wordCount) FROM book_chapters WHERE bookId = :bookId")
    suspend fun getTotalWordCount(bookId: Long): Int?
}