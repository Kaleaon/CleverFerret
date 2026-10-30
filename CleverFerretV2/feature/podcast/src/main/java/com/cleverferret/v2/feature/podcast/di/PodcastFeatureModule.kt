package com.cleverferret.v2.feature.podcast.di

import com.cleverferret.v2.feature.podcast.api.PodcastFeatureApi
import com.cleverferret.v2.feature.podcast.services.podcast.DefaultPodcastFeatureApi

object PodcastFeatureModule {
    fun providePodcastFeatureApi(): PodcastFeatureApi = DefaultPodcastFeatureApi()
}
