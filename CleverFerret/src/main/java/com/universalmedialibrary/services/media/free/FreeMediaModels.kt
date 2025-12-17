package com.universalmedialibrary.services.media.free

data class FreeMediaItem(
    val id: String,
    val type: FreeMediaType,
    val source: FreeMediaSource,
    val title: String,
    val creator: String? = null,
    val description: String? = null,
    val thumbnailUrl: String? = null,
    val streamingUrl: String? = null,
    val detailUrl: String? = null,
    val downloadOptions: List<FreeMediaDownloadOption> = emptyList(),
    val tags: List<String> = emptyList(),
    val runtimeSeconds: Long? = null,
    val year: String? = null
)

data class FreeMediaDownloadOption(
    val url: String,
    val label: String,
    val format: String,
    val sizeBytes: Long? = null
)

enum class FreeMediaSource(val displayName: String) {
    INTERNET_ARCHIVE("Internet Archive"),
    LIBRARY_OF_CONGRESS("Library of Congress")
}

enum class FreeMediaType(val displayName: String) {
    COMIC("Comics"),
    FEATURE_FILM("Feature Films"),
    NATIONAL_SCREENING_ROOM("National Screening Room")
}
