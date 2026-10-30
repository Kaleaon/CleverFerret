package com.cleverferret.v2.app.navigation

import com.cleverferret.v2.feature.audio.api.AudioNavDestination
import com.cleverferret.v2.feature.collections.api.CollectionsNavDestination
import com.cleverferret.v2.feature.library.api.LibraryNavDestination
import com.cleverferret.v2.feature.metadata.api.MetadataNavDestination
import com.cleverferret.v2.feature.opds.api.OpdsNavDestination
import com.cleverferret.v2.feature.plex.api.PlexNavDestination
import com.cleverferret.v2.feature.podcast.api.PodcastNavDestination
import com.cleverferret.v2.feature.radio.api.RadioNavDestination
import com.cleverferret.v2.feature.reader.api.ReaderNavDestination
import com.cleverferret.v2.feature.search.api.SearchNavDestination
import com.cleverferret.v2.feature.settings.api.SettingsNavDestination
import com.cleverferret.v2.feature.stats.api.StatsNavDestination
import com.cleverferret.v2.feature.sync.api.SyncNavDestination
import com.cleverferret.v2.feature.webfiction.api.WebfictionNavDestination
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class AppNavigationCatalogTest {
    @Test
    fun `canonical routes are unique across the app`() {
        val flattenedRoutes = AppNavigationCatalog.topLevelDestinations.values.flatten().map(AppDestination::route)

        assertEquals(flattenedRoutes.size, flattenedRoutes.distinct().size)
    }

    @Test
    fun `every top-level domain has at least one destination`() {
        V2NavigationGraph.TopLevelDomain.entries.forEach { domain ->
            assertTrue(AppNavigationCatalog.topLevelDestinations[domain].orEmpty().isNotEmpty())
        }
    }

    @Test
    fun `route equality confirms parity with previous canonical routes`() {
        val expectedCanonicalRoutes = setOf(
            "library/home",
            "library/item/{itemId}",
            "library/collection/{collectionId}",
            "library/series/{seriesId}",
            "library/search",
            "reader/session/{itemId}",
            "reader/contents/{itemId}",
            "reader/annotations/{itemId}",
            "reader/theme",
            "audio/home",
            "audio/now-playing",
            "audio/queue",
            "audio/audiobooks",
            "audio/podcasts",
            "audio/music",
            "radio/home",
            "radio/station/{stationId}",
            "radio/favorites",
            "discover/home",
            "discover/search",
            "discover/opds",
            "discover/webfiction",
            "discover/recommendations",
            "sync/home",
            "sync/providers",
            "sync/history",
            "sync/conflicts",
            "settings/home",
            "settings/reader",
            "settings/playback",
            "settings/network",
            "settings/security",
            "settings/import-export",
            "settings/about",
        )

        assertEquals(expectedCanonicalRoutes, AppNavigationCatalog.allRoutes)
    }

    @Test
    fun `verify all 14 feature sealed class nav destinations match canonical paths`() {
        assertEquals("library/home", LibraryNavDestination.Home.route)
        assertEquals("reader/session/123", ReaderNavDestination.Session("123").route)
        assertEquals("audio/home", AudioNavDestination.Home.route)
        assertEquals("radio/home", RadioNavDestination.Home.route)
        assertEquals("discover/opds", OpdsNavDestination.Catalog.route)
        assertEquals("discover/webfiction", WebfictionNavDestination.Home.route)
        assertEquals("sync/home", SyncNavDestination.Home.route)
        assertEquals("settings/home", SettingsNavDestination.Home.route)
        assertEquals("library/search", SearchNavDestination.LibrarySearch.route)
        assertEquals("sync/plex", PlexNavDestination.Integration.route)
        assertEquals("podcast/detail/abc", PodcastNavDestination.Detail("abc").route)
        assertEquals("library/collection/col1", CollectionsNavDestination.Detail("col1").route)
        assertEquals("metadata/editor/item1", MetadataNavDestination.Editor("item1").route)
        assertEquals("library/stats", StatsNavDestination.ReadingStats.route)
    }
}
