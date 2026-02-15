package com.universalmedialibrary.services.opds

import android.util.Log
import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.SharedLink
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.SharingRepository
import fi.iki.elonen.NanoHTTPD
import java.util.concurrent.CompletableFuture
import java.util.concurrent.ConcurrentHashMap
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancelChildren
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.launch

@Singleton
class OpdsServer @Inject constructor(
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository,
    private val sharingRepository: SharingRepository,
    private val opdsFeedGenerator: OpdsFeedGenerator,
    private val formatRegistry: FormatRegistry
) : NanoHTTPD("127.0.0.1", 8088) {

    @Volatile
    private var enabled: Boolean = false

    private val requestScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val linkLookupCache = ConcurrentHashMap<String, CompletableFuture<SharedLink?>>()
    private val libraryLookupCache = ConcurrentHashMap<Long, CompletableFuture<Library?>>()
    private val mediaLookupCache = ConcurrentHashMap<Long, CompletableFuture<MediaItem?>>()
    private val libraryItemsCache = ConcurrentHashMap<Long, CompletableFuture<List<MediaItem>>>()

    fun isRunning(): Boolean = enabled

    fun startServer() {
        if (!enabled) {
            enabled = true
            try {
                start(SOCKET_READ_TIMEOUT, true)
            } catch (e: Exception) {
                Log.e("OpdsServer", "Failed to start: ${e.message}")
                enabled = false
            }
        }
    }

    fun stopServer() {
        if (enabled) {
            enabled = false
            requestScope.coroutineContext.cancelChildren()
            linkLookupCache.clear()
            libraryLookupCache.clear()
            mediaLookupCache.clear()
            libraryItemsCache.clear()
            stop()
        }
    }

    override fun serve(session: IHTTPSession): Response {
        if (!enabled) return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "OPDS disabled")

        return try {
            when {
                session.uri == "/opds" -> newFixedLengthResponse(Response.Status.OK, MIME_XML, opdsFeedGenerator.generateCatalogFeed())
                session.uri.startsWith("/opds/libraries") -> serveLibraries(session)
                session.uri.startsWith("/opds/library/") -> serveLibraryItems(session)
                session.uri.startsWith("/opds/download/") -> serveDownload(session)
                else -> newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "Not found")
            }
        } catch (e: Exception) {
            newFixedLengthResponse(Response.Status.INTERNAL_ERROR, NanoHTTPD.MIME_PLAINTEXT, "Error: ${e.message}")
        }
    }

    private fun serveLibraries(session: IHTTPSession): Response {
        val token = session.parameters["token"]?.firstOrNull()
            ?: return newFixedLengthResponse(Response.Status.UNAUTHORIZED, NanoHTTPD.MIME_PLAINTEXT, "Missing token")

        val linkResult = pollLink(token)
        if (!linkResult.ready) return pendingResponse("Token validation")
        val link = linkResult.value
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")
        if (link.targetType != "LIBRARY") return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not for libraries")

        val libraryResult = pollLibrary(link.targetId)
        if (!libraryResult.ready) return pendingResponse("Loading library metadata")
        val library = libraryResult.value

        val entries = library?.let {
            """
            <entry>
              <title>${it.name}</title>
              <id>urn:lib:${it.libraryId}</id>
              <link rel=\"subsection\" href=\"/opds/library/${it.libraryId}?token=$token\" />
            </entry>
            """.trimIndent()
        } ?: ""

        val xml =
            """
            <?xml version=\"1.0\" encoding=\"utf-8\"?>
            <feed xmlns=\"http://www.w3.org/2005/Atom\" xmlns:opds=\"http://opds-spec.org/2010/catalog\">
              <title>Shared Libraries</title>
              $entries
            </feed>
            """.trimIndent()

        return newFixedLengthResponse(Response.Status.OK, MIME_XML, xml)
    }

    private fun serveLibraryItems(session: IHTTPSession): Response {
        val libraryId = session.uri.removePrefix("/opds/library/").toLongOrNull()
            ?: return newFixedLengthResponse(Response.Status.BAD_REQUEST, NanoHTTPD.MIME_PLAINTEXT, "Bad library id")
        val token = session.parameters["token"]?.firstOrNull()
            ?: return newFixedLengthResponse(Response.Status.UNAUTHORIZED, NanoHTTPD.MIME_PLAINTEXT, "Missing token")

        val linkResult = pollLink(token)
        if (!linkResult.ready) return pendingResponse("Token validation")
        val link = linkResult.value
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")
        if (link.targetType != "LIBRARY" || link.targetId != libraryId) {
            return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not valid for library")
        }

        val q = session.parameters["q"]?.firstOrNull()?.lowercase()
        val page = session.parameters["page"]?.firstOrNull()?.toIntOrNull()?.coerceAtLeast(0) ?: 0
        val size = session.parameters["size"]?.firstOrNull()?.toIntOrNull()?.coerceIn(1, 200) ?: 50

        val itemsResult = pollLibraryItems(libraryId)
        if (!itemsResult.ready) return pendingResponse("Loading library items")
        val allItems = itemsResult.value.orEmpty()

        var filtered = allItems
        if (!q.isNullOrBlank()) {
            filtered = filtered.filter { it.fileName.lowercase().contains(q) }
        }
        val from = (page * size).coerceAtMost(filtered.size)
        val to = (from + size).coerceAtMost(filtered.size)
        val pageItems = filtered.subList(from, to)

        val entries = pageItems.map { item ->
            val mimeType = formatRegistry.getFormatByExtension(item.fileExtension)?.mimeTypes?.firstOrNull()
                ?: "application/octet-stream"

            OpdsFeedGenerator.MediaItemEntry(
                id = item.itemId,
                title = item.fileName,
                author = item.author,
                description = null,
                mimeType = mimeType,
                thumbnailUrl = null,
                downloadToken = token
            )
        }

        val selfLink = "/opds/library/$libraryId?token=$token&page=$page&size=$size${if (!q.isNullOrBlank()) "&q=$q" else ""}"
        val nextLink = if (to < filtered.size)
            "/opds/library/$libraryId?token=$token&page=${page + 1}&size=$size${if (!q.isNullOrBlank()) "&q=$q" else ""}"
        else null
        val prevLink = if (page > 0)
            "/opds/library/$libraryId?token=$token&page=${page - 1}&size=$size${if (!q.isNullOrBlank()) "&q=$q" else ""}"
        else null

        val xml = opdsFeedGenerator.generateAcquisitionFeed(
            title = "Library $libraryId",
            items = entries,
            selfLink = selfLink,
            nextLink = nextLink,
            prevLink = prevLink
        )
        return newFixedLengthResponse(Response.Status.OK, MIME_XML, xml)
    }

    private fun serveDownload(session: IHTTPSession): Response {
        val itemId = session.uri.removePrefix("/opds/download/").toLongOrNull()
            ?: return newFixedLengthResponse(Response.Status.BAD_REQUEST, NanoHTTPD.MIME_PLAINTEXT, "Bad item id")
        val token = session.parameters["token"]?.firstOrNull()
            ?: return newFixedLengthResponse(Response.Status.UNAUTHORIZED, NanoHTTPD.MIME_PLAINTEXT, "Missing token")

        val linkResult = pollLink(token)
        if (!linkResult.ready) return pendingResponse("Token validation")
        val link = linkResult.value
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")

        val mediaResult = pollMedia(itemId)
        if (!mediaResult.ready) return pendingResponse("Loading item metadata")
        val media = mediaResult.value
            ?: return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "Item not found")

        if (link.targetType != "LIBRARY" || link.targetId != media.libraryId) {
            return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not valid for item")
        }

        return try {
            val file = java.io.File(media.filePath)
            if (!file.exists()) return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "File missing")
            val mime = formatRegistry.getFormatByExtension(media.fileExtension)?.mimeTypes?.firstOrNull()
                ?: "application/octet-stream"
            val fis = java.io.FileInputStream(file)
            try {
                newFixedLengthResponse(Response.Status.OK, mime, fis, file.length())
            } catch (e: Exception) {
                fis.close()
                throw e
            }
        } catch (e: Exception) {
            newFixedLengthResponse(Response.Status.INTERNAL_ERROR, NanoHTTPD.MIME_PLAINTEXT, "Error: ${e.message}")
        }
    }

    private fun pollLink(token: String): AsyncPollResult<SharedLink?> {
        val future = linkLookupCache.computeIfAbsent(token) {
            asyncFetch { sharingRepository.getByToken(token) }
        }
        return handleFuture(future, linkLookupCache, token)
    }

    private fun pollLibrary(libraryId: Long): AsyncPollResult<Library?> {
        val future = libraryLookupCache.computeIfAbsent(libraryId) {
            asyncFetch { libraryRepository.getLibraryById(libraryId) }
        }
        return handleFuture(future, libraryLookupCache, libraryId)
    }

    private fun pollLibraryItems(libraryId: Long): AsyncPollResult<List<MediaItem>> {
        val future = libraryItemsCache.computeIfAbsent(libraryId) {
            asyncFetch { mediaRepository.getMediaItemsByLibrary(libraryId).firstOrNull().orEmpty() }
        }
        return handleFuture(future, libraryItemsCache, libraryId)
    }

    private fun pollMedia(itemId: Long): AsyncPollResult<MediaItem?> {
        val future = mediaLookupCache.computeIfAbsent(itemId) {
            asyncFetch { mediaRepository.getMediaItemById(itemId) }
        }
        return handleFuture(future, mediaLookupCache, itemId)
    }

    private fun <K, T> handleFuture(
        future: CompletableFuture<T>,
        cache: ConcurrentHashMap<K, CompletableFuture<T>>,
        key: K
    ): AsyncPollResult<T> {
        if (!future.isDone) return AsyncPollResult(ready = false)
        return if (future.isCompletedExceptionally) {
            cache.remove(key)
            AsyncPollResult(ready = true, value = null)
        } else {
            AsyncPollResult(ready = true, value = future.getNow(null))
        }
    }

    private fun <T> asyncFetch(block: suspend () -> T): CompletableFuture<T> {
        val future = CompletableFuture<T>()
        requestScope.launch {
            try {
                future.complete(block())
            } catch (t: Throwable) {
                future.completeExceptionally(t)
            }
        }
        return future
    }

    private fun pendingResponse(detail: String): Response =
        newFixedLengthResponse(Response.Status.ACCEPTED, NanoHTTPD.MIME_PLAINTEXT, "$detail in progress, retry shortly")

    private data class AsyncPollResult<T>(
        val ready: Boolean,
        val value: T? = null
    )

    companion object {
        private const val MIME_XML = "application/atom+xml;profile=opds-catalog;kind=acquisition"
    }
}
