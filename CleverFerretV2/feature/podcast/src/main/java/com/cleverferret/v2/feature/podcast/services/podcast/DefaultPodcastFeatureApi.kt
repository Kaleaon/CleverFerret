package com.cleverferret.v2.feature.podcast.services.podcast

import com.cleverferret.v2.feature.podcast.api.PodcastFeatureApi

class DefaultPodcastFeatureApi : PodcastFeatureApi {
    override fun featureKey(): String = "feature:podcast"
}
