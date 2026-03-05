package com.cleverferret.v2.app.navigation

object V2NavigationGraph {
    enum class TopLevelDomain(val route: String) {
        LIBRARY("library"), READER("reader"), AUDIO("audio"), RADIO("radio"), DISCOVER("discover"), SYNC("sync"), SETTINGS("settings")
    }

    val CANONICAL_ROUTES = mapOf(
        TopLevelDomain.LIBRARY to listOf("library/home", "library/item/{itemId}", "library/collection/{collectionId}", "library/series/{seriesId}", "library/search"),
        TopLevelDomain.READER to listOf("reader/session/{itemId}", "reader/contents/{itemId}", "reader/annotations/{itemId}", "reader/theme"),
        TopLevelDomain.AUDIO to listOf("audio/home", "audio/now-playing", "audio/queue", "audio/audiobooks", "audio/podcasts", "audio/music"),
        TopLevelDomain.RADIO to listOf("radio/home", "radio/station/{stationId}", "radio/favorites"),
        TopLevelDomain.DISCOVER to listOf("discover/home", "discover/search", "discover/opds", "discover/webfiction", "discover/recommendations"),
        TopLevelDomain.SYNC to listOf("sync/home", "sync/providers", "sync/history", "sync/conflicts"),
        TopLevelDomain.SETTINGS to listOf("settings/home", "settings/reader", "settings/playback", "settings/network", "settings/security", "settings/import-export", "settings/about")
    )
}
