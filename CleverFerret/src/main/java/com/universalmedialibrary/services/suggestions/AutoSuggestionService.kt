package com.universalmedialibrary.services.suggestions

import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.data.local.entity.*
import com.universalmedialibrary.data.repository.TagRepository
import com.universalmedialibrary.services.collections.SmartCollectionEngine
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for auto-suggesting playlists, book groupings, movie collections, etc.
 *
 * Uses intelligent analysis of:
 * - User listening/reading patterns
 * - Content metadata (genres, authors, series)
 * - Tags and their relationships
 * - Time-based patterns (recently added, in progress)
 */
@Singleton
class AutoSuggestionService @Inject constructor(
    private val smartCollectionEngine: SmartCollectionEngine,
    private val tagRepository: TagRepository,
    private val tagHierarchyDao: TagHierarchyDao,
    private val smartCollectionDao: SmartCollectionDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    // ==================== TAG SUGGESTIONS ====================

    /**
     * Get tag suggestions for a media item based on:
     * - Existing metadata (genre, author, series)
     * - Similar items' tags
     * - Tag hierarchy relationships
     */
    suspend fun suggestTagsForItem(itemId: Long): List<TagSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<TagSuggestion>()
        
        // Get item and its metadata
        val item = mediaItemDao.getMediaItemById(itemId) ?: return@withContext emptyList()
        val metadata = metadataDao.getMetadataCommonByItemId(itemId)
        
        // 1. Suggest tags based on genre
        // (Would query genres for this item and suggest matching tags)
        
        // 2. Suggest tags based on title keywords for books
        // Note: Creator would come from People table with AUTHOR role
        // For now, use title-based suggestions
        metadata?.title?.let { title ->
            // Extract keywords from title for tag suggestions
            val keywords = title.split(" ").filter { it.length > 3 }.take(2)
            for (keyword in keywords) {
                val matchingTags = tagRepository.searchTags(keyword).first()
                matchingTags.take(1).forEach { tag ->
                    suggestions.add(
                        TagSuggestion(
                            tag = tag,
                            reason = "Title keyword match",
                            confidence = 0.7f,
                            source = SuggestionSource.METADATA
                        )
                    )
                }
            }
        }
        
        // 3. Suggest tags used on similar items (by media type)
        val popularTags = tagRepository.getPopularTagsForMediaType(item.mediaType, limit = 5)
        popularTags.forEach { tag ->
            if (suggestions.none { it.tag.tagId == tag.tagId }) {
                suggestions.add(
                    TagSuggestion(
                        tag = tag,
                        reason = "Popular for ${item.mediaType.lowercase().replace("_", " ")}",
                        confidence = 0.6f,
                        source = SuggestionSource.POPULARITY
                    )
                )
            }
        }
        
        // 4. Suggest related tags based on any existing tags
        val existingTags = tagRepository.getTagsForItem(itemId).first()
        for (existingTag in existingTags.take(3)) {
            val relatedTags = tagHierarchyDao.getRelatedTags(existingTag.tagId, limit = 3)
            relatedTags.forEach { relatedTag ->
                if (suggestions.none { it.tag.tagId == relatedTag.tagId } &&
                    existingTags.none { it.tagId == relatedTag.tagId }) {
                    suggestions.add(
                        TagSuggestion(
                            tag = relatedTag,
                            reason = "Related to \"${existingTag.name}\"",
                            confidence = 0.7f,
                            source = SuggestionSource.RELATED
                        )
                    )
                }
            }
        }
        
        // Sort by confidence and limit
        suggestions.sortedByDescending { it.confidence }.take(10)
    }

    /**
     * Suggest tags while user is typing (autocomplete)
     */
    suspend fun getTagAutocomplete(
        query: String,
        currentTagIds: List<Long> = emptyList(),
        limit: Int = 5
    ): List<UnifiedTag> = withContext(Dispatchers.IO) {
        if (query.length < 2) return@withContext emptyList()
        
        // Search tags including synonyms
        val matchingTags = tagHierarchyDao.searchTagsWithSynonyms(query, limit * 2)
        
        // Filter out already selected tags
        matchingTags
            .filter { it.tagId !in currentTagIds }
            .take(limit)
    }

    /**
     * Suggest new tags to create based on metadata patterns
     */
    suspend fun suggestNewTags(): List<NewTagSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<NewTagSuggestion>()
        
        // Analyze metadata for common values that aren't tags yet
        // 1. Check for authors without corresponding tags
        val authorCounts = smartCollectionDao.getAuthorItemCounts(minItems = 3)
        for (author in authorCounts.take(5)) {
            val existingTag = tagRepository.getTagByName(author.creator)
            if (existingTag == null) {
                suggestions.add(
                    NewTagSuggestion(
                        suggestedName = author.creator,
                        suggestedType = TagType.AUTO_GENERATED,
                        reason = "Author with ${author.itemCount} items",
                        suggestedCategory = "Authors",
                        itemCount = author.itemCount
                    )
                )
            }
        }
        
        // 2. Check for series names without tags
        // (Would analyze book metadata for series)
        
        // 3. Check for genre patterns
        val genreCounts = smartCollectionDao.getGenreItemCounts(minItems = 5)
        for (genre in genreCounts.take(5)) {
            val existingTag = tagRepository.getTagByName(genre.genreName)
            if (existingTag == null) {
                suggestions.add(
                    NewTagSuggestion(
                        suggestedName = genre.genreName,
                        suggestedType = TagType.AUTO_GENERATED,
                        reason = "Genre with ${genre.itemCount} items",
                        suggestedCategory = "Genres",
                        itemCount = genre.itemCount
                    )
                )
            }
        }
        
        suggestions
    }

    // ==================== PLAYLIST SUGGESTIONS ====================

    /**
     * Suggest music playlists based on listening patterns
     */
    suspend fun suggestMusicPlaylists(): List<PlaylistSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<PlaylistSuggestion>()
        
        // 1. Recently played music
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
        val recentMusic = smartCollectionDao.getRecentlyAccessedItems(oneWeekAgo, 30)
            .filter { it.mediaType == "MUSIC_TRACK" }
        
        if (recentMusic.size >= 5) {
            suggestions.add(
                PlaylistSuggestion(
                    name = "Recently Played",
                    description = "Your most recently played tracks",
                    itemIds = recentMusic.map { it.itemId },
                    reason = "Based on your listening history",
                    confidence = 0.9f,
                    playlistType = PlaylistType.RECENT
                )
            )
        }
        
        // 2. Most played tracks
        val mostPlayed = smartCollectionDao.getMostPlayedItems(50)
            .filter { it.mediaType == "MUSIC_TRACK" }
        
        if (mostPlayed.size >= 5) {
            suggestions.add(
                PlaylistSuggestion(
                    name = "Your Top Tracks",
                    description = "Songs you play the most",
                    itemIds = mostPlayed.take(30).map { it.itemId },
                    reason = "Based on play counts",
                    confidence = 0.95f,
                    playlistType = PlaylistType.TOP_TRACKS
                )
            )
        }
        
        // 3. Favorite tracks
        val favorites = smartCollectionDao.getFavoriteItems().first()
            .filter { it.mediaType == "MUSIC_TRACK" }
        
        if (favorites.size >= 3) {
            suggestions.add(
                PlaylistSuggestion(
                    name = "Favorites",
                    description = "Your favorited tracks",
                    itemIds = favorites.map { it.itemId },
                    reason = "Tracks you've marked as favorites",
                    confidence = 0.95f,
                    playlistType = PlaylistType.FAVORITES
                )
            )
        }
        
        // 4. Genre-based playlists (would group by genre)
        
        suggestions
    }

    // ==================== BOOK GROUPING SUGGESTIONS ====================

    /**
     * Suggest book series groupings
     */
    suspend fun suggestBookSeries(): List<SeriesSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<SeriesSuggestion>()
        
        // Detect series based on title patterns
        val potentialSeriesBooks = smartCollectionDao.detectPotentialSeriesBooks()
        val seriesGroups = groupBooksBySeries(potentialSeriesBooks)
        
        for ((seriesName, books) in seriesGroups) {
            if (books.size >= 2) {
                suggestions.add(
                    SeriesSuggestion(
                        seriesName = seriesName,
                        books = books.map { it.itemId },
                        reason = "Detected ${books.size} books with similar titles",
                        confidence = calculateSeriesConfidence(books),
                        detectedPattern = detectSeriesPattern(seriesName, books)
                    )
                )
            }
        }
        
        suggestions.sortedByDescending { it.confidence }
    }

    /**
     * Suggest author-based book collections
     */
    suspend fun suggestAuthorCollections(): List<AuthorCollectionSuggestion> = withContext(Dispatchers.IO) {
        val authorCounts = smartCollectionDao.getAuthorItemCounts(minItems = 3)
        
        authorCounts.map { author ->
            val items = smartCollectionDao.getItemsByAuthor(author.creator).first()
            
            AuthorCollectionSuggestion(
                authorName = author.creator,
                bookCount = author.itemCount,
                bookIds = items.map { it.itemId },
                reason = "You have ${author.itemCount} books by ${author.creator}",
                confidence = when {
                    author.itemCount >= 10 -> 0.95f
                    author.itemCount >= 5 -> 0.85f
                    else -> 0.7f
                }
            )
        }
    }

    /**
     * Suggest reading lists based on user patterns
     */
    suspend fun suggestReadingLists(): List<ReadingListSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<ReadingListSuggestion>()
        
        // 1. Continue Reading
        val inProgress = smartCollectionDao.getInProgressItems().first()
            .filter { it.mediaType in listOf("BOOK", "AUDIOBOOK", "COMIC") }
        
        if (inProgress.isNotEmpty()) {
            suggestions.add(
                ReadingListSuggestion(
                    name = "Continue Reading",
                    itemIds = inProgress.map { it.itemId },
                    reason = "${inProgress.size} books you've started",
                    confidence = 0.9f,
                    listType = ReadingListType.IN_PROGRESS
                )
            )
        }
        
        // 2. Backlog (not started)
        val backlog = smartCollectionDao.getBacklogItems(50)
            .filter { it.mediaType in listOf("BOOK", "AUDIOBOOK", "COMIC") }
        
        if (backlog.size >= 3) {
            suggestions.add(
                ReadingListSuggestion(
                    name = "To Be Read",
                    itemIds = backlog.map { it.itemId },
                    reason = "${backlog.size} unread books in your library",
                    confidence = 0.85f,
                    listType = ReadingListType.BACKLOG
                )
            )
        }
        
        // 3. Recently added books
        val oneWeekAgo = System.currentTimeMillis() - (7 * 24 * 60 * 60 * 1000L)
        val recentBooks = smartCollectionDao.getRecentlyAddedItems(oneWeekAgo, 30)
            .filter { it.mediaType in listOf("BOOK", "AUDIOBOOK", "COMIC") }
        
        if (recentBooks.size >= 3) {
            suggestions.add(
                ReadingListSuggestion(
                    name = "New Arrivals",
                    itemIds = recentBooks.map { it.itemId },
                    reason = "Books added in the last week",
                    confidence = 0.8f,
                    listType = ReadingListType.RECENT
                )
            )
        }
        
        suggestions
    }

    // ==================== MOVIE/TV COLLECTION SUGGESTIONS ====================

    /**
     * Suggest movie collections (franchises, directors, genres)
     */
    suspend fun suggestMovieCollections(): List<MovieCollectionSuggestion> = withContext(Dispatchers.IO) {
        val suggestions = mutableListOf<MovieCollectionSuggestion>()
        
        // 1. Director-based collections
        // (Would query movies grouped by director)
        
        // 2. Genre-based collections
        val genreCounts = smartCollectionDao.getGenreItemCounts(minItems = 3)
        for (genre in genreCounts.filter { it.itemCount >= 5 }.take(5)) {
            suggestions.add(
                MovieCollectionSuggestion(
                    name = "${genre.genreName} Movies",
                    description = "Your ${genre.genreName.lowercase()} collection",
                    movieIds = emptyList(), // Would populate
                    reason = "${genre.itemCount} movies in this genre",
                    confidence = 0.8f,
                    collectionType = MovieCollectionType.GENRE
                )
            )
        }
        
        // 3. Year-based collections (decades)
        // (Would group by decade)
        
        // 4. Favorites
        val favorites = smartCollectionDao.getFavoriteItems().first()
            .filter { it.mediaType in listOf("MOVIE", "TV_SHOW") }
        
        if (favorites.size >= 3) {
            suggestions.add(
                MovieCollectionSuggestion(
                    name = "Favorite Films",
                    description = "Movies you've marked as favorites",
                    movieIds = favorites.map { it.itemId },
                    reason = "${favorites.size} favorite movies",
                    confidence = 0.95f,
                    collectionType = MovieCollectionType.FAVORITES
                )
            )
        }
        
        suggestions
    }

    // ==================== HELPER FUNCTIONS ====================

    private fun groupBooksBySeries(books: List<MediaItem>): Map<String, List<MediaItem>> {
        val seriesPatterns = listOf(
            Regex("""^(.+?)[\s:–-]+Book\s*\d""", RegexOption.IGNORE_CASE),
            Regex("""^(.+?)[\s:–-]+Vol(?:ume)?\.?\s*\d""", RegexOption.IGNORE_CASE),
            Regex("""^(.+?)[\s:–-]+#\d"""),
            Regex("""^(.+?)[\s:–-]+Part\s*\d""", RegexOption.IGNORE_CASE)
        )
        
        return books.groupBy { book ->
            val title = book.fileName.substringBeforeLast('.')
            for (pattern in seriesPatterns) {
                val match = pattern.find(title)
                if (match != null) {
                    return@groupBy match.groupValues[1].trim()
                }
            }
            title.split(" ").take(3).joinToString(" ")
        }.filter { it.value.size >= 2 }
    }

    private fun calculateSeriesConfidence(books: List<MediaItem>): Float {
        val baseConfidence = 0.5f
        val sizeBonus = minOf(books.size * 0.1f, 0.3f)
        return minOf(baseConfidence + sizeBonus, 1.0f)
    }

    private fun detectSeriesPattern(seriesName: String, books: List<MediaItem>): String {
        // Detect the pattern used (Book N, Vol N, #N, etc.)
        val titles = books.map { it.fileName.substringBeforeLast('.') }
        
        return when {
            titles.any { it.contains(Regex("""Book\s*\d""", RegexOption.IGNORE_CASE)) } -> "Book N"
            titles.any { it.contains(Regex("""Vol(?:ume)?\.?\s*\d""", RegexOption.IGNORE_CASE)) } -> "Volume N"
            titles.any { it.contains(Regex("""#\d""")) } -> "#N"
            titles.any { it.contains(Regex("""Part\s*\d""", RegexOption.IGNORE_CASE)) } -> "Part N"
            else -> "Unknown"
        }
    }

    // ==================== UNIFIED SUGGESTIONS ====================

    /**
     * Get all suggestions in one call
     */
    suspend fun getAllSuggestions(): AllSuggestions = withContext(Dispatchers.IO) {
        AllSuggestions(
            collectionSuggestions = smartCollectionEngine.generateSuggestions(),
            playlistSuggestions = suggestMusicPlaylists(),
            seriesSuggestions = suggestBookSeries(),
            authorCollections = suggestAuthorCollections(),
            readingLists = suggestReadingLists(),
            movieCollections = suggestMovieCollections()
        )
    }
}

// ==================== DATA CLASSES ====================

data class TagSuggestion(
    val tag: UnifiedTag,
    val reason: String,
    val confidence: Float,
    val source: SuggestionSource
)

enum class SuggestionSource {
    METADATA,
    POPULARITY,
    RELATED,
    SMART_RULE,
    USER_PATTERN
}

data class NewTagSuggestion(
    val suggestedName: String,
    val suggestedType: TagType,
    val reason: String,
    val suggestedCategory: String?,
    val itemCount: Int
)

data class PlaylistSuggestion(
    val name: String,
    val description: String,
    val itemIds: List<Long>,
    val reason: String,
    val confidence: Float,
    val playlistType: PlaylistType
)

enum class PlaylistType {
    RECENT,
    TOP_TRACKS,
    FAVORITES,
    GENRE,
    MOOD,
    ARTIST
}

data class SeriesSuggestion(
    val seriesName: String,
    val books: List<Long>,
    val reason: String,
    val confidence: Float,
    val detectedPattern: String
)

data class AuthorCollectionSuggestion(
    val authorName: String,
    val bookCount: Int,
    val bookIds: List<Long>,
    val reason: String,
    val confidence: Float
)

data class ReadingListSuggestion(
    val name: String,
    val itemIds: List<Long>,
    val reason: String,
    val confidence: Float,
    val listType: ReadingListType
)

enum class ReadingListType {
    IN_PROGRESS,
    BACKLOG,
    RECENT,
    FAVORITES,
    GENRE
}

data class MovieCollectionSuggestion(
    val name: String,
    val description: String,
    val movieIds: List<Long>,
    val reason: String,
    val confidence: Float,
    val collectionType: MovieCollectionType
)

enum class MovieCollectionType {
    FRANCHISE,
    DIRECTOR,
    GENRE,
    DECADE,
    FAVORITES,
    WATCHLIST
}

data class AllSuggestions(
    val collectionSuggestions: List<SuggestedCollection>,
    val playlistSuggestions: List<PlaylistSuggestion>,
    val seriesSuggestions: List<SeriesSuggestion>,
    val authorCollections: List<AuthorCollectionSuggestion>,
    val readingLists: List<ReadingListSuggestion>,
    val movieCollections: List<MovieCollectionSuggestion>
)
