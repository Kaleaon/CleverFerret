package com.universalmedialibrary.data.settings

data class ApiSettings(
    val bookApis: BookApiSettings = BookApiSettings(),
    val comicApis: ComicApiSettings = ComicApiSettings(),
    val audiobookApis: AudiobookApiSettings = AudiobookApiSettings(),
    val movieTvApis: MovieTvApiSettings = MovieTvApiSettings(),
    val musicApis: MusicApiSettings = MusicApiSettings(),
    val metadataQualityThreshold: Float = 0.8f,
    val enableBatchProcessing: Boolean = true,
    val rateLimitingEnabled: Boolean = true,
    val cacheExpirationHours: Int = 24
)

data class BookApiSettings(
    val googleBooksEnabled: Boolean = true,
    val goodreadsEnabled: Boolean = false,
    val hardcoverEnabled: Boolean = false,
    val amazonEnabled: Boolean = false,
    val isbnDbEnabled: Boolean = false
)

data class ComicApiSettings(
    val comicVineEnabled: Boolean = false,
    val marvelEnabled: Boolean = false,
    val dcEnabled: Boolean = false
)

data class AudiobookApiSettings(
    val audibleEnabled: Boolean = false,
    val librivoxEnabled: Boolean = true,
    val archiveOrgEnabled: Boolean = true
)

data class MovieTvApiSettings(
    val tmdbEnabled: Boolean = false,
    val omdbEnabled: Boolean = false,
    val tvdbEnabled: Boolean = false,
    val fanartTvEnabled: Boolean = false
)

data class MusicApiSettings(
    val lastFmEnabled: Boolean = false,
    val discogsEnabled: Boolean = false,
    val musicBrainzEnabled: Boolean = true,
    val spotifyEnabled: Boolean = false
)