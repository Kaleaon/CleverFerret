package com.universalmedialibrary.ui.media.navigation

import android.net.Uri

/**
 * Canonical route contract for Home section -> See All -> Detail navigation.
 */
enum class HomeSectionRouteContract(val section: String, val mediaTypeRoute: String) {
    BOOKS("books", "book"),
    AUDIOBOOKS("audiobooks", "audiobook"),
    COMICS("comics", "comic"),
    MUSIC("music", "music"),
    PODCASTS("podcasts", "podcast"),
    MOVIES("movies", "movie"),
    TV_SHOWS("tv_shows", "tv_show"),
    DOCUMENTS("documents", "document"),
    WEB_FICTION("web_fiction", "webfiction");

    fun seeAllRoute(): String = MediaRoutes.seeAllRoute(section)

    companion object {
        fun fromSection(section: String): HomeSectionRouteContract? {
            val normalized = Uri.decode(section).trim().lowercase()
            return entries.firstOrNull { it.section == normalized }
        }
    }
}
