package com.universalmedialibrary.data.music.hivefy

import kotlinx.serialization.Serializable

/**
 * Data models that mirror the pieces of Hivefy's Saavn integration we want to surface inside
 * CleverFerret. The classes are intentionally lightweight and serialization-friendly so that
 * we can cache discovery payloads without re-downloading from the Saavn mirror on every launch.
 */

@Serializable
enum class SaavnLanguage(val slug: String, val displayName: String) {
    ENGLISH("english", "English"),
    HINDI("hindi", "Hindi"),
    TAMIL("tamil", "Tamil"),
    TELUGU("telugu", "Telugu"),
    PUNJABI("punjabi", "Punjabi"),
    MARATHI("marathi", "Marathi"),
    GUJARATI("gujarati", "Gujarati"),
    BENGALI("bengali", "Bengali"),
    KANNADA("kannada", "Kannada"),
    BHOJPURI("bhojpuri", "Bhojpuri"),
    MALAYALAM("malayalam", "Malayalam"),
    SANSKRIT("sanskrit", "Sanskrit"),
    HARYANVI("haryanvi", "Haryanvi"),
    RAJASTHANI("rajasthani", "Rajasthani"),
    ODIA("odia", "Odia"),
    ASSAMESE("assamese", "Assamese");

    companion object {
        val DEFAULT = ENGLISH
    }
}

@Serializable
data class SaavnImage(
    val quality: String,
    val url: String
) {
    val sizeHint: Int = quality.split("x")
        .firstOrNull()
        ?.filter { it.isDigit() }
        ?.toIntOrNull()
        ?: 0
}

@Serializable
data class SaavnAudioSource(
    val quality: String,
    val url: String
) {
    val bitrateKbps: Int = QUALITY_REGEX.find(quality)?.value?.toIntOrNull()
        ?: when {
            quality.contains("320", ignoreCase = true) -> 320
            quality.contains("160", ignoreCase = true) -> 160
            quality.contains("96", ignoreCase = true) -> 96
            quality.contains("48", ignoreCase = true) -> 48
            else -> 0
        }

    private companion object {
        private val QUALITY_REGEX = "\\d+".toRegex()
    }
}

@Serializable
data class SaavnArtist(
    val id: String,
    val name: String,
    val role: String? = null,
    val imageUrl: String? = null,
    val profileUrl: String? = null
)

@Serializable
data class SaavnSong(
    val id: String,
    val title: String,
    val url: String,
    val durationSeconds: Int? = null,
    val language: String? = null,
    val albumId: String? = null,
    val albumName: String? = null,
    val albumUrl: String? = null,
    val artworkUrl: String? = null,
    val primaryArtists: List<SaavnArtist> = emptyList(),
    val contributors: List<SaavnArtist> = emptyList(),
    val downloadSources: List<SaavnAudioSource> = emptyList(),
    val explicit: Boolean = false
) {
    val headline: String = buildString {
        append(title)
        val artistNames = primaryArtists.takeIf { it.isNotEmpty() }?.joinToString { it.name }
        if (!artistNames.isNullOrBlank()) {
            append(" • ")
            append(artistNames)
        }
    }
}

@Serializable
data class SaavnPlaylist(
    val id: String,
    val title: String,
    val description: String? = null,
    val url: String,
    val language: String? = null,
    val songCount: Int = 0,
    val explicit: Boolean = false,
    val artworkUrl: String? = null,
    val songs: List<SaavnSong> = emptyList(),
    val curator: String? = null
)

@Serializable
data class SaavnAlbum(
    val id: String,
    val title: String,
    val url: String,
    val artistNames: String? = null,
    val language: String? = null,
    val year: String? = null,
    val description: String? = null,
    val explicit: Boolean = false,
    val artworkUrl: String? = null,
    val songs: List<SaavnSong> = emptyList()
)

@Serializable
data class SaavnDiscoveryPayload(
    val language: SaavnLanguage,
    val playlists: List<SaavnPlaylist>,
    val albums: List<SaavnAlbum>,
    val fetchedAtEpochMillis: Long
)

fun SaavnSong.bestAudioSource(): SaavnAudioSource? =
    downloadSources.maxByOrNull { it.bitrateKbps }

fun SaavnPlaylist.primaryArtistLine(): String? =
    songs.asSequence()
        .flatMap { it.primaryArtists.asSequence() }
        .distinctBy { it.id }
        .take(3)
        .joinToString { it.name }
        .takeIf { it.isNotBlank() }
