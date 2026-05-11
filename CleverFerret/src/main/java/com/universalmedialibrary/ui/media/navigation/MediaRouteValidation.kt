package com.universalmedialibrary.ui.media.navigation

private fun sanitizeRouteParamForDisplay(input: String, maxLen: Int = 60): String {
    // Defensive: route params may come from deep links; keep UI strings printable and bounded.
    return input
        .replace(Regex("[\\p{Cc}\\p{Cf}]"), "")
        .take(maxLen)
        .trim()
}

private val knownStaticRoutes = setOf(
    MediaRoutes.HOME,
    MediaRoutes.SEARCH,
    MediaRoutes.ACTIVITY,
    MediaRoutes.SETTINGS,
    MediaRoutes.LIBRARY_ROOT,
    MediaRoutes.BOOKS,
    MediaRoutes.AUDIOBOOKS,
    MediaRoutes.MUSIC,
    MediaRoutes.PODCASTS,
    MediaRoutes.COMICS,
    MediaRoutes.MOVIES,
    MediaRoutes.TV_SHOWS,
    MediaRoutes.WEB_FICTION,
    MediaRoutes.RADIO,
    MediaRoutes.DOCUMENTS,
    MediaRoutes.DISCOVER,
    MediaRoutes.OPDS_BROWSER,
    MediaRoutes.PODCAST_DISCOVER,
    MediaRoutes.COLLECTIONS,
    MediaRoutes.TAGS,
    MediaRoutes.TAG_MANAGER,
    MediaRoutes.TAG_EXPLORER,
    MediaRoutes.SMART_COLLECTIONS,
    MediaRoutes.UNIVERSAL_SEARCH,
    MediaRoutes.AMBIENT_SOUNDS,
    MediaRoutes.NEWS,
    MediaRoutes.VISUALIZER,
    MediaRoutes.SYNC,
    MediaRoutes.IMPORT_EXPORT,
    MediaRoutes.FOLDER_IMPORT,
    MediaRoutes.LANDSEEK,
    MediaRoutes.ENHANCED_FILE_BROWSER,
    MediaRoutes.SETTINGS_API,
    MediaRoutes.SETTINGS_APPEARANCE,
    MediaRoutes.SETTINGS_PLAYBACK,
    MediaRoutes.SETTINGS_READER,
    MediaRoutes.SETTINGS_STORAGE,
    MediaRoutes.SETTINGS_SECURITY,
    MediaRoutes.SETTINGS_ABOUT,
    MediaRoutes.SETTINGS_MEDIA_SERVERS,
    MediaRoutes.FILE_BROWSER,
    MediaRoutes.ONBOARDING,
    MediaRoutes.DEBUG_MENU
)

private val knownParameterizedPrefixes = listOf(
    "library/",
    "detail/",
    "reader/",
    "player/",
    "discover/webfiction/",
    "home/see-all/",
    "collection/",
    "tag/",
    "smart_collection/",
    "enhanced_search",
    "not-found",
    "room-chat/"
)

internal fun resolveRouteOrFallback(route: String): String {
    if (route in knownStaticRoutes) return route
    if (knownParameterizedPrefixes.any { route.startsWith(it) }) return route
    return MediaRoutes.notFoundRoute(route)
}
