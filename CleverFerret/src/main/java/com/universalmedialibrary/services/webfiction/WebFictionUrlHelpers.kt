package com.universalmedialibrary.services.webfiction

internal fun detectSite(url: String): WebFictionSiteType {
    val domain = URL(url).host.lowercase()
    return when {
        "archiveofourown.org" in domain -> WebFictionSiteType.ARCHIVE_OF_OUR_OWN
        "fanfiction.net" in domain -> WebFictionSiteType.FANFICTION_NET
        "royalroad.com" in domain -> WebFictionSiteType.ROYAL_ROAD
        "webnovel.com" in domain -> WebFictionSiteType.WEBNOVEL
        "wattpad.com" in domain -> WebFictionSiteType.WATTPAD
        "scribblehub.com" in domain -> WebFictionSiteType.SCRIBBLE_HUB
        "spacebattles.com" in domain -> WebFictionSiteType.SPACEBATTLES
        "sufficientvelocity.com" in domain -> WebFictionSiteType.SUFFICIENT_VELOCITY
        "questionablequesting.com" in domain -> WebFictionSiteType.QUESTIONABLE_QUESTING
        "fimfiction.net" in domain -> WebFictionSiteType.FIMFICTION
        "metabods.com" in domain -> WebFictionSiteType.METABODS
        "literotica.com" in domain -> WebFictionSiteType.LITEROTICA
        "nifty.org" in domain -> WebFictionSiteType.NIFTY
        "adult-fanfiction.org" in domain -> WebFictionSiteType.ADULT_FANFICTION
        "bdsmlibrary.com" in domain -> WebFictionSiteType.BDSM_LIBRARY
        "mcstories.com" in domain -> WebFictionSiteType.MCSTORIES
        else -> WebFictionSiteType.GENERIC
    }
}

fun parseAndValidateSourceUrl(rawUrl: String): ValidatedWebFictionUrl {
    val normalized = rawUrl.trim()
    require(normalized.isNotBlank()) { "Enter a story URL to continue." }

    val uri = try {
        URI(normalized)
    } catch (_: Exception) {
        throw UnsupportedWebFictionUrlException("Invalid URL format. Include the full https:// address.")
    }

    if (uri.scheme.isNullOrBlank() || uri.host.isNullOrBlank()) {
        throw UnsupportedWebFictionUrlException("Invalid URL format. Include the full https:// address.")
    }
    if (uri.scheme != "https" && uri.scheme != "http") {
        throw UnsupportedWebFictionUrlException("Only http/https story URLs are supported.")
    }

    val cleanUrl = uri.normalize().toString()
    val siteType = detectSite(cleanUrl)
    if (siteType == WebFictionSiteType.GENERIC) {
        throw UnsupportedWebFictionUrlException(
            "Unsupported site. Use AO3, FanFiction.Net, Royal Road, WebNovel, Wattpad, Scribble Hub, FimFiction, or supported adult-source domains."
        )
    }

    return ValidatedWebFictionUrl(
        normalizedUrl = cleanUrl.substringBefore("#"),
        siteType = siteType
    )
}

internal fun mapSiteFailure(url: String, e: Exception): Exception {
    val message = e.message?.lowercase().orEmpty()
    return when {
        e is HttpStatusException && e.statusCode in setOf(429, 403, 503) ->
            WebFictionRateLimitException("Rate-limited by source site for $url (HTTP ${e.statusCode}).")
        e is SocketTimeoutException ->
            WebFictionRateLimitException("Timed out while contacting source site for $url.")
        "429" in message || "rate limit" in message || "too many requests" in message ->
            WebFictionRateLimitException("Rate-limited by source site for $url.")
        "selector" in message || "not found" in message || "element" in message ->
            WebFictionSiteChangedException("Source page structure changed for $url.")
        else -> e
    }
}

internal fun parseStoryStatus(statusText: String?): StoryStatus {
    if (statusText == null) return StoryStatus.UNKNOWN
    val normalized = statusText.lowercase()
    return when {
        "complete" in normalized || "completed" in normalized -> StoryStatus.COMPLETED
        "ongoing" in normalized || "in-progress" in normalized || "in progress" in normalized -> StoryStatus.ONGOING
        "hiatus" in normalized -> StoryStatus.HIATUS
        "cancelled" in normalized || "abandoned" in normalized -> StoryStatus.CANCELLED
        else -> StoryStatus.UNKNOWN
    }
}

internal fun siteTypeToString(siteType: WebFictionSiteType): String {
    return when (siteType) {
        WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> "Archive of Our Own"
        WebFictionSiteType.FANFICTION_NET -> "FanFiction.Net"
        WebFictionSiteType.ROYAL_ROAD -> "Royal Road"
        WebFictionSiteType.WEBNOVEL -> "WebNovel"
        WebFictionSiteType.WATTPAD -> "Wattpad"
        WebFictionSiteType.SCRIBBLE_HUB -> "ScribbleHub"
        WebFictionSiteType.SPACEBATTLES -> "SpaceBattles"
        WebFictionSiteType.SUFFICIENT_VELOCITY -> "Sufficient Velocity"
        WebFictionSiteType.QUESTIONABLE_QUESTING -> "Questionable Questing"
        WebFictionSiteType.FIMFICTION -> "FimFiction"
        WebFictionSiteType.LITEROTICA -> "Literotica"
        WebFictionSiteType.METABODS -> "Metabods"
        WebFictionSiteType.NIFTY -> "Nifty Archive"
        WebFictionSiteType.ADULT_FANFICTION -> "Adult-FanFiction"
        WebFictionSiteType.BDSM_LIBRARY -> "BDSM Library"
        WebFictionSiteType.MCSTORIES -> "MCStories"
        WebFictionSiteType.GENERIC -> "Generic"
    }
}

internal fun extractAO3Id(url: String): String {
    return Regex("works/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractFFNId(url: String): String {
    return Regex("s/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractRoyalRoadId(url: String): String {
    return Regex("fiction/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractWebnovelId(url: String): String {
    return Regex("book/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractWattpadId(url: String): String {
    return Regex("story/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractScribbleHubId(url: String): String {
    return Regex("series/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

internal fun extractFimFictionId(url: String): String {
    return Regex("story/(\\d+)").find(url)?.groupValues?.getOrNull(1) ?: url.hashCode().toString()
}

