package com.universalmedialibrary.services.media.free

import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class FreeMediaService @Inject constructor(
    private val internetArchiveMediaClient: InternetArchiveMediaClient,
    private val ioDispatcher: CoroutineDispatcher = Dispatchers.IO
) {

    suspend fun getFeaturedComics(limit: Int = 40): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("comic_books", "comics"),
            query = null,
            preferredFormats = setOf("cbz", "cbr", "pdf"),
            fallbackFormats = setOf("cb7", "zip"),
            type = FreeMediaType.COMIC,
            limit = limit
        )
    }

    suspend fun searchComics(query: String, limit: Int = 60): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("comic_books", "comics"),
            query = query,
            preferredFormats = setOf("cbz", "cbr", "pdf"),
            fallbackFormats = setOf("cb7", "zip"),
            type = FreeMediaType.COMIC,
            limit = limit
        )
    }

    suspend fun getFeaturedFeatureFilms(limit: Int = 40): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("feature_films"),
            query = null,
            preferredFormats = setOf("mp4", "m4v", "mp2"),
            fallbackFormats = setOf("ogv", "webm"),
            type = FreeMediaType.FEATURE_FILM,
            limit = limit
        )
    }

    suspend fun searchFeatureFilms(query: String, limit: Int = 60): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("feature_films"),
            query = query,
            preferredFormats = setOf("mp4", "m4v"),
            fallbackFormats = setOf("ogv", "webm"),
            type = FreeMediaType.FEATURE_FILM,
            limit = limit
        )
    }

    suspend fun getNationalScreeningRoom(limit: Int = 40): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("national_screening_room"),
            query = null,
            preferredFormats = setOf("mp4", "mpg"),
            fallbackFormats = setOf("m4v", "webm"),
            type = FreeMediaType.NATIONAL_SCREENING_ROOM,
            limit = limit
        )
    }

    suspend fun searchNationalScreeningRoom(query: String, limit: Int = 60): List<FreeMediaItem> = withContext(ioDispatcher) {
        internetArchiveMediaClient.fetchMedia(
            collections = listOf("national_screening_room"),
            query = query,
            preferredFormats = setOf("mp4", "mpg"),
            fallbackFormats = setOf("m4v", "webm"),
            type = FreeMediaType.NATIONAL_SCREENING_ROOM,
            limit = limit
        )
    }
}
