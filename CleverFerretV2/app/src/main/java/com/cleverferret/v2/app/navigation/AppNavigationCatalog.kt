package com.cleverferret.v2.app.navigation

object AppNavigationCatalog {
    private fun domain(
        route: String,
        title: String,
        supportsSearch: Boolean = false,
    ): AppDestination = AppDestination(route = route, title = title, supportsSearch = supportsSearch)

    val topLevelDestinations: Map<V2NavigationGraph.TopLevelDomain, List<AppDestination>> = mapOf(
        V2NavigationGraph.TopLevelDomain.LIBRARY to listOf(
            domain("library/home", "Library", supportsSearch = true),
            domain("library/item/{itemId}", "Item Details"),
            domain("library/collection/{collectionId}", "Collection"),
            domain("library/series/{seriesId}", "Series"),
            domain("library/search", "Library Search", supportsSearch = true),
        ),
        V2NavigationGraph.TopLevelDomain.READER to listOf(
            domain("reader/session/{itemId}", "Reader"),
            domain("reader/contents/{itemId}", "Contents"),
            domain("reader/annotations/{itemId}", "Annotations"),
            domain("reader/theme", "Theme"),
        ),
        V2NavigationGraph.TopLevelDomain.AUDIO to listOf(
            domain("audio/home", "Audio", supportsSearch = true),
            domain("audio/now-playing", "Now Playing"),
            domain("audio/queue", "Queue"),
            domain("audio/audiobooks", "Audiobooks", supportsSearch = true),
            domain("audio/podcasts", "Podcasts", supportsSearch = true),
            domain("audio/music", "Music", supportsSearch = true),
        ),
        V2NavigationGraph.TopLevelDomain.RADIO to listOf(
            domain("radio/home", "Radio", supportsSearch = true),
            domain("radio/station/{stationId}", "Station"),
            domain("radio/favorites", "Favorites"),
        ),
        V2NavigationGraph.TopLevelDomain.DISCOVER to listOf(
            domain("discover/home", "Discover", supportsSearch = true),
            domain("discover/search", "Discover Search", supportsSearch = true),
            domain("discover/opds", "OPDS Catalogs"),
            domain("discover/webfiction", "Web Fiction"),
            domain("discover/recommendations", "Recommendations"),
        ),
        V2NavigationGraph.TopLevelDomain.SYNC to listOf(
            domain("sync/home", "Sync"),
            domain("sync/providers", "Providers"),
            domain("sync/history", "History"),
            domain("sync/conflicts", "Conflicts"),
        ),
        V2NavigationGraph.TopLevelDomain.SETTINGS to listOf(
            domain("settings/home", "Settings", supportsSearch = true),
            domain("settings/reader", "Reader Preferences"),
            domain("settings/playback", "Playback Preferences"),
            domain("settings/network", "Network Preferences"),
            domain("settings/security", "Security"),
            domain("settings/import-export", "Import and Export"),
            domain("settings/about", "About"),
        ),
    )

    val allRoutes: Set<String> = topLevelDestinations.values
        .flatten()
        .map { it.route }
        .toSet()
}
