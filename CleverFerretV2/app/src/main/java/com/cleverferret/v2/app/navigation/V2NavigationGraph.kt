package com.cleverferret.v2.app.navigation

object V2NavigationGraph {
    enum class TopLevelDomain(val route: String, val displayName: String) {
        LIBRARY("library", "Library"),
        READER("reader", "Reader"),
        AUDIO("audio", "Audio"),
        RADIO("radio", "Radio"),
        DISCOVER("discover", "Discover"),
        SYNC("sync", "Sync"),
        SETTINGS("settings", "Settings"),
    }

    val CANONICAL_ROUTES: Map<TopLevelDomain, List<String>> = AppNavigationCatalog.topLevelDestinations
        .mapValues { (_, destinations) -> destinations.map(AppDestination::route) }
}
