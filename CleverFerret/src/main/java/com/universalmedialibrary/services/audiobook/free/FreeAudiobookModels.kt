package com.universalmedialibrary.services.audiobook.free

/**
 * Data classes describing freely available audiobooks pulled from external catalogs.
 */
data class FreeAudiobook(
    val id: String,
    val source: FreeAudiobookSource,
    val title: String,
    val author: String? = null,
    val narrator: String? = null,
    val description: String? = null,
    val coverUrl: String? = null,
    val language: String? = null,
    val durationSeconds: Long? = null,
    val tags: List<String> = emptyList(),
    val downloadOptions: List<AudiobookDownloadOption> = emptyList(),
    val streamUrl: String? = null,
    val detailUrl: String? = null
)

data class AudiobookDownloadOption(
    val url: String,
    val label: String,
    val format: String,
    val estimatedSizeBytes: Long? = null
)

enum class FreeAudiobookSource(val displayName: String) {
    LIT2GO("Lit2Go"),
    INTERNET_ARCHIVE("Internet Archive")
}
