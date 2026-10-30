package com.cleverferret.v2.app.navigation

import com.cleverferret.v2.feature.audio.api.AudioNavDestination
import com.cleverferret.v2.feature.library.api.LibraryNavDestination
import com.cleverferret.v2.feature.opds.api.OpdsNavDestination
import com.cleverferret.v2.feature.radio.api.RadioNavDestination
import com.cleverferret.v2.feature.reader.api.ReaderNavDestination
import com.cleverferret.v2.feature.search.api.SearchNavDestination
import com.cleverferret.v2.feature.settings.api.SettingsNavDestination
import com.cleverferret.v2.feature.sync.api.SyncNavDestination
import com.cleverferret.v2.feature.webfiction.api.WebfictionNavDestination

object AppNavigationCatalog {
    private fun domain(
        route: String,
        title: String,
        supportsSearch: Boolean = false,
    ): AppDestination = AppDestination(route = route, title = title, supportsSearch = supportsSearch)

    val topLevelDestinations: Map<V2NavigationGraph.TopLevelDomain, List<AppDestination>> = mapOf(
        V2NavigationGraph.TopLevelDomain.LIBRARY to listOf(
            domain(LibraryNavDestination.Home.route, "Library", supportsSearch = true),
            domain(LibraryNavDestination.Item("{itemId}").route, "Item Details"),
            domain(LibraryNavDestination.Collection("{collectionId}").route, "Collection"),
            domain(LibraryNavDestination.Series("{seriesId}").route, "Series"),
            domain(LibraryNavDestination.Search.route, "Library Search", supportsSearch = true),
        ),
        V2NavigationGraph.TopLevelDomain.READER to listOf(
            domain(ReaderNavDestination.Session("{itemId}").route, "Reader"),
            domain(ReaderNavDestination.Contents("{itemId}").route, "Contents"),
            domain(ReaderNavDestination.Annotations("{itemId}").route, "Annotations"),
            domain(ReaderNavDestination.Theme.route, "Theme"),
        ),
        V2NavigationGraph.TopLevelDomain.AUDIO to listOf(
            domain(AudioNavDestination.Home.route, "Audio", supportsSearch = true),
            domain(AudioNavDestination.NowPlaying.route, "Now Playing"),
            domain(AudioNavDestination.Queue.route, "Queue"),
            domain(AudioNavDestination.Audiobooks.route, "Audiobooks", supportsSearch = true),
            domain(AudioNavDestination.Podcasts.route, "Podcasts", supportsSearch = true),
            domain(AudioNavDestination.Music.route, "Music", supportsSearch = true),
        ),
        V2NavigationGraph.TopLevelDomain.RADIO to listOf(
            domain(RadioNavDestination.Home.route, "Radio", supportsSearch = true),
            domain(RadioNavDestination.Station("{stationId}").route, "Station"),
            domain(RadioNavDestination.Favorites.route, "Favorites"),
        ),
        V2NavigationGraph.TopLevelDomain.DISCOVER to listOf(
            domain("discover/home", "Discover", supportsSearch = true),
            domain(SearchNavDestination.DiscoverSearch.route, "Discover Search", supportsSearch = true),
            domain(OpdsNavDestination.Catalog.route, "OPDS Catalogs"),
            domain(WebfictionNavDestination.Home.route, "Web Fiction"),
            domain("discover/recommendations", "Recommendations"),
        ),
        V2NavigationGraph.TopLevelDomain.SYNC to listOf(
            domain(SyncNavDestination.Home.route, "Sync"),
            domain(SyncNavDestination.Providers.route, "Providers"),
            domain(SyncNavDestination.History.route, "History"),
            domain(SyncNavDestination.Conflicts.route, "Conflicts"),
        ),
        V2NavigationGraph.TopLevelDomain.SETTINGS to listOf(
            domain(SettingsNavDestination.Home.route, "Settings", supportsSearch = true),
            domain(SettingsNavDestination.Reader.route, "Reader Preferences"),
            domain(SettingsNavDestination.Playback.route, "Playback Preferences"),
            domain(SettingsNavDestination.Network.route, "Network Preferences"),
            domain(SettingsNavDestination.Security.route, "Security"),
            domain(SettingsNavDestination.ImportExport.route, "Import and Export"),
            domain(SettingsNavDestination.About.route, "About"),
        ),
    )

    val allRoutes: Set<String> = topLevelDestinations.values
        .flatten()
        .map { it.route }
        .toSet()
}
