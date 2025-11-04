package com.universalmedialibrary.ui.library

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for the LibraryDetailsScreen
 * Manages the state of media items within a specific library
 */
@HiltViewModel
class LibraryDetailsViewModel @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : ViewModel() {

    data class MediaItemWithMetadata(
        val mediaItem: MediaItem,
        val metadata: MetadataCommon?
    )

    data class UiState(
        val library: Library? = null,
        val mediaItems: List<MediaItemWithMetadata> = emptyList(),
        val isLoading: Boolean = true,
        val error: String? = null
    )

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    fun loadLibraryDetails(libraryId: Long) {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value.copy(isLoading = true, error = null)

                // Load library info
                val library = libraryDao.getLibraryById(libraryId)
                if (library == null) {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        error = "Library not found"
                    )
                    return@launch
                }

                // Load media items for this library
                mediaItemDao.getMediaItemsByLibrary(libraryId).collect { mediaItems ->
                    // PERFORMANCE OPTIMIZATION: Use batch queries to avoid N+1 problem
                    val mediaItemsWithMetadata = if (mediaItems.isEmpty()) {
                        emptyList()
                    } else {
                        val itemIds = mediaItems.map { it.itemId }
                        val metadataMap = metadataDao.getMetadataCommonBatch(itemIds)
                            .associateBy { it.itemId }
                        
                        mediaItems.map { mediaItem ->
                            MediaItemWithMetadata(mediaItem, metadataMap[mediaItem.itemId])
                        }
                    }

                    _uiState.value = _uiState.value.copy(
                        library = library,
                        mediaItems = mediaItemsWithMetadata,
                        isLoading = false,
                        error = null
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = e.message ?: "Unknown error occurred"
                )
            }
        }
    }

    fun refresh(libraryId: Long) {
        loadLibraryDetails(libraryId)
    }

    fun createSampleMediaItems(libraryId: Long) {
        viewModelScope.launch {
            try {
                val library = libraryDao.getLibraryById(libraryId) ?: return@launch
                val existingCount = mediaItemDao.getItemCountByLibrary(libraryId)

                if (existingCount == 0) {
                    // Create sample media items based on library type
                    val sampleItems = when (library.type) {
                        "BOOK" -> createSampleBooks(libraryId)
                        "MOVIE" -> createSampleMovies(libraryId)
                        "MUSIC" -> createSampleMusic(libraryId)
                        "PODCAST" -> createSamplePodcasts(libraryId)
                        "MAGAZINE" -> createSampleMagazines(libraryId)
                        "DOCUMENT" -> createSampleDocuments(libraryId)
                        else -> emptyList()
                    }

                    // Insert media items individually and insert metadata
                    for (item in sampleItems) {
                        val itemId = mediaItemDao.insertMediaItem(item)
                        val metadata = createSampleMetadata(itemId, item, library.type)
                        metadataDao.insertCommonMetadata(metadata)
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Failed to create sample data: ${e.message}"
                )
            }
        }
    }

    private fun createSampleBooks(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Books/digital_frontier.epub",
                fileName = "The Digital Frontier",
                fileExtension = "epub",
                fileSize = 2048000,
                mediaType = "BOOK",
                mimeType = "application/epub+zip",
                hasMetadata = true
            ),
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Books/ai_revolution.pdf",
                fileName = "AI Revolution",
                fileExtension = "pdf",
                fileSize = 5120000,
                mediaType = "BOOK",
                mimeType = "application/pdf",
                hasMetadata = true
            )
        )
    }

    private fun createSampleMovies(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Movies/cyber_dreams.mp4",
                fileName = "Cyber Dreams",
                fileExtension = "mp4",
                fileSize = 1073741824, // 1GB
                mediaType = "MOVIE",
                mimeType = "video/mp4",
                hasMetadata = true
            ),
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Movies/matrix_reborn.mkv",
                fileName = "Matrix Reborn",
                fileExtension = "mkv",
                fileSize = 2147483648, // 2GB
                mediaType = "MOVIE",
                mimeType = "video/x-matroska",
                hasMetadata = true
            )
        )
    }

    private fun createSampleMusic(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Music/neon_nights.mp3",
                fileName = "Neon Nights",
                fileExtension = "mp3",
                fileSize = 8388608, // 8MB
                mediaType = "MUSIC",
                mimeType = "audio/mpeg",
                hasMetadata = true
            ),
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Music/future_bass.flac",
                fileName = "Future Bass",
                fileExtension = "flac",
                fileSize = 41943040, // 40MB
                mediaType = "MUSIC",
                mimeType = "audio/flac",
                hasMetadata = true
            )
        )
    }

    private fun createSamplePodcasts(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Podcasts/tech_talk_001.mp3",
                fileName = "Tech Talk Episode 1",
                fileExtension = "mp3",
                fileSize = 52428800, // 50MB
                mediaType = "PODCAST",
                mimeType = "audio/mpeg",
                hasMetadata = true
            )
        )
    }

    private fun createSampleMagazines(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Magazines/tech_monthly_2024.pdf",
                fileName = "Tech Monthly 2024",
                fileExtension = "pdf",
                fileSize = 15728640, // 15MB
                mediaType = "MAGAZINE",
                mimeType = "application/pdf",
                hasMetadata = true
            )
        )
    }

    private fun createSampleDocuments(libraryId: Long): List<MediaItem> {
        return listOf(
            MediaItem(
                libraryId = libraryId,
                filePath = "/storage/emulated/0/Documents/important_doc.pdf",
                fileName = "Important Document",
                fileExtension = "pdf",
                fileSize = 1048576, // 1MB
                mediaType = "DOCUMENT",
                mimeType = "application/pdf",
                hasMetadata = false
            )
        )
    }

    private fun createSampleMetadata(itemId: Long, mediaItem: MediaItem, libraryType: String): MetadataCommon {
        return when (libraryType) {
            "BOOK" -> MetadataCommon(
                itemId = itemId,
                title = when (mediaItem.fileName) {
                    "The Digital Frontier" -> "The Digital Frontier"
                    "AI Revolution" -> "AI Revolution"
                    else -> mediaItem.fileName
                },
                year = 2024,
                rating = 4.5f,
                summary = "An engaging ${libraryType.lowercase()} that explores modern themes and captivates readers.",
                language = "en",
                metadataSource = "demo"
            )
            "MOVIE" -> MetadataCommon(
                itemId = itemId,
                title = when (mediaItem.fileName) {
                    "Cyber Dreams" -> "Cyber Dreams"
                    "Matrix Reborn" -> "Matrix Reborn"
                    else -> mediaItem.fileName
                },
                year = if (mediaItem.fileName == "Matrix Reborn") 2025 else 2023,
                rating = if (mediaItem.fileName == "Matrix Reborn") 4.9f else 4.8f,
                summary = "A thrilling ${libraryType.lowercase()} with stunning visuals and compelling storytelling.",
                language = "en",
                metadataSource = "demo"
            )
            "MUSIC" -> MetadataCommon(
                itemId = itemId,
                title = when (mediaItem.fileName) {
                    "Neon Nights" -> "Neon Nights"
                    "Future Bass" -> "Future Bass"
                    else -> mediaItem.fileName
                },
                year = 2024,
                rating = if (mediaItem.fileName == "Future Bass") 4.3f else 4.2f,
                summary = "An electronic music track with modern beats and atmospheric soundscapes.",
                language = "en",
                metadataSource = "demo"
            )
            "PODCAST" -> MetadataCommon(
                itemId = itemId,
                title = "Tech Talk Episode 1",
                year = 2024,
                rating = 4.4f,
                summary = "First episode of our technology discussion podcast series.",
                language = "en",
                metadataSource = "demo"
            )
            "MAGAZINE" -> MetadataCommon(
                itemId = itemId,
                title = "Tech Monthly 2024",
                year = 2024,
                rating = 4.1f,
                summary = "Monthly technology magazine covering the latest trends and innovations.",
                language = "en",
                metadataSource = "demo"
            )
            else -> MetadataCommon(
                itemId = itemId,
                title = mediaItem.fileName,
                year = 2024,
                rating = 3.8f,
                summary = "A document file in your collection.",
                language = "en",
                metadataSource = "demo"
            )
        }
    }
}

/**
 * Extension function to convert Room MediaItem with metadata to UI MediaItemData
 */
fun LibraryDetailsViewModel.MediaItemWithMetadata.toMediaItemData(): MediaItemData {
    val title = metadata?.title ?: mediaItem.fileName
    val author = when (mediaItem.mediaType) {
        "BOOK" -> "Unknown Author"
        "MOVIE" -> "Director Unknown"
        "MUSIC" -> "Unknown Artist"
        "PODCAST" -> "Unknown Host"
        "MAGAZINE" -> "Publisher"
        else -> "Unknown"
    }

    return MediaItemData(
        id = mediaItem.itemId.toInt(),
        title = title,
        author = author,
        year = metadata?.year ?: 2024,
        rating = metadata?.rating ?: (3.5f + (mediaItem.itemId % 11) * 0.15f), // Deterministic rating for demo
        genre = when (mediaItem.mediaType) {
            "BOOK" -> listOf("Sci-Fi", "Fiction", "Non-Fiction", "Biography")[(mediaItem.itemId % 4).toInt()]
            "MOVIE" -> listOf("Thriller", "Action", "Drama", "Comedy")[(mediaItem.itemId % 4).toInt()]
            "MUSIC" -> listOf("Electronic", "Pop", "Rock", "Jazz")[(mediaItem.itemId % 4).toInt()]
            "PODCAST" -> listOf("Technology", "Education", "Entertainment")[(mediaItem.itemId % 3).toInt()]
            "MAGAZINE" -> listOf("Technology", "Science", "Lifestyle")[(mediaItem.itemId % 3).toInt()]
            else -> "General"
        },
        type = when (mediaItem.mediaType) {
            "BOOK" -> MediaType.BOOK
            "MOVIE" -> MediaType.MOVIE
            "MUSIC" -> MediaType.MUSIC
            "PODCAST" -> MediaType.PODCAST
            "MAGAZINE" -> MediaType.MAGAZINE
            else -> MediaType.DOCUMENT
        },
        poster = null // No poster URLs for demo
    )
}
