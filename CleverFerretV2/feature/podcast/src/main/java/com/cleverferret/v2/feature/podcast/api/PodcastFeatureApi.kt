package com.cleverferret.v2.feature.podcast.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class PodcastNavDestination(val route: String) {
    data object Home : PodcastNavDestination("audio/podcasts")
    data class Detail(val podcastId: String) : PodcastNavDestination("podcast/detail/$podcastId") {
        companion object {
            const val ROUTE_PATTERN = "podcast/detail/{podcastId}"
        }
    }
    data class Episode(val episodeId: String) : PodcastNavDestination("podcast/episode/$episodeId") {
        companion object {
            const val ROUTE_PATTERN = "podcast/episode/{episodeId}"
        }
    }
}

interface PodcastFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}
