package com.universalmedialibrary.services.audiobook.free

import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Aggregates the various free audiobook sources into a common API.
 */
@Singleton
class FreeAudiobookService @Inject constructor(
    private val lit2GoClient: Lit2GoClient,
    private val internetArchiveClient: InternetArchiveAudiobookClient,
    private val ioDispatcher: CoroutineDispatcher = Dispatchers.IO
) {

    suspend fun getFeatured(limit: Int = 24): List<FreeAudiobook> = withContext(ioDispatcher) {
        val lit2Go = runCatching { lit2GoClient.fetchBooks(query = null, limit = limit / 2) }
            .getOrElse { emptyList() }
        val archive = runCatching { internetArchiveClient.search(query = null, limit = limit) }
            .getOrElse { emptyList() }

        (lit2Go + archive).distinctBy { it.id }
    }

    suspend fun search(
        query: String,
        source: FreeAudiobookSource?,
        limit: Int = 50
    ): List<FreeAudiobook> = withContext(ioDispatcher) {
        when (source) {
            FreeAudiobookSource.LIT2GO -> lit2GoClient.fetchBooks(query, limit)
            FreeAudiobookSource.INTERNET_ARCHIVE -> internetArchiveClient.search(query, limit)
            null -> {
                val lit2GoResults = runCatching { lit2GoClient.fetchBooks(query, limit / 2) }
                    .getOrElse { emptyList() }
                val archiveResults = runCatching { internetArchiveClient.search(query, limit) }
                    .getOrElse { emptyList() }
                (lit2GoResults + archiveResults).distinctBy { it.id }
            }
        }
    }
}
