package com.universalmedialibrary.services.music.free

data class FreeMusicTrack(
    val id: String,
    val title: String,
    val artist: String,
    val album: String? = null,
    val streamUrl: String,
    val downloadUrl: String? = null,
    val source: FreeMusicSource,
    val license: FreeMusicLicense,
    val durationSeconds: Int? = null,
    val tags: List<String> = emptyList(),
    val coverUrl: String? = null
)

enum class FreeMusicSource(val displayName: String) {
    FREE_MUSIC_ARCHIVE("Free Music Archive"),
    JAMENDO("Jamendo"),
    BBC_SOUND_EFFECTS("BBC Sound Effects"),
    FREESOUND("Freesound")
}

data class FreeMusicLicense(
    val name: String,
    val url: String,
    val requiresAttribution: Boolean
)
