package com.cleverferret.v2.feature.library.di

import com.cleverferret.v2.feature.library.api.LibraryFeatureApi
import com.cleverferret.v2.feature.library.services.library.DefaultLibraryFeatureApi

object LibraryFeatureModule {
    fun provideLibraryFeatureApi(): LibraryFeatureApi = DefaultLibraryFeatureApi()
}
