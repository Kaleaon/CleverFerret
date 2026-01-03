package com.universalmedialibrary.services.ai

import android.content.Context
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.ReadingProgressDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service that allows AI to browse and access the user's media library.
 * Provides read-only access to books, movies, music, comics, and other media.
 */
@Singleton
class AILibraryBrowserService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val readingProgressDao: ReadingProgressDao
) {
    
    /**
     * Browse the library with optional filters
     */
    suspend fun browseLibrary(
        mediaType: String? = null,
        searchQuery: String? = null,
        limit: Int = 20,
        offset: Int = 0
    ): List<LibraryBrowseItem> = withContext(Dispatchers.IO) {
        try {
            val items = when {
                !searchQuery.isNullOrBlank() && !mediaType.isNullOrBlank() && mediaType != "ALL" -> {
                    mediaItemDao.searchByTypeAndQuery(mediaType, "%$searchQuery%", limit, offset)
                }
                !searchQuery.isNullOrBlank() -> {
                    mediaItemDao.searchByQuery("%$searchQuery%", limit, offset)
                }
                !mediaType.isNullOrBlank() && mediaType != "ALL" -> {
                    mediaItemDao.getByType(mediaType, limit, offset)
                }
                else -> {
                    mediaItemDao.getRecentItems(limit, offset)
                }
            }
            
            items.mapNotNull { item ->
                convertToLibraryBrowseItem(item)
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get detailed information about a specific library item
     */
    suspend fun getLibraryItemDetails(itemId: Long): LibraryItemDetails? = withContext(Dispatchers.IO) {
        try {
            val item = mediaItemDao.getMediaItemById(itemId) ?: return@withContext null
            val metadata = metadataDao.getCommonMetadataByItemId(itemId)
            val genres = metadataDao.getGenresForItem(itemId)
            val people = metadataDao.getPeopleForItem(itemId)
            
            val progress = when (item.mediaType) {
                "BOOK", "COMIC" -> {
                    readingProgressDao.getProgressByItemIdSnapshot(itemId)?.let {
                        it.percentage / 100f  // Convert percentage (0-100) to 0-1 range
                    }
                }
                else -> null
            }
            
            LibraryItemDetails(
                id = item.itemId,
                title = metadata?.title ?: item.fileName,
                mediaType = item.mediaType,
                author = people.firstOrNull { it.role == "AUTHOR" || it.role == "ARTIST" }?.name,
                year = metadata?.year?.toString(),
                summary = metadata?.summary ?: metadata?.plot,
                genres = genres.map { it.name },
                rating = metadata?.rating?.toFloat(),
                userRating = metadata?.userRating?.toFloat(),
                progress = progress,
                filePath = item.filePath,
                fileSize = item.fileSize,
                dateAdded = item.dateAdded,
                lastAccessed = item.lastScanned,
                coverPath = metadata?.coverImagePath
            )
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Get reading progress for books
     */
    suspend fun getReadingProgress(bookId: Long? = null): List<ReadingProgressInfo> = withContext(Dispatchers.IO) {
        try {
            val progressList = if (bookId != null) {
                listOfNotNull(readingProgressDao.getProgressByItemIdSnapshot(bookId))
            } else {
                readingProgressDao.getAllProgressSnapshot()
            }
            
            progressList.mapNotNull { progress ->
                val item = mediaItemDao.getMediaItemById(progress.itemId)
                val metadata = metadataDao.getCommonMetadataByItemId(progress.itemId)
                
                if (item != null) {
                    ReadingProgressInfo(
                        bookId = item.itemId,
                        title = metadata?.title ?: item.fileName,
                        progressPercent = progress.percentage.toInt(),
                        currentPage = progress.currentPage,
                        totalPages = if (progress.percentage > 1.0f) (progress.currentPage / (progress.percentage / 100f)).toInt() else 0,
                        lastRead = progress.lastUpdate
                    )
                } else null
            }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get library statistics
     */
    suspend fun getLibraryStats(): LibraryStats = withContext(Dispatchers.IO) {
        try {
            val bookCount = mediaItemDao.getCountByType("BOOK")
            val movieCount = mediaItemDao.getCountByType("MOVIE")
            val musicCount = mediaItemDao.getCountByType("MUSIC")
            val comicCount = mediaItemDao.getCountByType("COMIC")
            
            val recentItems = mediaItemDao.getRecentItems(5, 0)
            val inProgressBooks = readingProgressDao.getInProgressCount()
            
            LibraryStats(
                totalBooks = bookCount,
                totalMovies = movieCount,
                totalMusic = musicCount,
                totalComics = comicCount,
                booksInProgress = inProgressBooks,
                recentAdditions = recentItems.mapNotNull { item ->
                    val meta = metadataDao.getCommonMetadataByItemId(item.itemId)
                    meta?.title ?: item.fileName
                }
            )
        } catch (e: Exception) {
            LibraryStats()
        }
    }
    
    /**
     * Get content recommendations based on user's library
     */
    suspend fun getRecommendations(
        mediaType: String? = null,
        basedOn: String = "recent"
    ): List<RecommendationItem> = withContext(Dispatchers.IO) {
        try {
            val recommendations = mutableListOf<RecommendationItem>()
            
            // Get user's library data for analysis
            val allItems = mediaItemDao.getRecentItems(100, 0)
            val genreCounts = mutableMapOf<String, Int>()
            val authorCounts = mutableMapOf<String, Int>()
            
            for (item in allItems) {
                if (mediaType != null && item.mediaType != mediaType) continue
                
                val genres = metadataDao.getGenresForItem(item.itemId)
                genres.forEach { genre ->
                    genreCounts[genre.name] = (genreCounts[genre.name] ?: 0) + 1
                }
                
                val people = metadataDao.getPeopleForItem(item.itemId)
                people.filter { it.role == "AUTHOR" || it.role == "ARTIST" }.forEach { person ->
                    authorCounts[person.name] = (authorCounts[person.name] ?: 0) + 1
                }
            }
            
            // Get top genres and authors
            val topGenres = genreCounts.entries.sortedByDescending { it.value }.take(3).map { it.key }
            val topAuthors = authorCounts.entries.sortedByDescending { it.value }.take(3).map { it.key }
            
            // Find items in the library that match top preferences but haven't been read/watched
            if (basedOn == "favorites" || basedOn == "genre") {
                for (genre in topGenres) {
                    val items = mediaItemDao.getByGenre(genre, 5, 0)
                    items.forEach { item ->
                        val progress = readingProgressDao.getProgressByItemIdSnapshot(item.itemId)
                        if (progress == null || progress.percentage == 0f) {
                            val meta = metadataDao.getCommonMetadataByItemId(item.itemId)
                            val people = metadataDao.getPeopleForItem(item.itemId)
                            recommendations.add(RecommendationItem(
                                title = meta?.title ?: item.fileName,
                                author = people.firstOrNull()?.name,
                                mediaType = item.mediaType,
                                reason = "Based on your interest in $genre"
                            ))
                        }
                    }
                }
            }
            
            // Recommend unread items from favorite authors
            if (basedOn == "favorites" || basedOn == "recent") {
                for (author in topAuthors) {
                    val items = mediaItemDao.getByAuthor(author, 3, 0)
                    items.forEach { item ->
                        val progress = readingProgressDao.getProgressByItemIdSnapshot(item.itemId)
                        if (progress == null || progress.percentage == 0f) {
                            val meta = metadataDao.getCommonMetadataByItemId(item.itemId)
                            if (recommendations.none { it.title == (meta?.title ?: item.fileName) }) {
                                recommendations.add(RecommendationItem(
                                    title = meta?.title ?: item.fileName,
                                    author = author,
                                    mediaType = item.mediaType,
                                    reason = "More from $author, an author you enjoy"
                                ))
                            }
                        }
                    }
                }
            }
            
            // If not enough recommendations, suggest highly rated items
            if (recommendations.size < 5) {
                val ratedItems = mediaItemDao.getHighlyRated(mediaType, 5 - recommendations.size, 0)
                ratedItems.forEach { item ->
                    val meta = metadataDao.getCommonMetadataByItemId(item.itemId)
                    val people = metadataDao.getPeopleForItem(item.itemId)
                    if (recommendations.none { it.title == (meta?.title ?: item.fileName) }) {
                        recommendations.add(RecommendationItem(
                            title = meta?.title ?: item.fileName,
                            author = people.firstOrNull()?.name,
                            mediaType = item.mediaType,
                            reason = "Highly rated in your library"
                        ))
                    }
                }
            }
            
            recommendations.distinctBy { it.title }.take(10)
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get items by author/artist
     */
    suspend fun getItemsByAuthor(author: String, limit: Int = 20): List<LibraryBrowseItem> = withContext(Dispatchers.IO) {
        try {
            val items = mediaItemDao.getByAuthor(author, limit, 0)
            items.mapNotNull { convertToLibraryBrowseItem(it) }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get items by genre
     */
    suspend fun getItemsByGenre(genre: String, limit: Int = 20): List<LibraryBrowseItem> = withContext(Dispatchers.IO) {
        try {
            val items = mediaItemDao.getByGenre(genre, limit, 0)
            items.mapNotNull { convertToLibraryBrowseItem(it) }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get recently added items
     */
    suspend fun getRecentlyAdded(limit: Int = 10): List<LibraryBrowseItem> = withContext(Dispatchers.IO) {
        try {
            val items = mediaItemDao.getRecentItems(limit, 0)
            items.mapNotNull { convertToLibraryBrowseItem(it) }
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get all unique authors in the library
     */
    suspend fun getAllAuthors(): List<String> = withContext(Dispatchers.IO) {
        try {
            metadataDao.getAllAuthors()
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get all unique genres in the library
     */
    suspend fun getAllGenres(): List<String> = withContext(Dispatchers.IO) {
        try {
            metadataDao.getAllGenreNames()
        } catch (e: Exception) {
            emptyList()
        }
    }
    
    /**
     * Get series information
     */
    suspend fun getSeriesInfo(seriesName: String): SeriesInfo? = withContext(Dispatchers.IO) {
        try {
            val series = metadataDao.getSeriesByName(seriesName) ?: return@withContext null
            val items = mediaItemDao.getBySeries(series.seriesId, 100, 0)
            
            SeriesInfo(
                name = series.name,
                itemCount = items.size,
                items = items.mapNotNull { item ->
                    val meta = metadataDao.getCommonMetadataByItemId(item.itemId)
                    LibraryBrowseItem(
                        id = item.itemId,
                        title = meta?.title ?: item.fileName,
                        mediaType = item.mediaType,
                        author = null,
                        year = meta?.year?.toString(),
                        hasProgress = readingProgressDao.getProgressByItemIdSnapshot(item.itemId) != null
                    )
                }
            )
        } catch (e: Exception) {
            null
        }
    }
    
    private suspend fun convertToLibraryBrowseItem(item: MediaItem): LibraryBrowseItem? {
        return try {
            val metadata = metadataDao.getCommonMetadataByItemId(item.itemId)
            val people = metadataDao.getPeopleForItem(item.itemId)
            val hasProgress = readingProgressDao.getProgressByItemIdSnapshot(item.itemId) != null
            
            LibraryBrowseItem(
                id = item.itemId,
                title = metadata?.title ?: item.fileName.substringBeforeLast('.'),
                mediaType = item.mediaType,
                author = people.firstOrNull { it.role == "AUTHOR" || it.role == "ARTIST" }?.name,
                year = metadata?.year?.toString(),
                hasProgress = hasProgress
            )
        } catch (e: Exception) {
            null
        }
    }
}

// ==================== Data Classes ====================

data class LibraryBrowseItem(
    val id: Long,
    val title: String,
    val mediaType: String,
    val author: String?,
    val year: String?,
    val hasProgress: Boolean
)

data class LibraryItemDetails(
    val id: Long,
    val title: String,
    val mediaType: String,
    val author: String?,
    val year: String?,
    val summary: String?,
    val genres: List<String>,
    val rating: Float?,
    val userRating: Float?,
    val progress: Float?,
    val filePath: String,
    val fileSize: Long,
    val dateAdded: Long,
    val lastAccessed: Long,
    val coverPath: String?
)

data class ReadingProgressInfo(
    val bookId: Long,
    val title: String,
    val progressPercent: Int,
    val currentPage: Int,
    val totalPages: Int,
    val lastRead: Long
)

data class LibraryStats(
    val totalBooks: Int = 0,
    val totalMovies: Int = 0,
    val totalMusic: Int = 0,
    val totalComics: Int = 0,
    val booksInProgress: Int = 0,
    val recentAdditions: List<String> = emptyList()
)

data class RecommendationItem(
    val title: String,
    val author: String?,
    val mediaType: String,
    val reason: String
)

data class SeriesInfo(
    val name: String,
    val itemCount: Int,
    val items: List<LibraryBrowseItem>
)
