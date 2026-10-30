package com.cleverferret.v2.feature.plex.di

import com.cleverferret.v2.feature.plex.api.PlexFeatureApi
import com.cleverferret.v2.feature.plex.services.plex.DefaultPlexFeatureApi

object PlexFeatureModule {
    fun providePlexFeatureApi(): PlexFeatureApi = DefaultPlexFeatureApi()
}
