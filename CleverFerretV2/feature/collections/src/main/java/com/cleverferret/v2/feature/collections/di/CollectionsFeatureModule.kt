package com.cleverferret.v2.feature.collections.di

import com.cleverferret.v2.feature.collections.api.CollectionsFeatureApi
import com.cleverferret.v2.feature.collections.services.collections.DefaultCollectionsFeatureApi

object CollectionsFeatureModule {
    fun provideCollectionsFeatureApi(): CollectionsFeatureApi = DefaultCollectionsFeatureApi()
}
