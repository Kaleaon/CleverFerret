package com.universalmedialibrary.services.oldtimeradio

import androidx.room.withTransaction
import com.universalmedialibrary.data.oldtimeradio.AudioQuality
import com.universalmedialibrary.data.oldtimeradio.OTRCategory
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDatabase
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
    private val radioDatabase: OldTimeRadioDatabase,
    private val oldTimeRadioDao: OldTimeRadioDao,
    private val internetArchiveMediaClient: InternetArchiveMediaClient
) {

    suspend fun importFeaturedEpisodes(
        limit: Int = 40,
        chunkSize: Int = 250,
        onProgress: (inserted: Int, total: Int) -> Unit = { _, _ -> }
    ): ImportResult = withContext(Dispatchers.IO) {
        val mediaItems = internetArchiveMediaClient.fetchMedia(
            collections = listOf("oldtimeradio"),
            query = null,
            preferredFormats = setOf("mp3"),
            fallbackFormats = setOf("ogg", "flac"),
            type = FreeMediaType.NATIONAL_SCREENING_ROOM, // bypass filtering
            limit = limit
        )

        val candidateEpisodes = mutableListOf<OldTimeRadioEpisode>()
        val seenUrisInBatch = mutableSetOf<String>()

        for (item in mediaItems) {
            item.downloadOptions.forEach { option ->
                val uri = option.url
                if (seenUrisInBatch.add(uri)) {
                    candidateEpisodes.add(
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

        var totalInserted = 0

        for (chunk in candidateEpisodes.chunked(chunkSize.coerceAtLeast(1))) {
            val chunkUris = chunk.map { it.uri }
            val existingUris = oldTimeRadioDao.getExistingUris(chunkUris).toSet()

            val newEpisodes = chunk.filter { !existingUris.contains(it.uri) }

            if (newEpisodes.isNotEmpty()) {
                radioDatabase.withTransaction {
                    oldTimeRadioDao.insertEpisodes(newEpisodes)
                }
                totalInserted += newEpisodes.size
            }
            onProgress(totalInserted, candidateEpisodes.size)
        }

        ImportResult(
            totalFetched = mediaItems.size,
            inserted = totalInserted
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
