package com.universalmedialibrary.services.music.hivefy

import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.data.local.entity.Genre
import com.universalmedialibrary.data.local.entity.ItemGenre
import com.universalmedialibrary.data.music.hivefy.SaavnAlbum
import com.universalmedialibrary.data.music.hivefy.SaavnDiscoveryPayload
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Persists Hivefy discovery content into the Room catalog so that it participates in
 * Smart Recommendations, playlists, and the rest of the Namida-inspired pipeline.
 */
@Singleton
class HivefyMediaSyncManager @Inject constructor(
    private val libraryDao: LibraryDao,
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) {

    suspend fun syncDiscovery(payload: SaavnDiscoveryPayload) = withContext(Dispatchers.IO) {
        val library = ensureLibrary()
        payload.playlists.forEach { syncPlaylist(it, library) }
        payload.albums.forEach { syncAlbum(it, library) }
    }

    private suspend fun syncPlaylist(playlist: SaavnPlaylist, library: Library) {
        playlist.songs.forEach { song ->
            syncSong(song, library, playlist.title, playlist.language)
        }
    }

    private suspend fun syncAlbum(album: SaavnAlbum, library: Library) {
        album.songs.forEach { song ->
            syncSong(
                song = song.copy(albumName = song.albumName ?: album.title, albumId = song.albumId ?: album.id),
                library = library,
                collectionName = album.title,
                languageOverride = album.language
            )
        }
    }

    private suspend fun syncSong(
        song: SaavnSong,
        library: Library,
        collectionName: String?,
        languageOverride: String?
    ) {
        val canonicalPath = song.url.ifEmpty { "https://hivefy.saavn/${song.id}" }
        val existing = mediaItemDao.getMediaItemByFilePath(canonicalPath)
        val baseItem = MediaItem(
            itemId = existing?.itemId ?: 0L,
            libraryId = library.libraryId,
            filePath = canonicalPath,
            fileName = song.title,
            fileExtension = "stream",
            fileSize = (song.durationSeconds ?: 0).toLong() * 1024, // rough placeholder
            mediaType = MUSIC_MEDIA_TYPE,
            mimeType = "audio/mpeg",
            hasMetadata = true,
            hasThumbnail = !song.artworkUrl.isNullOrEmpty(),
            thumbnailPath = song.artworkUrl ?: existing?.thumbnailPath
        )

        val itemId = if (existing == null) {
            mediaItemDao.insertMediaItem(baseItem)
        } else {
            mediaItemDao.updateMediaItem(baseItem.copy(itemId = existing.itemId))
            existing.itemId
        }

        metadataDao.insertMetadataCommon(
            MetadataCommon(
                itemId = itemId,
                title = song.title,
                sortTitle = song.title.lowercase(Locale.getDefault()),
                summary = collectionName ?: song.headline,
                language = languageOverride ?: song.language,
                metadataSource = "Hivefy/Saavn",
                externalId = song.id,
                coverImagePath = song.artworkUrl
            )
        )

        metadataDao.insertMetadataMusicTrack(
            MetadataMusicTrack(
                itemId = itemId,
                album = song.albumName ?: collectionName,
                albumArtist = song.primaryArtists.firstOrNull()?.name,
                artist = song.primaryArtists.joinToString { it.name },
                duration = (song.durationSeconds ?: 0) * 1000L,
                spotifyId = null,
                hasLyrics = false
            )
        )

        // Simple genre tagging based on language to help smart playlists discover content.
        val languageGenreName = (languageOverride ?: song.language)?.takeIf { it.isNotBlank() }?.let {
            "${it.replaceFirstChar { c -> c.uppercaseChar() }} Music"
        }
        if (!languageGenreName.isNullOrBlank()) {
            val existingGenreId = metadataDao.findGenreByName(languageGenreName)
                ?: metadataDao.insertGenre(
                    Genre(
                        name = languageGenreName,
                        description = "Music in $languageGenreName",
                        mediaType = MUSIC_MEDIA_TYPE
                    )
                )
            metadataDao.insertItemGenre(ItemGenre(itemId = itemId, genreId = existingGenreId))
        }
    }

    private suspend fun ensureLibrary(): Library {
        val existingByPath = libraryDao.getLibraryByPath(HivefyPlaybackContract.LIBRARY_PATH)
        if (existingByPath != null) return existingByPath

        val existingByName = libraryDao.getLibraryByName(HivefyPlaybackContract.LIBRARY_NAME)
        if (existingByName != null) return existingByName

        val library = Library(
            name = HivefyPlaybackContract.LIBRARY_NAME,
            type = "MUSIC",
            path = HivefyPlaybackContract.LIBRARY_PATH,
            source = HivefyPlaybackContract.LIBRARY_SOURCE,
            description = "Hivefy streaming collections",
            isActive = true
        )
        val id = libraryDao.insertLibrary(library)
        return library.copy(libraryId = id)
    }

    companion object {
        private const val MUSIC_MEDIA_TYPE = "MUSIC"
    }
}
