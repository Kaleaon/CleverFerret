package com.universalmedialibrary.services.podcast

import java.security.MessageDigest
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec

internal fun parsePodcastIndexCredentialsString(raw: String?): PodcastIndexCredentials? {
    if (raw.isNullOrBlank()) return null
    val tokens = raw.split(':', '|', ';', ',', '\n', '\r', '\t', ' ')
        .map { it.trim() }
        .filter { it.isNotEmpty() }
    return if (tokens.size >= 2) {
        PodcastIndexCredentials(tokens[0], tokens[1])
    } else {
        null
    }
}

internal fun createPodcastIndexAuthorizationSignature(
    credentials: PodcastIndexCredentials,
    epochSeconds: String
): String {
    return sha1(credentials.apiKey + credentials.apiSecret + epochSeconds)
}

internal fun sha1(input: String): String {
    val digest = MessageDigest.getInstance("SHA-1")
    val hash = digest.digest(input.toByteArray(Charsets.UTF_8))
    return hash.joinToString("") { "%02x".format(it) }
}

internal fun deduplicatePodcastResults(results: List<PodcastSearchResult>): List<PodcastSearchResult> {
    // Group by feed URL first (most accurate)
    val byFeedUrl = results.groupBy { it.feedUrl.trim().lowercase() }
    val deduplicated = mutableListOf<PodcastSearchResult>()

    byFeedUrl.forEach { (feedUrl, podcasts) ->
        if (feedUrl.isNotEmpty()) {
            // Take the result with most complete information
            val best = podcasts.maxByOrNull {
                (if (it.description?.isNotEmpty() == true) 1 else 0) +
                (if (it.imageUrl != null) 1 else 0) +
                (if (it.category != null) 1 else 0) +
                (it.episodeCount ?: 0)
            }
            best?.let { deduplicated.add(it) }
        } else {
            // For results without feed URLs (like Spotify), add all
            deduplicated.addAll(podcasts)
        }
    }

    // Additional deduplication by title similarity for remaining items
    return deduplicated.distinctBy { it.title.lowercase().trim() }
}

internal fun hasValidFeedUrl(feedUrl: String?): Boolean = feedUrl.toValidFeedUrlOrNull() != null

private fun firstValidFeedUrl(vararg candidates: String?): String? =
    candidates.firstNotNullOfOrNull { it.toValidFeedUrlOrNull() }

internal fun firstValidFeedUrl(vararg candidates: String?): String? =
    candidates.firstNotNullOfOrNull { it.toValidFeedUrlOrNull() }

internal fun String?.toValidFeedUrlOrNull(): String? {
    val trimmed = this?.trim()?.takeIf { it.isNotEmpty() } ?: return null
    return try {
        val uri = URI(trimmed)
        val scheme = uri.scheme?.lowercase(Locale.US)
        if ((scheme == "http" || scheme == "https") && !uri.host.isNullOrBlank()) trimmed else null
    } catch (_: URISyntaxException) {
        null
    } catch (_: IllegalArgumentException) {
        null
    }
}

internal fun parsePubDateToMillis(pubDate: String?): Long {
    if (pubDate.isNullOrBlank()) return 0L
    return runCatching {
        SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH)
            .parse(pubDate)
            ?.time
            ?: 0L
    }.getOrDefault(0L)
}

internal fun resolveUrl(feedUrl: String, candidate: String?): String? {
    if (candidate.isNullOrBlank()) return null
    return runCatching {
        URI(feedUrl).resolve(candidate.trim()).toString()
    }.getOrDefault(candidate)
}

internal fun parseDuration(durationStr: String?): Long {
    if (durationStr.isNullOrEmpty()) return 0L

    return try {
        if (durationStr.contains(":")) {
            val parts = durationStr.split(":")
            when (parts.size) {
                3 -> { // HH:MM:SS
                    val hours = parts[0].toLong()
                    val minutes = parts[1].toLong()
                    val seconds = parts[2].toLong()
                    hours * 3600 + minutes * 60 + seconds
                }
                2 -> { // MM:SS
                    val minutes = parts[0].toLong()
                    val seconds = parts[1].toLong()
                    minutes * 60 + seconds
                }
                else -> 0L
            }
        } else {
            // Assume it's seconds
            durationStr.toLongOrNull() ?: 0L
        }
    } catch (e: Exception) {
        0L
    }
}

internal fun generatePodcastId(feedUrl: String): Long {
    return feedUrl.hashCode().toLong().let { if (it < 0) -it else it }
}

internal fun sanitizeFileName(name: String): String {
    return fileNameSanitizer.sanitizeFileName(name)
}

internal fun getFileExtension(url: String): String {
    return try {
        val path = URL(url).path
        val lastDot = path.lastIndexOf('.')
        if (lastDot > 0 && lastDot < path.length - 1) {
            path.substring(lastDot + 1).lowercase()
        } else {
            "mp3" // Default to mp3
        }
    } catch (e: Exception) {
        "mp3"
    }
}


internal fun normalizeEpisodeList(items: List<RSSItem>, feedUrl: String): List<RSSItem> {
    return items
        .mapIndexed { index, item ->
            val normalizedTitle = item.title.ifBlank { "Episode ${index + 1}" }
                .replace("\\s+".toRegex(), " ")
                .trim()
            val normalizedGuid = item.guid?.ifBlank { null }
                ?: item.audioUrl?.ifBlank { null }
                ?: item.link?.ifBlank { null }
                ?: "$feedUrl#$index"
            val normalizedAudioUrl = item.audioUrl?.let { resolveUrl(feedUrl, it) }
            item.copy(
                title = normalizedTitle,
                guid = normalizedGuid,
                audioUrl = normalizedAudioUrl
            )
        }
        .filter { !it.audioUrl.isNullOrBlank() }
        .distinctBy { it.guid?.trim()?.lowercase(Locale.US) ?: "" }
        .sortedByDescending { parsePubDateToMillis(it.pubDate) }
}

internal fun convertRSSItemsToEpisodes(items: List<RSSItem>, podcastId: Long): List<PodcastEpisode> {
    val dateFormat = SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH)

    return items.mapIndexed { index, item ->
        val publishDate = try {
            dateFormat.parse(item.pubDate ?: "")?.time
        } catch (e: Exception) {
            System.currentTimeMillis() // Fallback to current time
        } ?: System.currentTimeMillis()

        val duration = parseDuration(item.duration)

        PodcastEpisode(
            id = 0, // Auto-generated by database
            podcastId = podcastId,
            guid = item.guid ?: "${podcastId}_$index",
            title = item.title,
            description = item.description,
            audioUrl = item.audioUrl ?: "",
            duration = duration,
            fileSize = item.fileSize ?: 0,
            publishDate = publishDate,
            episodeNumber = item.episodeNumber,
            seasonNumber = item.seasonNumber,
            imageUrl = item.imageUrl
        )
    }
}

