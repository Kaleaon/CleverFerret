package com.cleverferret.v2.feature.webfiction.di

import com.cleverferret.v2.feature.webfiction.api.WebfictionFeatureApi
import com.cleverferret.v2.feature.webfiction.services.webfiction.DefaultWebfictionFeatureApi

object WebfictionFeatureModule {
    fun provideWebfictionFeatureApi(): WebfictionFeatureApi = DefaultWebfictionFeatureApi()
}
