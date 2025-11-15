package com.universalmedialibrary.services.music.free

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class FreeMusicService @Inject constructor() {

    suspend fun getAllTracks(): List<FreeMusicTrack> = withContext(Dispatchers.Default) {
        FreeMusicCatalog.tracks
    }

    suspend fun getTracksBySource(source: FreeMusicSource): List<FreeMusicTrack> = withContext(Dispatchers.Default) {
        FreeMusicCatalog.tracks.filter { it.source == source }
    }

    suspend fun search(query: String): List<FreeMusicTrack> = withContext(Dispatchers.Default) {
        val normalized = query.trim().lowercase()
        if (normalized.isBlank()) {
            FreeMusicCatalog.tracks
        } else {
            FreeMusicCatalog.tracks.filter { track ->
                val haystack = listOfNotNull(
                    track.title,
                    track.artist,
                    track.album
                ).joinToString(" ").lowercase()
                haystack.contains(normalized) || track.tags.any { it.lowercase().contains(normalized) }
            }
        }
    }
}
