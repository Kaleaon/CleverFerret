package com.universalmedialibrary.services.oldtimeradio

import com.universalmedialibrary.data.oldtimeradio.AudioQuality
import com.universalmedialibrary.data.oldtimeradio.OTRCategory
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioEpisode
import com.universalmedialibrary.services.media.free.InternetArchiveMediaClient
import com.universalmedialibrary.services.media.free.FreeMediaType
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class OldTimeRadioImportService @Inject constructor(
    private val oldTimeRadioDao: OldTimeRadioDao,
    private val internetArchiveMediaClient: InternetArchiveMediaClient
) {

    suspend fun importFeaturedEpisodes(limit: Int = 40): ImportResult = withContext(Dispatchers.IO) {
        val mediaItems = internetArchiveMediaClient.fetchMedia(
            collections = listOf("oldtimeradio"),
            query = null,
            preferredFormats = setOf("mp3"),
            fallbackFormats = setOf("ogg", "flac"),
            type = FreeMediaType.NATIONAL_SCREENING_ROOM, // bypass filtering
            limit = limit
        )

        var inserted = 0
        val newEpisodes = mutableListOf<OldTimeRadioEpisode>()

        val existingUris = mutableSetOf<String>()

        for (item in mediaItems) {
            item.downloadOptions.forEach { option ->
                val uri = option.url
                if (existingUris.add(uri)) {
                    val already = oldTimeRadioDao.getEpisodeByUri(uri)
                    if (already == null) {
                        newEpisodes.add(
                            OldTimeRadioEpisode(
                                seriesTitle = item.title,
                                episodeTitle = option.label,
                                episodeNumber = null,
                                seasonNumber = null,
                                originalAirDate = item.year,
                                broadcastNetwork = null,
                                duration = (item.runtimeSeconds ?: 1800) * 1000,
                                category = inferCategory(item.tags),
                                genre = item.tags.firstOrNull(),
                                cast = null,
                                director = null,
                                writer = null,
                                sponsor = null,
                                description = item.description,
                                uri = uri,
                                filePath = null,
                                fileSize = option.sizeBytes ?: 0,
                                quality = AudioQuality.UNKNOWN,
                                lastPlayed = null,
                                playbackPosition = 0,
                                isComplete = false,
                                isFavorite = false,
                                playCount = 0,
                                tags = item.tags.joinToString(", "),
                                addedDate = System.currentTimeMillis()
                            )
                        )
                    }
                }
            }
        }

        if (newEpisodes.isNotEmpty()) {
            oldTimeRadioDao.insertEpisodes(newEpisodes)
            inserted = newEpisodes.size
        }

        ImportResult(
            totalFetched = mediaItems.size,
            inserted = inserted
        )
    }

    private fun inferCategory(tags: List<String>): OTRCategory {
        val lower = tags.map { it.lowercase() }
        return when {
            lower.any { it.contains("mystery") || it.contains("detective") } -> OTRCategory.MYSTERY
            lower.any { it.contains("sci-fi") || it.contains("science fiction") } -> OTRCategory.SCI_FI
            lower.any { it.contains("horror") || it.contains("thriller") } -> OTRCategory.HORROR
            lower.any { it.contains("western") } -> OTRCategory.WESTERN
            lower.any { it.contains("comedy") } -> OTRCategory.COMEDY
            lower.any { it.contains("soap") || it.contains("drama") } -> OTRCategory.DRAMA
            else -> OTRCategory.OTHER
        }
    }

    data class ImportResult(
        val totalFetched: Int,
        val inserted: Int
    )
}
