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
) : NanoHTTPD(8088) {

    @Volatile
    private var enabled: Boolean = false

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
                else -> newFixedLengthResponse(Response.Status.NOT_FOUND, NanoHTTPD.MIME_PLAINTEXT, "Not found")
            }
        } catch (e: Exception) {
            newFixedLengthResponse(Response.Status.INTERNAL_ERROR, NanoHTTPD.MIME_PLAINTEXT, "Error: ${e.message}")
        }
    }

    private fun serveLibraries(): Response {
        val xml = runBlocking {
            val libs = libraryRepository.getAllLibraries().firstOrNull().orEmpty()
            val entries = libs.joinToString("\n") { lib ->
                """
                <entry>
                  <title>${lib.name}</title>
                  <id>urn:lib:${lib.libraryId}</id>
                  <link rel="subsection" href="/opds/library/${lib.libraryId}" />
                </entry>
                """.trimIndent()
            }
            """
            <?xml version="1.0" encoding="utf-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog">
              <title>Libraries</title>
              $entries
            </feed>
            """.trimIndent()
        }
        return newFixedLengthResponse(MIME_XML, xml)
    }

    private fun serveLibraryItems(session: IHTTPSession): Response {
        val libraryId = session.uri.removePrefix("/opds/library/").toLongOrNull() ?: return newFixedLengthResponse(Response.Status.BAD_REQUEST, MIME_PLAINTEXT, "Bad library id")
        val xml = runBlocking {
            val items = mediaRepository.getMediaItemsByLibrary(libraryId).firstOrNull().orEmpty()
            val entries = items.joinToString("\n") { item ->
                """
                <entry>
                  <title>${item.fileName}</title>
                  <id>urn:item:${item.itemId}</id>
                </entry>
                """.trimIndent()
            }
            """
            <?xml version="1.0" encoding="utf-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog">
              <title>Library $libraryId</title>
              $entries
            </feed>
            """.trimIndent()
        }
        return newFixedLengthResponse(MIME_XML, xml)
    }

    companion object {
        private const val MIME_XML = "application/atom+xml;profile=opds-catalog;kind=acquisition"
    }
}

