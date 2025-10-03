package com.universalmedialibrary.services.opds

import android.util.Log
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.SharingRepository
import fi.iki.elonen.NanoHTTPD
import kotlinx.coroutines.runBlocking
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class OpdsServer @Inject constructor(
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository,
    private val sharingRepository: SharingRepository,
    private val opdsService: OpdsService
) : NanoHTTPD("127.0.0.1", 8088) {

    @Volatile
    private var enabled: Boolean = false

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
            stop()
        }
    }

    override fun serve(session: IHTTPSession): Response {
        if (!enabled) return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "OPDS disabled")

        return try {
            when {
                session.uri == "/opds" -> newFixedLengthResponse(MIME_XML, opdsService.generateCatalogFeed())
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
        val link = runBlocking { sharingRepository.getByToken(token) }
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")
        if (link.targetType != "LIBRARY") return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not for libraries")

        val xml = runBlocking {
            val lib = libraryRepository.getLibraryById(link.targetId)
            val entries = if (lib != null) {
                """
                <entry>
                  <title>${lib.name}</title>
                  <id>urn:lib:${lib.libraryId}</id>
                  <link rel=\"subsection\" href=\"/opds/library/${lib.libraryId}?token=$token\" />
                </entry>
                """.trimIndent()
            } else ""
            """
            <?xml version=\"1.0\" encoding=\"utf-8\"?>
            <feed xmlns=\"http://www.w3.org/2005/Atom\" xmlns:opds=\"http://opds-spec.org/2010/catalog\">
              <title>Shared Libraries</title>
              $entries
            </feed>
            """.trimIndent()
        }
        return newFixedLengthResponse(MIME_XML, xml)
    }

    private fun serveLibraryItems(session: IHTTPSession): Response {
        val libraryId = session.uri.removePrefix("/opds/library/").toLongOrNull()
            ?: return newFixedLengthResponse(Response.Status.BAD_REQUEST, NanoHTTPD.MIME_PLAINTEXT, "Bad library id")
        val token = session.parameters["token"]?.firstOrNull()
            ?: return newFixedLengthResponse(Response.Status.UNAUTHORIZED, NanoHTTPD.MIME_PLAINTEXT, "Missing token")
        val link = runBlocking { sharingRepository.getByToken(token) }
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")
        if (link.targetType != "LIBRARY" || link.targetId != libraryId) return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not valid for library")

        // Basic search and pagination
        val q = session.parameters["q"]?.firstOrNull()?.lowercase()
        val page = session.parameters["page"]?.firstOrNull()?.toIntOrNull()?.coerceAtLeast(0) ?: 0
        val size = session.parameters["size"]?.firstOrNull()?.toIntOrNull()?.coerceIn(1, 200) ?: 50

        val xml = runBlocking {
            var items = mediaRepository.getMediaItemsByLibrary(libraryId).firstOrNull().orEmpty()
            if (!q.isNullOrBlank()) {
                items = items.filter { it.fileName.lowercase().contains(q) }
            }
            val from = (page * size).coerceAtMost(items.size)
            val to = (from + size).coerceAtMost(items.size)
            val pageItems = items.subList(from, to)
            val entries = pageItems.joinToString("\n") { item ->
                """
                <entry>
                  <title>${item.fileName}</title>
                  <id>urn:item:${item.itemId}</id>
                  <link rel=\"http://opds-spec.org/acquisition/open-access\" href=\"/opds/download/${item.itemId}?token=$token\" />
                </entry>
                """.trimIndent()
            }
            val nextLink = if (to < items.size) "<link rel=\"next\" href=\"/opds/library/$libraryId?token=$token&page=${page + 1}&size=$size${if (!q.isNullOrBlank()) "&q=$q" else ""}\" />" else ""
            """
            <?xml version=\"1.0\" encoding=\"utf-8\"?>
            <feed xmlns=\"http://www.w3.org/2005/Atom\" xmlns:opds=\"http://opds-spec.org/2010/catalog\">
              <title>Library $libraryId</title>
              $entries
              $nextLink
            </feed>
            """.trimIndent()
        }
        return newFixedLengthResponse(MIME_XML, xml)
    }

    private fun serveDownload(session: IHTTPSession): Response {
        val itemId = session.uri.removePrefix("/opds/download/").toLongOrNull()
            ?: return newFixedLengthResponse(Response.Status.BAD_REQUEST, NanoHTTPD.MIME_PLAINTEXT, "Bad item id")
        val token = session.parameters["token"]?.firstOrNull()
            ?: return newFixedLengthResponse(Response.Status.UNAUTHORIZED, NanoHTTPD.MIME_PLAINTEXT, "Missing token")
        val link = runBlocking { sharingRepository.getByToken(token) }
            ?: return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Invalid token")
        val media = runBlocking { mediaRepository.getMediaItemById(itemId) }
            ?: return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "Item not found")
        if (link.targetType != "LIBRARY" || link.targetId != media.libraryId) {
            return newFixedLengthResponse(Response.Status.FORBIDDEN, NanoHTTPD.MIME_PLAINTEXT, "Token not valid for item")
        }

        return try {
            val file = java.io.File(media.filePath)
            if (!file.exists()) return newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "File missing")
            val mime = when (media.fileExtension.lowercase()) {
                "epub" -> "application/epub+zip"
                "pdf" -> "application/pdf"
                "cbz" -> "application/x-cbz"
                "cbr" -> "application/x-cbr"
                else -> "application/octet-stream"
            }
            val fis = java.io.FileInputStream(file)
            newFixedLengthResponse(Response.Status.OK, mime, fis, file.length())
        } catch (e: Exception) {
            newFixedLengthResponse(Response.Status.INTERNAL_ERROR, NanoHTTPD.MIME_PLAINTEXT, "Error: ${e.message}")
        }
    }

    companion object {
        private const val MIME_XML = "application/atom+xml;profile=opds-catalog;kind=acquisition"
    }
}
