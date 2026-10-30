package com.cleverferret.v2.feature.metadata.di

import com.cleverferret.v2.feature.metadata.api.MetadataFeatureApi
import com.cleverferret.v2.feature.metadata.services.metadata.DefaultMetadataFeatureApi

object MetadataFeatureModule {
    fun provideMetadataFeatureApi(): MetadataFeatureApi = DefaultMetadataFeatureApi()
}
