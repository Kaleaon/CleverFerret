package com.cleverferret.v2.app.navigation

object V2NavigationGraph {
    enum class TopLevelDomain(val route: String, val displayNameKey: String) {
        LIBRARY("library", "navigation_library"),
        READER("reader", "reader_title"),
        AUDIO("audio", "audio_player_title"),
        RADIO("radio", "fm_radio_title"),
        DISCOVER("discover", "nav_domain_discover"),
        SYNC("sync", "notification_sync_progress"),
        SETTINGS("settings", "navigation_settings");

        val displayName: String get() = displayNameKey
    }

    val CANONICAL_ROUTES: Map<TopLevelDomain, List<String>> = AppNavigationCatalog.topLevelDestinations
        .mapValues { (_, destinations) -> destinations.map(AppDestination::route) }
}
