package com.cleverferret.v2.feature.search.di

import com.cleverferret.v2.feature.search.api.SearchFeatureApi
import com.cleverferret.v2.feature.search.services.search.DefaultSearchFeatureApi

object SearchFeatureModule {
    fun provideSearchFeatureApi(): SearchFeatureApi = DefaultSearchFeatureApi()
}
