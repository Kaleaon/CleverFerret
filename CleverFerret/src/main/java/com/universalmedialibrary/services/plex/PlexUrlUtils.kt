package com.universalmedialibrary.services.plex

import com.universalmedialibrary.data.local.entity.PlexServer

/**
 * Utility functions for building authenticated Plex stream and thumbnail URLs,
 * and sanitizing URLs in logs to prevent secret leakage.
 */
object PlexUrlUtils {

    /**
     * Resolves the direct media stream part endpoint for playback or caching.
     * Format: {server.url}/library/parts/{ratingKey}/file?X-Plex-Token={token}
     */
    fun buildMediaStreamPartUrl(server: PlexServer, ratingKey: String): String {
        val baseUrl = server.url.trimEnd('/')
        val token = server.token
        return "$baseUrl/library/parts/$ratingKey/file?X-Plex-Token=$token"
    }

    /**
     * Resolves a relative or unauthenticated thumbnail path into a fully-qualified,
     * authenticated URL: ${server.url}${thumb}?X-Plex-Token=${token}
     */
    fun buildAuthenticatedThumbnailUrl(server: PlexServer, thumb: String?): String? {
        if (thumb.isNullOrBlank()) return null
        val token = server.token
        val cleanThumb = thumb.trim()
        val baseUrl = server.url.trimEnd('/')

        val fullUrl = if (cleanThumb.startsWith("http://") || cleanThumb.startsWith("https://")) {
            cleanThumb
        } else {
            val path = if (cleanThumb.startsWith("/")) cleanThumb else "/$cleanThumb"
            "$baseUrl$path"
        }

        return if (token.isNotBlank()) {
            if (fullUrl.contains("X-Plex-Token=")) {
                fullUrl
            } else {
                val separator = if (fullUrl.contains("?")) "&" else "?"
                "$fullUrl${separator}X-Plex-Token=$token"
            }
        } else {
            fullUrl
        }
    }

    /**
     * Redacts authentication tokens and API keys in URLs or messages
     * to prevent credential leakage in logs and exception traces.
     */
    fun sanitizeUrl(message: String): String {
        return message
            .replace(Regex("(?i)(X-Plex-Token=)[^&\\s]+"), "$1[REDACTED]")
            .replace(Regex("(?i)(api_key=)[^&\\s]+"), "$1[REDACTED]")
    }
}
