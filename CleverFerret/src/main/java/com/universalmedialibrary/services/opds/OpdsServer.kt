package com.universalmedialibrary.services.opds

import android.util.Log
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.SharingRepository
import fi.iki.elonen.NanoHTTPD
import kotlinx.coroutines.runBlocking
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class OpdsServer @Inject constructor(
    private val mediaRepository: MediaRepository,
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
        if (!enabled) return newFixedLengthResponse(Response.Status.NOT_FOUND, MIME_PLAINTEXT, "OPDS disabled")

        return try {
            when (session.uri) {
                "/opds" -> newFixedLengthResponse(MIME_XML, opdsService.generateCatalogFeed())
                else -> newFixedLengthResponse(Response.Status.NOT_FOUND, MIME_PLAINTEXT, "Not found")
            }
        } catch (e: Exception) {
            newFixedLengthResponse(Response.Status.INTERNAL_ERROR, MIME_PLAINTEXT, "Error: ${e.message}")
        }
    }

    companion object {
        private const val MIME_XML = "application/atom+xml;profile=opds-catalog;kind=acquisition"
    }
}

