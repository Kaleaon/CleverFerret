package com.universalmedialibrary.services.metadata

import android.net.Uri
import com.universalmedialibrary.services.music.MusicMetadataService
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Metadata Facade
 * 
 * Public single entry point for all file metadata extraction and remote API searches across
 * all media types (Audio, Video, Books, Comics, Podcasts, TV).
 */
@Singleton
class UnifiedMetadataFacade @Inject constructor(
    val embeddedTagExtractor: EmbeddedTagExtractor,
    val centralizedApiClient: CentralizedMetadataApiClient,
    val realMetadataService: RealMetadataService,
    val audioMetadataService: AudioMetadataService,
    val bookMetadataService: BookMetadataService,
    val comicMetadataService: ComicMetadataService,
    val fanfictionMetadataService: FanfictionMetadataService,
    val musicMetadataService: MusicMetadataService
) {
    /**
     * Extract embedded metadata from a media file path using EmbeddedTagExtractor.
     */
    suspend fun extractEmbeddedMetadata(filePath: String): UniversalMetadata {
        return embeddedTagExtractor.extractMetadata(filePath)
    }

    /**
     * Extract embedded audio metadata from Uri using EmbeddedTagExtractor.
     */
    suspend fun extractAudioMetadata(uri: Uri): AudioMetadata? {
        return embeddedTagExtractor.extractMetadataFromUri(uri)
    }

    /**
     * Extract enhanced track metadata from audio file path.
     */
    suspend fun extractTrackMetadata(filePath: String): EnhancedTrackMetadata {
        val meta = embeddedTagExtractor.extractMetadata(filePath)
        return EnhancedTrackMetadata(
            title = meta.title,
            artist = meta.artist,
            album = meta.album,
            albumArtist = meta.albumArtist,
            composer = meta.composer,
            genre = meta.genre,
            year = meta.year,
            date = meta.date,
            trackNumber = meta.trackNumber,
            discNumber = meta.discNumber,
            duration = meta.duration ?: 0L,
            bitrate = meta.bitrate,
            sampleRate = meta.sampleRate,
            channels = meta.channels,
            mimeType = meta.mimeType,
            author = meta.publisher,
            hasEmbeddedArt = meta.extractionSuccess,
            replayGainTrack = meta.replayGainTrack,
            replayGainAlbum = meta.replayGainAlbum
        )
    }

    /**
     * Search book metadata across external sources (Google Books, Open Library).
     */
    suspend fun searchBookMetadata(
        query: String? = null,
        isbn: String? = null,
        title: String? = null,
        author: String? = null
    ): BookMetadataResult {
        return realMetadataService.searchBookMetadata(query, isbn, title, author)
    }

    /**
     * Search movie metadata across external sources (TMDB, OMDb).
     */
    suspend fun searchMovieMetadata(
        title: String,
        year: Int? = null,
        imdbId: String? = null
    ): MovieMetadataResult {
        return realMetadataService.searchMovieMetadata(title, year, imdbId)
    }

    /**
     * Search music metadata via MusicBrainz.
     */
    suspend fun searchMusicMetadata(
        query: String? = null,
        artist: String? = null,
        album: String? = null,
        track: String? = null
    ): MusicMetadataResult {
        return realMetadataService.searchMusicMetadata(query, artist, album, track)
    }

    /**
     * Enhance track metadata using multiple remote sources.
     */
    suspend fun enhanceTrackMetadata(
        artist: String,
        title: String,
        album: String? = null
    ): EnhancedTrackMetadata {
        return musicMetadataService.enhanceTrackMetadata(artist, title, album)
    }

    /**
     * Fetch online audio metadata from MusicBrainz.
     */
    suspend fun fetchFromMusicBrainz(
        title: String? = null,
        artist: String? = null,
        album: String? = null,
        isrc: String? = null,
        musicBrainzId: String? = null
    ): AudioMetadata? {
        return audioMetadataService.fetchFromMusicBrainz(title, artist, album, isrc, musicBrainzId)
    }
}
